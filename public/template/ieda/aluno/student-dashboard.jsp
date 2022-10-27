<%-- 
    Document   : dc-error-400
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
        <title>SEGIA - Portal do Aluno</title>

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

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = "Estudante";

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

                <%@ include file="../menu.jsp" %> 

                <!-- Main content -->
                <div class="content-wrapper">


                    <% if (usuario != null) {

                            String primeiroNome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome());
                            String apelido = encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                            String email = encryptUtils.decodeString(usuario.getPessoapess().getPessEmail());
                            String contacto = encryptUtils.decodeString(usuario.getPessoapess().getPessContacto());
                            String endereco = encryptUtils.decodeString(usuario.getPessoapess().getPessBairro());
                            String dataNascimento = "";
                            String dis = "";

                            if (usuario.getTipoUsuariotipu().getTipuDescricao().equals("Aluno")) {
                                dis = "readonly";
                            }

                            if (usuario.getPessoapess().getPessDataNascimento() != null) {
                                dataNascimento = sdf.format(usuario.getPessoapess().getPessDataNascimento().toGregorianCalendar().getTime());
                            }
                            String nacionalidade = "";

                            if (usuario.getPessoapess().getNacionalidadenaci() != null) {
                                nacionalidade = encryptUtils.decodeString(usuario.getPessoapess().getNacionalidadenaci().getNaciDescricao());
                            }
                            String naturalidade = encryptUtils.decodeString(usuario.getPessoapess().getPessProvincia());
                            String sexo = encryptUtils.decodeString(usuario.getPessoapess().getPessSexo());
                            String cidade = encryptUtils.decodeString(usuario.getPessoapess().getPessBairro());
                            String cPostal = encryptUtils.decodeString(usuario.getPessoapess().getPessRua()) + " / " + encryptUtils.decodeString(usuario.getPessoapess().getPessNumeroCasa());

                            String tipoUsuario = usuario.getTipoUsuariotipu().getTipuDescricao();
                            String dataCriacao = sdf.format(usuario.getPessoapess().getPessDataCadastro().toGregorianCalendar().getTime());
                            String ultimoLogin = "Não definido";

                            String bi = encryptUtils.decodeString(usuario.getPessoapess().getPessBi());
                            String nuit = encryptUtils.decodeString(usuario.getPessoapess().getPessNuit());

                            if (usuario.getUsuDataUltimaVisita() != null) {
                                ultimoLogin = sdf.format(usuario.getUsuDataUltimaVisita().toGregorianCalendar().getTime());
                            }

                            String lblEstado = "bg-success";

                            String estado = usuario.getUsuaEstado();

                            if (estado.equals("Inactivo")) {
                                lblEstado = "bg-danger";
                            }

                            int nrAcessos = usuario.getUsuaTentativasLogin();


                    %>        




                    <!-- Toolbar -->
                    <div class="navbar navbar-default navbar-component navbar-xs">
                        <ul class="nav navbar-nav visible-xs-block">
                            <li class="full-width text-center"><a data-toggle="collapse" data-target="#navbar-filter"><i class="icon-menu7"></i></a></li>
                        </ul>

                        <div class="navbar-collapse collapse" id="navbar-filter">
                            <ul class="nav navbar-nav element-active-slate-400">
                                <li class="active"><a href="#settings" data-toggle="tab"  class="text-bold text-uppercase"><i class="icon-profile position-left"></i> Ficha do Aluno</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->

                    <div class = "row">

                        <div class = "col-md-12 col-md-offset-0">

                            <!-- User profile -->
                            <div class="row">


                                <div class="col-lg-3">

                                    <!-- User thumbnail -->
                                    <div class="thumbnail">
                                        <div class="thumb thumb-rounded thumb-slide">
                                            <img src="http://<%=ip%>:8081/suc/images/profile-pictures/<%=fotoPerfil%>" alt="<%=nome%>">
                                            <div class="caption">
                                                <span>
                                                    <a href="#" class="btn text-bold text-uppercase bg-success-400 btn-icon btn-xs" data-popup="lightbox"><i class="icon-plus2"></i></a>
                                                    <a href="#" class="btn text-bold text-uppercase bg-success-400 btn-icon btn-xs"><i class="icon-link"></i></a>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="caption text-center">
                                            <h6 class="text-semibold no-margin"><%=nome%><small class="display-block"><%=cargo%></small></h6>
                                            <ul class="icons-list mt-15">
                                                <li><a href="#" data-popup="tooltip" title="Google Drive"><i class="icon-google-drive"></i></a></li>
                                                <li><a href="#" data-popup="tooltip" title="Twitter"><i class="icon-twitter"></i></a></li>
                                                <li><a href="#" data-popup="tooltip" title="Github"><i class="icon-github"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- /user thumbnail -->

                                    <!-- Navigation -->
                                    <div class="panel panel-flat">
                                        <div class="panel-heading">
                                            <h6 class="panel-title text-uppercase text-bold text-blue-800 text-bold">Resumo do usuário</h6>
                                        </div>

                                        <div class="list-group list-group-borderless no-padding-top">

                                            <a href="#" class="list-group-item"><i class="icon-users4"></i> <b>Grupo</b> <span class="badge bg-gray pull-right"><%=tipoUsuario%></span></a>
                                            <a href="#" class="list-group-item"><i class="icon-info22"></i> <b>Estado</b> <span class="badge <%=lblEstado%> pull-right"><%=estado%></span></a>
                                            <a href="#" class="list-group-item"><i class="icon-calendar2"></i> <b>Data de Criação</b>  <span class="badge bg-success pull-right"><%=dataCriacao%></span></a>
                                            <a href="#" class="list-group-item"><i class="icon-calendar52"></i>  <b>Data do Últ. Login</b>  <span class="badge bg-danger pull-right"><%=ultimoLogin%></span></a>
                                            <a href="#" class="list-group-item"><i class="icon-info22"></i>  <b>Nº Logins</b>  <span class="badge bg-teal gray pull-right"><%=nrAcessos%></span></a>

                                        </div>
                                    </div>
                                    <!-- /navigation -->


                                </div>


                                <div class="col-lg-9">
                                    <div class="tabbable">
                                        <div class="tab-content">


                                            <div class="tab-pane fade active in" id="settings">

                                                <!-- Profile info -->
                                                <div class="panel panel-flat">
                                                    <div class="panel-heading">
                                                        <h6 class="panel-title text-uppercase text-bold text-bold">Informações pessoais</h6>
                                                        <div class="heading-elements">
                                                            <ul class="icons-list">
                                                                <li><a data-action="collapse"></a></li>
                                                                <li><a data-action="reload"></a></li>

                                                            </ul>
                                                        </div>
                                                    </div>


                                                    <div class="panel-body">
                                                        <br>
                                                        <form >
                                                            <div class="form-group">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <label>Nome</label>
                                                                        <input type="text" class="form-control" value="<%=primeiroNome%>" class="form-control" disabled>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <label>Apelido</label>
                                                                        <input type="text" value="<%=apelido%>" class="form-control" disabled>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <label>Data de nascimento</label>
                                                                        <input type="text" class="form-control daterange-single" value="<%=dataNascimento%>" disabled>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <label>Sexo</label>
                                                                        <div class="row col-md-offset-0">

                                                                            <label class="radio-inline">
                                                                                <input type="radio" name="radio-inline-left" class="styled" checked="checked">
                                                                                <%=sexo%>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <label>Nº Identificação</label>
                                                                        <input type="text" value="<%=bi%>" class="form-control"  disabled>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <label>Nuit</label>
                                                                        <input type="text" value="<%=nuit%>" class="form-control" disabled>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <div class="row">
                                                                    <div class="col-md-4">
                                                                        <label>Bairro</label>
                                                                        <input type="text" value="<%=cidade%>" class="form-control" disabled>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <label>Estado/Provincia</label>
                                                                        <input type="text" value="<%=naturalidade%>" class="form-control" disabled>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <label>Casa & Quarteirão</label>
                                                                        <input type="text" value="<%=cPostal%>" class="form-control" disabled>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <label>Email</label>
                                                                        <input type="text" readonly="readonly" value="<%=email%>" class="form-control" disabled>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <label>Nacionalidade</label><input type="text" value="<%=nacionalidade%>" class="form-control"  disabled>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <label>Contacto #</label>
                                                                        <input type="text" value="<%=contacto%>" class="form-control"  disabled>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <label>Endereço</label>
                                                                        <input type="text" value="<%=endereco%>" class="form-control" disabled>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <!-- /profile info -->


                                            </div>

                                        </div>
                                    </div>
                                </div>


                            </div>
                            <!-- /user profile -->



                        </div>
                        <!-- /vertical form options -->
                    </div>					


                    <%
                        }
                    %>

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
