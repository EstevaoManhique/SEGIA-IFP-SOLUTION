<%-- 
    Document   : avl-notes
    Created on : Sep 14, 2017, 12:26:26 PM
    Author     : hamil
--%>

<%@page import="java.util.Calendar"%>
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
        <title>SEGIA -  Lançamento de notas</title>

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
            List<Notas> notas = null;

            String semestre = "";
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
                notas = (List<Notas>) session.getAttribute("notas");

                if (session.getAttribute("semestre") != null) {
                    semestre = session.getAttribute("semestre").toString();
                }

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
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-grid-alt position-left"></i>Gestao de Módulos do Ensino a Distância</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->



                    <div class = "row">

                        <div class="panel panel-flat">

                            <div class="panel-body">
                                <div class="tabbable">
                                    <ul class="nav nav-tabs nav-tabs-highlight nav-justified">
                                        <li class="active"><a href="#justified-left-tab1" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-plus-circle2 position-left"></i> <b>Novo Registo</b></a></li>
                                        <li><a href="#justified-left-tab2" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-list3 position-left"></i> <b>Listagem dos módulos </b></a></li>

                                    </ul>

                                    <div class="tab-content">
                                        <div class="tab-pane active" id="justified-left-tab1">
                                            <!-- Vertical form options -->
                                            <div class="col-md-7 col-md-offset-2">


                                                <!-- Basic layout-->
                                                <%                                                    String act = encryptUtils.encodeString("accao#adicionar-curso");
                                                %>
                                                <form method="post" accept-charset="ISO-8859-1" id='form-modulo' class="form-horizontal">

                                                    <div class="panel panel-flat">
                                                        <div class="panel-body">

                                                            <div class="form-group">
                                                                <label class="col-lg-3 control-label text-bold text-uppercase">Categoria de Ensino: </label>

                                                                <div class="col-lg-6">
                                                                    <div class="row">

                                                                        <select class="select" id="ciclo_id"  name="ciclo_id" required="">
                                                                            <optgroup label="Selecione a categoria de ensino">

                                                                            </optgroup>
                                                                        </select>


                                                                    </div>
                                                                </div>

                                                            </div>


                                                            <div class="form-group">
                                                                <label class="col-lg-3 control-label text-bold text-uppercase">Curso: </label>

                                                                <div class="col-lg-6">
                                                                    <div class="row">

                                                                        <select class="select" id="curso_id"  name="curso_id" required="">
                                                                            <optgroup label="Selecione a curso">

                                                                            </optgroup>
                                                                        </select>


                                                                    </div>
                                                                </div>

                                                            </div>

                                                            <div class="form-group">
                                                                <label class="col-lg-3 control-label text-bold text-uppercase">Disciplina: </label>

                                                                <div class="col-lg-6">
                                                                    <div class="row">

                                                                        <select class="select"  id="disciplina_id"  name="disciplina_id" required="">
                                                                            <optgroup label="Selecione a disciplina">

                                                                            </optgroup>
                                                                        </select>


                                                                    </div>
                                                                </div>

                                                            </div>



                                                            <div class="form-group">
                                                                <label class="col-lg-3 control-label text-bold text-uppercase">Descrição: </label>

                                                                <div class="col-lg-9">
                                                                    <div class="row">

                                                                        <div class="input-group col-md-8">
                                                                            <span class="input-group-addon"><i class="icon-file-text"></i></span>
                                                                            <input type="text" class="form-control" placeholder="Descrição do módulo ... " name="descricao" required="">
                                                                        </div>

                                                                    </div>
                                                                </div>

                                                            </div>



                                                            <div class="form-group">
                                                                <label class="col-lg-3 control-label text-bold text-uppercase">Código: </label>

                                                                <div class="col-lg-9">
                                                                    <div class="row">

                                                                        <div class="input-group col-md-6">
                                                                            <span class="input-group-addon"><i class="icon-file-text"></i></span>
                                                                            <input type="text" class="form-control" placeholder="Código do módulo ... " name="codigo" required="" maxlength="3">
                                                                        </div>

                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <input type="hidden" name="operation" value="add-modulo">

                                                            <div class="text-right">
                                                                <button type="submit"  class="btn text-bold text-uppercase  bg-slate-800">Gravar Registo <i class="icon-arrow-right14 position-right"></i></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                                <!-- /basic layout -->

                                            </div>

                                        </div>

                                        <div class="tab-pane" id="justified-left-tab2">




                                            <!-- Basic responsive configuration -->
                                            <div class="panel panel-flat">




                                                <div class="panel-body">

                                                    <a href="Q3Vyc29TZXJ2bGV0I0RDSQ==?YWNjYW8jaW1wcmltaXItY3Vyc29z" target="_blank" class="btn bg-slate-400 btn-labeled btn-lg text-bold text-uppercase">
                                                        <b><i class="icon-printer2"></i></b>
                                                        Imprimir registos
                                                    </a>

                                                </div>

                                                <table class="table datatable-responsive" id="table-modulos">
                                                    <thead>
                                                        <tr>
                                                            <th class="text-bold text-uppercase">#</th> 
                                                            <th class="text-bold text-uppercase">Descrição</th>
                                                            <th class="text-bold text-uppercase">Disciplina</th>
                                                            <th class="text-bold text-uppercase">Curso</th>
                                                            <th class="text-center text-bold text-uppercase text-danger-600">---</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                    </tbody>
                                                </table>
                                            </div>
                                            <!-- /basic responsive configuration -->


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>	



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

                function fnExcelReport(idTable, title)
                {
                    var tab_text = "<meta http-equiv='content-type' content='application/vnd.ms-excel; charset=UTF-8'> <style type='text/css'>  body {font-family: Verdana;}</style> <br><h4 style='text-align: center; font-family: Verdana;'><b>" + title + "</b></h4><br>\n\
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
                    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, ""); //remove if u want links in your table
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
            <script>
                $.ajax({
                    url: "CommonServelet",
                    method: "GET",
                    data: {operation: 'getCiclos'},
                    success: function (data) {
                        //  console.log(data);
                        $("#ciclo_id option").remove();
                        var obj = $.parseJSON(data);
                        // console.log(obj);
                        $.each(obj, function (key, value) {
                            $("#ciclo_id optgroup").append('<option value="' + value.arefId + '">' + value.arefDescricao + '</option>');
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("Error: " + jqXHR.toString());
                    }
                });

                $.ajax({
                    url: "CommonServelet",
                    method: "GET",
                    data: {operation: 'getModulos'},
                    success: function (data) { 
                        var obj = $.parseJSON(data);
                        var tbody = $("#table-modulos tbody");
                        $.each(obj, function (key, value) {
                            tbody.append('<tr><td>'+(key+1)+'</td><td>'+value.moduDescricao+'</td><td>'+value.disciplina.discDescricao+'</td><td>'+value.curso.cursDescricao+'</td><td><a type="button" data-id="'+value.moduId+ '" class="btn btn-sm  btn-warning  btn-delete">Remover<i class="far fa-trash-alt"></i></a> <a type="button" data-id="'+value.moduId+ '" class="btn btn-sm  btn-info  btn-edit">Editar<i class="far fa-trash-alt"></i></a></td</tr>');
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("Error: " + jqXHR.toString());
                    }
                });
                $.ajax({
                    url: "CommonServelet",
                    method: "GET",
                    data: {operation: 'getCursoAreaF', curso_id: $('#ciclo_id').val()},
                    success: function (data) {
                        // console.log(data);
                        $("#curso_id option").remove();
                        var obj = $.parseJSON(data);
                        // console.log(obj);
                        $.each(obj, function (key, value) {
                            $("#curso_id optgroup").append('<option value="' + value.cursId + '">' + value.cursDescricao + '</option>');
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("Error: " + jqXHR.toString());
                    }
                });
                $(document).on('click','.btn-delete',function(e){
                    e.preventDefault();
                    var id=$(this).attr('data-id');
                    $.ajax({
                        url: "CommonServelet",
                        method: "GET",
                        data: {operation: 'delete-modulo', modulo_id:id},
                        success: function (data) {
                            
                            console.log(data);
                             
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("Error: " + jqXHR.toString());
                        }
                    });
                });
                $(document).on('change', '#ciclo_id', function (e) {
                    e.preventDefault();
                    console.log($('#ciclo_id').val())
                    $.ajax({
                        url: "CommonServelet",
                        method: "GET",
                        data: {operation: 'getCursoAreaF', ciclo_id: $('#ciclo_id').val()},
                        success: function (data) {
                            $("#curso_id option").remove();
                            var obj = $.parseJSON(data);
                            // console.log(obj);
                            $.each(obj, function (key, value) {
                                $("#curso_id optgroup").append('<option value="' + value.cursId + '">' + value.cursDescricao + '</option>');
                            });
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("Error: " + jqXHR.toString());
                        }
                    });
                });
                $(document).on('change', '#curso_id', function (e) {
                    e.preventDefault();
                    console.log($('#curso_id').val())
                    $.ajax({
                        url: "CommonServelet",
                        method: "GET",
                        data: {operation: 'getCursoDisciplina', curso_id: $('#curso_id').val()},
                        success: function (data) {
                            $("#disciplina_id option").remove();
                            var obj = $.parseJSON(data);
                            // console.log(obj);
                            $.each(obj, function (key, value) {
                                $("#disciplina_id optgroup").append('<option value="' + value.disdId + '">' + value.disciplina.discDescricao + '</option>');
                            });
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("Error: " + jqXHR.toString());
                        }
                    });
                });
                $(document).on('submit', '#form-modulo', function (e) {
                    e.preventDefault();

                    var idd = $(this).attr("data-type");
                    var url = $(this).attr("action");
                    var type = $(this).attr("method");
                    var data = $(this).serializeArray();

                    console.log(data);
                    $.ajax({
                        url: "CommonServelet",
                        method: "Post",
                        data: data,
                        success: function (data) {

                           // var obj = $.parseJSON(data);
                            console.log(data);

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("Error: " + jqXHR.toString());
                        }
                    });
                    
                });

            </script>

            <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>

            <script type="text/javascript" src="assets/js/owner/selects_dependent.js">


                        </body>
                        </html>
