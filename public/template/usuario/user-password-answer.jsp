<%-- 
    Document   : dc-user-password-answer
    Created on : Nov 20, 2016, 8:18:49 AM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SEGIA - Recuperação da Senha</title>

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
	<link href="assets/css/minified/bg.css" rel="stylesheet" type="text/css">
        <!-- /global stylesheets -->

        <!-- Core JS files -->
        <script type="text/javascript" src="assets/js/plugins/loaders/pace.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/loaders/blockui.min.js"></script>
        <!-- /core JS files -->

        <!-- Theme JS files -->
        <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>

        <script type="text/javascript" src="assets/js/core/app.js"></script>
        <script type="text/javascript" src="assets/js/pages/login.js"></script>
        <!-- /theme JS files -->

        <%
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            String msgErro = session.getAttribute("msgErro").toString();
            String alerta = session.getAttribute("alerta").toString();

            EncryptUtils encryptUtils = new EncryptUtils();
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

        <video poster="assets/images/vd-login.png" id="bgvid" playsinline autoplay muted loop>
            <source src="assets/videos/demo.webm" type="video/webm">
            <source src="assets/videos/demo.mp4" type="video/mp4">
        </video>

        <script>
            (function () {
                /**
                 * Video element
                 * @type {HTMLElement}
                 */
                var video = document.getElementById("my-video");

                /**
                 * Check if video can play, and play it
                 */
                video.addEventListener("canplay", function () {
                    video.play();
                });
            })();
        </script>

        <!-- Main navbar -->
        <div class="navbar navbar-inverse">
            <div class="navbar-header">
                <h6 class="text-semibold class text-uppercase" style="margin-left: 2em;"> Sistema Electrónico de Gestão de Informação Académica </h6>

                <ul class="nav navbar-nav pull-right visible-xs-block">
                    <li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
                </ul>
            </div>

            <div class="navbar-collapse collapse" id="navbar-mobile">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#">
                            <i class="icon-display4"></i> <span class="visible-xs-inline-block position-right"></span>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <i class="icon-user-tie"></i> <span class="visible-xs-inline-block position-right"> </span>
                        </a>
                    </li>

                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-cog3"></i>
                            <span class="visible-xs-inline-block position-right"> </span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /main navbar -->


        <!-- Page container -->
        <div class="page-container login-container">

            <!-- Page content -->
            <div class="page-content">

                <!-- Main content -->
                <div class="content-wrapper">

                    <%
                        String perguntaSeguranca = "";
                        String act = "";

                        if (usuario != null) {
                            perguntaSeguranca = encryptUtils.decodeString(usuario.getUsuaPerguntaSeguranca());
                            act = encryptUtils.encodeString("accao#redefinir-senha&us="+usuario.getUsuaUsuario());
                        }
                    %>
                    <!-- Registration form -->
                    <form method="post" action="VXN1YXJpb1NlcnZsZXQjRENJ?<%=act%>">
                        <div class="row">
                            <div class="col-lg-6 col-lg-offset-3">
                                <div class="panel registration-form">
                                    <div class="panel-body">
                                        <div class="text-center">
                                            <div class="icon-object border-danger text-danger"><i class="icon-user-lock"></i></div>
                                            <h6 class="content-group-lg text-uppercase text-bold">Recuperação da Senha <small class="display-block">Defina a sua nova senha</small></h6>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group has-feedback">
                                                    <input type="password" class="form-control" placeholder="Nova Senha" required="" name="password">
                                                    <div class="form-control-feedback">
                                                        <i class="icon-user-lock text-muted"></i>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group has-feedback">
                                                    <input type="password" class="form-control" placeholder="Repetir a Senha" required="" name="repassword">
                                                    <div class="form-control-feedback">
                                                        <i class="icon-user-check text-muted"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>



                                        <div class="form-group has-feedback">
                                            <input type="text" class="form-control" value="<%=perguntaSeguranca%>" disabled>
                                            <div class="form-control-feedback">
                                                <i class="icon-question4 text-muted"></i>
                                            </div>
                                        </div>

                                        <div class="form-group has-feedback">
                                            <input type="password" class="form-control" placeholder="Responda a pergunta de segurança acima" required="" name="respostaSeguranca">
                                            <div class="form-control-feedback">
                                                <i class="icon-unlocked2 text-muted"></i>
                                            </div>
                                        </div>

                                        <div class="text-right">
                                            <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800 btn-labeled btn-labeled-right ml-10"><b><i class="icon-spinner11"></i></b> Redefinir a senha</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- /registration form -->

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

    </body>
</html>
