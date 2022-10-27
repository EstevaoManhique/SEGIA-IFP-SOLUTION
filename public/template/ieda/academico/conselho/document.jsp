<%-- 
    Document   : document-type
    Created on : Feb 11, 2017, 7:30:25 PM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.Doc"%>
<%@page import="com.dciapps.localcontroler.StringUtils"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="com.dciapps.webclient.Documento"%>
<%@page import="com.dciapps.webclient.Cliente"%>
<%@page import="com.dciapps.webclient.ModulosUsuario"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.webclient.Log"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dciapps.controller.GenericHandler"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SEGIA - Documento</title>

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
        <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/selects/select2.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
        <!-- /theme JS files -->

        <%

            int timeout = session.getMaxInactiveInterval();

            GenericHandler gh = new GenericHandler(request, response);
            Usuario usuario = gh.loggedUser();

            String nome = "";
            String fotoPerfil = "";
            String cargo = "";

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, HH:mm:ss");
            EncryptUtils encryptUtils = new EncryptUtils();
            StringUtils stringUtils = new StringUtils();

            Doc doc = null;

            ModulosUsuario mu = null;

            String msgErro = "";
            String alerta = "";
            String mes = "";
            String anoX = "";

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");
                doc = (Doc) session.getAttribute("doc");

                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();

                if (session.getAttribute("mes") != null) {
                    mes = session.getAttribute("mes").toString();
                }

                if (session.getAttribute("ano") != null) {
                    anoX = session.getAttribute("ano").toString();
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



        <script type="text/javascript" src="assets/js/core/app.js"></script>
        <script type="text/javascript" src="assets/js/pages/form_layouts.js"></script>
        <script type="text/javascript" src="assets/js/pages/editor_ckeditor.js"></script>

    </head>

    <body   class="navbar-top">



        <!-- Main navbar -->
        <div class="navbar navbar-inverse  navbar-fixed-top">
            <div class="navbar-header">
                <h6 class="text-semibold class text-uppercase" style="margin-left: 2em;">Sistema Electrónico de Gestão de Informação Académica</h6>

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
                            <!--  -->
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
                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-uppercase text-bold btn-labeled btn-labeled-left bg-danger-400 heading-btn">Voltar ao painel principal<b><i class="icon-chevron-left"></i></b></button>
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
                                <li class="active text-bold text-uppercase"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-file-plus2 position-left"></i> Novo Documento</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->




                    <div class = "row">

                        <div class = "col-md-9 col-md-offset-1">

                            <!-- CKEditor default -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-uppercase text-bold">Registar Documento</h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="panel-body">

                                    <%                                        String act = encryptUtils.encodeString("accao#registar-documento");
                                        String lbl = "Registar Notificação";
                                        String texto = "";
                                        String tipo = "";
                                        String assunto = "";
                                        String destinatario = "";

                                        if (doc != null) {
                                            lbl = "Actualizar Documento";
                                            act = encryptUtils.encodeString("accao#actualizar-documento");

                                            texto = encryptUtils.decodeString(doc.getDocTexto());
                                            tipo = encryptUtils.decodeString(doc.getDocTipo());
                                            assunto = encryptUtils.decodeString(doc.getDocAssunto());
                                            destinatario = encryptUtils.decodeString(destinatario);
                                        }
                                    %>

                                    <form action="Q29uc2VsaG9TZXJ2bGV0I0RDSQ==?<%=act%>" method="post" accept-charset="ISO-8859-1">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="text-bold text-danger-600 text-uppercase">TIPO DE DOCUMENTO:</label>
                                                <select data-placeholder="Selecione o tipo de documento" class="select" required="" name="tipo">


                                                    <%
                                                        String ds[] = {"Carta Formal", "Comunicado", "Aviso"};

                                                        for (String s : ds) {
                                                            String sel = "";

                                                            if (tipo.equalsIgnoreCase(s)) {
                                                                sel = "selected";
                                                            }

                                                    %>
                                                    <option value="<%=s%>" <%=sel%>><%=s%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="text-bold text-danger-600 text-uppercase">Assunto:</label>
                                                <input type="text" placeholder="Assunto ..." class="form-control" name="assunto" required=""  value="<%=assunto%>">

                                            </div>
                                        </div>

                                        <div class="row">
                                            <br>
                                            <div class="col-md-8">
                                                <label class="text-bold text-danger-600 text-uppercase">Destinatário:</label>
                                                <input type="text" placeholder="Destinatário (opcional) ..." class="form-control" name="destinatario"  value="<%=destinatario%>">

                                            </div>
                                        </div>

                                        <div class="row">
                                            <br>
                                            <div class="col-md-12">
                                                <div class="content-group">
                                                    <textarea name="texto" id="editor-full" rows="4" cols="4" required="">
                                                        <%=texto%>
                                                    </textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="text-right">

                                            <%
                                                if (doc != null) {
                                                    String actC = encryptUtils.encodeString("accao#cancelar-edicao-documento");
                                            %>
                                            <a href="Q29uc2VsaG9TZXJ2bGV0I0RDSQ==?<%=actC%>" class="btn text-bold text-uppercase bg-danger-400 btn-labeled-left ml-10"><i class="icon-cross2"></i> Cancelar edição</a>
                                            <%
                                                }
                                            %>
                                            <button type="submit"  onclick="this.disabled = 'disabled'; this.form.submit();" class="btn  bg-orange-600 text-uppercase text-bold"><%=lbl%> <i class="icon-bubbles6 position-right"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- /CKEditor default -->
                        </div>
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
                &copy; <%=ano%>. <a href="#" class="text-bold">SEGIA</a>. Todos os direitos reservados
            </div>
            <!-- /footer -->
        </div>
        <!-- /page container -->

    </body>
</html>
