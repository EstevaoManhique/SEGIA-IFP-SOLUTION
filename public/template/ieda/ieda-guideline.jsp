<%-- 
    Document   : ee-guideline
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
        <title>SEGIA - Pauta de Exame</title>

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

                if (bg !== '') {
                    /*$.jGrowl(erro, {
                     position: 'center',
                     header: hd,
                     theme: bg
                     });*/

                    if (bg === 'bg-error') {
                        cl = "#EF5350";
                        tp = "error";
                    }

                    if (bg === 'bg-warning') {
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
                        paginate: {
                            'first': 'Primeiro',
                            'last': 'Último',
                            'next': '&rarr;',
                            'previous': '&larr;'
                        }
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
        <%@ include file="navebar.jsp" %> 
        <!-- /main navbar -->

        <!-- Page header -->
        <%@ include file="header.jsp" %> 
        <!-- /page header -->


        <!-- Main sidebar -->
        <%@ include file="menu.jsp" %>  
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
                        <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-table2 position-left"></i> Pauta de Exame</a></li>
                    </ul>

                </div>
            </div>
            <!-- /toolbar -->





            <div class="row">



                <!-- Vertical form options -->
                <div class="col-md-6">
                    <!-- Basic layout-->

                    <form method="post" accept-charset="ISO-8859-1" action="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jcGF1dGE=">
                        <div class="panel panel-flat">
                            <div class="panel-body">

                                <div class="form-group">
                                    <div class="col-lg-12">
                                        <div class="row">

                                            <div class="col-md-7">

                                                <select class="select" name="idCurso">
                                                    <optgroup label="Selecione a classe">

                                                        <%                                                                    if (cursos != null) {
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

                    <form method="post" accept-charset="ISO-8859-1" action="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jcGF1dGE=">
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
                                                <button type="submit" onclick="this.disabled = 'disabled';
                                                        this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
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



            <div class="row">

                <!-- Vertical form options -->
                <div class="col-md-6">
                    <!-- Basic layout-->

                    <%                                String act4 = encryptUtils.encodeString("accao#filtrar-salaExame&to=ee-guideline");
                    %>

                    <form method="post" accept-charset="ISO-8859-1" action="SUVEQVNlcnZsZXQjRENJ?<%=act4%>">
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


            <div class="row">

                <%
                    String decT = "---";
                    String decD = "---";
                    String decJ1 = "---";
                    String decJ2 = "---";
                    String cap = "";

                    int id = -1;

                    if (salaExame != null) {

                        decT = encryptUtils.decodeString(salaExame.getSala().getSalaDescricao());
                        decD = sdf.format(salaExame.getSalaeData().toGregorianCalendar().getTime());
                        decJ2 = encryptUtils.decodeString(salaExame.getJuri2().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(salaExame.getJuri2().getPessoa().getPessApelido());
                        decJ1 = encryptUtils.decodeString(salaExame.getJuri1().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(salaExame.getJuri1().getPessoa().getPessApelido());
                        cap = salaExame.getSalaeMaxAlunos() + "";
                        id = salaExame.getSalaeId();
                    }
                %>
                <div class="col-md-5">

                    <!-- Basic table -->
                    <div class="panel panel-flat">
                        <div class="panel-heading">
                            <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Detalhes da turma</h6>
                            <div class="heading-elements">
                                <ul class="icons-list">
                                    <li>
                                        <a data-action="collapse"></a>
                                    </li>
                                    <li>
                                        <a data-action="reload"></a>
                                    </li>

                                </ul>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td class="text-bold">Sala: </td>
                                        <td>
                                            <%=decT%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-bold">Capacidade: </td>
                                        <td>
                                            <%=cap%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-bold">Data: </td>
                                        <td>
                                            <%=decD%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-bold">Júri 1: </td>
                                        <td>
                                            <%=decJ1%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-bold">Júri 2: </td>
                                        <td>
                                            <%=decJ2%>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- /basic table -->

                </div>
            </div>

            <div class="row">



                <div class="col-md-10">
                    <!-- Vertical form options -->



                    <!-- Basic responsive configuration -->
                    <div class="panel panel-flat">
                        <div class="panel-heading">
                            <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Lista dos alunos para marcação de presenças/fraudes <span class="text-danger">(<%=decT%>)</span></h6>
                            <div class="heading-elements">
                                <ul class="icons-list">
                                    <li>
                                        <a data-action="collapse"></a>
                                    </li>
                                    <li>
                                        <a data-action="reload"></a>
                                    </li>
                                </ul>
                            </div>
                        </div>





                        <%

                            String act = encryptUtils.encodeString("accao#actualizar-presencas");
                        %>

                        <form method="post" accept-charset="ISO-8859-1" action="SUVEQVNlcnZsZXQjRENJ?<%=act%>">



                            <div class="panel-body">
                                <p>

                                    <a href="#" target="_blank" class="btn text-bold text-uppercase bg-teal-700 btn-labeled btn-lg text-bold text-uppercase"><b><i class="icon-printer2"></i></b> Imprimir a Pauta</a>


                                </p>
                            </div>


                            <table class="table datatable-responsive">
                                <thead>
                                    <tr>
                                        <th class="text-bold text-uppercase">#</th>
                                        <th class="text-bold text-uppercase">COD</th>
                                        <th class="text-bold text-uppercase">Nome</th>
                                        <th class="text-bold text-uppercase text-right">Média</th>
                                        <th class="text-bold text-uppercase text-right">1ª Chamada</th>
                                        <th class="text-bold text-uppercase text-right">2ª Chamada</th>
                                        <th class="text-bold text-uppercase text-right">Nota Final</th>
                                        <th class="text-bold text-uppercase text-center">Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        if (exames != null) {
                                            int x = 0;
                                            for (Exame e : exames) {

                                                x++;

                                                String ref = encryptUtils.decodeString(e.getAluno().getAlunBadgnumber());
                                                String nom = encryptUtils.decodeString(e.getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(e.getAluno().getPessoa().getPessApelido());
                                                String med = df.format(e.getExamMedia());
                                                String n1 = df.format(e.getExamNota());
                                                String n2 = df.format(e.getExamRecorrencia());
                                                String medF = df.format(e.getExamNotaFinal());
                                                String status = "Aprovado";

                                                String lbl1 = "text-danger";
                                                String lbl2 = "text-danger";
                                                String lbl3 = "text-danger";

                                                if (e.getExamNota() >= 9.5) {
                                                    lbl1 = "text-success";
                                                }
                                                if (e.getExamRecorrencia() >= 9.5) {
                                                    lbl2 = "text-success";
                                                }
                                                if (e.getExamNotaFinal() >= 9.5) {
                                                    lbl3 = "text-success";
                                                }

                                                String lblStatus = "bg-success-600";

                                                if (e.getExamNota() < 9.5 && e.getExamRecorrencia() == 0) {
                                                    status = "2ª Chamada";
                                                    lblStatus = "bg-orange-700";
                                                }

                                                if (e.getExamNotaFinal() < 9.5 && e.getExamNota() != 0 && e.getExamRecorrencia() != 0) {
                                                    status = "Reprovado";
                                                    lblStatus = "bg-danger-400";
                                                }

                                                if (e.getExamNota() >= 9.5) {
                                                    status = "Aprovado";
                                                    lblStatus = "bg-success-400";
                                                }

                                                boolean fraude = e.isExamFraude();

                                                if (fraude) {
                                                    n1 = "<i class='icon-minus2 text-slate-800'></i>";
                                                    n2 = "<i class='icon-minus2 text-slate-800'></i>";
                                                    medF = "<i class='icon-minus2 text-slate-800'></i>";
                                                    status = "Fraude";
                                                    lblStatus = "bg-danger-800";
                                                }

                                                int idA = e.getExamId();
                                    %>
                                    <tr>
                                        <td>
                                            <a href="#">
                                                <%=x%>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="#">
                                                <%=ref%>
                                            </a>
                                        </td>
                                        <td>
                                            <%=nom%>
                                        </td>
                                        <td class="text-bold text-right">
                                            <%=med%>
                                        </td>
                                        <td class="text-bold text-right <%=lbl1%>">
                                            <%=n1%>
                                        </td>
                                        <td class="text-bold text-right <%=lbl2%>">
                                            <%=n2%>
                                        </td>
                                        <td class="text-bold text-right <%=lbl3%>">
                                            <%=medF%>
                                        </td>
                                        <td class="text-center"><span class="label <%=lblStatus%>"><%=status%></span></td>
                                    </tr>

                                    <%
                                            }
                                        }
                                    %>
                                </tbody>
                            </table>

                        </form>
                    </div>
                    <!-- /basic responsive configuration -->



                </div>
                <!-- /vertical form options -->


            </div>


        </div>
        <!-- /main content -->


        <!-- Footer -->
        <%@ include file="footer2.jsp" %> 
        <!-- /Footer -->

        <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>

    </body>

</html>