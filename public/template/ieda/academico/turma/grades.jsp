<%-- 
    Document   : dc-inefp-grades
    Created on : Feb 11, 2017, 7:30:25 PM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.Sala"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="com.dciapps.webclient.Turma"%>
<%@page import="com.dciapps.webclient.Horario"%>
<%@page import="com.dciapps.local.RTurmas"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dciapps.webclient.Curso"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.webclient.Log"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dciapps.controller.GenericHandler"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="com.dciapps.webclient.ModulosUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SEGIA - Turmas</title>

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

            ModulosUsuario mu = null;
            List<RTurmas> rturmas = null;
            List<Curso> cursos = null;
            List<Horario> horarios = null;
            List<Sala> salas = null;
            Turma turma = null;

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

                rturmas = (List<RTurmas>) session.getAttribute("rturmas");
                cursos = (List<Curso>) session.getAttribute("cursos");
                horarios = (List<Horario>) session.getAttribute("horarios");
                salas = (List<Sala>) session.getAttribute("salas");
                turma = (Turma) session.getAttribute("turma");

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

    <body oncontextmenu="return false"  class="navbar-top">



        <!-- Main navbar -->
        <div class="navbar navbar-inverse  navbar-fixed-top">
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
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-table position-left"></i> Gestão de Turmas</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->



                    <div class = "row">

                        <div class = "col-md-12 col-md-offset-0">

                            <%                                String cls = "col-md-6";
                                String act = encryptUtils.encodeString("accao#adicionar-turma");
                                String vlBtn = "Gravar Registo";
                                String lblReg = "Novo Registo";
                                String icnReg = "icon-file-plus";

                                String curso = session.getAttribute("curso").toString();
                                String horario = session.getAttribute("horario").toString();
                                String min = session.getAttribute("min").toString();
                                String max = session.getAttribute("max").toString();
                                String turno = session.getAttribute("turno").toString();
                                String periodo = session.getAttribute("periodo").toString();
                                String descricao = session.getAttribute("descricao").toString();

                                String sala = "";

                                if (turma != null) {
                                    cls = "col-md-6 col-md-offset-3";
                                    act = encryptUtils.encodeString("accao#confirmar-edicao-turma");
                                    vlBtn = "Actualizar Registo";
                                    lblReg = "Actualizar Registo";
                                    icnReg = "icon-pencil4";

                                    curso = encryptUtils.decodeString(turma.getCurso().getCursDescricao());
                                    horario = encryptUtils.decodeString(turma.getTurmHorario());
                                    sala = encryptUtils.decodeString(turma.getSala().getSalaDescricao());

                                    min = turma.getTurmMinEstudantes() + "";
                                    max = turma.getTurmMaxEstudantes() + "";
                                    turno = encryptUtils.decodeString(turma.getTurmTurno());
                                    periodo = sdf.format(turma.getTurmDataInicio().toGregorianCalendar().getTime()) + " - " + sdf.format(turma.getTurmDataFim().toGregorianCalendar().getTime());
                                    descricao = encryptUtils.decodeString(turma.getTurmDescricao());
                                }

                                if (min.equals("0")) {
                                    min = "";
                                }

                                if (max.equals("0")) {
                                    max = "";
                                }
                            %>
                            <!-- Vertical form options -->
                            <div class="<%=cls%>">


                                <!-- Basic layout-->

                                <form method="post" accept-charset="ISO-8859-1" action="VHVybWFTZXJ2bGV0I0RDSQ==?<%=act%>" class="form-horizontal">

                                    <div class="panel panel-flat">
                                        <div class="panel-heading">
                                            <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase"><i class="<%=icnReg%>"></i> <%=lblReg%></h6>
                                            <div class="heading-elements">
                                                <ul class="icons-list">
                                                    <li><a data-action="collapse"></a></li>
                                                    <li><a data-action="reload"></a></li>

                                                </ul>
                                            </div>
                                        </div>

                                        <div class="panel-body">



                                            <div class="form-group">
                                                <label class="col-lg-3 control-label text-bold text-uppercase">Descrição: </label>

                                                <div class="col-lg-9">
                                                    <div class="row">

                                                        <div class="input-group col-md-10">
                                                            <span class="input-group-addon"><i class="icon-file-text"></i></span>
                                                            <input type="text" class="form-control" placeholder="Descrição da turma ... " name="descricao" required="" value='<%=descricao%>'>
                                                        </div>

                                                    </div>
                                                </div>

                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-3 control-label text-bold text-uppercase">Classe: </label>

                                                <div class="col-lg-9">
                                                    <div class="row">

                                                        <div class="col-md-12">
                                                            <select data-placeholder="Selecione a classe" class="select" name="idCurso" required="">
                                                                <optgroup label="Selecione a classe">
                                                                    <%
                                                                        if (cursos != null) {

                                                                            for (Curso c : cursos) {

                                                                                int id = c.getCursId();
                                                                                String desc = encryptUtils.decodeString(c.getCursCod())+" - "+ encryptUtils.decodeString(c.getCursDescricao());

                                                                                String sel = "";

                                                                                if (desc.equals(curso)) {
                                                                                    sel = "selected";
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

                                                    </div>
                                                </div>

                                            </div>




                                            <div class="form-group">

                                                <label class="col-lg-3 control-label text-danger-700 text-bold text-uppercase">ENSINO:</label>

                                                <div class="col-lg-9">
                                                    <div class="row">

                                                        <div class="col-lg-6">
                                                            <label class="radio-inline">
                                                                <input type="radio" value ="PRESENCIAL" name="tipoEnsino" class="styled" checked="checked">
                                                                <span class="text-bold  text-uppercase">PRESENCIAL</span>
                                                            </label>
                                                        </div>

                                                        <div class="col-lg-6">
                                                            <label class="radio-inline">
                                                                <input type="radio" value ="DISTÂNCIA" name="tipoEnsino" class="styled">
                                                                <span class="text-bold  text-uppercase">DISTÂNCIA</span>
                                                            </label>
                                                        </div>

                                                    </div>
                                                </div>

                                            </div>


                                            <div class="form-group">
                                                <label class="col-lg-3 control-label text-bold text-uppercase">Sala: </label>

                                                <div class="col-lg-9">
                                                    <div class="row">

                                                        <div class="col-md-12">
                                                            <select data-placeholder="Selecione a sala" class="select" required="" name="idSala">
                                                                <option></option>
                                                                <%
                                                                    if (salas != null) {
                                                                        for (Sala s : salas) {
                                                                            int id = s.getSalaId();
                                                                            String desc = encryptUtils.decodeString(s.getSalaDescricao());

                                                                            String sel = "";

                                                                            if (desc.equals(sala)) {
                                                                                sel = "selected";
                                                                            }
                                                                %>
                                                                <option value="<%=id%>" <%=sel%>><%=desc%></option> 
                                                                <%

                                                                        }
                                                                    }
                                                                %>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>



                                            <div class="form-group">
                                                <label class="col-lg-3 control-label text-bold text-uppercase">Horário: </label>

                                                <div class="col-lg-9">
                                                    <div class="row">

                                                        <div class="col-md-12">
                                                            <select data-placeholder="Selecione o horário" class="select" required="" name="idHorario">
                                                                <option></option>
                                                                <%
                                                                    if (horarios != null) {
                                                                        for (Horario h : horarios) {
                                                                            int id = h.getHoraId();
                                                                            String desc = encryptUtils.decodeString(h.getHoraInicio()) + " - " + encryptUtils.decodeString(h.getHoraFim());

                                                                            String sel = "";

                                                                            if (desc.equals(horario)) {
                                                                                sel = "selected";
                                                                            }
                                                                %>
                                                                <option value="<%=id%>" <%=sel%>><%=desc%></option> 
                                                                <%

                                                                        }
                                                                    }
                                                                %>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>



                                            <div class="form-group">
                                                <label class="col-lg-3 control-label text-bold text-uppercase">Turno: </label>

                                                <div class="col-lg-9">
                                                    <div class="row">

                                                        <div class="col-md-12">
                                                            <select data-placeholder="Selecione o turno" class="select" required="" name="turno">
                                                                <option></option>
                                                                <%
                                                                    String turnos[] = {"Laboral", "Pós Laboral"};

                                                                    for (String desc : turnos) {
                                                                        String sel = "";

                                                                        if (desc.equals(turno)) {
                                                                            sel = "selected";
                                                                        }
                                                                %>
                                                                <option value="<%=desc%>" <%=sel%>><%=desc%></option> 
                                                                <%
                                                                    }
                                                                %>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-3 control-label text-bold text-uppercase">Alunos: </label>

                                                <div class="col-lg-9">
                                                    <div class="row">

                                                        <div class="col-md-6">
                                                            <input type="number" class="form-control" placeholder="Minímo ... " name="min" required="" min="5" value="<%=min%>">
                                                        </div>

                                                        <div class="input-group col-md-6">
                                                            <span class="input-group-addon"><i class=" icon-sort-numeric-asc"></i></span>
                                                            <input type="number" class="form-control" placeholder="Máximo ... " name="max" min="5" max="50" required="" value="<%=max%>">
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>


                                            <div class="form-group">
                                                <label class="col-lg-3 control-label text-bold text-uppercase">Periodo: </label>

                                                <div class="col-lg-9">
                                                    <div class="row">

                                                        <div class="input-group col-md-9">
                                                            <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                            <input type="text" class="form-control daterange-weeknumbers"  name="periodo" required="" value="<%=periodo%>"> 
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="text-right">
                                                <%
                                                    if (turma != null) {
                                                        String actC = encryptUtils.encodeString("accao#cancelar-edicao");
                                                %>
                                                <a href="VHVybWFTZXJ2bGV0I0RDSQ==?<%=actC%>" class="btn text-bold text-uppercase bg-danger-400 btn-labeled-left ml-10"><i class="icon-cross2"></i> Cancelar edição</a>
                                                <%
                                                    }
                                                %>

                                                <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800"><%=vlBtn%> <i class="icon-arrow-right14 position-right"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!-- /basic layout -->

                            </div>

                            <%
                                if (turma == null) {
                            %>

                            <div class="col-md-6">

                                <!-- Basic responsive configuration -->
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Lista das turmas</h6>
                                        <div class="heading-elements">
                                            <ul class="icons-list">
                                                <li><a data-action="collapse"></a></li>
                                                <li><a data-action="reload"></a></li>

                                            </ul>
                                        </div>
                                    </div>


                                    <div class="panel-body">

                                        <a href="VHVybWFTZXJ2bGV0I0RDSQ==?YWNjYW8jaW1wcmltaXItdHVybWFz" target="_blank" class="btn bg-slate-400 btn-labeled btn-lg text-bold text-uppercase">
                                            <b><i class="icon-printer2"></i></b>
                                            Imprimir registos
                                        </a>

                                    </div>


                                    <table class="table datatable-responsive">
                                        <thead>
                                            <tr>
                                                <th class="text-bold text-uppercase">#</th>
                                                <th class="text-bold text-uppercase">REF</th>
                                                <th class="text-bold text-uppercase">Descrição</th>
                                                <th class="text-uppercase text-bold">Inscritos</th>
                                                <th class="text-uppercase text-bold">Estado</th>
                                                <th class="text-uppercase text-bold">Ensino</th>
                                                <th class="text-center text-bold text-uppercase text-danger-600">---</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                if (rturmas != null) {
                                                    for (RTurmas rt : rturmas) {

                                                        int id = rt.getTurma().getTurmId();
                                                        String desc = encryptUtils.decodeString(rt.getTurma().getTurmDescricao());
                                                        String ref = encryptUtils.decodeString(rt.getTurma().getTurmReferencia());
                                                        int dur = rt.getInscricoes();
                                                        String status = rt.getStatus();
                                                        String ens = "PRESENCIAL";

                                                        if (rt.getTurma().getXTipoEnsino() != null) {
                                                            ens = encryptUtils.decodeString(rt.getTurma().getXTipoEnsino());
                                                        }

                                                        String lbl = "label-success";
                                                        if (status.equals("Inactiva")) {
                                                            lbl = "label-danger";
                                                        }
                                                        String actR = encryptUtils.encodeString("accao#remover-turma&id=" + id);
                                                        String actE = encryptUtils.encodeString("accao#editar-turma&id=" + id);
                                                        String actV = encryptUtils.encodeString("accao#alunos-turma&id=" + id);
                                            %>
                                            <tr>
                                                <td><a href="#"><%=id%></a></td>
                                                <td><a href="#"><%=ref%></a></td>
                                                <td><%=desc%></td>
                                                <td class="text-center"><a><%=dur%></a></td>
                                                <td><span class="label <%=lbl%>"><%=status%></span></td>
                                                <td class="text-bold text-uppercase text-danger-700"><%=ens%></td>
                                                <td class="text-center">

                                                    <div class="btn text-bold text-uppercase-group">
                                                        <button type="button" class="btn text-bold text-uppercase bg-slate dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
                                                        <ul class="dropdown-menu dropdown-menu-right">
                                                            <li><a href="VHVybWFTZXJ2bGV0I0RDSQ==?<%=actV%>"><i class="icon-man-woman"></i> Alunos da turma</a></li>
                                                            <li class="divider"></li>
                                                            <li><a  href="VHVybWFTZXJ2bGV0I0RDSQ==?<%=actE%>"><i class="icon-database-edit2 text-primary-800"></i> Editar registo</a></li>
                                                            <li><a  href="#" data-toggle="modal" data-target="#modal_rem_<%=id%>"><i class="icon-cancel-circle2 text-danger-800"></i> Remover registo</a></li>
                                                        </ul>




                                                        <!-- Danger modal -->
                                                        <div id="modal_rem_<%=id%>" class="modal fade">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                        <h6 class="modal-title text-semibold">Confirma a remoção da turma com a referência #<%=id%> ?</h6>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <h6 class="text-bold text-danger" ><i class="icon-question6 text-danger" style="font-size: 100px"></i></h6>

                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn text-bold text-uppercase btn-link" data-dismiss="modal">Cancelar</button>

                                                                        <a href="VHVybWFTZXJ2bGV0I0RDSQ==?<%=actR%>" class="btn text-bold text-uppercase btn-danger">Sim, confirmo !</a>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- /default modal -->  
                                                    </div>


                                                </td>


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
                            <%
                                }
                            %>
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
