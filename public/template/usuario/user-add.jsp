<%-- 
    Document   : user-add
    Created on : Feb 11, 2017, 7:30:25 PM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.EdstProvince"%>
<%@page import="java.io.File"%>
<%@page import="com.dciapps.webclient.Pessoa"%>
<%@page import="com.dciapps.webclient.TipoUsuario"%>
<%@page import="com.dciapps.webclient.Entidade"%>
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
        <title>SEGIA - Usuários</title>


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

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy, HH:mm:ss");
            EncryptUtils encryptUtils = new EncryptUtils();

            ModulosUsuario mui = null;
            List<Entidade> entidades = null;

            List<TipoUsuario> tiposUsuario = null;
            List<Usuario> usuarios = null;

            String msgErro = "";
            String alerta = "";

            List<EdstProvince> provincias = null;

            String lblDistritos = "";
            String lblEscolas = "";

            int numReg = 0;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mui = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

                entidades = (List<Entidade>) session.getAttribute("entidades");
                tiposUsuario = (List<TipoUsuario>) session.getAttribute("tiposUsuario");
                usuarios = (List<Usuario>) session.getAttribute("usuarios");

                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();

                if (usuarios != null) {
                    if (!usuarios.isEmpty()) {
                        numReg = usuarios.size();
                    }
                }

                provincias = (List<EdstProvince>) session.getAttribute("provincias");

                if (session.getAttribute("lblDistritos") != null) {
                    lblDistritos = session.getAttribute("lblDistritos").toString();
                }

                if (session.getAttribute("lblEscolas") != null) {
                    lblEscolas = session.getAttribute("lblEscolas").toString();
                }

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

    <body oncontextmenu="return false"  class="navbar-top">



        <!-- Main navbar -->
        <div class="navbar navbar-inverse  navbar-fixed-top">
            <div class="navbar-header">
                <h6 class="text-semibold class text-uppercase" style="margin-left: 2em;">Sistema Electrónico de Gestão de Informação Académica </h6>

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
                </div>

                <div class="heading-elements">
                    <div class="heading-btn-group">
                        <form method="post" action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jZG9VcGRhdGU=">
                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase text-uppercase text-bold btn-labeled btn-labeled-left bg-danger-400 heading-btn">Voltar ao painel principal<b><i class="icon-chevron-left"></i></b></button>
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
                                            <button class="btn  bg-slate-800 btn-block btn-float btn-float-lg" type="submit"><i class="icon-meter-fast"></i> <span class="text-bold text-uppercase">Painel Principal</span></button>
                                        </form>
                                    </div>
                                </div>

                                <%
                                    if (mui.isMuiUsuariosAdd()) {
                                %>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <br>
                                        <form action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jdXN1YXJpb3M=" method="post">
                                            <button class="btn bg-orange-600  btn-block btn-float btn-float-lg" type="submit"><i class="icon-user-plus"></i> <span class="text-bold text-uppercase">Utilizadores</span></button>
                                        </form>
                                    </div>
                                </div>

                                <%
                                    }
                                %>

                                <%
                                    if (mui.isMuiUsuariosPermissoes()) {
                                %>

                                <div class="row">

                                    <div class="col-xs-12">
                                        <br>

                                        <form action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jcGVybWlzc29lcw==" method="post">
                                            <button class="btn  bg-slate-800 btn-block btn-float btn-float-lg" type="submit"><i class="icon-user-lock"></i> <span class="text-bold text-uppercase">Permissões</span></button>
                                        </form>
                                    </div>

                                </div>
                                <%
                                    }
                                %>


                                <div class="row">

                                    <%
                                        if (mui.isMuiUsuariosLogs()) {
                                    %>
                                    <div class="col-xs-12">
                                        <br>

                                        <form action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jbG9ncw==" method="post">
                                            <button class="btn  bg-slate-800 btn-block btn-float btn-float-lg" type="submit"><i class="icon-spinner10 spinner"></i> <span class="text-bold text-uppercase">Logs</span></button>
                                        </form>
                                    </div>

                                    <%
                                        }
                                    %>

                                    <%
                                        if (mui.isMuiUsuariosStatus()) {
                                    %>
                                    <div class="col-xs-12">
                                        <br>

                                        <form action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jY29uZXhvZXM=" method="post">
                                            <button class="btn  bg-slate-800 btn-block btn-float btn-float-lg" type="submit"><i class="icon-collaboration"></i> <span class="text-bold text-uppercase">Conectados</span></button>
                                        </form>
                                    </div>

                                    <%
                                        }
                                    %>
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
                            <ul class="nav navbar-nav element-active-slate-400">
                                <li class="active text-bold text-uppercase"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-users4 position-left"></i> Gestão de Utilizadores</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->








                    <div class = "row">

                        <div class = "col-md-10 col-md-offset-1">
                            <!-- Vertical form options -->





                            <div class="content-group tab-content-bordered navbar-component">
                                <div class="navbar navbar-inverse bg-slate-800" style="position: relative; z-index: 99;">
                                    <div class="navbar-header">
                                        <h6 class="text-semibold class text-uppercase" style="margin-left: 2em;">Sistema Electrónico de Gestão de Informação Académica</h6>

                                        <ul class="nav navbar-nav pull-right visible-xs-block">
                                            <li><a data-toggle="collapse" data-target="#demo1"><i class="icon-tree5"></i></a></li>
                                        </ul>
                                    </div>

                                    <div class="navbar-collapse collapse" id="demo1">
                                        <ul class="nav navbar-nav">
                                            <li class="active">
                                                <a href="#tab-demo1" data-toggle="tab" class="text-bold text-uppercase" class="text-bold text-uppercase">
                                                    <i class="icon-file-plus position-left"></i>
                                                    NOVO REGISTO
                                                </a>
                                            </li>

                                            <li>
                                                <a href="#tab-demo2" data-toggle="tab" class="text-bold text-uppercase" class="text-bold text-uppercase"><i class="icon-files-empty position-left"></i>
                                                    LISTA DE REGISTOS
                                                    <span class="badge bg-danger-800 badge-inline position-right"><%=numReg%></span>
                                                </a>
                                            </li>
                                        </ul>

                                    </div>
                                </div>

                                <div class="tab-content">
                                    <div class="tab-pane fade active in has-padding" id="tab-demo1">



                                        <!-- 2 columns form -->

                                        <%
                                            String act = encryptUtils.encodeString("accao#registar-usuario");
                                        %>
                                        <!-- Basic layout-->
                                        <form  class= "form-horizontal" method="post" accept-charset="ISO-8859-1" action="VXN1YXJpb1NlcnZsZXQjRENJ?<%=act%>">
                                            <div class="panel panel-flat">
                                                <div class="panel-heading">
                                                    <h6 class="panel-title text-bold text-uppercase">Informe os dados do utilizador</h6>
                                                    <div class="heading-elements">
                                                        <ul class="icons-list">
                                                            <li><a data-action="collapse"></a></li>
                                                            <li><a data-action="reload"></a></li>

                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="panel-body">
                                                    <div class="row">

                                                        <div class="col-md-12">
                                                            <fieldset>
                                                                <legend class="text-semibold"><i class="icon-user-plus position-left"></i> Dados do utilizador</legend>

                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase text-bold">Nome:</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <input type="text" placeholder="Nome" class="form-control" name="nome" required="" value="">
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                                <input type="text" placeholder="Apelido" class="form-control" name="apelido" required="" value="">
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase text-bold">Contacto:</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <input type="text" placeholder="+999-99-999-9999" class="form-control" name="contacto" required="" value="">
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                                <input type="email" placeholder="Introduza o e-mail" class="form-control" name="email" value="">
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>


                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase text-bold">Cargo:</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
                                                                            <div class="col-md-6">


                                                                                <select class="select" name="idTipoUsuario" required="">
                                                                                    <optgroup label="Selecione um tipo">


                                                                                        <%
                                                                                            if (tiposUsuario != null) {
                                                                                                for (TipoUsuario tu : tiposUsuario) {

                                                                                                    if (!tu.getTipuDescricao().equals("Super Administrador")
                                                                                                            && !tu.getTipuDescricao().equals("Cliente")
                                                                                                            && !tu.getTipuDescricao().equals("Operador")
                                                                                                            && !tu.getTipuDescricao().equals("Agente")) {
                                                                                        %>
                                                                                        <option value="<%=tu.getTipuId()%>"><%=tu.getTipuDescricao()%></option>

                                                                                        <%
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        %>

                                                                                        <%
                                                                                            if (cargo.equals("Tecnico Informatica") || cargo.equals("Tecnico Informatica (Distrital)")) {
                                                                                        %>
                                                                                        <option value="20">Director Pedagogico</option>
                                                                                        <%
                                                                                            }
                                                                                        %>
                                                                                    </optgroup>
                                                                                </select>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>




                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase">Localização:</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <select id="make" data-placeholder="Selecione a provincia" class="select" name="provincia" required="">
                                                                                    <option></option>
                                                                                    <%
                                                                                        for (EdstProvince s : provincias) {
                                                                                            String sel = "";
                                                                                            String desc = s.getName();
                                                                                    %>
                                                                                    <option value ="<%=desc%>" <%=sel%>><%=desc%></option>
                                                                                    <%
                                                                                        }
                                                                                    %>
                                                                                </select>

                                                                            </div>

                                                                            <div class="col-md-6">

                                                                                <select id="models"  data-placeholder="Selecione o distrito" class="select" name="distrito" required="">
                                                                                    <option></option>
                                                                                </select>     
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>





                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase text-bold">Escola:</label>

                                                                    <div class="col-lg-9">

                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <select data-placeholder="Selecione a escola" class="select" name="nome" required="" id="schools">
                                                                                    <option></option>
                                                                                </select>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </fieldset>                     

                                                            <div class="text-right">
                                                                <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn  bg-slate-800 text-bold text-uppercase">Gravar registo <i class="icon-arrow-right14 position-right"></i></button>


                                                                <br>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                    <!-- /2 columns form -->


                                    <div class="tab-pane fade has-padding" id="tab-demo2">



                                        <!-- Basic responsive configuration -->
                                        <div class="panel panel-flat">
                                            <div class="panel-heading">
                                                <h6 class="panel-title text-bold text-uppercase">Lista dos utilizadores</h6>
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li><a data-action="collapse"></a></li>
                                                        <li><a data-action="reload"></a></li>

                                                    </ul>
                                                </div>
                                            </div>


                                            <div class="panel-body">
                                                <p>
                                                    <a href="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jaW1wcmltaXItdXN1YXJpb3M=" target="_blank" class="btn bg-grey-300 btn-labeled btn-lg text-bold text-uppercase">
                                                        <b><i class="icon-printer2"></i></b>
                                                        Imprimir registos
                                                    </a>

                                                    <a href="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jZW52aWFyLWxpc3RhLXVzdWFyaW9z" class="btn bg-danger-300 btn-labeled btn-lg text-bold text-uppercase">
                                                        <b><i class="icon-envelop5"></i></b>
                                                        Enviar cópia por e-mail
                                                    </a>

                                                </p>

                                            </div>

                                            <table class="table datatable-responsive">
                                                <thead>
                                                    <tr>
                                                        <th class = "text-bold text-uppercase">#</th>
                                                        <th class = "text-bold text-uppercase">Denominação</th>
                                                        <th class = "text-bold text-uppercase">Utilizador</th>
                                                        <th class = "text-bold text-uppercase">Grupo</th>
                                                        <th class = "text-bold text-uppercase">Contacto</th>
                                                        <th class = "text-bold text-uppercase">Província</th>
                                                        <th class = "text-bold text-uppercase">Distrito</th>
                                                        <th class = "text-bold text-uppercase">Escola</th>
                                                        <th class = "text-bold text-uppercase">Estado</th>
                                                        <th class="text-bold text-uppercase text-danger-400">Opções</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        if (usuarios != null) {

                                                            for (Usuario u : usuarios) {

                                                                String nm = "--";
                                                                String us = "--";
                                                                String tp = "---";
                                                                String prov = "---";
                                                                String dist = "---";
                                                                String esc = "---";

                                                                if (u.getTipoUsuariotipu() != null) {
                                                                    tp = u.getTipoUsuariotipu().getTipuDescricao();
                                                                }

                                                                if (!tp.equals("Super Administrador") && !tp.equals("Cliente") && !tp.equals("Membro") && !tp.equals("Aluno") && !tp.equals("Estudante")) {
                                                                    String con = "---";
                                                                    nm = encryptUtils.decodeString(u.getPessoapess().getPessNome());

                                                                    if (u.getPessoapess().getPessApelido() != null) {
                                                                        nm += " " + encryptUtils.decodeString(u.getPessoapess().getPessApelido());
                                                                    }
                                                                    us = encryptUtils.decodeString(u.getUsuaUsuario());
                                                                    if (u.getPessoapess().getPessContacto() != null) {
                                                                        con = encryptUtils.decodeString(u.getPessoapess().getPessContacto());
                                                                    }

                                                                    String status = u.getUsuaEstado();
                                                                    String lblStatus = "label-success";

                                                                    int id = u.getUsuaId();

                                                                    String actA = encryptUtils.encodeString("accao#alterar-estado&to=Activo&id=" + us);
                                                                    String actI = encryptUtils.encodeString("accao#alterar-estado&to=Inactivo&id=" + us);
                                                                    String actR = encryptUtils.encodeString("accao#remover-usuario&id=" + id);
                                                                    String actS = encryptUtils.encodeString("accao#reset-senha&id=" + us);

                                                                    if (status.equals("Inactivo")) {
                                                                        lblStatus = "label-danger";
                                                                    }

                                                                    if (u.getUsuaProvincia() != null) {
                                                                        prov = u.getUsuaProvincia();
                                                                    }

                                                                    if (u.getUsuaDistrito() != null) {
                                                                        dist = u.getUsuaDistrito();
                                                                    }

                                                                    if (u.getEscola() != null) {
                                                                        esc = encryptUtils.decodeString(u.getEscola().getEscDescricao());
                                                                    }
                                                    %>
                                                    <tr>
                                                        <td><a href="#"><%=id%></a></td>
                                                        <td><%=nm%></td>
                                                        <td><a href="#"><%=us%></a></td>
                                                        <td class="text-bold"><%=tp%></td>
                                                        <td><%=con%></td>
                                                        <td><%=prov%></td>
                                                        <td><%=dist%></td>
                                                        <td><%=esc%></td>
                                                        <td><span class="label <%=lblStatus%>"><%=status%></span></td>
                                                        <td>



                                                            <div class="btn-group">
                                                                <button type="button" class="btn bg-grey-600 btn-icon dropdown-toggle" data-toggle="dropdown">
                                                                    <i class="icon-menu7"></i> &nbsp;<span class="caret"></span>
                                                                </button>

                                                                <ul class="dropdown-menu dropdown-menu-right" style="width: 12em;
                                                                    height: 3em;
                                                                    line-height: 2em;
                                                                    border: 1px solid #ccc;
                                                                    padding: 0;
                                                                    margin: 0;
                                                                    overflow: scroll;
                                                                    overflow-x: hidden;">


                                                                    <li><a href="VXN1YXJpb1NlcnZsZXQjRENJ?<%=actS%>"><i class="icon-reload-alt text-blue-800"></i> Redefinir senha</a></li>


                                                                    <%
                                                                        if (!status.equals("Inactivo")) {
                                                                    %>
                                                                    <li><a href="VXN1YXJpb1NlcnZsZXQjRENJ?<%=actI%>"><i class="icon-user-block text-danger"></i> Desactivar</a></li>
                                                                        <%
                                                                        } else {
                                                                        %>

                                                                    <li><a href="VXN1YXJpb1NlcnZsZXQjRENJ?<%=actA%>"><i class="icon-user-check text-success"></i> Activar</a></li>
                                                                        <%
                                                                            }
                                                                        %>


                                                                    <%
                                                                        if (cargo.equals("Super Administrador") || cargo.equals("Administrador") || cargo.equals("Tecnico Informatica") || cargo.equals("Tecnico Informatica (Distrital)")) {
                                                                    %>
                                                                    <li class="divider"></li>
                                                                    <li><a href="#" data-toggle="modal" data-target="#modal_rem_<%=id%>"><i class="icon-cancel-circle2 text-danger-800"></i>Remover registo</a></li>
                                                                        <%
                                                                            }
                                                                        %>

                                                                </ul>
                                                            </div>




                                                            <!-- Danger modal -->
                                                            <div id="modal_rem_<%=id%>" class="modal fade text-center">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                            <h6 class="modal-title text-semibold">Confirma a remoção do utilizador com a referência #<%=id%> ?</h6>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <h6 class="text-bold text-danger" ><i class="icon-question6 text-danger" style="font-size: 100px"></i></h6>

                                                                        </div>

                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-link" data-dismiss="modal">Cancelar</button>

                                                                            <a href="VXN1YXJpb1NlcnZsZXQjRENJ?<%=actR%>" class="btn btn-danger text-bold text-uppercase">Sim, confirmo !</a>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- /default modal -->       


                                                        </td>
                                                    </tr>
                                                    <%
                                                                }
                                                            }
                                                        }
                                                    %>

                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- /basic responsive configuration -->


                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /vertical form options -->
                    </div>


                </div>
                <!-- /main content -->

            </div>
            <!-- /page content -->





            <!-- Footer -->
            <div class="footer text-bold">
                <%
                    String ano = session.getAttribute("ano").toString();
                %>
                &copy; <%=ano%>. <a href="#" class="text-bold">MINEDH. SEGIA</a>. Todos os direitos reservados
            </div>
            <!-- /footer -->

        </div>
        <!-- /page container -->


        <script>
            $(function () {
                //setup arrays
                var cars = {<%=lblDistritos%>};
                var schools = {<%=lblEscolas%>};

                $('#make').change(function () {
                    $("#models").html(""); //clear existing options
                    $("#schools").html(""); //clear existing options
                    var newOptions = cars[this.value]; //finds the array w/the name of the selected value
                    //populate the new options
                    for (var i = 0; i < newOptions.length; i++) {

                        $("#models").append("<option value='" + newOptions[i] + "'>" + newOptions[i] + "</option>");

                    }
                });

                $('#models').change(function () {
                    $("#schools").html(""); //clear existing options
                    var newOptions2 = schools[this.value]; //finds the array w/the name of the selected value
                    //populate the new options
                    $("#schools").append("<option value=''>Selecionar Escola</option>");

                    for (var i = 0; i < newOptions2.length; i++) {

                        $("#schools").append("<option value='" + newOptions2[i] + "'>" + newOptions2[i] + "</option>");

                    }
                });
            });
        </script>

        <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>

    </body>
</html>
