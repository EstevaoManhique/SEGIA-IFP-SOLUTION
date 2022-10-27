<%-- 
    Document   : dc-inefp-partners
    Created on : Feb 11, 2017, 7:30:25 PM
    Author     : HJC2K8
--%>

<%@page import="java.util.Date"%>
<%@page import="com.dciapps.webclient.Area"%>
<%@page import="com.dciapps.webclient.Pessoa"%>
<%@page import="com.dciapps.webclient.Docente"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="com.dciapps.webclient.Parceiro"%>
<%@page import="com.dciapps.webclient.Curso"%>
<%@page import="com.dciapps.webclient.AreaFormacao"%>
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
        <title>SEGIA - Professores</title>

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
            EncryptUtils encryptUtils = new EncryptUtils();

            ModulosUsuario mu = null;
            List<Docente> docentes = null;
            Docente docente = null;
            List<AreaFormacao> areasFormacao = null;
            List<Area> areas = null;

            String msgErro = "";
            String alerta = "";
            int numRegistos = 0;
            Entidade entidade = (Entidade) session.getAttribute("entidadeSelecionada");

            if (entidade == null) {
                entidade = (Entidade) session.getAttribute("entidade");
            }

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

                docentes = (List<Docente>) session.getAttribute("docentes");
                areasFormacao = (List<AreaFormacao>) session.getAttribute("areasFormacao");
                areas = (List<Area>) session.getAttribute("areas");
                docente = (Docente) session.getAttribute("docente");

                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();

                if (docentes != null) {
                    numRegistos = docentes.size();
                }

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
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-reading position-left"></i> Gestão de Professores</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->




                    <div class = "row">

                        <div class = "col-md-12 col-md-offset-0">



                            <div class="content-group tab-content-bordered navbar-component">
                                <div class="navbar navbar-inverse bg-slate-800" style="position: relative; z-index: 99;">
                                    <div class="navbar-header">
                                        <h6 class="text-semibold class text-uppercase" style="margin-left: 2em;"> Sistema Electrónico de Gestão de Informação Académica </h6>

                                        <ul class="nav navbar-nav pull-right visible-xs-block">
                                            <li><a data-toggle="collapse" data-target="#demo1"><i class="icon-tree5"></i></a></li>
                                        </ul>
                                    </div>

                                    <%                                        String lst = "";
                                        String act = encryptUtils.encodeString("accao#registar-docente");
                                        String vlBtn = "Gravar Registo";
                                        String lblReg = "Novo Registo";
                                        String icnReg = "icon-file-plus";
                                        String nm = session.getAttribute("nome").toString();
                                        String apl = session.getAttribute("apelido").toString();
                                        String sex = session.getAttribute("sexo").toString();
                                        String mail = session.getAttribute("email").toString();
                                        String bi = session.getAttribute("bi").toString();
                                        String nuit = session.getAttribute("nuit").toString();
                                        String sM = "checked";
                                        String sF = "";
                                        String casa = session.getAttribute("casa").toString();
                                        String cnt = session.getAttribute("contacto").toString();
                                        String end = session.getAttribute("endereco").toString();
                                        String quar = session.getAttribute("quarteirao").toString();
                                        String prov = session.getAttribute("provincia").toString();
                                        String distr = session.getAttribute("distrito").toString();

                                        String niv = session.getAttribute("nivel").toString();
                                        String aer = session.getAttribute("area").toString();
                                        String esp = session.getAttribute("especialidade").toString();
                                        String cat = session.getAttribute("categoria").toString();
                                        String tc = session.getAttribute("tipoContrato").toString();
                                        String dv = sdf.format(new Date());

                                        String nomeC = "";

                                        if (docente != null) {
                                            lst = "hide";
                                            act = encryptUtils.encodeString("accao#actualizar-docente&fi=" + docente.getDoceId());
                                            vlBtn = "Actualizar Registo";
                                            lblReg = "Actualizar Registo";
                                            icnReg = "icon-pencil4";

                                            niv = encryptUtils.decodeString(docente.getDoceGrauFormacao());
                                            aer = encryptUtils.decodeString(docente.getAreaFormacao().getArefDescricao());
                                            esp = encryptUtils.decodeString(docente.getDoceEspecialidade());
                                            cat = encryptUtils.decodeString(docente.getDoceCategoria());

                                            if (docente.getDoceTipoContrato() != null) {
                                                tc = encryptUtils.decodeString(docente.getDoceTipoContrato());
                                            }

                                            if (docente.getDoceValidadeContrato() != null) {
                                                dv = sdf.format(docente.getDoceValidadeContrato().toGregorianCalendar().getTime());
                                            }

                                            Pessoa pessoa = docente.getPessoa();

                                            nm = encryptUtils.decodeString(pessoa.getPessNome());
                                            apl = encryptUtils.decodeString(pessoa.getPessApelido());
                                            bi = encryptUtils.decodeString(pessoa.getPessBi());
                                            sex = encryptUtils.decodeString(pessoa.getPessSexo());
                                            mail = encryptUtils.decodeString(pessoa.getPessEmail());
                                            cnt = encryptUtils.decodeString(pessoa.getPessContacto());
                                            nuit = encryptUtils.decodeString(pessoa.getPessNuit());

                                            if (pessoa.getPessDistrito() != null) {
                                                distr = encryptUtils.decodeString(pessoa.getPessDistrito());
                                            }
                                            prov = encryptUtils.decodeString(pessoa.getPessProvincia());
                                            quar = encryptUtils.decodeString(pessoa.getPessRua());
                                            casa = encryptUtils.decodeString(pessoa.getPessNumeroCasa());
                                            end = encryptUtils.decodeString(pessoa.getPessBairro());

                                            if (sex.equals("Feminino")) {
                                                sM = "";
                                                sF = "checked";
                                            }

                                            if (mail.equals("N/D")) {
                                                mail = "";
                                            }

                                            nomeC += nm;
                                            if (!apl.isEmpty()) {
                                                nomeC += " " + apl;
                                            }
                                        }
                                    %>

                                    <div class="navbar-collapse collapse" id="demo1">
                                        <ul class="nav navbar-nav">
                                            <li class="active">
                                                <a href="#tab-demo1" data-toggle="tab" class="text-bold text-uppercase" class="text-bold text-uppercase">
                                                    <i class="<%=icnReg%> position-left"></i>
                                                    <%=lblReg%>
                                                </a>
                                            </li>

                                            <li class="<%=lst%>">
                                                <a href="#tab-demo2" data-toggle="tab" class="text-bold text-uppercase" class="text-bold text-uppercase"><i class="icon-files-empty position-left"></i>
                                                    Lista de Registos
                                                    <span class="badge bg-danger-800 badge-inline position-right"><%=numRegistos%></span>
                                                </a>
                                            </li>
                                        </ul>

                                    </div>
                                </div>


                                <div class="tab-content">
                                    <div class="tab-pane fade active in has-padding" id="tab-demo1">



                                        <!-- 2 columns form -->
                                        <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="RG9jZW50ZVNlcnZsZXQjRENJ?<%=act%>">
                                            <div class="panel panel-flat">
                                                <div class="panel-heading">
                                                    <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Informe os dados do professor</h6>
                                                    <div class="heading-elements">
                                                        <ul class="icons-list">
                                                            <li><a data-action="collapse"></a></li>
                                                            <li><a data-action="reload"></a></li>

                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="panel-body">
                                                    <div class="row">



                                                        <div class="col-md-6">
                                                            <fieldset>
                                                                <legend class="text-semibold"><i class="icon-reading position-left"></i> Dados do professor</legend>

                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label">Nome:</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <div class="form-group has-feedback has-feedback-right">
                                                                                    <input type="text" placeholder="Nome Completo" class="form-control" name="nomeCompleto" value="<%=nomeC%>" required="">
                                                                                    <div class="form-control-feedback">
                                                                                        <i class="icon-regexp2 text-danger"></i>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label">Identificação:</label>
                                                                    <div class="col-lg-9">

                                                                        <div class="row">
                                                                            <div class="col-md-7">

                                                                                <div class="form-group has-feedback has-feedback-right">
                                                                                    <input type="text" placeholder="BI/DIRE/Passaporte N.º" class="form-control" name="bi" value="<%=bi%>" required=""  maxlength="13">
                                                                                    <div class="form-control-feedback">
                                                                                        <i class="icon-regexp2 text-danger"></i>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-5">


                                                                                <div class="form-group has-feedback has-feedback-right">
                                                                                    <input type="number"  oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" maxlength="9" placeholder="NUIT" class="form-control" name="nuit" value="<%=nuit%>" required="">
                                                                                    <div class="form-control-feedback">
                                                                                        <i class="icon-regexp2 text-danger"></i>
                                                                                    </div>
                                                                                </div>


                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>

                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label">Sexo:  <i class="icon-regexp2 text-danger"></i></label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">

                                                                            <label class="radio-inline">
                                                                                <input type="radio" name="sexo" class="styled" <%=sM%> value="Masculino">
                                                                                Masculino
                                                                            </label>

                                                                            <label class="radio-inline">
                                                                                <input type="radio" name="sexo" class="styled" <%=sF%> value="Feminino">
                                                                                Feminino
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label">Contacto:</label>
                                                                    <div class="col-lg-9">

                                                                        <div class="row">
                                                                            <div class="col-md-7">
                                                                                <input type="email" placeholder="E-mail" class="form-control"name="email" value="<%=mail%>">
                                                                            </div>

                                                                            <div class="col-md-5">
                                                                                <div class="form-group has-feedback has-feedback-right">
                                                                                    <input type="text" placeholder="Telefone/telemóvel:" class="form-control" name="contacto" value="<%=cnt%>" required="">
                                                                                    <div class="form-control-feedback">
                                                                                        <i class="icon-regexp2 text-danger"></i>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>

                                                            </fieldset>



                                                            <fieldset>
                                                                <legend class="text-semibold"><i class="icon-home5 position-left"></i> ENDEREÇO</legend>


                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label">Localização:</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <select id="make" data-placeholder="Selecione a provincia" class="select" name="provincia" required="">
                                                                                    <option></option>
                                                                                    <%
                                                                                        String provincias[] = {"Cidade de Maputo", "Maputo", "Gaza", "Inhambane", "Manica",
                                                                                            "Nampula", "Sofala", "Tete", "Niassa", "Zambézia", "Cabo Delgado"};

                                                                                        for (String s : provincias) {
                                                                                            String sel = "";

                                                                                            if (prov.equals(s)) {
                                                                                                sel = "selected";
                                                                                            }
                                                                                    %>
                                                                                    <option value ="<%=s%>" <%=sel%>><%=s%></option>
                                                                                    <%
                                                                                        }
                                                                                    %>
                                                                                </select>

                                                                            </div>

                                                                            <div class="col-md-6">
                                                                                <select id="models"  data-placeholder="Selecione o distrito" class="select" name="distrito" required="">
                                                                                    <option></option>

                                                                                    <%
                                                                                        String distritos[] = {"KaMpfumo", "Nlhamankulu", "KaMaxaquene", "KaMavota", "KaMubukwana", "KaTembe", "KaNyaka"};

                                                                                        for (String s : distritos) {
                                                                                            String sel = "";

                                                                                            if (distr.equals(s)) {
                                                                                                sel = "selected";
                                                                                            }
                                                                                    %>
                                                                                    <option value ="<%=s%>" <%=sel%>><%=prov%></option>
                                                                                    <%
                                                                                        }
                                                                                    %>
                                                                                </select>       
                                                                            </div>
                                                                        </div>
                                                                        <br>
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <div class="form-group has-feedback has-feedback-right">
                                                                                    <input type="text" placeholder="Bairro" class="form-control" name="endereco" value="<%=end%>" required="">
                                                                                    <div class="form-control-feedback">
                                                                                        <i class="icon-regexp2 text-danger"></i>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <br>
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <input type="text" placeholder="Quarteirão/Talhão" class="form-control mb-15"  name="quarteirao" value="<%=quar%>">
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                                <input type="text" placeholder="Nº da Casa" class="form-control"  name="casa" value="<%=casa%>">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </fieldset>

                                                        </div>



                                                        <div class="col-md-6">

                                                            <fieldset>
                                                                <legend class="text-semibold"><i class="icon-briefcase position-left"></i> Habilitações Literarias</legend>


                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label">Nível:</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
                                                                            <div class="col-md-8">
                                                                                <div class="mb-15">
                                                                                    <select data-placeholder="Selecione o nível de formação" class="select" required="" name="nivel">
                                                                                        <option></option>
                                                                                        <%
                                                                                            String niveis[] = {"Ensino básico", "Ensino médio", "Ensino técnico", "Ensino técnico superior", "Ensino superior"};

                                                                                            for (String s : niveis) {

                                                                                                String sel = "";

                                                                                                if (s.equals(niv)) {
                                                                                                    sel = "selected";
                                                                                                }
                                                                                        %>
                                                                                        <option value="<%=s%>" <%=sel%>><%=s%></option> 
                                                                                        <%
                                                                                            }
                                                                                        %>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label">Área Formação:</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
                                                                            <div class="col-md-8">
                                                                                <div class="mb-15">
                                                                                    <select data-placeholder="Selecione a área de formação" class="select" name="area" required="">
                                                                                        <option></option>
                                                                                        <%
                                                                                            if (areasFormacao != null) {

                                                                                                for (AreaFormacao af : areasFormacao) {
                                                                                                    String desc = encryptUtils.decodeString(af.getArefDescricao());
                                                                                                    String sel = "";

                                                                                                    if (desc.equals(aer)) {
                                                                                                        sel = "selected";
                                                                                                    }
                                                                                        %>
                                                                                        <option value="<%=desc%>" <%=sel%>><%=desc%></option> 
                                                                                        <%
                                                                                                }
                                                                                            }
                                                                                        %>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>




                                                            </fieldset>


                                                            <fieldset>
                                                                <legend class="text-semibold"><i class="icon-plus-circle2 position-left"></i> Informação Adicional</legend>



                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label">Carreira:</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
                                                                            <div class="col-md-8">
                                                                                <div class="mb-15">
                                                                                    <select data-placeholder="Selecione a carreira" class="select" required="" name="especialidade">
                                                                                        <option></option>
                                                                                        <%
                                                                                            String carreiras[] = {"Técnico", "Técnico Profissional", "Técn.Sup.Adm.Trab.N1", "Técn.Sup.Adm.Trab.N2"};

                                                                                            for (String s : carreiras) {

                                                                                                String sel = "";

                                                                                                if (s.equals(esp)) {
                                                                                                    sel = "selected";
                                                                                                }
                                                                                        %>
                                                                                        <option value="<%=s%>" <%=sel%>><%=s%></option> 
                                                                                        <%
                                                                                            }
                                                                                        %>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>



                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label">Categoria:</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
                                                                            <div class="col-md-8">
                                                                                <div class="mb-15">
                                                                                    <select data-placeholder="Selecione a categoria" class="select" required="" name="categoria">
                                                                                        <option></option>
                                                                                        <%
                                                                                            if (areas != null) {

                                                                                                for (Area a : areas) {

                                                                                                    String s = encryptUtils.decodeString(a.getAreaDescricao());
                                                                                                    String sel = "";

                                                                                                    if (s.equals(tc)) {
                                                                                                        sel = "selected";
                                                                                                    }
                                                                                        %>
                                                                                        <option value="<%=s%>" <%=sel%>><%=s%></option> 
                                                                                        <%
                                                                                                }
                                                                                            }
                                                                                        %>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label">T. Contrato:</label>
                                                                    <div class="col-lg-9">

                                                                        <div class="row">

                                                                            <div class="col-md-12">
                                                                                <div class="form-group has-feedback has-feedback-right">
                                                                                    <input type="text" placeholder="Tipo de Contrato:" class="form-control" name="contacto" value="<%=cnt%>" required="">
                                                                                    <div class="form-control-feedback">
                                                                                        <i class="icon-regexp2 text-danger"></i>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                    </div>
                                                                </div>


                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label">Validade:</label>
                                                                    <div class="col-lg-9">

                                                                        <div class="row">
                                                                            <div class="col-md-5">
                                                                                <input type="text" placeholder="Data de validade" class="form-control daterange-single" name="dataValidade" value="<%=dv%>">
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>

                                                            </fieldset>

                                                        </div>

                                                    </div>

                                                    <div class="text-left">
                                                        <i class="icon-regexp2 text-danger"></i> -  <span class="text-semibold text-muted">Campos de preenchimento obrigatório</span>
                                                    </div>

                                                    <div class="text-right">
                                                        <%
                                                            if (docente != null) {
                                                                String actC = encryptUtils.encodeString("accao#cancelar-edicao");
                                                        %>
                                                        <a href="RG9jZW50ZVNlcnZsZXQjRENJ?<%=actC%>" class="btn text-bold text-uppercase bg-danger-400 btn-labeled-left ml-10"><i class="icon-cross2"></i> Cancelar edição</a>
                                                        <%
                                                            }
                                                        %>
                                                        <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800"><%=vlBtn%> <i class="icon-arrow-right14 position-right"></i></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                        <!-- /2 columns form -->


                                    </div>

                                    <div class="tab-pane fade has-padding" id="tab-demo2">







                                        <!-- Basic responsive configuration -->
                                        <div class="panel panel-flat">
                                            <div class="panel-heading">
                                                <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Lista dos formadores</h6>
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li><a data-action="collapse"></a></li>
                                                        <li><a data-action="reload"></a></li>

                                                    </ul>
                                                </div>
                                            </div>



                                            <div class="panel-body">
                                                <p>
                                                    <a href="RG9jZW50ZVNlcnZsZXQjRENJ?YWNjYW8jaW1wcmltaXItZG9jZW50ZXM=" target="_blank" class="btn bg-slate-400 btn-labeled text-bold text-uppercase">
                                                        <b><i class="icon-printer2"></i></b>
                                                        Imprimir a listagem
                                                    </a>
                                                </p>
                                            </div>


                                            <table class="table datatable-responsive">
                                                <thead>
                                                    <tr>
                                                        <th class="text-bold text-uppercase">Nome</th>
                                                        <th class="text-bold text-uppercase">Contacto</th>
                                                        <th class="text-bold text-uppercase">Especialidade</th>
                                                        <th class="text-bold text-uppercase">Área de Formação</th>
                                                        <th class="text-bold text-uppercase">Validade Contrato</th>
                                                        <th class="text-center text-bold text-uppercase text-danger-600">---</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        if (docentes != null) {
                                                            for (Docente d : docentes) {

                                                                int id = d.getDoceId();

                                                                String s1 = encryptUtils.decodeString(d.getPessoa().getPessNome()) + " " + encryptUtils.decodeString(d.getPessoa().getPessApelido());
                                                                String s2 = encryptUtils.decodeString(d.getPessoa().getPessContacto());
                                                                String s3 = encryptUtils.decodeString(d.getDoceEspecialidade());
                                                                String s4 = encryptUtils.decodeString(d.getDoceGrauFormacao());
                                                                String s5 = "---";

                                                                if (d.getDoceValidadeContrato() != null) {
                                                                    s5 = sdf.format(d.getDoceValidadeContrato().toGregorianCalendar().getTime());
                                                                }

                                                                String actE = encryptUtils.encodeString("accao#editar-docente&ei=" + id);
                                                                String actR = encryptUtils.encodeString("accao#remover-docente&ei=" + id);
                                                                String actC = encryptUtils.encodeString("accao#carga-horaria&ei=" + id);

                                                    %>
                                                    <tr>
                                                        <td class="text-bold"><%=s1%></td>
                                                        <td><%=s2%></td>
                                                        <td><a href="#"><%=s3%></a></td>
                                                        <td><%=s4%></td>
                                                        <td class="text-bold text-italic text-info-700"><%=s5%></td>
                                                        <td class="text-center">

                                                            <div class="btn text-bold text-uppercase-group">
                                                                <button type="button" class="btn text-bold text-uppercase bg-slate dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
                                                                <ul class="dropdown-menu dropdown-menu-right">
                                                                    <li><a  href="RG9jZW50ZVNlcnZsZXQjRENJ?<%=actC%>"><i class="icon-calendar2 text-grey-800"></i> Carga Horaria</a></li>
                                                                    <li class="divider"></li>
                                                                    <li><a  href="RG9jZW50ZVNlcnZsZXQjRENJ?<%=actE%>"><i class="icon-database-edit2 text-primary-800"></i> Editar registo</a></li>
                                                                    <li><a  href="#" data-toggle="modal" data-target="#modal_rem_<%=id%>"><i class="icon-cancel-circle2 text-danger-800"></i> Remover registo</a></li>
                                                                </ul>




                                                                <!-- Danger modal -->
                                                                <div id="modal_rem_<%=id%>" class="modal fade">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                                <h6 class="modal-title text-semibold">Confirma a remoção do formador com a referência #<%=id%> ?</h6>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h6 class="text-bold text-danger" ><i class="icon-question6 text-danger" style="font-size: 100px"></i></h6>

                                                                            </div>

                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn text-bold text-uppercase btn-link" data-dismiss="modal">Cancelar</button>

                                                                                <a href="RG9jZW50ZVNlcnZsZXQjRENJ?<%=actR%>" class="btn text-bold text-uppercase btn-danger">Sim, confirmo !</a>

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
                                </div>
                            </div>

                        </div>
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

        <script>
            $(function () {

                var dist = '<%=distr%>';
                //setup arrays
                var cars = {
                    "Cidade de Maputo": ['KaMpfumo', 'Nlhamankulu', 'KaMaxaquene', 'KaMavota', 'KaMubukwana', 'KaTembe', 'KaNyaka'],
                    "Maputo": ['Boane', 'Cidade da Matola', 'Magude', 'Marracuene', 'Matutuíne', 'Moamba', 'Namaacha'],
                    "Gaza": ['Bilene - Macia', 'Chibuto', 'Chicualacuala', 'Chigubo', 'Chòkwé', 'Cidade de Xai-Xai', 'Guijá', 'Mabalane', 'Manjacaze - Dingane', 'Xai-Xai Distrito'],
                    "Inhambane": ['Cidade de Maxixe', 'Cidade de Inhambane', 'Funhalouro', 'Govuro', 'Homoíne', 'Inharrime', 'Inhassoro', 'Jangamo', 'Mabote', 'Massinga', 'Morrumbene', 'Panda', 'Vilankulo', 'Zavala'],
                    "Manica": ['Barué', 'Cidade de Chimoio', 'Gondola', 'Guro', 'Muchaze', 'Macossa', 'Manica', 'Mossurize', 'Sussundega', 'Tambara'],
                    "Nampula": ['Angoche', 'Cidade de Nampula', 'Ilha de Moçambique', 'Lalaua', 'Malema', 'Meconta', 'Mecubúri', 'Memba', 'Mongicual', 'Mogovolas', 'Moma', 'Mossuril', 'Muecate', 'Murrupula', 'Nacala - Porto', 'Nacala - Velha', 'Nacarôa', 'Namapa - Eráti', 'Nampula - Distrito', 'Ribaué'],
                    "Niassa": ['Chimbonila', 'Cuamba', 'Lago', 'Lichinga', 'Majune', 'Mandimba', 'Marrupa', 'Maúa', 'Mavago', 'Mecanhelas', 'Mecula', 'Metarica', 'Muembe', 'Ngauma', 'Nipepe', 'Sanga'],
                    "Sofala": ['Búzi', 'Caia', 'Magude', 'Chemba', 'Cheringoma', 'Chibabava', 'Cidade da Beira', 'Dondo', 'Gorongosa', 'Machanga', 'Marromeu', 'Maríngue', 'Muanza', 'Nhamatanda'],
                    "Tete": ['Angónia', 'Cahora Bassa', 'Changara', 'Chifunde', 'Chiúta', 'Cidade de Tete', 'Macanga', 'Marávia', 'Moatize', 'Mutarara', 'Mágoé', 'Tsangano', 'Zumbo'],
                    "Zambézia": ['Alto Molócué', 'Chinde', 'Cidade de Quelimane', 'Gilé', 'Gurué', 'Ile', 'Inhassunge', 'Lugela', 'Maganja da Costa', 'Milange', 'Mocuba', 'Mopeia', 'Morrumbala', 'Namacurra', 'Namarrói', 'Nicoadala', 'Pebane'],
                    "Cabo Delgado": ['Ancuabe', 'Balama', 'Chiúre', 'Cidade de Pemba', 'Ibo', 'Macomia', 'Mecúfi', 'Mocímboa da Praia', 'Montepuez', 'Mueda', 'Muidumbe', 'Namuno', 'Nangade', 'Pemba - Metuge', 'Quissanga']
                };

                $('#make').change(function () {
                    $("#models").html(""); //clear existing options
                    var newOptions = cars[this.value]; //finds the array w/the name of the selected value
                    //populate the new options
                    for (var i = 0; i < newOptions.length; i++) {

                        if (newOptions[i] === dist)
                        {
                            $("#models").append("<option value='" + newOptions[i] + "' selected>" + newOptions[i] + "</option>");
                        } else
                        {
                            $("#models").append("<option value='" + newOptions[i] + "'>" + newOptions[i] + "</option>");
                        }
                    }
                    $('#models').prop('disabled', false); //enable the dropdown
                });
            });
        </script>

        <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>
    </body>
</html>
