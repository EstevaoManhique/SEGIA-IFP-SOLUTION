<%-- 
    Document   : exam-list
    Created on : Sep 14, 2017, 12:26:26 PM
    Author     : hamil
--%>

<%@page import="com.dciapps.webclient.AnoLectivo"%>
<%@page import="com.dciapps.webclient.Exame"%>
<%@page import="com.dciapps.webclient.SalaExame"%>
<%@page import="com.dciapps.webclient.Media"%>
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
        <title>SEGIA -  Lista Apurados</title>

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
            List<Disciplina> disciplinas = null;
            List<Curso> cursos = null;
            List<Exame> exames = null;
            List<SalaExame> salasExame = null;

            Disciplina disciplina = null;
            Curso curso = null;
            SalaExame salaExame = null;

            String msgErro = "";
            String alerta = "";

            ModulosUsuario mu = null;

            AnoLectivo anoLectivo = null;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = encryptUtils.decodeString(usuario.getPessoapess().getPessActividade());

                disciplina = (Disciplina) session.getAttribute("disciplinaSelecionada");
                curso = (Curso) session.getAttribute("cursoSelecionado");
                salaExame = (SalaExame) session.getAttribute("salaExame");
                anoLectivo = (AnoLectivo) session.getAttribute("anoLectivoActivo");

                alunos = (List<Aluno>) session.getAttribute("alunos");
                disciplinas = (List<Disciplina>) session.getAttribute("disciplinas");
                cursos = (List<Curso>) session.getAttribute("cursos");
                exames = (List<Exame>) session.getAttribute("exames");
                salasExame = (List<SalaExame>) session.getAttribute("salasExame");

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
                            <button type="submit" onclick="this.disabled = 'disabled';
                                    this.form.submit();" class="btn btn-labeled btn-labeled-left bg-danger-400 heading-btn text-bold text-uppercase">Voltar ao painel principal<b><i class="icon-chevron-left"></i></b></button>
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
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-sort-alpha-asc position-left"></i> Listagem dos Candidatos á Exame</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->


                    <div class = "row">



                        <!-- Vertical form options -->
                        <div class="col-md-6"> 
                            <!-- Basic layout-->

                            <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?YWNjYW8jbGlzdGEtZXhhbWVz">
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
                                                        <button type="submit" onclick="this.disabled = 'disabled';
                                                                this.form.submit();" class="btn bg-slate-800 btn-labeled text-bold text-uppercase">
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
                            <%                                String act3 = encryptUtils.encodeString("accao#filtrar-turma&to=exam-list");
                            %>


                            <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?YWNjYW8jbGlzdGEtZXhhbWVz">
                                <div class="panel panel-flat">
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <div class="row">

                                                    <div class="col-md-7">


                                                        <select class="select" name="idDisciplina">
                                                            <optgroup label="Selecione disciplina">

                                                                <%
                                                                    if (disciplinas != null) {
                                                                        for (Disciplina d : disciplinas) {

                                                                            int id = d.getDiscId();
                                                                            String desc = encryptUtils.decodeString(d.getDiscDescricao());

                                                                            String sel = "";

                                                                            if (disciplina != null) {
                                                                                if (id == disciplina.getDiscId()) {
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



                    <div class = "row">

                        <!-- Vertical form options -->
                        <div class="col-md-6"> 
                            <!-- Basic layout-->

                            <%                                String act4 = encryptUtils.encodeString("accao#filtrar-salaExame&to=exam-list");
                            %>

                            <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?<%=act4%>">
                                <div class="panel panel-flat">
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <div class="row">

                                                    <div class="col-md-7">


                                                        <select class="select" name="idSala">
                                                            <optgroup label="Selecione uma Sala">

                                                                <%
                                                                    if (salasExame != null) {
                                                                        for (SalaExame s : salasExame) {

                                                                            int id = s.getSalaeId();
                                                                            String desc = encryptUtils.decodeString(s.getSala().getSalaDescricao()) + " - " + sdf.format(s.getSalaeData().toGregorianCalendar().getTime());

                                                                            String sel = "";

                                                                            if (salaExame != null) {
                                                                                if (id == salaExame.getSalaeId()) {
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
                                                        <button type="submit" onclick="this.disabled = 'disabled';
                                                                this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                            <b><i class="icon-search4 position-right"></i></b> 
                                                            Filtrar Sala
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



                        <%
                            String dd = "";
                            String cur = "";
                            String di = "";

                            String an = "";

                            if (salaExame != null) {

                                dd = encryptUtils.decodeString(salaExame.getSala().getSalaDescricao());
                                cur = encryptUtils.decodeString(salaExame.getCurso().getCursDescricao());
                                di = encryptUtils.decodeString(salaExame.getDisciplina().getDiscDescricao());

                            }

                            if (anoLectivo != null) {
                                an = encryptUtils.decodeString(anoLectivo.getAnolDescricao());
                            }
                        %>



                        <div class="col-md-12">

                            <!-- Basic responsive configuration -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-bold text-uppercase">LISTA DE CANDIDATOS A EXAME  <span class="text-danger-600">[<%=cur + "| Turma:" + dd%>]</span> <span class="text-primary-600"> - [<%=di%>]</span></h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>
                                        </ul>
                                    </div>
                                </div>



                                <div class="panel-body">

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <button id="btnExport" onclick="fnExcelReport('id18', 'LISTA DE CANDIDATOS A EXAME', '<%=an%>', '<%=cur%> | DISCIPLINA: <%=di%>');" class="btn bg-success-600 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                <b><i class="icon-file-excel"></i></b>
                                                Exportar registos
                                            </button>
                                        </div>
                                    </div>

                                </div>


                                <table class="table datatable-responsive">
                                    <thead>
                                        <tr>
                                            <th class="text-bold text-uppercase">#</th>
                                            <th class="text-bold text-uppercase">Província</th>
                                            <th class="text-bold text-uppercase">Escola</th>
                                            <th class="text-bold text-uppercase">Código</th>
                                            <th class="text-bold text-uppercase">Candidato ID</th>
                                            <th class="text-bold text-uppercase">Nome Completo</th>
                                            <th class="text-bold text-uppercase">Género</th>
                                            <th class="text-bold text-uppercase">Tipo de Doc.</th>
                                            <th class="text-bold text-uppercase">Nº Do Documento</th>
                                            <th class="text-bold text-uppercase">Grupo Científico</th>
                                            <th class="text-bold text-uppercase">Disciplina</th>
                                        </tr>
                                    </thead>
                                    <tbody>


                                        <%
                                            int i = 0;
                                            if (exames != null) {

                                                for (Exame e : exames) {

                                                    int id = e.getExamId();

                                                    String s1 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(e.getAluno().getPessoa().getPessApelido());
                                                    String s2 = encryptUtils.decodeString(e.getAluno().getAlunBadgnumber());
                                                    String s3 = encryptUtils.decodeString(e.getEntidade().getEntiProvincia());
                                                    String s4 = encryptUtils.decodeString(e.getEntidade().getEntiLicenca());
                                                    String s5 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessSexo()).charAt(0) + "";
                                                    String s6 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessDocumento());
                                                    String s7 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessBi());
                                                    String s8 = "---";
                                                    String s9 = encryptUtils.decodeString(e.getDisciplina().getDiscDescricao());
                                                    String s10 = encryptUtils.decodeString(e.getEntidade().getEntiNome());

                                                    i++;

                                        %>
                                        <tr>
                                            <td class="text-bold text-primary-600"><%=i%></td>
                                            <td class="text-uppercase"><%=s3%></td>
                                            <td class="text-uppercase"><%=s10%></td>
                                            <td class="text-uppercase"><%=s4%></td>
                                            <td class="text-bold"><%=s2%></td>
                                            <td class="text-uppercase"><%=s1%></td>
                                            <td class="text-uppercase"><%=s5%></td>
                                            <td class="text-uppercase"><%=s6%></td>
                                            <td class="text-uppercase"><%=s7%></td>
                                            <td class="text-uppercase"><%=s8%></td>
                                            <td class="text-uppercase"><%=s9%></td>
                                        </tr>

                                        <%

                                                }
                                            }
                                        %>

                                    </tbody>
                                </table>




                                <table class="table" hidden="" id="id18">
                                    <thead>
                                        <tr>
                                            <th class="text-bold text-uppercase">#</th>
                                            <th class="text-bold text-uppercase">Província</th>
                                            <th class="text-bold text-uppercase">Escola</th>
                                            <th class="text-bold text-uppercase">Código</th>
                                            <th class="text-bold text-uppercase">Candidato ID</th>
                                            <th class="text-bold text-uppercase">Nome Completo</th>
                                            <th class="text-bold text-uppercase">Género</th>
                                            <th class="text-bold text-uppercase">Tipo de Doc.</th>
                                            <th class="text-bold text-uppercase">Nº Do Documento</th>
                                            <th class="text-bold text-uppercase">Grupo Científico</th>
                                            <th class="text-bold text-uppercase">Disciplina</th>
                                        </tr>
                                    </thead>
                                    <tbody>


                                        <%
                                            i = 0;
                                            if (exames != null) {

                                                for (Exame e : exames) {

                                                    int id = e.getExamId();

                                                    String s1 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(e.getAluno().getPessoa().getPessApelido());
                                                    String s2 = encryptUtils.decodeString(e.getAluno().getAlunBadgnumber());
                                                    String s3 = encryptUtils.decodeString(e.getEntidade().getEntiProvincia());
                                                    String s4 = encryptUtils.decodeString(e.getEntidade().getEntiLicenca());
                                                    String s5 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessSexo()).charAt(0) + "";
                                                    String s6 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessDocumento());
                                                    String s7 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessBi());
                                                    String s8 = "---";
                                                    String s9 = encryptUtils.decodeString(e.getDisciplina().getDiscDescricao());
                                                    String s10 = encryptUtils.decodeString(e.getEntidade().getEntiNome());

                                                    i++;

                                        %>
                                        <tr>
                                            <td class="text-bold text-primary-600"><%=i%></td>
                                            <td class="text-uppercase"><%=s3%></td>
                                            <td class="text-uppercase"><%=s10%></td>
                                            <td class="text-uppercase"><%=s4%></td>
                                            <td class="text-bold"><%=s2%></td>
                                            <td class="text-uppercase"><%=s1%></td>
                                            <td class="text-uppercase"><%=s5%></td>
                                            <td class="text-uppercase"><%=s6%></td>
                                            <td class="text-uppercase"><%=s7%></td>
                                            <td class="text-uppercase"><%=s8%></td>
                                            <td class="text-uppercase"><%=s9%></td>
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


        <script type="text/javascript">

            function fnExcelReport(idTable, title, an, cur)
            {
                var tab_text = "<meta http-equiv='content-type' content='application/vnd.ms-excel; charset=UTF-8'> <style type='text/css'>  body {font-family: Verdana;}</style> <br><br><h4 style='text-align: center; font-family: Verdana;'><b>" + title + "</b></h4><br>\n\
         <br><h4 style='text-align: center; font-family: Verdana;'><b>ANO LECTIVO: " + an + " | CLASSE: " + cur + "</b></h4><br>\n\
                                \n\
                             <table border='2px'><tr bgcolor='#87AFC6'>";
                var textRange;
                var j = 0;
                tab = document.getElementById(idTable); // id of table

                for (j = 0; j < tab.rows.length; j++)
                {
                    tab_text = tab_text + tab.rows[j].innerHTML + "</tr>";
                    //tab_text=tab_text+"</tr>";
                }

                tab_text = tab_text + "</table>";
                tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
                tab_text = tab_text.replace(/<img[^>]*>/gi, ""); // remove if u want images in your table
                tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params

                var ua = window.navigator.userAgent;
                var msie = ua.indexOf("MSIE");

                if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
                {
                    txtArea1.document.open("txt/html", "replace");
                    txtArea1.document.write(tab_text);
                    txtArea1.document.close();
                    txtArea1.focus();
                    sa = txtArea1.document.execCommand("SaveAs", true, "Exportação com sucesso");
                } else                 //other browser not tested on IE 11
                {
                    sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));
                }
                return (sa);
            }

        </script>
        <!-- /scripts -->

        <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>

    </body>
</html>
