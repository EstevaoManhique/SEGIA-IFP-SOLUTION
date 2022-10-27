<%-- 
    Document   : dc-inefp-payment-stats
    Created on : Apr 5, 2017, 8:39:19 AM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="com.dciapps.webclient.Inscricao"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.webclient.ModulosUsuario"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="com.dciapps.controller.GenericHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> SEGIA - Situação dos Pagamentos</title>

        <!-- Page Description, Author and Keywords -->
        <meta name="description" content="Sistema Electrónico de Gestão de Informação Académica">
        <meta name="author" content="Hamilton Jhonas">
        <meta name="keywords" content="SEGIA, DC Inovaction, Software, Multimedia, Escola, School, Vendas, Stock, Market, Branding, Logo, Hotel, Hotelaria, RH, Recursos Humanos, Controle de Acesso, Web Design, Web Marketing, Development, Hosting" />

        <!-- Favicon -->
        <%
            String ip = "localhost";

            if (session.getAttribute("ip") != null) {
                ip = session.getAttribute("ip").toString();
            } else {
                response.sendRedirect("startup");
            }
        %>
        <link rel="shortcut icon" href="http://<%=ip%>:8081/suc/images/favicons/governo/apple-touch-icon.png">


        <!-- Global stylesheets -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,300,100,500,700,900" rel="stylesheet" type="text/css">
        <link href="assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
        <link href="assets/css/minified/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/minified/core.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/minified/components.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/minified/colors.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/minified/bg.css" rel="stylesheet" type="text/css">
        <!-- /global stylesheets -->

        <!-- Core JS files -->
        <script type="text/javascript" src="assets/js/plugins/loaders/pace.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/loaders/blockui.min.js"></script>
        <!-- /core JS files -->

        <!-- Theme JS files -->

        <!-- Theme JS files -->
        <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/switchery.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/switch.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/datatables.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/extensions/responsive.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/selects/select2.min.js"></script>



        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/datepicker.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/effects.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/ui/moment/moment.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/daterangepicker.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/pickadate/picker.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/pickadate/picker.date.js"></script>

        <script type="text/javascript" src="assets/js/pages/form_layouts.js"></script>

        <script type="text/javascript" src="assets/js/core/app.js"></script>
        <!-- /theme JS files -->


        <!-- Velocity animation  menu -->
        <script type="text/javascript" src="assets/js/plugins/velocity/velocity.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/velocity/velocity.ui.min.js"></script>
        <script>

            $(function () {

                // Animated dropdowns
                // ------------------------------

                //
                // Velocity animations
                //

                // Open
                $('.dropdown-velocity, .btn-group-velocity').on('show.bs.dropdown', function (e) {
                    $(this).find('.dropdown-menu').velocity('transition.slideUpIn', {
                        duration: 200
                    });
                });

                // Close
                $('.dropdown-velocity, .btn-group-velocity').on('hide.bs.dropdown', function (e) {
                    $(this).find('.dropdown-menu').velocity('transition.slideLeftOut', {
                        duration: 200,
                        complete: function () {
                            $(this).removeAttr('style');
                        }
                    });
                });

            });

        </script>
        <!-- velocity animation menu -->

        <script type="text/javascript" src="assets/js/pages/datatables_responsive.js"></script>
        <!-- /theme JS files -->
        <%

            int timeout = session.getMaxInactiveInterval();

            GenericHandler gh = new GenericHandler(request, response);
            Usuario usuario = gh.loggedUser();

            String nome = "";
            String fotoPerfil = "";
            String cargo = "";

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            EncryptUtils encryptUtils = new EncryptUtils();

            ModulosUsuario mu = null;
            List<Inscricao> inscricoes = null;

            String msgErro = "";
            String alerta = "";
            Entidade entidade = (Entidade) session.getAttribute("entidadeSelecionada");

            if (entidade == null) {
                entidade = (Entidade) session.getAttribute("entidade");
            }

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

                inscricoes = (List<Inscricao>) session.getAttribute("inscricoes");

                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();

                response.setHeader("Refresh", timeout + "; URL =VXN1YXJpb1NlcnZsZXQjRENJ?" + encryptUtils.encodeString("accao#lockscreen&user=" + encryptUtils.decodeString(usuario.getUsuaUsuario()) + "&ei=" + entidade.getEntiId()));

            }
        %>
    </head>


    <body oncontextmenu="return false"  class="navbar-top">




        <!-- Main navbar -->
        <div class="navbar navbar-inverse  navbar-fixed-top">
            <div class="navbar-header">
                <h6 class="text-semibold class text-uppercase" style="margin-left: 2em;"> Sistema Electrónico de Gestão de Informação Académica </h6>

                <ul class="nav navbar-nav visible-xs-block">
                    <li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
                    <li><a class="sidebar-mobile-main-toggle"><i class="icon-paragraph-justify3"></i></a></li>
                </ul>
            </div>

            <div class="navbar-collapse collapse" id="navbar-mobile">
                <ul class="nav navbar-nav">
                    <li><a class="sidebar-control sidebar-main-toggle hidden-xs"><i class="icon-paragraph-justify3"></i></a></li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown language-switch">
                        <a class="dropdown-toggle" data-toggle="dropdown">
                            <img src="assets/images/flags/mz.png" class="position-left" alt="">
                            Português
                            <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu">
                            <li><a class="english"><img src="assets/images/flags/gb.png" alt=""> English</a></li>
                        </ul>
                    </li>



                    <li class="dropdown dropdown-user">
                        <a class="dropdown-toggle" data-toggle="dropdown">
                            <img src="http://<%=ip%>:8081/suc/images/profile-pictures/<%=fotoPerfil%>" alt="<%=nome%>">
                            <span class="text-bold text-uppercase"><%=nome%></span>
                            <i class="caret"></i>
                        </a>

                        <ul class="dropdown-menu dropdown-menu-right">
                            <li><a href="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jdmVyLXBlcmZpbA=="><i class="icon-user-plus"></i> Definições da Conta</a></li>

                            <li class="divider"></li>
                            <li><a href="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jbG9nb3V0I0RDSQ=="><i class="icon-switch2"></i> Terminar Sessão</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /main navbar -->



        <!-- Page header -->
        <div class="page-header">
            <div class="breadcrumb-line breadcrumb-line-wide">

                <%
                    String nmEscola = "";

                    if (session.getAttribute("nmEscola") != null) {
                        nmEscola = session.getAttribute("nmEscola").toString();
                    }
                %>

                <ul class="breadcrumb">
                    <li><a href="#"><i class="icon-home2 position-left"></i> <%=nmEscola%></a></li>
                </ul>
            </div>
                
            <div class="page-header-content">
                <div class="page-title">
                </div>

                <div class="heading-elements">
                    <div class="heading-btn-group">
                        <form method="post" action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jZG9VcGRhdGU=">
                            <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase btn-labeled btn-labeled-left bg-danger-400 heading-btn">Voltar ao painel principal<b><i class="icon-chevron-left"></i></b></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /page header -->



        <!-- Page container -->
        <div class="page-container">

            <!-- Page content -->
            <div class="page-content">


                <!-- Main sidebar -->
               <%@ include file="../../menu.jsp" %> 
                <!-- /main sidebar -->

                <!-- Main content -->
                <div class="content-wrapper">




                    <!-- Toolbar -->
                    <div class="navbar navbar-default navbar-component navbar-xs">
                        <ul class="nav navbar-nav visible-xs-block">
                            <li class="full-width text-center"><a data-toggle="collapse" data-target="#navbar-filter"><i class="icon-menu7"></i></a></li>
                        </ul>

                        <div class="navbar-collapse collapse" id="navbar-filter">
                            <ul class="nav navbar-nav element-active-slate-400">
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-info22 position-left"></i> Situação dos pagamentos</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->




                    <div class = "row">


                        <!-- Basic responsive configuration -->
                        <div class="panel panel-flat">
                            <div class="panel-heading">
                                <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Situação dos Pagamentos</h6>
                                <div class="heading-elements">
                                    <ul class="icons-list">
                                        <li><a data-action="collapse"></a></li>
                                        <li><a data-action="reload"></a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="panel-body">


                                <p>
                                    A opção <strong>'Notificar Irregulares'</strong> permite notificar electrónicamente todos os alunos que se encontram em situação irregular.
                                </p>
                                <p>

                                    <%
                                        String actx1 = "accao#notificar-irregulares";
                                    %>
                                <form method="post" accept-charset="ISO-8859-1" action="UGFnYW1lbnRvU2VydmxldCNEQ0k=?<%=actx1%>">
                                    <button class="btn text-bold text-uppercase bg-grey-800 bt-sm" type="submit"><span class="icon-bell3"></span> Notificar Irregulares</button>
                                </form>
                                </p>

                                <table class="table datatable-responsive">
                                    <thead>
                                        <tr>
                                            <th class="text-bold text-uppercase">#</th>
                                            <th class="text-bold text-uppercase">Inscrição</th>
                                            <th class="text-bold text-uppercase">Aluno</th>
                                            <th class="text-bold text-uppercase">Turma</th>
                                            <th class="text-bold text-uppercase">Últ. Pagamento</th>
                                            <th class="text-bold text-uppercase">Próx. Pagamento</th>
                                            <th class="text-center text-bold text-uppercase text-danger-600">Situação</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            if (inscricoes != null) {
                                                for (Inscricao i : inscricoes) {

                                                    if (i.isInscActiva()) {
                                                        int id = i.getInscId();
                                                        String ref = encryptUtils.decodeString(i.getInscReferencia());
                                                        String alun = encryptUtils.decodeString(i.getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(i.getAluno().getPessoa().getPessApelido());
                                                        String turm = encryptUtils.decodeString(i.getTurma().getTurmDescricao());
                                                        String dte = "Não definido";

                                                        String dataProximo = "Não definido";
                                                        String situacao = "Irregular";
                                                        String label = "bg-danger-600";

                                                        if (i.isInscRegular()) {
                                                            situacao = "Regular";
                                                            label = "bg-success-600";
                                                        }

                                                        if (i.getInscDataProximoPagamento() != null) {
                                                            dataProximo = sdf.format(i.getInscDataProximoPagamento().toGregorianCalendar().getTime());

                                                        }

                                                        if (i.getInscDataUltimoPagamento() != null) {
                                                            dte = sdf.format(i.getInscDataUltimoPagamento().toGregorianCalendar().getTime());
                                                        }

                                                        String bolseiro = encryptUtils.decodeString(i.getAluno().getAlunBolseiro());

                                                        if (bolseiro.equals("Bolseiro Integral")) {
                                                            situacao = "Regular";
                                                            dte = "<b>---</b>";
                                                            dataProximo = "<b>---</b>";
                                                        }

                                        %>
                                        <tr>
                                            <td><a href="#"><%=id%></a></td>
                                            <td><span class="label bg-slate-400"><%=ref%></span></td>
                                            <td><%=alun%></td>
                                            <td class="text-italic"><%=turm%></td>
                                            <td><%=dte%></td>
                                            <td><%=dataProximo%></td>
                                            <td class="text-center"><span class="label <%=label%>"><%=situacao%></span></td>
                                                <%
                                                            }
                                                        }
                                                    }
                                                %>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                        <!-- /basic responsive configuration -->

                        <!-- /vertical form options -->
                    </div>					


                </div>
                <!-- /main content -->


            </div>
            <!-- /page content -->



            <!-- Footer -->
            <div class="footer text-bold text-grey-300">
                <%
                    String ano = session.getAttribute("ano").toString();
                %>
                &copy; <%=ano%>. <a href="#" class="text-bold">SEGIA</a>. Todos os direitos reservados
            </div>
            <!-- /footer -->

        </div>
        <!-- /page container -->

    </body>
    <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>
</html>
