<%-- 
    Document   : avl-guidelines
    Created on : Sep 14, 2017, 12:26:26 PM
    Author     : hamil
--%>

<%@page import="com.dciapps.webclient.Inscricao"%>
<%@page import="com.dciapps.local.Pauta"%>
<%@page import="java.util.Date"%>
<%@page import="com.dciapps.webclient.Notas"%>
<%@page import="com.dciapps.webclient.Calendario"%>
<%@page import="com.dciapps.webclient.Disciplina"%>
<%@page import="com.dciapps.webclient.Curso"%>
<%@page import="com.dciapps.webclient.Turma"%>
<%@page import="com.dciapps.webclient.Aluno"%>
<%@page import="com.dciapps.webclient.Presencas"%>
<%@page import="com.dciapps.webclient.ModulosUsuario"%>
<%@page import="com.dciapps.webclient.Funcionario"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.localcontroler.StringUtils"%>
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
        <title>SEGIA -  Pautas</title>

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
        <script type="text/javascript" src="assets/js/plugins/forms/selects/select2.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/datatables.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/extensions/fixed_columns.min.js"></script>

        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/datepicker.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/effects.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/ui/moment/moment.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/daterangepicker.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/pickadate/picker.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/pickadate/picker.date.js"></script>
        <script type="text/javascript" src="assets/js/plugins/visualization/echarts/echarts.js"></script>

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

            List<Aluno> alunos = null;
            List<Turma> turmas = null;
            List<Curso> cursos = null;
            List<Calendario> calendarios = null;
            List<Pauta> pautas = null;

            Turma turma = null;
            Curso curso = null;
            Calendario calendario = null;

            String msgErro = "";
            String alerta = "";

            ModulosUsuario mu = null;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = encryptUtils.decodeString(usuario.getPessoapess().getPessActividade());

                turma = (Turma) session.getAttribute("turma");
                curso = (Curso) session.getAttribute("cursoSelecionado");
                calendario = (Calendario) session.getAttribute("calendario");

                alunos = (List<Aluno>) session.getAttribute("alunos");
                turmas = (List<Turma>) session.getAttribute("turmas");
                cursos = (List<Curso>) session.getAttribute("cursos");
                calendarios = (List<Calendario>) session.getAttribute("calendarios");
                pautas = (List<Pauta>) session.getAttribute("pautas");

                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

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
                            width: "350px",
                            targets: [0]
                        }
                    ],
                    scrollX: true,
                    scrollY: '400px',
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




        <%!
            int getNumberFromStatus(String status) {
                int num = 0;
                //"MUITO BOM", "BOM", "SUFICIENTE", "MAU", "MEDÍOCRE"
                switch (status) {
                    case "MUITO BOM":
                        num = 5;
                        break;
                    case "BOM":
                        num = 4;
                        break;
                    case "SUFICIENTE":
                        num = 3;
                        break;
                    case "MAU":
                        num = 2;
                        break;
                    case "MEDÍOCRE":
                        num = 1;
                        break;
                }

                return num;
            }

            String getStatusFromNumber(int num) {
                String status = "";
                //"MUITO BOM", "BOM", "SUFICIENTE", "MAU", "MEDÍOCRE"
                switch (num) {
                    case 1:
                        status = "MEDÍOCRE";
                        break;
                    case 2:
                        status = "MAU";
                        break;
                    case 3:
                        status = "SUFICIENTE";
                        break;
                    case 4:
                        status = "BOM";
                        break;
                    case 5:
                        status = "MUITO BOM";
                        break;
                }

                return status;
            }

            String getLabelFromNumber(int num) {
                String status = "bg-grey-800";
                //"MUITO BOM", "BOM", "SUFICIENTE", "MAU", "MEDÍOCRE"
                switch (num) {
                    case 1:
                        status = "bg-danger-800";
                        break;
                    case 2:
                        status = "bg-danger-400";
                        break;
                    case 3:
                        status = "bg-orange-600";
                        break;
                    case 4:
                        status = "bg-teal-400";
                        break;
                    case 5:
                        status = "bg-success-600";
                        break;
                }

                return status;
            }
        %>

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
                        <form method="post" action="main-dashboard">
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
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-grid-alt position-left"></i> Pautas</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->





                    <div class = "row">



                        <!-- Vertical form options -->
                        <div class="col-md-6"> 
                            <!-- Basic layout-->

                            <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?YWNjYW8jcGF1dGFz">
                                <div class="panel panel-flat">
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <div class="row">

                                                    <div class="col-md-7">

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
                            <%                                String act3 = encryptUtils.encodeString("accao#filtrar-turma&to=avl-guidelines");
                            %>

                            <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?<%=act3%>">
                                <div class="panel panel-flat">
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <div class="row">

                                                    <div class="col-md-7">


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
                    <!-- /row.1-->



                    <div class = "row">

                        <!-- Vertical form options -->
                        <div class="col-md-6"> 
                            <!-- Basic layout-->

                            <%                                String act4 = encryptUtils.encodeString("accao#filtrar-calendario&to=avl-guidelines");
                            %>

                            <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?<%=act4%>">
                                <div class="panel panel-flat">
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <div class="row">

                                                    <div class="col-md-7">


                                                        <select class="select" name="idCalendario">
                                                            <optgroup label="Selecione disciplina">

                                                                <%
                                                                    if (calendarios != null) {
                                                                        for (Calendario c : calendarios) {

                                                                            int id = c.getCaleId();
                                                                            String desc = encryptUtils.decodeString(c.getDisciplina().getDiscDescricao());

                                                                            String sel = "";

                                                                            if (calendario != null) {
                                                                                if (id == calendario.getCaleId()) {
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
                                                            Filtrar Disciplina
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

                        <div class="col-md-12">



                            <%
                                String dd = "";
                                String cur = "";
                                String di = "";

                                boolean haveT3 = false;
                                boolean haveT4 = false;
                                boolean haveA2 = false;

                                int nACS = 3;
                                int nACP = 2;
                                int nr = 7;

                                int numACS = 2;
                                int numACP = 1;

                                if (turma != null) {

                                    dd = encryptUtils.decodeString(turma.getTurmDescricao());
                                    cur = encryptUtils.decodeString(turma.getCurso().getCursCod())
                                            + " - " + encryptUtils.decodeString(turma.getCurso().getCursDescricao());

                                }

                                if (calendario != null) {
                                    di = encryptUtils.decodeString(calendario.getDisciplina().getDiscDescricao());

                                    haveT3 = calendario.isCaleHaveTeste3();
                                    haveT4 = calendario.isCaleHaveTeste4();
                                    haveA2 = calendario.isCaleHaveAcp();
                                }

                                if (haveT3) {
                                    nACS++;
                                    nr++;
                                    numACS++;
                                }

                                if (haveT4) {
                                    nACS++;
                                    nr++;
                                    numACS++;
                                }

                                if (haveA2) {
                                    nACP++;
                                    nr++;
                                    numACP++;
                                }
                            %>


                            <!-- Basic responsive configuration -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">

                                    <h6 class="panel-title text-bold text-uppercase">Pautas Trimestrais  <span class="text-danger-600">[<%=cur + "| Turma:" + dd%>]</span> <span class="text-primary-600"> - [<%=di%>]</span></h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>
                                        </ul>
                                    </div>
                                </div>



                                <div class="panel-body">

                                    <p>
                                        <a href="QXZhbGlhY2FvU2VydmxldCNEQ0k=?YWNjYW8jaW1wcmltaXItcGF1dGE=" target="_blank" class="btn  bg-slate-800 btn-labeled btn-lg text-bold text-uppercase">
                                            <b><i class="icon-printer2"></i></b>
                                            Imprimir pauta
                                        </a>

                                    </p>

                                </div>

                                <table class="table datatable-fixed-left table-bordered table-striped" width="100%">
                                    <thead>
                                        <tr>
                                            <th class="text-bold text-uppercase text-center" rowspan="3">Aluno</th>
                                            <th class="text-bold text-uppercase text-center bg-slate-400" colspan="<%=nr%>">1º Trimistre</th>
                                            <th class="text-bold text-uppercase text-center bg-slate-400" colspan="<%=nr%>">2º Trimistre</th>
                                            <th class="text-bold text-uppercase text-center bg-slate-400" colspan="<%=nr%>">3º Trimistre</th>
                                            <th class="text-bold text-uppercase text-center" rowspan="3">Média Final</th>
                                            <th class="text-bold text-uppercase text-center" rowspan="3">Status</th>
                                        </tr>
                                        <tr>
                                            <th colspan="<%=nACS%>" class="text-bold text-uppercase text-center">ACS</th>
                                            <th colspan="<%=nACP%>" class="text-bold text-uppercase text-center">ACP</th>
                                            <th rowspan="2" class="text-bold text-uppercase text-center">MÉDIA FINAL</th>
                                            <th rowspan="2" class="text-bold text-uppercase text-center">COMP.</th>

                                            <th colspan="<%=nACS%>" class="text-bold text-uppercase text-center">ACS</th>
                                            <th colspan="<%=nACP%>" class="text-bold text-uppercase text-center">ACP</th>
                                            <th rowspan="2" class="text-bold text-uppercase text-center">MÉDIA FINAL</th>
                                            <th rowspan="2" class="text-bold text-uppercase text-center">COMP.</th>

                                            <th colspan="<%=nACS%>" class="text-bold text-uppercase text-center">ACS</th>
                                            <th colspan="<%=nACP%>" class="text-bold text-uppercase text-center">ACP</th>
                                            <th rowspan="2" class="text-bold text-uppercase text-center">MÉDIA FINAL</th>
                                            <th rowspan="2" class="text-bold text-uppercase text-center">COMPOR.</th>
                                        </tr>
                                        <tr>

                                            <!-- 1º TRIMISTRE -->
                                            <th class="text-bold text-uppercase text-right">1ª</th>
                                            <th class="text-bold text-uppercase text-right">2ª</th>
                                                <%
                                                    if (haveT3) {
                                                %>
                                            <th class="text-bold text-uppercase text-right">3ª</th>
                                                <%
                                                    }
                                                %>
                                                <%
                                                    if (haveT4) {
                                                %>
                                            <th class="text-bold text-uppercase text-right">4ª</th>
                                                <%
                                                    }
                                                %>
                                            <th class="text-bold text-uppercase text-right">MÉDIA</th>
                                            <th class="text-bold text-uppercase text-right">1ª</th>

                                            <%
                                                if (haveA2) {
                                            %>
                                            <th class="text-bold text-uppercase text-right">2ª</th>
                                                <%
                                                    }
                                                %>

                                            <th class="text-bold text-uppercase text-right">MÉDIA</th>
                                            <!-- 1º trimestre -->

                                            <!-- 2º TRIMISTRE -->
                                            <th class="text-bold text-uppercase text-right">1ª</th>
                                            <th class="text-bold text-uppercase text-right">2ª</th>
                                                <%
                                                    if (haveT3) {
                                                %>
                                            <th class="text-bold text-uppercase text-right">3ª</th>
                                                <%
                                                    }
                                                %>
                                                <%
                                                    if (haveT4) {
                                                %>
                                            <th class="text-bold text-uppercase text-right">4ª</th>
                                                <%
                                                    }
                                                %>
                                            <th class="text-bold text-uppercase text-right">MÉDIA</th>
                                            <th class="text-bold text-uppercase text-right">1ª</th>

                                            <%
                                                if (haveA2) {
                                            %>
                                            <th class="text-bold text-uppercase text-right">2ª</th>
                                                <%
                                                    }
                                                %>
                                            <th class="text-bold text-uppercase text-right">MÉDIA</th>
                                            <!-- 2º trimestre -->

                                            <!-- 3º TRIMISTRE -->
                                            <th class="text-bold text-uppercase text-right">1ª</th>
                                            <th class="text-bold text-uppercase text-right">2ª</th>
                                                <%
                                                    if (haveT3) {
                                                %>
                                            <th class="text-bold text-uppercase text-right">3ª</th>
                                                <%
                                                    }
                                                %>
                                                <%
                                                    if (haveT4) {
                                                %>
                                            <th class="text-bold text-uppercase text-right">4ª</th>
                                                <%
                                                    }
                                                %>
                                            <th class="text-bold text-uppercase text-right">MÉDIA</th>
                                            <th class="text-bold text-uppercase text-right">1ª</th>

                                            <%
                                                if (haveA2) {
                                            %>
                                            <th class="text-bold text-uppercase text-right">2ª</th>
                                                <%
                                                    }
                                                %>
                                            <th class="text-bold text-uppercase text-right">MÉDIA</th>
                                            <!-- 3º trimestre -->

                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            if (pautas != null) {
                                                for (Pauta p : pautas) {

                                                    List<Notas> notas = p.getNotas();
                                                    Inscricao i = p.getInscricao();

                                                    String s1 = /*encryptUtils.decodeString(i.getAluno().getAlunBadgnumber()) + " - " + */ encryptUtils.decodeString(i.getAluno().getPessoa().getPessNome()) + " "
                                                            + encryptUtils.decodeString(i.getAluno().getPessoa().getPessApelido());
                                                    String comp1 = "---";
                                                    String comp2 = "---";
                                                    String comp3 = "---";

                                                    if (i.getInscComp1() != null) {
                                                        comp1 = encryptUtils.decodeString(i.getInscComp1());
                                                    }

                                                    if (i.getInscComp2() != null) {
                                                        comp2 = encryptUtils.decodeString(i.getInscComp2());
                                                    }

                                                    if (i.getInscComp3() != null) {
                                                        comp3 = encryptUtils.decodeString(i.getInscComp3());
                                                    }

                                                    float mediaFinal = 0;

                                                    String status = "-";
                                                    String lblStatus = "bg-slate-400";
                                                    String lblMediaFinal = "text-slate-400";
                                        %>
                                        <tr>

                                            <td><%=s1%></td>
                                            <%

                                                if (notas != null) {
                                                    for (Notas n : notas) {

                                                        String n1 = "-";
                                                        String n2 = "-";
                                                        String n3 = "-";
                                                        String n4 = "-";
                                                        String n5 = "-";
                                                        String n6 = "-";

                                                        String l1 = "text-danger";
                                                        String l2 = "text-danger";
                                                        String l3 = "text-danger";
                                                        String l4 = "text-danger";
                                                        String l5 = "text-danger";
                                                        String l6 = "text-danger";

                                                        String lblMediaACS = "text-slate-400";
                                                        String lblMediaACP = "text-slate-400";

                                                        String lblMedia = "text-slate-400";

                                                        float media = 0;
                                                        float mediaACS = 0;
                                                        float mediaACP = 0;

                                                        String comp = "-";
                                                        if (n != null) {

                                                            n1 = df.format(n.getNotaTeste1());
                                                            n2 = df.format(n.getNotaTeste2());
                                                            n3 = df.format(n.getNotaTeste3());
                                                            n4 = df.format(n.getNotaTeste4());
                                                            n5 = df.format(n.getNotaAcp());
                                                            n6 = df.format(n.getNotaAcp2());

                                                            media = n.getNotaMedia();
                                                            mediaACS = Math.round((n.getNotaTeste1() + n.getNotaTeste2() + n.getNotaTeste3() + n.getNotaTeste4()) / numACS);
                                                            mediaACP = Math.round((n.getNotaAcp() + n.getNotaAcp2()) / numACP);

                                                            if (n.getNotaTeste1() >= 10) {
                                                                l1 = "text-success";
                                                            }

                                                            if (n.getNotaTeste2() >= 10) {
                                                                l2 = "text-success";
                                                            }

                                                            if (n.getNotaTeste3() >= 10) {
                                                                l3 = "text-success";
                                                            }

                                                            if (n.getNotaTeste4() >= 10) {
                                                                l4 = "text-success";
                                                            }

                                                            if (n.getNotaAcp() >= 10) {
                                                                l5 = "text-success";
                                                            }

                                                            if (n.getNotaAcp2() >= 10) {
                                                                l6 = "text-success";
                                                            }

                                                            if (mediaACS < 10) {
                                                                lblMediaACS = "text-danger-700";
                                                            } else {
                                                                lblMediaACS = "text-success-700";
                                                            }

                                                            if (mediaACP < 10) {
                                                                lblMediaACP = "text-danger-700";
                                                            } else {
                                                                lblMediaACP = "text-success-700";
                                                            }

                                                            if (media < 10) {
                                                                lblMedia = "text-danger-700";
                                                            } else {
                                                                lblMedia = "text-success-400";
                                                            }

                                                            if (media >= 14) {
                                                                lblMedia = "text-success-800";
                                                            }

                                                            String sem = encryptUtils.decodeString(n.getNotaSemestre());

                                                            switch (sem) {
                                                                case "1º TRIMESTRE":
                                                                    comp = comp1;
                                                                    break;
                                                                case "2º TRIMESTRE":
                                                                    comp = comp2;
                                                                    break;
                                                                case "3º TRIMESTRE":
                                                                    comp = comp3;
                                                                    break;
                                                            }
                                                        }

                                                        mediaFinal += media;
                                            %>
                                            <td class="text-bold <%=l1%> text-right"><%=n1%></td>
                                            <td class="text-bold <%=l2%> text-right"><%=n2%></td>


                                            <%
                                                if (haveT3) {
                                            %>
                                            <td class="text-bold <%=l3%> text-right"><%=n3%></td>

                                            <%

                                                }%>
                                            <%
                                                if (haveT4) {
                                            %>

                                            <td class="text-bold <%=l4%> text-right"><%=n4%></td>
                                            <%
                                                }
                                            %>
                                            <td class="text-bold <%=lblMediaACS%> text-right"><%=mediaACS%></td>
                                            <td class="text-bold <%=l5%> text-right"><%=n5%></td>


                                            <%
                                                if (haveA2) {
                                            %>
                                            <td class="text-bold <%=l6%> text-right"><%=n6%></td>
                                            <%
                                                }
                                            %>
                                            <td class="text-bold <%=lblMediaACP%> text-right"><%=mediaACP%></td>
                                            <td class="text-bold <%=lblMedia%> text-right"><%=media%></td>
                                            <td class="text-bold"><%=comp%></td>
                                            <%
                                                    }
                                                }

                                                mediaFinal = Math.round(mediaFinal / 3);

                                                if (mediaFinal < 10) {
                                                    if (calendario.isCaleHaveExame()) {
                                                        status = "Excluido";
                                                    } else {
                                                        status = "Reprovado";
                                                    }

                                                    lblStatus = "bg-danger-700";
                                                    lblMediaFinal = "text-danger-700";
                                                } else {

                                                    status = "Aprovado";
                                                    lblStatus = "bg-success-400";
                                                    lblMediaFinal = "text-success-400";

                                                }

                                                if (mediaFinal >= 14) {
                                                    if (calendario.isCaleHaveExame()) {
                                                        status = "Dispensado";
                                                    }

                                                    lblStatus = "bg-success-800";
                                                    lblMediaFinal = "text-success-800";
                                                }

                                                if (mediaFinal >= 9.5 && mediaFinal < 13.5) {
                                                    if (calendario.isCaleHaveExame()) {
                                                        status = "Admitdo ao Exame";
                                                    }

                                                    lblStatus = "bg-slate-800";
                                                    lblMediaFinal = "text-slate-800";
                                                }

                                            %>


                                            <td class="text-bold <%=lblMediaFinal%> text-center"><%=mediaFinal%></td>
                                            <td class="text-center"><span class="label <%=lblStatus%>"><%=status%></span></td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>

                                    </tbody>
                                </table>
                            </div>
                            <!-- /basic responsive configuration -->
                        </div>

                    </div>
                    <!-- /row.2 -->

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
        <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>

    </body>
</html>
