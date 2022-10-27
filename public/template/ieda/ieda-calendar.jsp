<%-- 
    Document   : ee-calendar
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
        <title>SEGIA - Calendário de Exames (Exame Extraodinário)</title>

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

        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/effects.min.js"></script>

        <script type="text/javascript" src="assets/js/plugins/ui/moment/moment.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/ui/fullcalendar/fullcalendar.min.js"></script>
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

            String dd = "";
            String lblCalendario = "";

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

                dd = session.getAttribute("dd").toString();
                lblCalendario = session.getAttribute("lblCalendario").toString();

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


    </head>

    <body oncontextmenu="return false">

        <%@ include file="navebar.jsp" %> 

        <!-- Page header -->
        <%@ include file="header.jsp" %> 
        <!-- /Page header -->

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
                        <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-calendar3 position-left"></i> Calendário Exames</a></li>
                    </ul>

                </div>
            </div>
            <!-- /toolbar -->

            <!-- rom.1-->
            <div class="row">
                <!-- Vertical form options -->
                <form class="row col-sm-12" method="post" accept-charset="ISO-8859-1" action="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jY2FsZW5kYXJpbw==">
                    <div class="panel panel-flat ">
                        <div class="panel-body">
                            <div class="col-md-5">
                                <label for="idCurso" class="form-label text-bold text-uppercase">Classe</label>
                                <select class="form-control" id="idCurso" name="idCurso" id="idCurso"></select>
                            </div> 
                            <div class="col-md-5">
                                <label for="idDisciplina" class="form-label text-bold text-uppercase">Disciplina:</label>
                                <select class="form-control" id="idDisciplina" name="idDisciplina" id="idDisciplina"></select>
                            </div>
                            <div class="col-md-2">
                                <label class="form-label"></label>
                                <button type="submit" onclick="this.disabled = 'disabled';
                                        this.form.submit();" class="btn bg-slate-800 btn-labeled text-bold text-uppercase pull-right btn-block">
                                    <b><i class="icon-search4 position-right"></i></b> 
                                    Filtrar
                                </button>

                            </div>
                        </div>
                    </div>
                </form>
                <!-- /Vertical form options -->
            </div> 
            <!-- /row.1--> 




            <!-- Main charts -->
            <div class="row">
                <div class="col-lg-12">

                    <!-- Event colors -->
                    <div class="panel panel-flat">
                        <div class="panel-body">

                            <div class="fullcalendar-event-colors"></div>
                        </div>
                    </div>
                    <!-- /event colors -->

                </div>
            </div>
            <!-- /.main charts -->

        </div>
        <!-- /row.2 -->

        <!-- Footer -->
        <%@ include file="footer2.jsp" %> 
        <!-- /Footer -->

        <script type="text/javascript">
            /* ------------------------------------------------------------------------------
             *
             *  # Fullcalendar basic options
             *
             *  Specific JS code additions for extra_fullcalendar_views.html and 
             *  extra_fullcalendar_styling.html pages
             *
             *  Version: 1.0
             *  Latest update: Aug 1, 2015
             *
             * ---------------------------------------------------------------------------- */

            $(function () {


                // Add events
                // ------------------------------


                // Event colors
                var eventColors = [<%=lblCalendario%>];


                // Initialization
                // ------------------------------

                // Event colors
                $('.fullcalendar-event-colors').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    defaultDate: '<%=dd%>',
                    events: eventColors
                });


            });
        </script>
        <script type="text/javascript">

            $(document).ready(function () {

                $.ajax({
                    url: "CommonServelet",
                    method: "GET",
                    data: {operation: 'getCursos'},
                    success: function (data) {
                        console.log(data);
                        $("#idCurso option").remove();
                        $("#idCurso").append('<option value="">Seleciona uma classe </option>');
                        var obj = $.parseJSON(data);
                        $.each(obj, function (key, value) {
                            $("#idCurso").append('<option value="' + value.cursId + '">' + value.cursDescricao + '</option>');
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("Error: " + jqXHR.toString());
                    }
                });
                $(document).on('change', '#idCurso', function (e) {

                    e.preventDefault();
                 //   $("#curso").html($("#idCurso").val());
                    $.ajax({
                        url: "CommonServelet",
                        method: "GET",
                        data: {operation: 'getDisciplinaCurso', cursoId: $("#idCurso").val()},
                        success: function (data) {
                            console.log(data);
                            $("#idDisciplina option").remove();
                            $("#idDisciplina").append('<option value=""> Seleciona uma disciplina </option>');
                            var obj = $.parseJSON(data);
                            $.each(obj, function (key, value) {
                                $("#idDisciplina").append('<option value="' + value.discId + '">' + value.discDescricao + '</option>');
                            });
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("Error: " + jqXHR.toString());
                        }
                    });
                });


            });
        </script>
        <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>


    </body>

</html>