<%-- 
    Document   : user-dashboard
    Created on : Oct 18, 2017, 6:48:39 AM
    Author     : hamil
--%>

<%@page import="org.joda.time.Days"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Date"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.localcontroler.StringUtils"%>
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
        <title>SEGIA - Utilizadores - Dashboard</title>

        <!-- Page Description, Author and Keywords -->
        <meta name="description" content="Sistema Electrónico de Gestão de Informação Académica">
        <meta name="author" content="Hamilton Jhonas">
        <meta name="keywords" content="SEGIA" />

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

        <script type="text/javascript" src="assets/js/plugins/visualization/d3/d3.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/visualization/d3/d3_tooltip.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/switchery.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
        <script type="text/javascript" src="assets/js/plugins/ui/moment/moment.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/daterangepicker.js"></script>


        <script type="text/javascript" src="assets/js/pages/datatables_responsive.js"></script>
        <script type="text/javascript" src="assets/js/plugins/visualization/echarts/echarts.js"></script>

        <script type="text/javascript" src="assets/js/core/app.js"></script>
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

            StringUtils stringUtils = new StringUtils();

            int numReg = 0;

            int numPacientes = 0;
            int numPacientesInternos = 0;
            int numPacientesExternos = 0;
            int numInternamentos = 0;
            int numPacientesPediatria = 0;

            String lblNovosPacientes = "";
            String lblPacientesExternos = "";
            String lblInternamentos = "";
            String lblSUR = "";
            String lblPediatria = "";

            String lblM1 = "";
            String lblM2 = "";
            String lblM3 = "";
            String lblM4 = "";
            String lblM5 = "";
            String lblM6 = "";

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                if (session.getAttribute("numPacientes") != null) {
                    numPacientes = Integer.parseInt(session.getAttribute("numPacientes").toString());
                }
                if (session.getAttribute("numPacientesInternos") != null) {
                    numPacientesInternos = Integer.parseInt(session.getAttribute("numPacientesInternos").toString());
                }
                if (session.getAttribute("numPacientesExternos") != null) {
                    numPacientesExternos = Integer.parseInt(session.getAttribute("numPacientesExternos").toString());
                }
                if (session.getAttribute("numInternamentos") != null) {
                    numInternamentos = Integer.parseInt(session.getAttribute("numInternamentos").toString());
                }
                if (session.getAttribute("numPacientesPediatria") != null) {
                    numPacientesPediatria = Integer.parseInt(session.getAttribute("numPacientesPediatria").toString());
                }

                if (session.getAttribute("lblNovosPacientes") != null) {
                    lblNovosPacientes = session.getAttribute("lblNovosPacientes").toString();
                }
                if (session.getAttribute("lblPacientesExternos") != null) {
                    lblPacientesExternos = session.getAttribute("lblPacientesExternos").toString();
                }
                if (session.getAttribute("lblInternamentos") != null) {
                    lblInternamentos = session.getAttribute("lblInternamentos").toString();
                }
                if (session.getAttribute("lblSUR") != null) {
                    lblSUR = session.getAttribute("lblSUR").toString();
                }
                if (session.getAttribute("lblPediatria") != null) {
                    lblPediatria = session.getAttribute("lblPediatria").toString();
                }
                if (session.getAttribute("lblM1") != null) {
                    lblM1 = session.getAttribute("lblM1").toString();
                }
                if (session.getAttribute("lblM2") != null) {
                    lblM2 = session.getAttribute("lblM2").toString();
                }
                if (session.getAttribute("lblM3") != null) {
                    lblM3 = session.getAttribute("lblM3").toString();
                }
                if (session.getAttribute("lblM4") != null) {
                    lblM4 = session.getAttribute("lblM4").toString();
                }
                if (session.getAttribute("lblM5") != null) {
                    lblM5 = session.getAttribute("lblM5").toString();
                }
                if (session.getAttribute("lblM6") != null) {
                    lblM6 = session.getAttribute("lblM6").toString();
                }

                response.setHeader("Refresh", timeout + "; URL =VXN1YXJpb1NlcnZsZXQjRENJ?" + encryptUtils.encodeString("accao#lockscreen&user=" + encryptUtils.decodeString(usuario.getUsuaUsuario())));

            }
        %>



    </head>

    <body oncontextmenu="return false">




        <!-- Main navbar -->
        <div class="navbar navbar-inverse">
            <div class="navbar-header">
                <h6 class="text-bold text-uppercase text-semibold class text-uppercase" style="margin-left: 2em;">Sistema Electrónico de Gestão de Informação Académica</h6> 

                <ul class="nav navbar-nav visible-xs-block">
                    <li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
                    <li><a class="sidebar-mobile-main-toggle"><i class="icon-paragraph-justify3"></i></a></li>
                </ul>
            </div>

            <div class="navbar-collapse collapse" id="navbar-mobile">


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
                            <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn btn-labeled btn-labeled-left bg-danger-400 heading-btn text-bold text-uppercase">Voltar ao painel principal<b><i class="icon-chevron-left"></i></b></button>
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
                <div class="sidebar sidebar-main">
                    <div class="sidebar-content">


                        <!-- REQUISIÇÕES -->
                        <div class="sidebar-category">
                            <div class="category-title">
                                <span><B>GESTÃO DE UTILIZADORES</B></span>
                                <ul class="icons-list">
                                    <li><a href="#" data-action="collapse"></a></li>
                                </ul>
                            </div>

                            <div class="category-content">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <form action="TW9kdWxvU2VydmxldCNEQ0k=?YWNjYW8jY29udHJvbG8tYWNlc3Nv" method="post">
                                            <button class="btn bg-orange-600 btn-block btn-float btn-float-lg" type="submit"><i class="icon-meter-fast"></i> <span class="text-bold text-uppercase">Painel Principal</span></button>
                                        </form>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <br>
                                        <form action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jdXN1YXJpb3M=" method="post">
                                            <button class="btn  bg-slate-800 btn-block btn-float btn-float-lg" type="submit"><i class="icon-user-plus"></i> <span class="text-bold text-uppercase">Utilizadores</span></button>
                                        </form>
                                    </div>
                                </div>

                                <div class="row">

                                    <div class="col-xs-12">
                                        <br>

                                        <form action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jcGVybWlzc29lcw==" method="post">
                                            <button class="btn  bg-slate-800 btn-block btn-float btn-float-lg" type="submit"><i class="icon-user-lock"></i> <span class="text-bold text-uppercase">Permissões</span></button>
                                        </form>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <br>

                                        <form action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jbG9ncw==" method="post">
                                            <button class="btn  bg-slate-800 btn-block btn-float btn-float-lg" type="submit"><i class="icon-spinner10 spinner"></i> <span class="text-bold text-uppercase">Logs</span></button>
                                        </form>
                                    </div>
                                    <div class="col-xs-12">
                                        <br>

                                        <form action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jY29uZXhvZXM=" method="post">
                                            <button class="btn  bg-slate-800 btn-block btn-float btn-float-lg" type="submit"><i class="icon-collaboration"></i> <span class="text-bold text-uppercase">Conectados</span></button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /requisições -->

                    </div>
                </div>
                <!-- /main sidebar -->



                <!-- Main content -->
                <div class="content-wrapper">


                    <!-- Toolbar -->
                    <div class="navbar navbar-default navbar-component navbar-xs">
                        <ul class="nav navbar-nav visible-xs-block">
                            <li class="full-width text-center"><a data-toggle="collapse" data-target="#navbar-filter"><i class="icon-menu7"></i></a></li>
                        </ul>

                        <div class="navbar-collapse collapse" id="navbar-filter">
                            <ul class="nav navbar-nav element-active-orange-400">
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-users2 position-left"></i> Gestão de Utilizadores  <span class="text-danger-400"> (Painel Principal)</span> </a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->



                    <!-- Content area -->
                    <div class="content">

                        <!-- Main charts -->
                        <div class="row">
                            <div class="col-lg-6">

                                <!-- Traffic sources -->
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-bold text-uppercase">Resumo do tráfego</h6>
                                        <div class="heading-elements">
                                            <form class="heading-form" action="#">
                                                <div class="form-group">
                                                    <label class="checkbox-inline checkbox-switchery checkbox-right switchery-xs text-bold text-uppercase">
                                                        <input type="checkbox" class="switch" checked="checked">
                                                        Em tempo real:
                                                    </label>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <ul class="list-inline text-center">
                                                    <li>
                                                        <a href="#" class="btn border-teal text-teal btn-flat btn-rounded btn-icon btn-xs valign-text-bottom"><i class="icon-plus3"></i></a>
                                                    </li>
                                                    <li class="text-left">
                                                        <div class="text-bold text-uppercase">Novas visitas</div>
                                                        <div class="text-muted">2,349 avg</div>
                                                    </li>
                                                </ul>

                                                <div class="col-lg-10 col-lg-offset-1">
                                                    <div class="content-group" id="new-visitors"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <ul class="list-inline text-center">
                                                    <li>
                                                        <a href="#" class="btn border-warning-400 text-warning-400 btn-flat btn-rounded btn-icon btn-xs valign-text-bottom"><i class="icon-watch2"></i></a>
                                                    </li>
                                                    <li class="text-left">
                                                        <div class="text-bold text-uppercase">Tempo em sessão</div>
                                                        <div class="text-muted">01:20 avg</div>
                                                    </li>
                                                </ul>

                                                <div class="col-lg-10 col-lg-offset-1">
                                                    <div class="content-group" id="new-sessions"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <ul class="list-inline text-center">
                                                    <li>
                                                        <a href="#" class="btn border-indigo-400 text-indigo-400 btn-flat btn-rounded btn-icon btn-xs valign-text-bottom"><i class="icon-people"></i></a>
                                                    </li>
                                                    <li class="text-left">
                                                        <div class="text-bold text-uppercase">Total online</div>
                                                        <div class="text-muted"><span class="status-mark border-success position-left"></span> 5,378 avg</div>
                                                    </li>
                                                </ul>

                                                <div class="col-lg-10 col-lg-offset-1">
                                                    <div class="content-group" id="total-online"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="position-relative" id="traffic-sources"></div>
                                </div>
                                <!-- /traffic sources -->

                            </div>

                            <div class="col-lg-6">

                                <!-- Progress counters -->
                                <div class="row">
                                    <div class="col-md-4">

                                        <!-- Available hours -->
                                        <div class="panel text-center">
                                            <div class="panel-body">
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li class="dropdown text-muted">
                                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-cog3"></i> <span class="caret"></span></a>
                                                            <ul class="dropdown-menu dropdown-menu-right">
                                                                <li><a href="#"><i class="icon-sync"></i> Update data</a></li>
                                                                <li><a href="#"><i class="icon-list-unordered"></i> Detailed log</a></li>
                                                                <li><a href="#"><i class="icon-pie5"></i> Statistics</a></li>
                                                                <li><a href="#"><i class="icon-cross3"></i> Clear list</a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>

                                                <!-- Progress counter -->
                                                <div class="content-group-sm svg-center position-relative" id="hours-available-progress"></div>
                                                <!-- /progress counter -->


                                                <!-- Bars -->
                                                <div id="hours-available-bars"></div>
                                                <!-- /bars -->

                                            </div>
                                        </div>
                                        <!-- /available hours -->

                                    </div>

                                    <div class="col-md-4">

                                        <!-- Productivity goal -->
                                        <div class="panel text-center">
                                            <div class="panel-body">
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li class="dropdown text-muted">
                                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-cog3"></i> <span class="caret"></span></a>
                                                            <ul class="dropdown-menu dropdown-menu-right">
                                                                <li><a href="#"><i class="icon-sync"></i> Update data</a></li>
                                                                <li><a href="#"><i class="icon-list-unordered"></i> Detailed log</a></li>
                                                                <li><a href="#"><i class="icon-pie5"></i> Statistics</a></li>
                                                                <li><a href="#"><i class="icon-cross3"></i> Clear list</a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>

                                                <!-- Progress counter -->
                                                <div class="content-group-sm svg-center position-relative" id="goal-progress"></div>
                                                <!-- /progress counter -->

                                                <!-- Bars -->
                                                <div id="goal-bars"></div>
                                                <!-- /bars -->

                                            </div>
                                        </div>
                                        <!-- /productivity goal -->

                                    </div>

                                    <div class="col-md-4">

                                        <!-- Productivity goal -->
                                        <div class="panel text-center">
                                            <div class="panel-body">
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li class="dropdown text-muted">
                                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-cog3"></i> <span class="caret"></span></a>
                                                            <ul class="dropdown-menu dropdown-menu-right">
                                                                <li><a href="#"><i class="icon-sync"></i> Update data</a></li>
                                                                <li><a href="#"><i class="icon-list-unordered"></i> Detailed log</a></li>
                                                                <li><a href="#"><i class="icon-pie5"></i> Statistics</a></li>
                                                                <li><a href="#"><i class="icon-cross3"></i> Clear list</a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>

                                                <!-- Progress counter -->
                                                <div class="content-group-sm svg-center position-relative" id="goal-progress_2"></div>
                                                <!-- /progress counter -->

                                                <!-- Bars -->
                                                <div id="goal-bars_2"></div>
                                                <!-- /bars -->

                                            </div>
                                        </div>
                                        <!-- /productivity goal -->

                                    </div>
                                </div>
                                <!-- /progress counters -->


                                <!-- Quick stats boxes -->
                                <div class="row">
                                    <br> <br> <br>
                                    <div class="col-lg-4">

                                        <!-- Members online -->
                                        <div class="panel bg-teal-400">
                                            <div class="panel-body">
                                                <div class="heading-elements">
                                                    <span class="heading-text badge bg-teal-800">+53,6%</span>
                                                </div>

                                                <h3 class="no-margin">4</h3>
                                                Utilizadores online
                                                <div class="text-muted text-size-small">1 avg</div>
                                            </div>

                                            <div class="container-fluid">
                                                <div id="members-online"></div>
                                            </div>
                                        </div>
                                        <!-- /members online -->

                                    </div>

                                    <div class="col-lg-4">

                                        <!-- Current server load -->
                                        <div class="panel bg-pink-400">
                                            <div class="panel-body">
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li class="dropdown">
                                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-cog3"></i> <span class="caret"></span></a>
                                                            <ul class="dropdown-menu dropdown-menu-right">
                                                                <li><a href="#"><i class="icon-sync"></i> Update data</a></li>
                                                                <li><a href="#"><i class="icon-list-unordered"></i> Detailed log</a></li>
                                                                <li><a href="#"><i class="icon-pie5"></i> Statistics</a></li>
                                                                <li><a href="#"><i class="icon-cross3"></i> Clear list</a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>

                                                <h3 class="no-margin">55.4%</h3>
                                                Carga acutal do CPU
                                                <div class="text-muted text-size-small">34.6% avg</div>
                                            </div>

                                            <div id="server-load"></div>
                                        </div>
                                        <!-- /current server load -->

                                    </div>

                                    <div class="col-lg-4">

                                        <!-- Today's revenue -->
                                        <div class="panel bg-blue-400">
                                            <div class="panel-body">
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li><a data-action="reload"></a></li>
                                                    </ul>
                                                </div>

                                                <h3 class="no-margin">18,390</h3>
                                                Logs por semana
                                                <div class="text-muted text-size-small">1,578 avg</div>
                                            </div>

                                            <div id="today-revenue"></div>
                                        </div>
                                        <!-- /today's revenue -->

                                    </div>
                                </div>
                                <!-- /quick stats boxes -->

                            </div>
                        </div>
                        <!-- /main charts -->



                        <%
                            String ano = session.getAttribute("ano").toString();
                        %>

                    </div>
                </div>
                <!-- /main content -->

            </div>
            <!-- /page content -->

            <!-- Footer -->
            <div class="footer text-bold">
                &copy; <%=ano%>. <a href="#" class="text-bold">MINEDH. SEGIA</a>. Todos os direitos reservados
            </div>
            <!-- /footer -->
        </div>


        <!-- /page container -->
    </body>




    <script>
        /* ------------------------------------------------------------------------------
         *
         *  # Dashboard configuration
         *
         *  Demo dashboard configuration. Contains charts and plugin inits
         *
         *  Version: 1.0
         *  Latest update: Aug 1, 2015
         *
         * ---------------------------------------------------------------------------- */

        $(function () {


            // Switchery toggles
            // ------------------------------

            var switches = Array.prototype.slice.call(document.querySelectorAll('.switch'));
            switches.forEach(function (html) {
                var switchery = new Switchery(html, {color: '#4CAF50'});
            });




            // Daterange picker
            // ------------------------------

            $('.daterange-ranges').daterangepicker(
                    {
                        startDate: moment().subtract('days', 29),
                        endDate: moment(),
                        minDate: '01/01/2012',
                        maxDate: '12/31/2016',
                        dateLimit: {days: 60},
                        ranges: {
                            'Today': [moment(), moment()],
                            'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
                            'Last 7 Days': [moment().subtract('days', 6), moment()],
                            'Last 30 Days': [moment().subtract('days', 29), moment()],
                            'This Month': [moment().startOf('month'), moment().endOf('month')],
                            'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                        },
                        opens: 'left',
                        applyClass: 'btn-small bg-slate-600 btn-block',
                        cancelClass: 'btn-small btn-default btn-block',
                        format: 'MM/DD/YYYY'
                    },
                    function (start, end) {
                        $('.daterange-ranges span').html(start.format('MMMM D') + ' - ' + end.format('MMMM D'));
                    }
            );

            $('.daterange-ranges span').html(moment().subtract('days', 29).format('MMMM D') + ' - ' + moment().format('MMMM D'));




            // Traffic sources stream chart
            // ------------------------------

            trafficSources('#traffic-sources', 330); // initialize chart

            // Chart setup
            function trafficSources(element, height) {


                // Basic setup
                // ------------------------------

                // Define main variables
                var d3Container = d3.select(element),
                        margin = {top: 5, right: 50, bottom: 40, left: 50},
                        width = d3Container.node().getBoundingClientRect().width - margin.left - margin.right,
                        height = height - margin.top - margin.bottom,
                        tooltipOffset = 30;

                // Tooltip
                var tooltip = d3Container
                        .append("div")
                        .attr("class", "d3-tip e")
                        .style("display", "none")

                // Format date
                var format = d3.time.format("%m/%d/%y %H:%M");
                var formatDate = d3.time.format("%H:%M");

                // Colors
                var colorrange = ['#03A9F4', '#29B6F6', '#4FC3F7', '#81D4FA', '#B3E5FC', '#E1F5FE'];



                // Construct scales
                // ------------------------------

                // Horizontal
                var x = d3.time.scale().range([0, width]);

                // Vertical
                var y = d3.scale.linear().range([height, 0]);

                // Colors
                var z = d3.scale.ordinal().range(colorrange);



                // Create axes
                // ------------------------------

                // Horizontal
                var xAxis = d3.svg.axis()
                        .scale(x)
                        .orient("bottom")
                        .ticks(d3.time.hours, 4)
                        .innerTickSize(4)
                        .tickPadding(8)
                        .tickFormat(d3.time.format("%H:%M")); // Display hours and minutes in 24h format

                // Left vertical
                var yAxis = d3.svg.axis()
                        .scale(y)
                        .ticks(6)
                        .innerTickSize(4)
                        .outerTickSize(0)
                        .tickPadding(8)
                        .tickFormat(function (d) {
                            return (d / 1000) + "k";
                        });

                // Right vertical
                var yAxis2 = yAxis;

                // Dash lines
                var gridAxis = d3.svg.axis()
                        .scale(y)
                        .orient("left")
                        .ticks(6)
                        .tickPadding(8)
                        .tickFormat("")
                        .tickSize(-width, 0, 0);



                // Create chart
                // ------------------------------

                // Container
                var container = d3Container.append("svg")

                // SVG element
                var svg = container
                        .attr('width', width + margin.left + margin.right)
                        .attr("height", height + margin.top + margin.bottom)
                        .append("g")
                        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");



                // Construct chart layout
                // ------------------------------

                // Stack
                var stack = d3.layout.stack()
                        .offset("silhouette")
                        .values(function (d) {
                            return d.values;
                        })
                        .x(function (d) {
                            return d.date;
                        })
                        .y(function (d) {
                            return d.value;
                        });

                // Nest
                var nest = d3.nest()
                        .key(function (d) {
                            return d.key;
                        });

                // Area
                var area = d3.svg.area()
                        .interpolate("cardinal")
                        .x(function (d) {
                            return x(d.date);
                        })
                        .y0(function (d) {
                            return y(d.y0);
                        })
                        .y1(function (d) {
                            return y(d.y0 + d.y);
                        });



                // Load data
                // ------------------------------

                d3.csv("assets/demo_data/dashboard/traffic_sources.csv", function (error, data) {

                    // Pull out values
                    data.forEach(function (d) {
                        d.date = format.parse(d.date);
                        d.value = +d.value;
                    });

                    // Stack and nest layers
                    var layers = stack(nest.entries(data));



                    // Set input domains
                    // ------------------------------

                    // Horizontal
                    x.domain(d3.extent(data, function (d, i) {
                        return d.date;
                    }));

                    // Vertical
                    y.domain([0, d3.max(data, function (d) {
                            return d.y0 + d.y;
                        })]);



                    // Add grid
                    // ------------------------------

                    // Horizontal grid. Must be before the group
                    svg.append("g")
                            .attr("class", "d3-grid-dashed")
                            .call(gridAxis);



                    //
                    // Append chart elements
                    //

                    // Stream layers
                    // ------------------------------

                    // Create group
                    var group = svg.append('g')
                            .attr('class', 'streamgraph-layers-group');

                    // And append paths to this group
                    var layer = group.selectAll(".streamgraph-layer")
                            .data(layers)
                            .enter()
                            .append("path")
                            .attr("class", "streamgraph-layer")
                            .attr("d", function (d) {
                                return area(d.values);
                            })
                            .style('stroke', '#fff')
                            .style('stroke-width', 0.5)
                            .style("fill", function (d, i) {
                                return z(i);
                            });

                    // Add transition
                    var layerTransition = layer
                            .style('opacity', 0)
                            .transition()
                            .duration(750)
                            .delay(function (d, i) {
                                return i * 50;
                            })
                            .style('opacity', 1)



                    // Append axes
                    // ------------------------------

                    //
                    // Left vertical
                    //

                    svg.append("g")
                            .attr("class", "d3-axis d3-axis-left d3-axis-solid")
                            .call(yAxis.orient("left"));

                    // Hide first tick
                    d3.select(svg.selectAll('.d3-axis-left .tick text')[0][0])
                            .style("visibility", "hidden");


                    //
                    // Right vertical
                    //

                    svg.append("g")
                            .attr("class", "d3-axis d3-axis-right d3-axis-solid")
                            .attr("transform", "translate(" + width + ", 0)")
                            .call(yAxis2.orient("right"));

                    // Hide first tick
                    d3.select(svg.selectAll('.d3-axis-right .tick text')[0][0])
                            .style("visibility", "hidden");


                    //
                    // Horizontal
                    //

                    var xaxisg = svg.append("g")
                            .attr("class", "d3-axis d3-axis-horizontal d3-axis-solid")
                            .attr("transform", "translate(0," + height + ")")
                            .call(xAxis);

                    // Add extra subticks for hidden hours
                    xaxisg.selectAll(".d3-axis-subticks")
                            .data(x.ticks(d3.time.hours), function (d) {
                                return d;
                            })
                            .enter()
                            .append("line")
                            .attr("class", "d3-axis-subticks")
                            .attr("y1", 0)
                            .attr("y2", 4)
                            .attr("x1", x)
                            .attr("x2", x);



                    // Add hover line and pointer
                    // ------------------------------

                    // Append group to the group of paths to prevent appearance outside chart area
                    var hoverLineGroup = group.append("g")
                            .attr("class", "hover-line");

                    // Add line
                    var hoverLine = hoverLineGroup
                            .append("line")
                            .attr("y1", 0)
                            .attr("y2", height)
                            .style('fill', 'none')
                            .style('stroke', '#fff')
                            .style('stroke-width', 1)
                            .style('pointer-events', 'none')
                            .style('shape-rendering', 'crispEdges')
                            .style("opacity", 0);

                    // Add pointer
                    var hoverPointer = hoverLineGroup
                            .append("rect")
                            .attr("x", 2)
                            .attr("y", 2)
                            .attr("width", 6)
                            .attr("height", 6)
                            .style('fill', '#03A9F4')
                            .style('stroke', '#fff')
                            .style('stroke-width', 1)
                            .style('shape-rendering', 'crispEdges')
                            .style('pointer-events', 'none')
                            .style("opacity", 0);



                    // Append events to the layers group
                    // ------------------------------

                    layerTransition.each("end", function () {
                        layer
                                .on("mouseover", function (d, i) {
                                    svg.selectAll(".streamgraph-layer")
                                            .transition()
                                            .duration(250)
                                            .style("opacity", function (d, j) {
                                                return j != i ? 0.75 : 1; // Mute all except hovered
                                            });
                                })

                                .on("mousemove", function (d, i) {
                                    mouse = d3.mouse(this);
                                    mousex = mouse[0];
                                    mousey = mouse[1];
                                    datearray = [];
                                    var invertedx = x.invert(mousex);
                                    invertedx = invertedx.getHours();
                                    var selected = (d.values);
                                    for (var k = 0; k < selected.length; k++) {
                                        datearray[k] = selected[k].date
                                        datearray[k] = datearray[k].getHours();
                                    }
                                    mousedate = datearray.indexOf(invertedx);
                                    pro = d.values[mousedate].value;


                                    // Display mouse pointer
                                    hoverPointer
                                            .attr("x", mousex - 3)
                                            .attr("y", mousey - 6)
                                            .style("opacity", 1);

                                    hoverLine
                                            .attr("x1", mousex)
                                            .attr("x2", mousex)
                                            .style("opacity", 1);

                                    //
                                    // Tooltip
                                    //

                                    // Tooltip data
                                    tooltip.html(
                                            "<ul class='list-unstyled mb-5'>" +
                                            "<li>" + "<div class='text-size-base mt-5 mb-5'><i class='icon-circle-left2 position-left'></i>" + d.key + "</div>" + "</li>" +
                                            "<li>" + "Visits: &nbsp;" + "<span class='text-semibold pull-right'>" + pro + "</span>" + "</li>" +
                                            "<li>" + "Time: &nbsp; " + "<span class='text-semibold pull-right'>" + formatDate(d.values[mousedate].date) + "</span>" + "</li>" +
                                            "</ul>"
                                            )
                                            .style("display", "block");

                                    // Tooltip arrow
                                    tooltip.append('div').attr('class', 'd3-tip-arrow');
                                })

                                .on("mouseout", function (d, i) {

                                    // Revert full opacity to all paths
                                    svg.selectAll(".streamgraph-layer")
                                            .transition()
                                            .duration(250)
                                            .style("opacity", 1);

                                    // Hide cursor pointer
                                    hoverPointer.style("opacity", 0);

                                    // Hide tooltip
                                    tooltip.style("display", "none");

                                    hoverLine.style("opacity", 0);
                                });
                    });



                    // Append events to the chart container
                    // ------------------------------

                    d3Container
                            .on("mousemove", function (d, i) {
                                mouse = d3.mouse(this);
                                mousex = mouse[0];
                                mousey = mouse[1];

                                // Display hover line
                                //.style("opacity", 1);


                                // Move tooltip vertically
                                tooltip.style("top", (mousey - ($('.d3-tip').outerHeight() / 2)) - 2 + "px") // Half tooltip height - half arrow width

                                // Move tooltip horizontally
                                if (mousex >= ($(element).outerWidth() - $('.d3-tip').outerWidth() - margin.right - (tooltipOffset * 2))) {
                                    tooltip
                                            .style("left", (mousex - $('.d3-tip').outerWidth() - tooltipOffset) + "px") // Change tooltip direction from right to left to keep it inside graph area
                                            .attr("class", "d3-tip w");
                                } else {
                                    tooltip
                                            .style("left", (mousex + tooltipOffset) + "px")
                                            .attr("class", "d3-tip e");
                                }
                            });
                });



                // Resize chart
                // ------------------------------

                // Call function on window resize
                $(window).on('resize', resizeStream);

                // Call function on sidebar width change
                $('.sidebar-control').on('click', resizeStream);

                // Resize function
                // 
                // Since D3 doesn't support SVG resize by default,
                // we need to manually specify parts of the graph that need to 
                // be updated on window resize
                function resizeStream() {

                    // Layout
                    // -------------------------

                    // Define width
                    width = d3Container.node().getBoundingClientRect().width - margin.left - margin.right;

                    // Main svg width
                    container.attr("width", width + margin.left + margin.right);

                    // Width of appended group
                    svg.attr("width", width + margin.left + margin.right);

                    // Horizontal range
                    x.range([0, width]);


                    // Chart elements
                    // -------------------------

                    // Horizontal axis
                    svg.selectAll('.d3-axis-horizontal').call(xAxis);

                    // Horizontal axis subticks
                    svg.selectAll('.d3-axis-subticks').attr("x1", x).attr("x2", x);

                    // Grid lines width
                    svg.selectAll(".d3-grid-dashed").call(gridAxis.tickSize(-width, 0, 0))

                    // Right vertical axis
                    svg.selectAll(".d3-axis-right").attr("transform", "translate(" + width + ", 0)");

                    // Area paths
                    svg.selectAll('.streamgraph-layer').attr("d", function (d) {
                        return area(d.values);
                    });
                }
            }



            // Sparklines
            // ------------------------------

            // Initialize chart
            sparkline("#new-visitors", "line", 30, 35, "basis", 750, 2000, "#26A69A");
            sparkline("#new-sessions", "line", 30, 35, "basis", 750, 2000, "#FF7043");
            sparkline("#total-online", "line", 30, 35, "basis", 750, 2000, "#5C6BC0");
            sparkline("#server-load", "area", 30, 50, "basis", 750, 2000, "rgba(255,255,255,0.5)");

            // Chart setup
            function sparkline(element, chartType, qty, height, interpolation, duration, interval, color) {


                // Basic setup
                // ------------------------------

                // Define main variables
                var d3Container = d3.select(element),
                        margin = {top: 0, right: 0, bottom: 0, left: 0},
                        width = d3Container.node().getBoundingClientRect().width - margin.left - margin.right,
                        height = height - margin.top - margin.bottom;


                // Generate random data (for demo only)
                var data = [];
                for (var i = 0; i < qty; i++) {
                    data.push(Math.floor(Math.random() * qty) + 5)
                }



                // Construct scales
                // ------------------------------

                // Horizontal
                var x = d3.scale.linear().range([0, width]);

                // Vertical
                var y = d3.scale.linear().range([height - 5, 5]);



                // Set input domains
                // ------------------------------

                // Horizontal
                x.domain([1, qty - 3])

                // Vertical
                y.domain([0, qty])



                // Construct chart layout
                // ------------------------------

                // Line
                var line = d3.svg.line()
                        .interpolate(interpolation)
                        .x(function (d, i) {
                            return x(i);
                        })
                        .y(function (d, i) {
                            return y(d);
                        });

                // Area
                var area = d3.svg.area()
                        .interpolate(interpolation)
                        .x(function (d, i) {
                            return x(i);
                        })
                        .y0(height)
                        .y1(function (d) {
                            return y(d);
                        });



                // Create SVG
                // ------------------------------

                // Container
                var container = d3Container.append('svg');

                // SVG element
                var svg = container
                        .attr('width', width + margin.left + margin.right)
                        .attr('height', height + margin.top + margin.bottom)
                        .append("g")
                        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");



                // Add mask for animation
                // ------------------------------

                // Add clip path
                var clip = svg.append("defs")
                        .append("clipPath")
                        .attr('id', function (d, i) {
                            return "load-clip-" + element.substring(1)
                        })

                // Add clip shape
                var clips = clip.append("rect")
                        .attr('class', 'load-clip')
                        .attr("width", 0)
                        .attr("height", height);

                // Animate mask
                clips
                        .transition()
                        .duration(1000)
                        .ease('linear')
                        .attr("width", width);



                //
                // Append chart elements
                //

                // Main path
                var path = svg.append("g")
                        .attr("clip-path", function (d, i) {
                            return "url(#load-clip-" + element.substring(1) + ")"
                        })
                        .append("path")
                        .datum(data)
                        .attr("transform", "translate(" + x(0) + ",0)");

                // Add path based on chart type
                if (chartType == "area") {
                    path.attr("d", area).attr('class', 'd3-area').style("fill", color); // area
                } else {
                    path.attr("d", line).attr("class", "d3-line d3-line-medium").style('stroke', color); // line
                }

                // Animate path
                path
                        .style('opacity', 0)
                        .transition()
                        .duration(750)
                        .style('opacity', 1);



                // Set update interval. For demo only
                // ------------------------------

                setInterval(function () {

                    // push a new data point onto the back
                    data.push(Math.floor(Math.random() * qty) + 5);

                    // pop the old data point off the front
                    data.shift();

                    update();

                }, interval);



                // Update random data. For demo only
                // ------------------------------

                function update() {

                    // Redraw the path and slide it to the left
                    path
                            .attr("transform", null)
                            .transition()
                            .duration(duration)
                            .ease("linear")
                            .attr("transform", "translate(" + x(0) + ",0)");

                    // Update path type
                    if (chartType == "area") {
                        path.attr("d", area).attr('class', 'd3-area').style("fill", color)
                    } else {
                        path.attr("d", line).attr("class", "d3-line d3-line-medium").style('stroke', color);
                    }
                }



                // Resize chart
                // ------------------------------

                // Call function on window resize
                $(window).on('resize', resizeSparklines);

                // Call function on sidebar width change
                $('.sidebar-control').on('click', resizeSparklines);

                // Resize function
                // 
                // Since D3 doesn't support SVG resize by default,
                // we need to manually specify parts of the graph that need to 
                // be updated on window resize
                function resizeSparklines() {

                    // Layout variables
                    width = d3Container.node().getBoundingClientRect().width - margin.left - margin.right;


                    // Layout
                    // -------------------------

                    // Main svg width
                    container.attr("width", width + margin.left + margin.right);

                    // Width of appended group
                    svg.attr("width", width + margin.left + margin.right);

                    // Horizontal range
                    x.range([0, width]);


                    // Chart elements
                    // -------------------------

                    // Clip mask
                    clips.attr("width", width);

                    // Line
                    svg.select(".d3-line").attr("d", line);

                    // Area
                    svg.select(".d3-area").attr("d", area);
                }
            }




            // Daily revenue line chart
            // ------------------------------

            dailyRevenue('#today-revenue', 50); // initialize chart

            // Chart setup
            function dailyRevenue(element, height) {


                // Basic setup
                // ------------------------------

                // Add data set
                var dataset = [
                    {
                        "date": "04/13/14",
                        "alpha": "60"
                    }, {
                        "date": "04/14/14",
                        "alpha": "35"
                    }, {
                        "date": "04/15/14",
                        "alpha": "65"
                    }, {
                        "date": "04/16/14",
                        "alpha": "50"
                    }, {
                        "date": "04/17/14",
                        "alpha": "65"
                    }, {
                        "date": "04/18/14",
                        "alpha": "20"
                    }, {
                        "date": "04/19/14",
                        "alpha": "60"
                    }
                ];

                // Main variables
                var d3Container = d3.select(element),
                        margin = {top: 0, right: 0, bottom: 0, left: 0},
                        width = d3Container.node().getBoundingClientRect().width - margin.left - margin.right,
                        height = height - margin.top - margin.bottom,
                        padding = 20;

                // Format date
                var parseDate = d3.time.format("%m/%d/%y").parse,
                        formatDate = d3.time.format("%a, %B %e");



                // Add tooltip
                // ------------------------------

                var tooltip = d3.tip()
                        .attr('class', 'd3-tip')
                        .html(function (d) {
                            return "<ul class='list-unstyled mb-5'>" +
                                    "<li>" + "<div class='text-size-base mt-5 mb-5'><i class='icon-check2 position-left'></i>" + formatDate(d.date) + "</div>" + "</li>" +
                                    "<li>" + "Sales: &nbsp;" + "<span class='text-semibold pull-right'>" + d.alpha + "</span>" + "</li>" +
                                    "<li>" + "Revenue: &nbsp; " + "<span class='text-semibold pull-right'>" + "$" + (d.alpha * 25).toFixed(2) + "</span>" + "</li>" +
                                    "</ul>";
                        });



                // Create chart
                // ------------------------------

                // Add svg element
                var container = d3Container.append('svg');

                // Add SVG group
                var svg = container
                        .attr('width', width + margin.left + margin.right)
                        .attr('height', height + margin.top + margin.bottom)
                        .append("g")
                        .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
                        .call(tooltip);



                // Load data
                // ------------------------------

                dataset.forEach(function (d) {
                    d.date = parseDate(d.date);
                    d.alpha = +d.alpha;
                });



                // Construct scales
                // ------------------------------

                // Horizontal
                var x = d3.time.scale()
                        .range([padding, width - padding]);

                // Vertical
                var y = d3.scale.linear()
                        .range([height, 5]);



                // Set input domains
                // ------------------------------

                // Horizontal
                x.domain(d3.extent(dataset, function (d) {
                    return d.date;
                }));

                // Vertical
                y.domain([0, d3.max(dataset, function (d) {
                        return Math.max(d.alpha);
                    })]);



                // Construct chart layout
                // ------------------------------

                // Line
                var line = d3.svg.line()
                        .x(function (d) {
                            return x(d.date);
                        })
                        .y(function (d) {
                            return y(d.alpha)
                        });



                //
                // Append chart elements
                //

                // Add mask for animation
                // ------------------------------

                // Add clip path
                var clip = svg.append("defs")
                        .append("clipPath")
                        .attr("id", "clip-line-small");

                // Add clip shape
                var clipRect = clip.append("rect")
                        .attr('class', 'clip')
                        .attr("width", 0)
                        .attr("height", height);

                // Animate mask
                clipRect
                        .transition()
                        .duration(1000)
                        .ease('linear')
                        .attr("width", width);



                // Line
                // ------------------------------

                // Path
                var path = svg.append('path')
                        .attr({
                            'd': line(dataset),
                            "clip-path": "url(#clip-line-small)",
                            'class': 'd3-line d3-line-medium'
                        })
                        .style('stroke', '#fff');

                // Animate path
                svg.select('.line-tickets')
                        .transition()
                        .duration(1000)
                        .ease('linear');



                // Add vertical guide lines
                // ------------------------------

                // Bind data
                var guide = svg.append('g')
                        .selectAll('.d3-line-guides-group')
                        .data(dataset);

                // Append lines
                guide
                        .enter()
                        .append('line')
                        .attr('class', 'd3-line-guides')
                        .attr('x1', function (d, i) {
                            return x(d.date);
                        })
                        .attr('y1', function (d, i) {
                            return height;
                        })
                        .attr('x2', function (d, i) {
                            return x(d.date);
                        })
                        .attr('y2', function (d, i) {
                            return height;
                        })
                        .style('stroke', 'rgba(255,255,255,0.3)')
                        .style('stroke-dasharray', '4,2')
                        .style('shape-rendering', 'crispEdges');

                // Animate guide lines
                guide
                        .transition()
                        .duration(1000)
                        .delay(function (d, i) {
                            return i * 150;
                        })
                        .attr('y2', function (d, i) {
                            return y(d.alpha);
                        });



                // Alpha app points
                // ------------------------------

                // Add points
                var points = svg.insert('g')
                        .selectAll('.d3-line-circle')
                        .data(dataset)
                        .enter()
                        .append('circle')
                        .attr('class', 'd3-line-circle d3-line-circle-medium')
                        .attr("cx", line.x())
                        .attr("cy", line.y())
                        .attr("r", 3)
                        .style('stroke', '#fff')
                        .style('fill', '#29B6F6');



                // Animate points on page load
                points
                        .style('opacity', 0)
                        .transition()
                        .duration(250)
                        .ease('linear')
                        .delay(1000)
                        .style('opacity', 1);


                // Add user interaction
                points
                        .on("mouseover", function (d) {
                            tooltip.offset([-10, 0]).show(d);

                            // Animate circle radius
                            d3.select(this).transition().duration(250).attr('r', 4);
                        })

                        // Hide tooltip
                        .on("mouseout", function (d) {
                            tooltip.hide(d);

                            // Animate circle radius
                            d3.select(this).transition().duration(250).attr('r', 3);
                        });

                // Change tooltip direction of first point
                d3.select(points[0][0])
                        .on("mouseover", function (d) {
                            tooltip.offset([0, 10]).direction('e').show(d);

                            // Animate circle radius
                            d3.select(this).transition().duration(250).attr('r', 4);
                        })
                        .on("mouseout", function (d) {
                            tooltip.direction('n').hide(d);

                            // Animate circle radius
                            d3.select(this).transition().duration(250).attr('r', 3);
                        });

                // Change tooltip direction of last point
                d3.select(points[0][points.size() - 1])
                        .on("mouseover", function (d) {
                            tooltip.offset([0, -10]).direction('w').show(d);

                            // Animate circle radius
                            d3.select(this).transition().duration(250).attr('r', 4);
                        })
                        .on("mouseout", function (d) {
                            tooltip.direction('n').hide(d);

                            // Animate circle radius
                            d3.select(this).transition().duration(250).attr('r', 3);
                        })



                // Resize chart
                // ------------------------------

                // Call function on window resize
                $(window).on('resize', revenueResize);

                // Call function on sidebar width change
                $('.sidebar-control').on('click', revenueResize);

                // Resize function
                // 
                // Since D3 doesn't support SVG resize by default,
                // we need to manually specify parts of the graph that need to 
                // be updated on window resize
                function revenueResize() {

                    // Layout variables
                    width = d3Container.node().getBoundingClientRect().width - margin.left - margin.right;


                    // Layout
                    // -------------------------

                    // Main svg width
                    container.attr("width", width + margin.left + margin.right);

                    // Width of appended group
                    svg.attr("width", width + margin.left + margin.right);

                    // Horizontal range
                    x.range([padding, width - padding]);


                    // Chart elements
                    // -------------------------

                    // Mask
                    clipRect.attr("width", width);

                    // Line path
                    svg.selectAll('.d3-line').attr("d", line(dataset));

                    // Circles
                    svg.selectAll('.d3-line-circle').attr("cx", line.x());

                    // Guide lines
                    svg.selectAll('.d3-line-guides')
                            .attr('x1', function (d, i) {
                                return x(d.date);
                            })
                            .attr('x2', function (d, i) {
                                return x(d.date);
                            });
                }
            }




            // Marketing campaigns progress pie chart
            // ------------------------------

            // Initialize chart
            progressMeter("#today-progress", 20, 20, '#7986CB');
            progressMeter("#yesterday-progress", 20, 20, '#7986CB');

            // Chart setup
            function progressMeter(element, width, height, color) {


                // Basic setup
                // ------------------------------

                // Main variables
                var d3Container = d3.select(element),
                        border = 2,
                        radius = Math.min(width / 2, height / 2) - border,
                        twoPi = 2 * Math.PI,
                        progress = $(element).data('progress'),
                        total = 100;



                // Construct chart layout
                // ------------------------------

                // Arc
                var arc = d3.svg.arc()
                        .startAngle(0)
                        .innerRadius(0)
                        .outerRadius(radius)
                        .endAngle(function (d) {
                            return (d.value / d.size) * 2 * Math.PI;
                        })



                // Create chart
                // ------------------------------

                // Add svg element
                var container = d3Container.append("svg");

                // Add SVG group
                var svg = container
                        .attr("width", width)
                        .attr("height", height)
                        .append("g")
                        .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");



                //
                // Append chart elements
                //

                // Progress group
                var meter = svg.append("g")
                        .attr("class", "progress-meter");

                // Background
                meter.append("path")
                        .attr("d", arc.endAngle(twoPi))
                        .style('fill', '#fff')
                        .style('stroke', color)
                        .style('stroke-width', 1.5);

                // Foreground
                var foreground = meter.append("path")
                        .style('fill', color);

                // Animate foreground path
                foreground
                        .transition()
                        .ease("cubic-out")
                        .duration(2500)
                        .attrTween("d", arcTween);


                // Tween arcs
                function arcTween() {
                    var i = d3.interpolate(0, progress);
                    return function (t) {
                        var currentProgress = progress / (100 / t);
                        var endAngle = arc.endAngle(twoPi * (currentProgress));
                        return arc(i(endAngle));
                    };
                }
            }


            // Bar charts with random data
            // ------------------------------

            // Initialize charts
            generateBarChart("#hours-available-bars", 24, 40, true, "elastic", 1200, 50, "#EC407A", "hours");
            generateBarChart("#goal-bars", 24, 40, true, "elastic", 1200, 50, "#5C6BC0", "goal"); 
            generateBarChart("#goal-bars_2", 24, 40, true, "elastic", 1200, 50, "#26A69A", "goal");
            generateBarChart("#members-online", 24, 50, true, "elastic", 1200, 50, "rgba(255,255,255,0.5)", "members");

            // Chart setup
            function generateBarChart(element, barQty, height, animate, easing, duration, delay, color, tooltip) {


                // Basic setup
                // ------------------------------

                // Add data set
                var bardata = [];
                for (var i = 0; i < barQty; i++) {
                    bardata.push(Math.round(Math.random() * 10) + 10)
                }

                // Main variables
                var d3Container = d3.select(element),
                        width = d3Container.node().getBoundingClientRect().width;



                // Construct scales
                // ------------------------------

                // Horizontal
                var x = d3.scale.ordinal()
                        .rangeBands([0, width], 0.3)

                // Vertical
                var y = d3.scale.linear()
                        .range([0, height]);



                // Set input domains
                // ------------------------------

                // Horizontal
                x.domain(d3.range(0, bardata.length))

                // Vertical
                y.domain([0, d3.max(bardata)])



                // Create chart
                // ------------------------------

                // Add svg element
                var container = d3Container.append('svg');

                // Add SVG group
                var svg = container
                        .attr('width', width)
                        .attr('height', height)
                        .append('g');



                //
                // Append chart elements
                //

                // Bars
                var bars = svg.selectAll('rect')
                        .data(bardata)
                        .enter()
                        .append('rect')
                        .attr('class', 'd3-random-bars')
                        .attr('width', x.rangeBand())
                        .attr('x', function (d, i) {
                            return x(i);
                        })
                        .style('fill', color);



                // Tooltip
                // ------------------------------

                var tip = d3.tip()
                        .attr('class', 'd3-tip')
                        .offset([-10, 0]);

                // Show and hide
                if (tooltip == "hours" || tooltip == "goal" || tooltip == "members") {
                    bars.call(tip)
                            .on('mouseover', tip.show)
                            .on('mouseout', tip.hide);
                }

                // Daily meetings tooltip content
                if (tooltip == "hours") {
                    tip.html(function (d, i) {
                        return "<div class='text-center'>" +
                                "<h6 class='no-margin'>" + d + "</h6>" +
                                "<span class='text-size-small'>meetings</span>" +
                                "<div class='text-size-small'>" + i + ":00" + "</div>" +
                                "</div>"
                    });
                }

                // Statements tooltip content
                if (tooltip == "goal") {
                    tip.html(function (d, i) {
                        return "<div class='text-center'>" +
                                "<h6 class='no-margin'>" + d + "</h6>" +
                                "<span class='text-size-small'>statements</span>" +
                                "<div class='text-size-small'>" + i + ":00" + "</div>" +
                                "</div>"
                    });
                }

                // Online members tooltip content
                if (tooltip == "members") {
                    tip.html(function (d, i) {
                        return "<div class='text-center'>" +
                                "<h6 class='no-margin'>" + d + "0" + "</h6>" +
                                "<span class='text-size-small'>members</span>" +
                                "<div class='text-size-small'>" + i + ":00" + "</div>" +
                                "</div>"
                    });
                }



                // Bar loading animation
                // ------------------------------

                // Choose between animated or static
                if (animate) {
                    withAnimation();
                } else {
                    withoutAnimation();
                }

                // Animate on load
                function withAnimation() {
                    bars
                            .attr('height', 0)
                            .attr('y', height)
                            .transition()
                            .attr('height', function (d) {
                                return y(d);
                            })
                            .attr('y', function (d) {
                                return height - y(d);
                            })
                            .delay(function (d, i) {
                                return i * delay;
                            })
                            .duration(duration)
                            .ease(easing);
                }

                // Load without animateion
                function withoutAnimation() {
                    bars
                            .attr('height', function (d) {
                                return y(d);
                            })
                            .attr('y', function (d) {
                                return height - y(d);
                            })
                }



                // Resize chart
                // ------------------------------

                // Call function on window resize
                $(window).on('resize', barsResize);

                // Call function on sidebar width change
                $('.sidebar-control').on('click', barsResize);

                // Resize function
                // 
                // Since D3 doesn't support SVG resize by default,
                // we need to manually specify parts of the graph that need to 
                // be updated on window resize
                function barsResize() {

                    // Layout variables
                    width = d3Container.node().getBoundingClientRect().width;


                    // Layout
                    // -------------------------

                    // Main svg width
                    container.attr("width", width);

                    // Width of appended group
                    svg.attr("width", width);

                    // Horizontal range
                    x.rangeBands([0, width], 0.3);


                    // Chart elements
                    // -------------------------

                    // Bars
                    svg.selectAll('.d3-random-bars')
                            .attr('width', x.rangeBand())
                            .attr('x', function (d, i) {
                                return x(i);
                            });
                }
            }




            // Animated progress chart
            // ------------------------------

            // Initialize charts
            progressCounter('#hours-available-progress', 38, 2, "#F06292", 0.68, "icon-watch text-pink-400", 'Disponibilidade do servidor', '64% média');
            progressCounter('#goal-progress', 38, 2, "#5C6BC0", 0.82, "icon-trophy3 text-indigo-400", 'Produtividade do servidor', '87% média');
            progressCounter('#goal-progress_2', 38, 2, "#26A69A", 0.93, "icon-users text-teal-400", 'Sessões finalizadas', '93% média');

            // Chart setup
            function progressCounter(element, radius, border, color, end, iconClass, textTitle, textAverage) {


                // Basic setup
                // ------------------------------

                // Main variables
                var d3Container = d3.select(element),
                        startPercent = 0,
                        iconSize = 32,
                        endPercent = end,
                        twoPi = Math.PI * 2,
                        formatPercent = d3.format('.0%'),
                        boxSize = radius * 2;

                // Values count
                var count = Math.abs((endPercent - startPercent) / 0.01);

                // Values step
                var step = endPercent < startPercent ? -0.01 : 0.01;



                // Create chart
                // ------------------------------

                // Add SVG element
                var container = d3Container.append('svg');

                // Add SVG group
                var svg = container
                        .attr('width', boxSize)
                        .attr('height', boxSize)
                        .append('g')
                        .attr('transform', 'translate(' + (boxSize / 2) + ',' + (boxSize / 2) + ')');



                // Construct chart layout
                // ------------------------------

                // Arc
                var arc = d3.svg.arc()
                        .startAngle(0)
                        .innerRadius(radius)
                        .outerRadius(radius - border);



                //
                // Append chart elements
                //

                // Paths
                // ------------------------------

                // Background path
                svg.append('path')
                        .attr('class', 'd3-progress-background')
                        .attr('d', arc.endAngle(twoPi))
                        .style('fill', '#eee');

                // Foreground path
                var foreground = svg.append('path')
                        .attr('class', 'd3-progress-foreground')
                        .attr('filter', 'url(#blur)')
                        .style('fill', color)
                        .style('stroke', color);

                // Front path
                var front = svg.append('path')
                        .attr('class', 'd3-progress-front')
                        .style('fill', color)
                        .style('fill-opacity', 1);



                // Text
                // ------------------------------

                // Percentage text value
                var numberText = d3.select(element)
                        .append('h2')
                        .attr('class', 'mt-15 mb-5')

                // Icon
                d3.select(element)
                        .append("i")
                        .attr("class", iconClass + " counter-icon")
                        .attr('style', 'top: ' + ((boxSize - iconSize) / 2) + 'px');

                // Title
                d3.select(element)
                        .append('div')
                        .text(textTitle);

                // Subtitle
                d3.select(element)
                        .append('div')
                        .attr('class', 'text-size-small text-muted')
                        .text(textAverage);



                // Animation
                // ------------------------------

                // Animate path
                function updateProgress(progress) {
                    foreground.attr('d', arc.endAngle(twoPi * progress));
                    front.attr('d', arc.endAngle(twoPi * progress));
                    numberText.text(formatPercent(progress));
                }

                // Animate text
                var progress = startPercent;
                (function loops() {
                    updateProgress(progress);
                    if (count > 0) {
                        count--;
                        progress += step;
                        setTimeout(loops, 10);
                    }
                })();
            }



            // Other codes
            // ------------------------------

            // Grab first letter and insert to the icon
            $(".table tr").each(function (i) {

                // Title
                var $title = $(this).find('.letter-icon-title'),
                        letter = $title.eq(0).text().charAt(0).toUpperCase();

                // Icon
                var $icon = $(this).find('.letter-icon');
                $icon.eq(0).text(letter);
            });

        });

    </script>

    <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>

</html>
