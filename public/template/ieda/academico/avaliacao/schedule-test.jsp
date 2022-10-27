<%-- 
    Document   : schedule-test
    Created on : Nov 12, 2018, 4:55:24 PM
    Author     : hamil
--%>

<%@page import="com.dciapps.webclient.Calendario"%>
<%@page import="com.dciapps.local.HCal"%>
<%@page import="com.dciapps.webclient.Agenda"%>
<%@page import="com.dciapps.webclient.Disciplina"%>
<%@page import="com.dciapps.webclient.Turma"%>
<%@page import="com.dciapps.webclient.Curso"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.webclient.ModulosUsuario"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="com.dciapps.controller.GenericHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SEGIA - Testes</title>


        <!-- Page Description, Author and Keywords -->
        <meta name="description" content="Sistema Electrónico de Gestão de Informação Académica">
        <meta name="author" content="Hamilton Jhonas">
        <meta name="keywords" content="SEGIA, DC Inovaction, Software, Multimedia, Escola, School, Vendas, Stock, Market, Branding, Logo, Hotel, Hotelaria, RH, Recursos Humanos, Controlo de Acesso, Web Design, Web Marketing, Development, Hosting" />

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
        <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/datatables.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/extensions/fixed_columns.min.js"></script>

        <script type="text/javascript" src="assets/js/plugins/forms/selects/select2.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/datepicker.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/effects.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/ui/moment/moment.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/daterangepicker.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/pickadate/picker.js"></script>

        <script type="text/javascript" src="assets/js/core/app.js"></script>
        <script type="text/javascript" src="assets/js/pages/form_layouts.js"></script>
        <!-- /theme JS files -->

        <%

            int timeout = session.getMaxInactiveInterval();

            GenericHandler gh = new GenericHandler(request, response);
            Usuario usuario = gh.loggedUser();

            String nome = "";
            String fotoPerfil = "";
            String cargo = "";

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            DecimalFormat df = new DecimalFormat("#,###,##0");
            EncryptUtils encryptUtils = new EncryptUtils();

            ModulosUsuario mu = null;

            List<Curso> cursos = null;
            List<Turma> turmas = null;
            List<Disciplina> disciplinas = null;
            List<Calendario> calendarios = null;
            Curso curso = null;
            Turma turma = null;

            String semestre = "";

            String msgErro = "";
            String alerta = "";

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

                curso = (Curso) session.getAttribute("curso");
                turma = (Turma) session.getAttribute("turma");

                cursos = (List<Curso>) session.getAttribute("cursos");
                turmas = (List<Turma>) session.getAttribute("turmas");
                disciplinas = (List<Disciplina>) session.getAttribute("disciplinas");
                calendarios = (List<Calendario>) session.getAttribute("calendarios");

                if (session.getAttribute("semestre") != null) {
                    semestre = session.getAttribute("semestre").toString();
                }

                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();

                response.setHeader("Refresh", timeout + "; URL =VXN1YXJpb1NlcnZsZXQjRENJ?" + encryptUtils.encodeString("accao#lockscreen&user=" + encryptUtils.decodeString(usuario.getUsuaUsuario())));

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


        <script type="text/javascript">
            /* ------------------------------------------------------------------------------
             *
             *  # Fixed Columns extension for Datatables
             *
             *  Specific JS code additions for datatable_extension_fixed_columns.html page
             *
             *  Version: 1.0
             *  Latest update: Aug 1, 2015
             *
             * ---------------------------------------------------------------------------- */

            $(function () {


                // Table setup
                // ------------------------------

                // Setting datatable defaults
                $.extend($.fn.dataTable.defaults, {
                    columnDefs: [{
                            orderable: false,
                            width: '100px',
                            targets: [5]
                        }],
                    dom: '<"datatable-header"fl><"datatable-scroll datatable-scroll-wrap"t><"datatable-footer"ip>',
                    language: {
                        search: '<span>Filtrar:</span> _INPUT_',
                        lengthMenu: '<span>Listar:</span> _MENU_',
                        paginate: {'first': 'Primeiro', 'last': 'Último', 'next': '&rarr;', 'previous': '&larr;'}
                    }
                });


                // Left fixed column example
                $('.datatable-fixed-left').DataTable({
                    columnDefs: [

                        {
                            width: "300px",
                            targets: [0]
                        }
                    ],
                    scrollX: true,
                    scrollY: '250px',
                    scrollCollapse: true,
                    fixedColumns: true
                });


                // External table additions
                // ------------------------------

                // Add placeholder to the datatable filter option
                $('.dataTables_filter input[type=search]').attr('placeholder', 'Digite para filtrar...');


                // Enable Select2 select for the length option
                $('.dataTables_length select').select2({
                    minimumResultsForSearch: "-1"
                });

            });

        </script>

    </head>

    <body oncontextmenu="return false">


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
                        <form method="post" action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jZG9VcGRhdGU=">
                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn btn-labeled btn-labeled-left bg-danger-400 heading-btn text-bold text-uppercase">Voltar ao painel principal<b><i class="icon-chevron-left"></i></b></button>
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
                            <ul class="nav navbar-nav element-active-orange-400">
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-calendar52 position-left"></i> Gestão do Calendário de Testes</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->




                    <div class = "row">



                        <!-- Vertical form options -->
                        <div class="col-md-6"> 
                            <!-- Basic layout-->

                            <form method="post" accept-charset="ISO-8859-1" action="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?YWNjYW8jdGVzdGVz">
                                <div class="panel panel-flat">
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <div class="row">

                                                    <div class="col-md-8">

                                                        <select class="select" name="idCurso">
                                                            <optgroup label="Selecione a classe">

                                                                <%
                                                                    if (cursos != null) {
                                                                        for (Curso c : cursos) {

                                                                            int id = c.getCursId();
                                                                            String desc = encryptUtils.decodeString(c.getCursCod()) + " - " + encryptUtils.decodeString(c.getCursDescricao());

                                                                            String sel = "";

                                                                            if (curso != null) {
                                                                                if (id == curso.getCursId()) {
                                                                                    sel = "selected";
                                                                                }
                                                                            }
                                                                %>
                                                                <option value="<%=id%>" <%=sel%>><%=desc%></option>
                                                                <%
                                                                        }
                                                                    }
                                                                %>                                                                

                                                            </optgroup>
                                                        </select>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-slate-800 btn-labeled text-bold text-uppercase">
                                                            <b><i class="icon-search4 position-right"></i></b> 
                                                            Filtrar Classe
                                                        </button>

                                                    </div>
                                                    <br> <br> <br>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </form>
                            <!-- /basic layout -->

                        </div>





                        <!-- Vertical form options -->
                        <div class="col-md-6"> 
                            <!-- Basic layout-->


                            <%
                                String act = encryptUtils.encodeString("accao#filtrar-semestre&to=schedule-test");
                            %>

                            <!-- Basic layout-->
                            <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?<%=act%>">
                                <div class="panel panel-flat">
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <div class="row">

                                                    <div class="col-md-8">

                                                        <select class="select" name="semestre">
                                                            <optgroup label="Selecione o semestre">

                                                                <%
                                                                    String semestres[] = {"1º TRIMESTRE", "2º TRIMESTRE", "3º TRIMESTRE"};

                                                                    for (String s : semestres) {

                                                                        String sel = "";

                                                                        if (s.equals(semestre)) {
                                                                            sel = "selected";
                                                                        }

                                                                %>
                                                                <option value="<%=s%>" <%=sel%>><%=s%></option>
                                                                <%
                                                                    }

                                                                %>                                                                

                                                            </optgroup>
                                                        </select>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                            <b><i class="icon-search4 position-right"></i></b> 
                                                            Filtrar Semestre
                                                        </button>

                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </form>
                            <!-- /basic layout -->

                        </div>
                        <!-- /vertical form options -->
                    </div>
                    <!-- /row.1-->




                    <!-- User profile -->
                    <div class="row">

                        <%                            String ref = "";
                            String dd = "";
                            String tur = "";
                            String cur = "";
                            String hor = "";
                            String dI = "";
                            String dF = "";
                            String min = "";
                            String max = "";

                            String testes[] = {"1ª ACS", "2ª ACS", "3ª ACS", "4ª ACS", "1ª ACP", "2ª ACP"};

                            String horarios[] = {"07:00 - 07:45", "07:50 - 08:35", "08:40 - 09:25", "09:45 - 10:30", "10:35 - 11:20", "11:25 - 12:10",
                                "12:15 - 13:00", "13:05 - 13:50", "13:55 - 14:10", "14:45 - 15:30", "15:45 - 16:30", "16:35 - 17:20", "17:25 - 18:10"};

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

                        <div class="col-md-7">

                            <!-- Row -->
                            <div class="row">


                                <!-- Vertical form options -->
                                <div class="col-md-12"> 
                                    <!-- Basic layout-->


                                    <%
                                        String act3 = encryptUtils.encodeString("accao#filtrar-turma&to=schedule-test");
                                    %>

                                    <!-- Basic layout-->
                                    <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?<%=act3%>">
                                        <div class="panel panel-flat">
                                            <div class="panel-body">

                                                <div class="form-group">
                                                    <div class="col-lg-12">
                                                        <div class="row">

                                                            <div class="col-md-8">

                                                                <select class="select" name="idTurma">
                                                                    <optgroup label="Selecione a turma">

                                                                        <%
                                                                            if (turmas != null) {
                                                                                for (Turma t : turmas) {

                                                                                    int id = t.getTurmId();
                                                                                    String desc = encryptUtils.decodeString(t.getTurmReferencia()) + " - " + encryptUtils.decodeString(t.getTurmDescricao());

                                                                                    String sel = "";

                                                                                    if (turma != null) {
                                                                                        if (id == turma.getTurmId()) {
                                                                                            sel = "selected";
                                                                                        }
                                                                                    }
                                                                        %>
                                                                        <option value="<%=id%>" <%=sel%>><%=desc%></option>
                                                                        <%
                                                                                }
                                                                            }
                                                                        %>                                                                

                                                                    </optgroup>
                                                                </select>
                                                            </div>

                                                            <div class="col-md-3">
                                                                <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                                    <b><i class="icon-search4 position-right"></i></b> 
                                                                    Filtrar Turma
                                                                </button>

                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </form>
                                    <!-- /basic layout -->

                                </div>
                                <!-- /vertical form options -->

                            </div>
                            <!--/row -->

                            <!-- row -->
                            <div class="row">

                                <!-- Vertical form options -->
                                <div class="col-md-12"> 
                                    <!-- Bordered striped table -->
                                    <div class="panel panel-flat">

                                        <div class="table-responsive">
                                            <table class="table table-bordered table-striped">
                                                <tbody>
                                                    <tr>
                                                        <td class="text-bold text-uppercase"><i class="icon-markup"></i> Código</td>
                                                        <td class="text-bold text-danger-600"><%=ref%></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-bold text-uppercase"><i class="icon-file-text"></i> Descrição</td>
                                                        <td class="text-bold"><%=dd%></td>
                                                    </tr>

                                                    <tr>
                                                        <td class="text-bold text-uppercase"><i class="icon-archive"></i> Curso</td>
                                                        <td><%=cur%></td>
                                                    </tr>

                                                    <tr>
                                                        <td class="text-bold text-uppercase"><i class="icon-popout"></i> Turno</td>
                                                        <td><%=tur%></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <!-- /bordered striped table -->


                                </div>
                                <!-- /vertical form options -->
                            </div>
                            <!-- /row -->



                            <!-- row.3 -->
                            <div class ="row">

                                <div class="col-md-12">
                                    <!-- Bordered panel body table -->
                                    <div class="panel panel-flat">
                                        <div class="panel-heading">
                                            <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Calendário de Avaliações <span class="text-danger-600">[<%=cur + " | " + dd + " | " + semestre%>]</span></h6>
                                            <div class="heading-elements">
                                                <ul class="icons-list">
                                                    <li><a data-action="collapse"></a></li>
                                                    <li><a data-action="reload"></a></li>

                                                </ul>
                                            </div>
                                        </div>

                                        <div class="panel-body">

                                            <p>
                                                <a href="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?YWNjYW8jaW1wcmltaXItY2FsZW5kYXJpbw==" target="_blank" class="btn  bg-slate-800 btn-labeled btn-lg text-bold text-uppercase">
                                                    <b><i class="icon-printer2"></i></b>
                                                    Imprimir calendário
                                                </a>

                                            </p>

                                            <table class="table datatable-fixed-left" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th class="text-bold text-uppercase"></th>

                                                        <%                                                        for (String d : testes) {
                                                        %>
                                                        <th class="text-bold text-uppercase"><%=d%></th>
                                                            <%
                                                                }
                                                            %>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <%
                                                        if (calendarios != null) {
                                                            for (Calendario c : calendarios) {

                                                                String dis = encryptUtils.decodeString(c.getDisciplina().getDiscDescricao());

                                                                String d1 = "---";
                                                                String d2 = "---";
                                                                String d3 = "---";
                                                                String d4 = "---";
                                                                String d5 = "---";
                                                                String d6 = "---";

                                                                if (c.getCaleTeste1() != null) {
                                                                    d1 = sdf.format(c.getCaleTeste1().toGregorianCalendar().getTime());
                                                                }

                                                                if (c.getCaleTeste2() != null) {
                                                                    d2 = sdf.format(c.getCaleTeste2().toGregorianCalendar().getTime());
                                                                }

                                                                if (c.getCaleTeste3() != null) {
                                                                    d3 = sdf.format(c.getCaleTeste3().toGregorianCalendar().getTime());
                                                                }

                                                                if (c.getCaleTeste4() != null) {
                                                                    d4 = sdf.format(c.getCaleTeste4().toGregorianCalendar().getTime());
                                                                }

                                                                if (c.getCaleAcp() != null) {
                                                                    d5 = sdf.format(c.getCaleAcp().toGregorianCalendar().getTime());
                                                                }

                                                                if (c.getCaleAcp2() != null) {
                                                                    d6 = sdf.format(c.getCaleAcp2().toGregorianCalendar().getTime());
                                                                }
                                                    %>
                                                    <tr>
                                                        <td><%=dis%></td>
                                                        <td><%=d1%></td>
                                                        <td><%=d2%></td>
                                                        <td><%=d3%></td>
                                                        <td><%=d4%></td>
                                                        <td><%=d5%></td>
                                                        <td><%=d6%></td>
                                                    </tr>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <!-- /bordered panel body table -->

                                </div>
                            </div>
                            <!-- /row.3 -->

                        </div>





                        <div class="col-md-5">

                            <%
                                String act2 = encryptUtils.encodeString("accao#definir-calendario-teste");
                            %>

                            <!-- Basic layout-->
                            <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?<%=act2%>">
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-bold text-uppercase">Definição de Calendário</h6>
                                        <div class="heading-elements">
                                            <ul class="icons-list">
                                                <li><a data-action="collapse"></a></li>
                                                <li><a data-action="reload"></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="panel-body">



                                        <div class="form-group">
                                            <label class="text-bold text-uppercase">Disciplina:</label>


                                            <select class="select" name="idDisciplina" required="">
                                                <optgroup label="Selecione uma disciplina">
                                                    <%                                                        if (disciplinas != null) {

                                                            for (Disciplina d : disciplinas) {

                                                                int id = d.getDiscId();
                                                                String desc = encryptUtils.decodeString(d.getDiscDescricao());

                                                    %>
                                                    <option value="<%=id%>"><%=desc%></option>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </optgroup>
                                            </select>

                                        </div>


                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">

                                                    <label class="text-bold">1ª ACS - Data Avaliação: </label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                        <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data1" required="">
                                                    </div>
                                                </div>

                                                <div class="col-md-6">

                                                    <label class="text-bold">1ª ACS - Limite Submissão: </label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                        <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data1Limite" required="">
                                                    </div>
                                                </div>

                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">

                                                    <label class="text-bold">2ª ACS - Data Avaliação: </label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                        <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data2" required="">
                                                    </div>
                                                </div>

                                                <div class="col-md-6">

                                                    <label class="text-bold">2ª ACS - Limite Submissão: </label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                        <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data2Limite" required="">
                                                    </div>
                                                </div>

                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">

                                                    <label class="text-bold">3ª ACS - Data Avaliação: </label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                        <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data3" required="">
                                                    </div>
                                                </div>

                                                <div class="col-md-6">

                                                    <label class="text-bold">3ª ACS - Limite Submissão: </label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                        <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data3Limite" required="">
                                                    </div>
                                                </div>

                                            </div>
                                        </div>




                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">

                                                    <label class="text-bold">4ª ACS - Data Avaliação: </label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                        <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data4" required="">
                                                    </div>
                                                </div>

                                                <div class="col-md-6">

                                                    <label class="text-bold">4ª ACS - Limite Submissão: </label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                        <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data4Limite" required="">
                                                    </div>
                                                </div>

                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">

                                                    <label class="text-bold">1ª ACP - Data Avaliação: </label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                        <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data5" required="">
                                                    </div>
                                                </div>

                                                <div class="col-md-6">

                                                    <label class="text-bold">1ª ACP - Limite Submissão: </label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                        <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data5Limite" required="">
                                                    </div>
                                                </div>

                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">

                                                    <label class="text-bold">2ª ACP - Data Avaliação: </label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                        <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data6" required="">
                                                    </div>
                                                </div>

                                                <div class="col-md-6">

                                                    <label class="text-bold">2ª ACP - Limite Submissão: </label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                        <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data6Limite" required="">
                                                    </div>
                                                </div>

                                            </div>
                                        </div>


                                        <!-- Single styled checkbox -->
                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <code class="text-bold text-uppercase">Nota:</code> 
                                                Ao desselecionar as opções, o sistema não considera as datas das avaliações.
                                            </div>
                                        </div>
                                        <!-- /single styled checkbox -->

                                        <!-- Single styled checkbox -->
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" name="acs3" class="styled">
                                                            <b class="text-uppercase">3ª Acs ?</b>
                                                        </label>
                                                    </div>

                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" name="acs4" class="styled">
                                                            <b class="text-uppercase">4ª Acs ?</b>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" name="acp2" class="styled">
                                                            <b class="text-uppercase">2ª Acp ?</b>
                                                        </label>
                                                    </div>


                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" name="tem" class="styled">
                                                            <b class="text-uppercase">Disciplina com exame ?</b>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /single styled checkbox -->

                                        <div class="text-right">
                                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 text-uppercase text-bold">Definir calendário <i class="icon-circle-right2 position-right"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- /basic layout -->




                        </div>


                    </div>
                    <!-- /row.2 -->
                </div>
                <!-- /main content -->

            </div>
            <!-- /page content -->


            <!-- Footer -->
            <div class="footer text-bold">

                <%                    String ano = session.getAttribute("ano").toString();
                %>

                &copy; <%=ano%>. <a href="#" class="text-bold">SEGIA</a>. Todos os direitos reservados
            </div>
            <!-- /footer -->

        </div>
        <!-- /page container -->
        <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>

    </body>
</html>
