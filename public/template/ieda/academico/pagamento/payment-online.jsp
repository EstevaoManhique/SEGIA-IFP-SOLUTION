<%-- 
    Document   : school-dashboard
    Created on : Feb 8, 2017, 7:04:20 PM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.local.Importacao"%>
<%@page import="com.dciapps.webclient.Pagamento"%>
<%@page import="com.dciapps.webclient.Turma"%>
<%@page import="com.dciapps.webclient.ModulosUsuario"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="com.dciapps.controller.GenericHandler"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SEGIA - Payment Gate</title>

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
        <!-- /global stylesheets -->

        <!-- Core JS files -->
        <script type="text/javascript" src="assets/js/plugins/loaders/pace.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/loaders/blockui.min.js"></script>
        <!-- /core JS files -->

        <!-- Theme JS files -->
        <script type="text/javascript" src="assets/js/plugins/forms/styling/switchery.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
        <script type="text/javascript" src="assets/js/plugins/ui/moment/moment.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/daterangepicker.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/core.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/wizards/form_wizard/form.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/wizards/form_wizard/form_wizard.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/selects/select2.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jasny_bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/validation/validate.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/notifications/sweet_alert.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/datatables.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/extensions/responsive.min.js"></script>

        <script type="text/javascript" src="assets/js/core/app.js"></script>
        <script type="text/javascript" src="assets/js/pages/components_popups.js"></script>



        <script type="text/javascript" src="assets/js/plugins/visualization/d3/d3.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/visualization/d3/d3_tooltip.js"></script>


        <script type="text/javascript" src="assets/js/plugins/visualization/d3/d3.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/visualization/c3/c3.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/visualization/echarts/echarts.js"></script>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>


        <script type="text/javascript" src="assets/js/pages/wizard_form.js"></script>

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
            SimpleDateFormat sdf2 = new SimpleDateFormat("MM/yyyy");
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            EncryptUtils encryptUtils = new EncryptUtils();

            ModulosUsuario mu = null;

            String msgErro = "";
            String alerta = "";
            Entidade entidade = (Entidade) session.getAttribute("entidadeSelecionada");

            List<Pagamento> pagamentos = null;
            List<Importacao> importacoes = null;

            if (entidade == null) {
                entidade = (Entidade) session.getAttribute("entidade");
            }


            boolean have = false;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

                
                pagamentos = (List<Pagamento>) session.getAttribute("pagamentosElectronicos");

                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();

                importacoes = (List<Importacao>) session.getAttribute("importacoes");

                if (importacoes != null) {
                    if (!importacoes.isEmpty()) {
                        have = true;
                    }
                }

                response.setHeader("Refresh", timeout + "; URL =VXN1YXJpb1NlcnZsZXQjRENJ?" + encryptUtils.encodeString("accao#lockscreen&user=" + encryptUtils.decodeString(usuario.getUsuaUsuario()) + "&ei=" + entidade.getEntiId()));

            }
        %>






        <!-- START NOTIFICATION -->


        <!-- /Notification JS files -->
        <script type="text/javascript" src="assets/js/plugins/notifications/jgrowl.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/notifications/sweet_alert.min.js"></script>
        <!-- /Notification JS files -->
        <script>

            jQuery(function () {

                // Defaults override - hide "close all" button
                $.jGrowl.defaults.closer = false;

                var erro = '<%=msgErro%>';
                var bg = '<%=alerta%>';
                var hd = "Notificação do Sistema";
                var cl = "#66BB6A";
                var tp = "success";

                if (bg !== '')
                {
                    /*$.jGrowl(erro, {
                     position: 'center',
                     header: hd,
                     theme: bg
                     });*/

                    if (bg === 'bg-error')
                    {
                        cl = "#EF5350";
                        tp = "error";
                    }

                    if (bg === 'bg-warning')
                    {
                        cl = "#FF7043";
                        tp = "warning";
                    }


                    swal({
                        title: hd,
                        text: erro,
                        confirmButtonColor: cl,
                        type: tp,
                        timer: 5000
                    });
                }


            });
        </script>	
        <!-- END NOTIFICATION -->

    </head>

    <body  oncontextmenu="return false" class="navbar-top">


        <!-- Main navbar -->
        <div class="navbar navbar-inverse navbar-fixed-top">
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
                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase btn-labeled btn-labeled-left bg-danger-400 heading-btn">Voltar ao painel principal<b><i class="icon-chevron-left"></i></b></button>
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


                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-earth position-left"></i> Pagamentos online</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->



                    <!-- Vertical form options -->
                    <div class="row">
                        <div class="col-md-4">

                            <%
                                String act = encryptUtils.encodeString("accao#carregar-ficheiro");
                            %>
                            <!-- Basic layout-->
                            <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="UGFnYW1lbnRvU2VydmxldCNEQ0k=?<%=act%>">
                                <div class="panel panel-flat">

                                    <div class="panel-body">
                                        <div class ="row">
                                            <div class="col-md-12">

                                                <fieldset>
                                                    <legend class="text-bold text-uppercase"><i class="icon-download10 position-left"></i>Carregamento de ficheiro</legend>




                                                    <div class="form-group">
                                                        <label class="text-bold text-uppercase">Localizar ficheiro:</label>
                                                        <br>


                                                        Faça aqui o carregamento do documento com as senhas:

                                                        <span class="help-block">Formatos aceites: xls, xlxs. Tamanho máximo 2Mb</span>

                                                        <center>
                                                            <iframe src="http://<%=ip%>:8081/suc/index-pagamentos-ena.php" style=" width: 90%; height: 25em; background: transparent;" frameBorder="0" scrolling="no" id="upload_target" name="upload_target"> </iframe>
                                                        </center>

                                                    </div>


                                                </fieldset>

                                            </div>

                                        </div>

                                        <div class="text-right">
                                            <button type="submit" id='btn3' onclick="this.disabled = 'disabled'; this.form.submit();" class="text-bold text-uppercase btn bg-danger-600 text-bold text-uppercase">Carregar Ficheiro <i class="icon-download4 position-right"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- /basic layout -->


                        </div>


                        <div class="col-md-8">

                            <!-- Basic responsive configuration -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-bold text-uppercase">Listagem de dados à importar</h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>
                                        </ul>
                                    </div>
                                </div>


                                <div class="panel-body">
                                    <p>

                                        <%
                                            if (have) {
                                        %>

                                    <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="U2VuaGFTZXJ2bGV0I0RDSQ==?YWNjYW8jY29uZmlybWFyLWltcG9ydGFjYW8=">

                                        <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="text-bold text-uppercase btn bg-primary-600 text-bold text-uppercase"> Confirmar importação de dados <i class="icon-check position-right"></i></button>
                                    </form>
                                    <%
                                        }
                                    %>

                                    </p>

                                </div>


                                <table class="table datatable-responsive">
                                    <thead>
                                        <tr>
                                            <th class="text-bold text-uppercase">Referência</th>
                                            <th class="text-bold text-uppercase text-right">Valor Pago</th>
                                            <th class="text-bold text-uppercase text-right">Comissão Pagamento</th>
                                            <th class="text-bold text-uppercase">Data & Hora</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            double tt1 = 0;
                                            double tt2 = 0;

                                            String lblStatus = "text-success-800";

                                            int numAux = 0;

                                            if (importacoes != null) {
                                                numAux = importacoes.size();
                                                for (Importacao imp : importacoes) {

                                                    String ref = imp.getRef();

                                                    String valP = df.format(imp.getValor());
                                                    String hor = imp.getHora();
                                                    String valC = df.format(imp.getComissao());
                                                    String dPag = imp.getData();

                                                    tt1 += imp.getValor();

                                                    tt2 += imp.getComissao();


                                        %>
                                        <tr>
                                            <td><a><%=ref%></a></td>
                                            <td class="text-bold text-success-600 text-right"><%=valP%></td>
                                            <td class="text-bold text-danger-600 text-right"><%=valC%></td>
                                            <td class="text-italic text-info-600"><small><%=dPag + "," + hor%></small></td>
                                        </tr>
                                        <%                                                }
                                            }
                                        %>

                                    </tbody>
                                </table>


                                <div class="panel-footer">

                                    <div class="table-responsive">
                                        <table class="table">

                                            <tbody>
                                                <tr>
                                                    <td class="text-bold text-uppercase">Nº REGISTOS</td>
                                                    <td class="text-bold text-danger-800"><%=numAux%></td>

                                                </tr>
                                                <tr>
                                                    <td class="text-bold text-uppercase">TOTAL PAGAMENTOS</td>
                                                    <td class="text-bold text-danger-800"><%=df.format(tt1)%></td>

                                                </tr>
                                                <tr>
                                                    <td class="text-bold text-uppercase">TOTAL COMISSÃO</td>
                                                    <td class="text-bold text-success-800"><%=df.format(tt2)%></td>

                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>

                                </div>

                            </div>
                            <!-- /basic responsive configuration -->
                        </div>


                    </div>
                    <!-- /vertical form options -->

                    <div class="row">

                        <div class="col-md-12">
                            <!-- Basic setup -->
                            <div class="panel panel-white">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-bold text-uppercase">RESUMO PAGAMENTOS ELECTRÓNICOS</h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>

                                        </ul>
                                    </div>
                                </div>




                                <table class="table datatable-responsive">
                                    <thead>
                                        <tr>
                                            <th class="text-bold text-uppercase">#</th>
                                            <th class="text-bold text-uppercase">Nome</th>
                                            <th class="text-bold text-uppercase">Descrição</th>
                                            <th class="text-bold text-uppercase">Estado</th>
                                            <th class="text-bold text-uppercase">Periodo</th>
                                            <th class="text-bold text-uppercase">Valor</th>
                                            <th class="text-bold text-uppercase">Comissão</th>
                                            <th class="text-bold text-uppercase">Referência</th>
                                            <th class="text-bold text-uppercase">Dta. Pag</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            if (pagamentos != null) {

                                                for (Pagamento p : pagamentos) {

                                                    if (p.getPagRefOnline() != null) {
                                                        int id = p.getPagId();
                                                        String alu = encryptUtils.decodeString(p.getInscricao().getAluno().getAlunBadgnumber())
                                                                + " - "
                                                                + encryptUtils.decodeString(p.getInscricao().getAluno().getPessoa().getPessNome())
                                                                + " " + encryptUtils.decodeString(p.getInscricao().getAluno().getPessoa().getPessApelido());

                                                        String per = sdf2.format(p.getPagData().toGregorianCalendar().getTime());

                                                        String value = df.format(p.getPagValor());
                                                        String ref = encryptUtils.decodeString(p.getPagRefOnline());
                                                        String desc = encryptUtils.decodeString(p.getPagDescricao());

                                                        String lbl = "bg-warning-600";

                                                        String status = "Pendente";

                                                        // status = encryptUtils.decodeString(p.)

                                        %>
                                        <tr>
                                            <td><a href="#"><%=id%></a></td>
                                            <td><a href="#"><%=alu%></a></td>
                                            <td class="text-italic"><%=desc%></td>
                                            <td><span class="label bg-warning-600">Pendente</span></td>
                                            <td><%=per%></td>
                                            <td><%=value%></td>
                                            <td>---</td>
                                            <td class="text-bold"><%=ref%></td>
                                            <td>---</td>
                                        </tr>
                                        <%
                                                    }
                                                }
                                            }

                                        %>


                                    </tbody>
                                </table>


                            </div>
                            <!-- /basic setup -->
                        </div>
                    </div>

                    <!-- Content area -->
                    <div class="content">



                        <!-- Footer -->
                        <div class="footer text-bold text-grey-300">
                            <%                                String ano = session.getAttribute("ano").toString();
                            %>
                            &copy; <%=ano%>. <a href="#" class="text-bold">SEGIA</a>. Todos os direitos reservados
                        </div>
                        <!-- /footer -->


                    </div>
                    <!-- /content area -->

                </div>
                <!-- /main content -->

            </div>
            <!-- /page content -->

        </div>
        <!-- /page container -->
    </body>
</html>
