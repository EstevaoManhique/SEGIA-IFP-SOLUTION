<%-- 
    Document   : student-info
    Created on : Jun 1, 2016, 1:05:33 PM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.local.HCal"%>
<%@page import="org.joda.time.Days"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dciapps.webclient.Pagamento"%>
<%@page import="com.dciapps.webclient.Mensalidade"%>
<%@page import="com.dciapps.webclient.Notas"%>
<%@page import="com.dciapps.webclient.Turno"%>
<%@page import="com.dciapps.webclient.Inscricao"%>
<%@page import="com.dciapps.webclient.Turma"%>
<%@page import="com.dciapps.webclient.Aluno"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="com.dciapps.localcontroler.Data"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="com.dciapps.controller.GenericHandler"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SEGIA - Outras Informações</title>

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
        <!-- /core JS files -->

        <!-- Theme JS files -->
        <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/switchery.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/switch.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/selects/select2.min.js"></script>
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

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            EncryptUtils encryptUtils = new EncryptUtils();

            Entidade entidade = (Entidade) session.getAttribute("entidadeSelecionada");

            if (entidade == null) {
                entidade = (Entidade) session.getAttribute("entidade");
            }
            Inscricao inscricao = null;
            List<HCal> hCals = null;
            Turma turma = null;

            int faltas = 0;

            String comportamento = "";
            float notaMaxima = 0;
            float notaMinima = 0;
            float mediaActual = 0;

            String semestre = "";


            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = "Estudante";

                hCals = (List<HCal>) session.getAttribute("hCals");
                turma = (Turma) session.getAttribute("turma");

                comportamento = session.getAttribute("comportamento").toString();
                
                inscricao = (Inscricao) session.getAttribute("inscricao");
                
                if (session.getAttribute("semestre") != null) {
                    semestre = session.getAttribute("semestre").toString();
                }

                response.setHeader("Refresh", timeout + "; URL =VXN1YXJpb1NlcnZsZXQjRENJ?" + encryptUtils.encodeString("accao#lockscreen&user=" + encryptUtils.decodeString(usuario.getUsuaUsuario()) + "&ei=" + entidade.getEntiId()));

            }
        %>
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
                        <form method="post" action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jbG9nb3V0I0RDSQ==">
                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase btn-labeled btn-labeled-left bg-danger-400 heading-btn">Terminar a sessão<b><i class="icon-switch"></i></b></button>
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
                <%@ include file="../menu.jsp" %> 
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
                                <li class="active"><a href="#settings" data-toggle="tab"  class="text-bold text-uppercase"><i class="icon-info22 position-left"></i> Outras Informações do Aluno</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->


                    <div class ="row">
                        <div class="col-md-6">


                            <!-- Basic table -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Avaliação</h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>

                                        </ul>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="text-bold text-uppercase">Descrição</th>
                                                <th class="text-bold text-uppercase">Detalhes</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><i class="icon-brain"></i> <b>Comportamento</b></td>
                                                <td><span class="label label-success"><%=comportamento%></span></td>
                                            </tr>
                                            <tr>
                                                <td><i class="icon-arrow-up-right32"></i> <b>Melhor Nota</b></td>
                                                <td><span class="label label-success"><%=df.format(notaMaxima)%></span></td>
                                            </tr>
                                            <tr>
                                                <td><i class="icon-arrow-down-left32"></i> <b>Pior Nota</b></td>
                                                <td><span class="label label-default"><%=df.format(notaMinima)%></span></td>
                                            </tr>
                                            <tr>
                                                <td><i class="icon-medal"></i> <b>Média Actual</b></td>
                                                <td><span class="label label-success"><%=df.format(mediaActual)%></span></td>
                                            </tr>
                                            <tr>
                                                <td><i class="icon-spam"></i> <b>Faltas</b></td>
                                                <td><span class="label label-danger"><%=faltas%></span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /basic table -->
                        </div>
                        <div class="col-md-6">


                            <%
                                if (inscricao != null) {

                                    String curso = encryptUtils.decodeString(inscricao.getCurso().getCursDescricao());
                                    String horario = encryptUtils.decodeString(inscricao.getTurma().getTurmHorario());

                                    String dataUlt = "---";
                                    String dataIns = sdf.format(inscricao.getInscDataInscricao().toGregorianCalendar().getTime());

                                    int diasTrial = 0;

                                    if (inscricao.getInscDataUltimoPagamento() != null) {
                                        Date dtaProx = inscricao.getInscDataUltimoPagamento().toGregorianCalendar().getTime();
                                        dataUlt = sdf.format(dtaProx);
                                        Date dtaHoje = new Date();
                                        diasTrial = Days.daysBetween(new DateTime(dtaHoje), new DateTime(dtaProx)).getDays();

                                    }

                                    String bg = "bg-danger-800";

                                    if (diasTrial > 0 && diasTrial < 7) {
                                        bg = "bg-danger-600";
                                    }

                                    if (diasTrial >= 7 && diasTrial <= 15) {
                                        bg = "bg-warning-600";
                                    }

                                    if (diasTrial > 15) {
                                        bg = "bg-success-600";
                                    }
                            %>
                            <!-- Basic table -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Resumo da Inscrição</h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>

                                        </ul>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="text-bold text-uppercase">Descrição</th>
                                                <th class="text-bold text-uppercase">Detalhes</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><i class="icon-books"></i>  <b>Curso</b></td>
                                                <td><span class="badge bg-slate-800 pull-right"><%=curso%></span></td>
                                            </tr>
                                            <tr>
                                                <td><i class="icon-sort-time-asc"></i>  <b>Data de inscrição</b></td>
                                                <td><span class="badge bg-slate-800 pull-right"><%=dataIns%></span></td>
                                            </tr>
                                            <tr>
                                                <td><i class="icon-watch2"></i> <b>Horário</b></td>
                                                <td><span class="badge bg-slate-800 pull-right"><%=horario%></span></td>
                                            </tr>
                                            <tr>
                                                <td><i class="icon-calendar22"></i> <b>Último Pagamento</b> </td>
                                                <td><span class="badge bg-slate-800 pull-right"><%=dataUlt%></span></td>
                                            </tr>
                                            <tr>
                                                <td><i class="icon-exclamation"></i>  <b>Dias Prox. Pagamento</b></td>
                                                <td><span class="badge <%=bg%> gray pull-right"><%=diasTrial%></span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /basic table -->

                            <%
                                }
                            %>
                        </div>

                    </div>



                    <!-- row.3 -->
                    <div class ="row">


                        <%
                            String ref = "";
                            String dd = "";
                            String tur = "";
                            String cur = "";
                            String hor = "";
                            String dI = "";
                            String dF = "";
                            String min = "";
                            String max = "";

                            String dias[] = {"SEGUNDA-FEIRA", "TERÇA-FEIRA", "QUARTA-FEIRA", "QUINTA-FEIRA", "SEXTA-FEIRA", "SABÁDO"};

                            String horarios[] = {"07:00 - 07:45", "07:50 - 08:35", "08:40 - 09:25", "09:45 - 10:30", "10:35 - 11:20", "11:25 - 12:10",
                                "12:15 - 13:00", "13:05 - 13:50", "14:45 - 15:30", "15:45 - 16:30", "16:35 - 17:20", "17:25 - 18:10"};

                            if (turma != null) {

                                ref = encryptUtils.decodeString(turma.getTurmReferencia());
                                dd = encryptUtils.decodeString(turma.getTurmDescricao());
                                tur = encryptUtils.decodeString(turma.getTurmTurno());
                                hor = encryptUtils.decodeString(turma.getTurmHorario());
                                cur = encryptUtils.decodeString(turma.getCurso().getCursCod())
                                        + " - " + encryptUtils.decodeString(turma.getCurso().getCursDescricao());

                                dI = sdf.format(turma.getTurmDataInicio().toGregorianCalendar().getTime());
                                dF = sdf.format(turma.getTurmDataFim().toGregorianCalendar().getTime());

                                min = turma.getTurmMinEstudantes() + "";
                                max = turma.getTurmMaxEstudantes() + "";
                            }
                        %>

                        <div class="col-md-12">
                            <!-- Bordered panel body table -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Horário Actual <span class="text-danger-600">[<%=cur + "|" + dd + "|" + semestre%>]</span></h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>

                                        </ul>
                                    </div>
                                </div>

                                <div class="panel-body">

                                    <p>
                                        <a href="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?YWNjYW8jaW1wcmltaXItaG9yYXJpbw==" target="_blank" class="btn  bg-slate-800 btn-labeled btn-lg text-bold text-uppercase">
                                            <b><i class="icon-printer2"></i></b>
                                            Imprimir horário
                                        </a>

                                    </p>

                                    <div class="table-responsive">
                                        <table class="table table-bordered table-framed table-responsive">
                                            <thead>
                                                <tr>
                                                    <th class="text-bold text-uppercase"></th>

                                                    <%                                                        for (String d : dias) {
                                                    %>
                                                    <th class="text-bold text-uppercase"><%=d%></th>
                                                        <%
                                                            }
                                                        %>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <%
                                                    if (hCals != null) {
                                                        for (HCal hc : hCals) {

                                                            String h = hc.getHorario();
                                                %>
                                                <tr>
                                                    <td><%=h%></td>

                                                    <%
                                                        List<String> aulas = hc.getAulas();

                                                        for (String disx : aulas) {

                                                            if (!disx.equals("")) {
                                                    %>
                                                    <td><%=disx%></td>
                                                    <%
                                                    } else {
                                                    %>
                                                    <td class="bg-success-300 text-success-300">--</td>

                                                    <%
                                                            }
                                                        }
                                                    %>

                                                </tr>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- /bordered panel body table -->

                        </div>
                    </div>
                    <!-- /row.3 -->


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

    <script type="text/javascript">
        /* ------------------------------------------------------------------------------
         *
         *  # Styled checkboxes, radios and file input
         *
         *  Specific JS code additions for form_checkboxes_radios.html page
         *
         *  Version: 1.0
         *  Latest update: Aug 1, 2015
         *
         * ---------------------------------------------------------------------------- */

        $(function () {


            //
            // Contextual colors
            //

            // Primary
            $(".control-primary").uniform({
                radioClass: 'choice',
                wrapperClass: 'border-primary-600 text-primary-800'
            });

            // Danger
            $(".control-danger").uniform({
                radioClass: 'choice',
                wrapperClass: 'border-danger-600 text-danger-800'
            });

            // Success
            $(".control-success").uniform({
                radioClass: 'choice',
                wrapperClass: 'border-success-600 text-success-800'
            });

            // Warning
            $(".control-warning").uniform({
                radioClass: 'choice',
                wrapperClass: 'border-warning-600 text-warning-800'
            });

            // Info
            $(".control-info").uniform({
                radioClass: 'choice',
                wrapperClass: 'border-info-600 text-info-800'
            });

            // Custom color
            $(".control-custom").uniform({
                radioClass: 'choice',
                wrapperClass: 'border-indigo-600 text-indigo-800'
            });



            // Bootstrap switch
            // ------------------------------

            $(".switch").bootstrapSwitch();

        });


    </script>
    <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>

</html>
