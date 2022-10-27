<%-- 
    Document   : hcm-dashboard
    Created on : May 13, 2018, 10:03:40 AM
    Author     : Hamilton Jhonas
--%>

<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
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
        <title>SEGIA - Dashboard</title>

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
	<link href="assets/css/icons/fontawesome/styles.min.css" rel="stylesheet" type="text/css">
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
        <script type="text/javascript" src="assets/js/plugins/media/fancybox.min.js"></script>

        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/datepicker.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/effects.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/ui/moment/moment.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/daterangepicker.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/pickadate/picker.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/pickadate/picker.date.js"></script>



        <script type="text/javascript" src="assets/js/core/app.js"></script>
        <script type="text/javascript" src="assets/js/pages/form_layouts.js"></script>
        <script type="text/javascript" src="assets/js/pages/datatables_responsive.js"></script>
        <script type="text/javascript" src="assets/js/pages/gallery.js"></script>

        <!-- /theme JS files -->


        <%

            int timeout = session.getMaxInactiveInterval();

            GenericHandler gh = new GenericHandler(request, response);
            Usuario usuario = gh.loggedUser();

            String nome = "";
            String fotoPerfil = "";
            String cargo = "";

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy, HH:mm:ss");
            EncryptUtils encryptUtils = new EncryptUtils();
            String msgErro = "";
            String alerta = "";

            String referencia = "";

            int first = 1;
            int last = 999;
            int segmentos = 0;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();

                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();

                response.setHeader("Refresh", timeout + "; URL =VXN1YXJpb1NlcnZsZXQjRENJ?" + encryptUtils.encodeString("accao#lockscreen&user=" + encryptUtils.decodeString(usuario.getUsuaUsuario())));

            }
        %>

    </head>

    <body oncontextmenu="return false" class="layout-boxed">





        <!-- Main navbar -->
        <div class="navbar navbar-inverse  navbar-fixed-top">
            <div class="navbar-header">
                <h6 class="text-semibold class text-uppercase" style="margin-left: 2em;">Sistema Electrónico de Gestão de Informação Académica</h6>

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


                        <!-- <ul class="dropdown-menu">
                             <li><a class="english"><img src="assets/images/flags/gb.png" alt=""> English</a></li>
                         </ul> -->
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
                    <h6 class="text-bold text-uppercase"><i class="icon-home2 position-left"></i> <span class="text-semibold">Painel Principal</span></h6>
                </div>

                <div class="heading-elements">

                    <form method="post" action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jbG9nb3V0I0RDSQ==">
                        <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase text-bold text-uppercase text-uppercase text-bold btn-labeled btn-labeled-left bg-danger-400 heading-btn"><b><i class="icon-switch2"></i></b> Terminar sessão</button>
                    </form>
                </div>
            </div>
        </div>
        <!-- /page header -->

        <!-- Page container -->
        <div class="page-container">

            <!-- Page content -->
            <div class="page-content">

                <!-- Main content -->
                <div class="content-wrapper">

                    <!-- Info blocks -->
                    <div class="row">

                        <div class="col-md-4">
                            <div class="panel">
                                <div class="panel-body text-center">
                                    <div class="icon-object border-grey-400 text-grey-400"><i class="icon-book"></i></div>
                                    <h6 class="text-bold text-uppercase">Registo Académico</h6>
                                    <form method ="post" action ="#">
                                        <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase bg-slate-400 btn-labeled btn-rounded text-bold text-uppercase"><b><i class="icon-book"></i></b> Aceder ao módulo</button>
                                    </form>
                                </div>
                            </div>
                        </div>


                        <div class="col-md-4">
                            <div class="panel">
                                <div class="panel-body text-center">
                                    <div class="icon-object border-grey-400 text-grey-400"><i class="icon-books"></i></div>
                                    <h6 class="text-bold text-uppercase">Gestão da Biblioteca</h6>
                                    <form method ="post" action ="#">
                                        <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase bg-slate-400 btn-labeled btn-rounded text-bold text-uppercase"><b><i class="icon-books"></i></b> Aceder ao módulo</button>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="panel">
                                <div class="panel-body text-center">
                                    <div class="icon-object border-grey-400 text-grey-400"><i class="icon-coins"></i></div>
                                    <h6 class="text-bold text-uppercase">Gestão da Tesouraria</h6>
                                    <form method ="post" action ="#">
                                        <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase bg-slate-400 btn-labeled btn-rounded text-bold text-uppercase"><b><i class="icon-coins"></i></b> Aceder ao módulo</button>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="panel">
                                <div class="panel-body text-center">
                                    <div class="icon-object border-grey-400 text-grey-400"><i class="icon-calculator"></i></div>
                                    <h6 class="text-bold text-uppercase">Gestão Comercial</h6>
                                    <form method ="post" action ="#">
                                        <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase bg-slate-400 btn-labeled btn-rounded text-bold text-uppercase"><b><i class="icon-calculator"></i></b> Aceder ao módulo</button>
                                    </form>
                                </div>
                            </div>
                        </div>


                        <div class="col-md-4">
                            <div class="panel">
                                <div class="panel-body text-center">
                                    <div class="icon-object border-grey-400 text-grey-400"><i class="icon-stats-growth"></i></div>
                                    <h6 class="text-bold text-uppercase">Gestão Financeira</h6>
                                    <form method ="post" action ="#">
                                        <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase bg-slate-400 btn-labeled btn-rounded text-bold text-uppercase"><b><i class="icon-stats-growth"></i></b> Aceder ao módulo</button>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="panel">
                                <div class="panel-body text-center">
                                    <div class="icon-object border-grey-400 text-grey-400"><i class="icon-copy3"></i></div>
                                    <h6 class="text-bold text-uppercase">Gestão de Contratos</h6>
                                    <form method ="post" action ="#">
                                        <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase bg-slate-400 btn-labeled btn-rounded text-bold text-uppercase"><b><i class="icon-copy3"></i></b> Aceder ao módulo</button>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="panel">
                                <div class="panel-body text-center">
                                    <div class="icon-object border-grey-400 text-grey-400"><i class="fa fa-cubes"></i></div>
                                    <h6 class="text-bold text-uppercase">Gestão do Armazém</h6>
                                    <form method ="post" action ="#">
                                        <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase bg-slate-400 btn-labeled btn-rounded text-bold text-uppercase"><b><i class="fa fa-cubes"></i></b> Aceder ao módulo</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-4">
                            <div class="panel">
                                <div class="panel-body text-center">
                                    <div class="icon-object border-grey-400 text-grey-400"><i class="icon-cog2 spinner"></i></div>
                                    <h6 class="text-bold text-uppercase">Configuração</h6>
                                   <form method ="post" action ="#">
                                        <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase bg-slate-400 btn-labeled btn-rounded text-bold text-uppercase"><b><i class="icon-cog2 spinner"></i></b> Aceder ao módulo</button>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="panel">
                                <div class="panel-body text-center">
                                    <div class="icon-object border-grey-400 text-grey-400"><i class="icon-users2"></i></div>
                                    <h6 class="text-bold text-uppercase">Controlo de acesso</h6>
                                    <form method ="post" action ="#">
                                        <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase bg-slate-400 btn-labeled btn-rounded text-bold text-uppercase"><b><i class="icon-users2"></i></b> Aceder ao módulo</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <!-- /info blocks -->


                    <!-- Recurso Indisponivel -->
                    <div id="modal_indisponivel" class="modal fade" data-backdrop="false">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="close" data-dismiss="modal">&times;</button>
                                    <h6 class="modal-title">Notificação do Sistema</h6>
                                </div>

                                <div class="modal-body text-center">
                                    <h1 class="error-title"><i class="icon-spinner2 spinner text-teal-400" style="font-size:200px"></i></h1>
                                    <h6 class="text-semibold content-group text-grey-800">Módulo indisponível !.<br>A nossa equipe de desenvolvimento encontra-se no momento a trabalhar para disponibilizar o recurso solicitado,<br>em breve irá notifica-lo para a utilização do mesmo !</h6>
                                </div>

                                <div class="modal-footer">
                                    <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase btn-danger" data-dismiss="modal"><i class="icon-chevron-down"></i>  Fechar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /recurso indisponivel -->



                </div>
                <!-- /main content -->

            </div>
            <!-- /page content -->



            <!-- Footer -->
            <div class="footer text-bold">
                <%
                    String ano = session.getAttribute("ano").toString();
                %>
               &copy; <%=ano%>. <a href="#" class="text-bold">SEGIA</a>. Todos os direitos reservados
            </div>
            <!-- /footer -->

        </div>
        <!-- /page container -->

    </body>
</html>
