<%-- 
    Document   : dc-inefp-payment-exchange
    Created on : Apr 9, 2017, 9:14:34 AM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.webclient.Inscricao"%>
<%@page import="com.dciapps.controller.GenericHandler"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="com.dciapps.webclient.ModulosUsuario"%>
<%@page import="com.dciapps.webclient.Taxa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SEGIA - Outros Pagamentos</title>

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
        <script type="text/javascript" src="assets/js/plugins/forms/selects/select2.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/datatables.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/extensions/responsive.min.js"></script>

        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/datepicker.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/effects.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/ui/moment/moment.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/daterangepicker.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/pickadate/picker.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/pickadate/picker.date.js"></script>

        <script type="text/javascript" src="assets/js/core/app.js"></script>



        <script type="text/javascript" src="assets/js/pages/form_layouts.js"></script>
        <script type="text/javascript" src="assets/js/pages/datatables_responsive.js"></script>
        <!-- /theme JS files -->
        <%

            int timeout = session.getMaxInactiveInterval();

            GenericHandler gh = new GenericHandler(request, response);
            Usuario usuario = gh.loggedUser();

            String nome = "";
            String fotoPerfil = "";
            String cargo = "";

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy, HH:mm:ss");
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            EncryptUtils encryptUtils = new EncryptUtils();

            ModulosUsuario mu = null;

            List<Inscricao> inscricoes = null;
            List<Taxa> taxas = null;

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
                taxas = (List<Taxa>) session.getAttribute("taxas");

                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();

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

    <body oncontextmenu="return false" >

        <!-- Main navbar -->
        <div class="navbar navbar-inverse">
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
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-coins position-left"></i> Outros Pagamentos</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->



                    <div class = "row">

                        <!-- Vertical form options -->
                        <div class="col-md-10 col-md-offset-1">


                            <!-- 2 columns form -->
                            <%
                                String act = encryptUtils.encodeString("accao#adicionar-pagamento");

                            %>
                            <!-- Basic layout-->
                            <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="UGFnYW1lbnRvU2VydmxldCNEQ0k=?<%=act%>">
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Informe os dados do pagamento</h6>
                                        <div class="heading-elements">
                                            <ul class="icons-list">
                                                <li><a data-action="collapse"></a></li>
                                                <li><a data-action="reload"></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="panel-body">
                                        <div class="row">

                                            <div class="col-md-6">
                                                <fieldset>
                                                    <legend class="text-semibold"><i class="icon-cash position-left"></i> Dados do Pagamento</legend>

                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Inscrição:</label>
                                                        <div class="col-lg-9">
                                                            <div class="row">
                                                                <select class="select" name="idInscricao" required="">
                                                                    <optgroup label="Selecione uma inscrição">
                                                                        <%
                                                                            if (inscricoes != null) {

                                                                                for (Inscricao i : inscricoes) {

                                                                                    int id = i.getInscId();
                                                                                    String desc = encryptUtils.decodeString(i.getInscReferencia()) + " - "+ encryptUtils.decodeString(i.getAluno().getPessoa().getPessNome()) +" "+ encryptUtils.decodeString(i.getAluno().getPessoa().getPessApelido());

                                                                        %>
                                                                        <option value="<%=id%>"><%=desc%></option>
                                                                        <%
                                                                                }
                                                                            }
                                                                        %>
                                                                    </optgroup>
                                                                </select>

                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Taxa:</label>
                                                        <div class="col-lg-7">
                                                            <div class="row">
                                                                <select class="select" name="idTaxa" required="">
                                                                    <optgroup label="Selecione uma taxa">
                                                                        <%
                                                                            if (taxas != null) {

                                                                                for (Taxa t : taxas) {

                                                                                    int id = t.getTaxaId();
                                                                                    String desc = encryptUtils.decodeString(t.getTaxaDescricao()) + " - (" + df.format(t.getTaxaValor()) + " MT)";

                                                                        %>
                                                                        <option value="<%=id%>"><%=desc%></option>
                                                                        <%
                                                                                }
                                                                            }
                                                                        %>
                                                                    </optgroup>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">F. Pagamento:</label>
                                                        <div class="col-lg-5">
                                                            <div class="row">

                                                                <select class="select" name="formaPagamento" required="">
                                                                    <optgroup label="Selecione a forma de pagamento">
                                                                        <option value="Cheque">Cheque</option> 
                                                                        <option value="Talão de Depósito">Talão de Depósito</option> 
                                                                        <option value="Transferência Bancaria">Transferência Bancaria</option> 
                                                                    </optgroup>
                                                                </select>

                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Nº Documento:</label>
                                                        <div class="col-lg-6">
                                                            <input type="number" class="form-control" placeholder="Nº Documento ..." name="documento" required="">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>



                                            <div class="col-md-6">
                                                <fieldset>
                                                    <legend class="text-semibold"><i class="icon-info22 position-left"></i> Mais informações</legend>

                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Detalhes:</label>
                                                        <div class="col-lg-9">
                                                            <textarea rows="5" cols="5" class="form-control" placeholder="Inidique os detalhes do pagamento" name="descricao" required=""></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Valor:</label>
                                                        <div class="col-lg-4">
                                                            <input type="money" class="form-control" placeholder="Valor ..." name="valor" required="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Data:</label>
                                                        <div class="col-lg-4">
                                                            <input type="text" class="form-control daterange-single" placehorlder="Data..." name="dataPagamento" required="">
                                                        </div>
                                                    </div>

                                                </fieldset>
                                            </div>
                                        </div>

                                        <div class="text-right">

                                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800">Gravar Registo <i class="icon-arrow-right14 position-right"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- /2 columns form -->



                        </div>
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
        <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>

    </body>
</html>
