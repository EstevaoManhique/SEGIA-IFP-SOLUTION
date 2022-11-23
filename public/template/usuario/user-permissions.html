<%-- 
    Document   : user-logs
    Created on : Feb 11, 2017, 7:30:25 PM
    Author     : HJC2K8
--%>

<%@page import="java.io.File"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="com.dciapps.webclient.ModulosUsuario"%>
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
        <title>SEGIA - Permissões</title>


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
        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/interactions.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/touch.min.js"></script>

        <script type="text/javascript" src="assets/js/core/app.js"></script>
        <script type="text/javascript" src="assets/js/pages/form_layouts.js"></script>
        <script type="text/javascript" src="assets/js/pages/components_navs.js"></script>
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
            List<ModulosUsuario> modulosUsuario = null;
            ModulosUsuario muf = null;

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

                mui = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

                modulosUsuario = (List<ModulosUsuario>) session.getAttribute("modulosUsuario");
                muf = (ModulosUsuario) session.getAttribute("modulosUsuarioSelecionado");

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
                                            <button class="btn bg-slate-800  btn-block btn-float btn-float-lg" type="submit"><i class="icon-user-plus"></i> <span class="text-bold text-uppercase">Utilizadores</span></button>
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
                                            <button class="btn  bg-orange-600 btn-block btn-float btn-float-lg" type="submit"><i class="icon-user-lock"></i> <span class="text-bold text-uppercase">Permissões</span></button>
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
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase text-danger-600"><i class="icon-user-lock position-left"></i> Permissões dos utilizadores</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->

                    <!-- User profile -->
                    <div class="row">

                        <div class="col-lg-9">
                            <div class="tabbable">
                                <div class="tab-content">



                                    <div class="tab-pane fade in active" id="settings">

                                        <%                                            //  if (mub != null) {
                                            String m1 = "";
                                            String m2 = "";
                                            String m3 = "";
                                            String m4 = "";
                                            String m5 = "";
                                            String m6 = "";
                                            String m7 = "";
                                            String m8 = "";
                                            String m9 = "";
                                            String m10 = "";
                                            String m11 = "";
                                            String m12 = "";
                                            String m13 = "";
                                            String m14 = "";
                                            String m15 = "";
                                            String m16 = "";
                                            String m17 = "";
                                            String m18 = "";
                                            String m19 = "";
                                            String m20 = "";
                                            String m21 = "";
                                            String m22 = "";
                                            String m23 = "";
                                            String m24 = "";
                                            String m25 = "";
                                            String m26 = "";
                                            String m27 = "";
                                            String m28 = "";
                                            String m29 = "";
                                            String m30 = "";
                                            String m31 = "";
                                            String m32 = "";
                                            String m33 = "";
                                            String m34 = "";
                                            String m35 = "";
                                            String m36 = "";
                                            String m37 = "";
                                            String m38 = "";
                                            String m39 = "";
                                            String m40 = "";
                                            String m41 = "";
                                            String m42 = "";
                                            String m43 = "";
                                            String m44 = "";
                                            String m45 = "";
                                            String m46 = "";
                                            String m47 = "";
                                            String m48 = "";
                                            String m49 = "";
                                            String m50 = "";
                                            String m51 = "";
                                            String m52 = "";
                                            String m53 = "";
                                            String m54 = "";
                                            String m55 = "";
                                            String m56 = "";
                                            String m57 = "";
                                            String m58 = "";
                                            String m59 = "";
                                            String m60 = "";
                                            String m61 = "";
                                            String m62 = "";
                                            String m63 = "";
                                            String m64 = "";
                                            String m65 = "";
                                            String m66 = "";
                                            String m67 = "";
                                            String m68 = "";
                                            String m69 = "";
                                            String m70 = "";
                                            String m71 = "";
                                            String m72 = "";
                                            String m73 = "";
                                            String m74 = "";
                                            String m75 = "";
                                            String m76 = "";
                                            String m77 = "";
                                            String m78 = "";
                                            String m79 = "";
                                            String m80 = "";
                                            String m81 = "";
                                            String m82 = "";
                                            String m83 = "";
                                            String m84 = "";
                                            String m85 = "";
                                            String m86 = "";
                                            String m87 = "";
                                            String m88 = "";
                                            String m89 = "";

                                            //PAINEL PRINCIPAL
                                            if (muf.isMuiConfiguracao()) {
                                                m58 = "checked";
                                            }
                                            if (muf.isMuiUsuarios()) {
                                                m40 = "checked";
                                            }
                                            if (muf.isMuiGestao()) {
                                                m1 = "checked";
                                            }
                                            if (muf.isMui12Classe()) {
                                                m55 = "checked";
                                            }
                                            if (muf.isMuiExamesExtraodinarios()) {
                                                m57 = "checked";
                                            }
                                            if (muf.isMuiFormacaoProfessores()) {
                                                m48 = "checked";
                                            }
                                            if (muf.isMuiEnsinoDistancia()) {
                                                m47 = "checked";
                                            }

                                            //GESTÃO ACADÉMICA
                                            if (muf.isMuiGestaoFormados()) {
                                                m2 = "checked";
                                            }
                                            if (muf.isMuiGestaoFormadores()) {
                                                m3 = "checked";
                                            }
                                            if (muf.isMuiGestaoTurmas()) {
                                                m4 = "checked";
                                            }
                                            if (muf.isMuiGestaoInscricoes()) {
                                                m5 = "checked";
                                            }
                                            if (muf.isMuiGestaoCentros()) {
                                                m6 = "checked";
                                            }
                                            if (muf.isMuiGestaoParceiros()) {
                                                m7 = "checked";
                                            }
                                            if (muf.isMuiCursos()) {
                                                m8 = "checked";
                                            }
                                            if (muf.isMuiCursosCursos()) {
                                                m9 = "checked";
                                            }
                                            if (muf.isMuiCursosAreasInscricao()) {
                                                m10 = "checked";
                                            }
                                            if (muf.isMuiCursosModulos()) {
                                                m11 = "checked";
                                            }
                                            if (muf.isMuiCursosCursosCentro()) {
                                                m12 = "checked";
                                            }
                                            if (muf.isMuiCalendario()) {
                                                m13 = "checked";
                                            }
                                            if (muf.isMuiCalendarioHorario()) {
                                                m14 = "checked";
                                            }
                                            if (muf.isMuiCalendarioTestes()) {
                                                m15 = "checked";
                                            }
                                            if (muf.isMuiCalendarioExames()) {
                                                m16 = "checked";
                                            }
                                            if (muf.isMuiCalendarioRecorrencias()) {
                                                m17 = "checked";
                                            }
                                            if (muf.isMuiAvaliacao()) {
                                                m18 = "checked";
                                            }
                                            if (muf.isMuiAvaliacaoNotas()) {
                                                m19 = "checked";
                                            }
                                            if (muf.isMuiAvaliacaoPautas()) {
                                                m20 = "checked";
                                            }
                                            if (muf.isMuiAvaliacaoPresencas()) {
                                                m21 = "checked";
                                            }
                                            if (muf.isMuiAvaliacaoObservacoes()) {
                                                m22 = "checked";
                                            }
                                            if (muf.isMuiAvaliacaoBoletins()) {
                                                m23 = "checked";
                                            }
                                            if (muf.isMuiPagamentos()) {
                                                m32 = "checked";
                                            }
                                            if (muf.isMuiPagamentosTaxas()) {
                                                m33 = "checked";
                                            }
                                            if (muf.isMuiPagamentosPropinas()) {
                                                m34 = "checked";
                                            }
                                            if (muf.isMuiPagamentosMultas()) {
                                                m35 = "checked";
                                            }
                                            if (muf.isMuiPagamentosOutrosPagamentos()) {
                                                m36 = "checked";
                                            }
                                            if (muf.isMuiPagamentosPagamentosOnline()) {
                                                m37 = "checked";
                                            }
                                            if (muf.isMuiPagamentosSituacaoPagamentos()) {
                                                m38 = "checked";
                                            }
                                            if (muf.isMuiDisciplinas()) {
                                                m49 = "checked";
                                            }
                                            if (muf.isMuiDisciplinasGestao()) {
                                                m50 = "checked";
                                            }
                                            if (muf.isMuiDisciplinasCurso()) {
                                                m51 = "checked";
                                            }
                                            if (muf.isMuiDisciplinasTurma()) {
                                                m52 = "checked";
                                            }
                                            if (muf.isMuiDisciplinasDocente()) {
                                                m53 = "checked";
                                            }

                                            //RELATÓRIOS
                                            if (muf.isMuiEstatisticas()) {
                                                m24 = "checked";
                                            }
                                            if (muf.isMuiEstatisticasGerais()) {
                                                m25 = "checked";
                                            }
                                            if (muf.isMuiEstatisticasCurso()) {
                                                m26 = "checked";
                                            }
                                            if (muf.isMuiResultados()) {
                                                m39 = "checked";
                                            }

                                            //CONTROLO DE ACESSO
                                            if (muf.isMuiUsuariosAdd()) {
                                                m41 = "checked";
                                            }
                                            if (muf.isMuiUsuariosPermissoes()) {
                                                m42 = "checked";
                                            }
                                            if (muf.isMuiUsuariosLogs()) {
                                                m43 = "checked";
                                            }
                                            if (muf.isMuiUsuariosStatus()) {
                                                m44 = "checked";
                                            }

                                            //EXAMES EXTRAODINARIOS
                                            if (muf.isMuiEePeriodoInscricao()) {
                                                m61 = "checked";
                                            }
                                            if (muf.isMuiEeCentroExame()) {
                                                m62 = "checked";
                                            }
                                            if (muf.isMuiEeInscrverCandidato()) {
                                                m63 = "checked";
                                            }
                                            if (muf.isMuiEeValidarInscricao()) {
                                                m64 = "checked";
                                            }
                                            if (muf.isMuiEeCandidatosInscritos()) {
                                                m65 = "checked";
                                            }
                                            if (muf.isMuiEeCalendarioExames()) {
                                                m66 = "checked";
                                            }
                                            if (muf.isMuiEeCriacaoJuris()) {
                                                m67 = "checked";
                                            }
                                            if (muf.isMuiEeSalaExame()) {
                                                m68 = "checked";
                                            }
                                            if (muf.isMuiEeGuiaoRespostas()) {
                                                m69 = "checked";
                                            }
                                            if (muf.isMuiEeCarregarRespostas()) {
                                                m70 = "checked";
                                            }
                                            if (muf.isMuiEePautas()) {
                                                m71 = "checked";
                                            }

                                            //12ª CLASSE
                                            if (muf.isMui12CandidatosInscritos()) {
                                                m72 = "checked";
                                            }
                                            if (muf.isMui12CalendarioExames()) {
                                                m73 = "checked";
                                            }
                                            if (muf.isMui12CriacaoJuris()) {
                                                m74 = "checked";
                                            }
                                            if (muf.isMui12SalaExame()) {
                                                m75 = "checked";
                                            }
                                            if (muf.isMui12GuiaoRespostas()) {
                                                m76 = "checked";
                                            }
                                            if (muf.isMui12CarregarRespostas()) {
                                                m77 = "checked";
                                            }
                                            if (muf.isMui12Pautas()) {
                                                m78 = "checked";
                                            }
                                            
                                            
                                            //FORMAÇÃO DE PROFESSORES
                                            if (muf.isMuiIfpPeriodoInscricao()) {
                                                m79 = "checked";
                                            }
                                            if (muf.isMuiIfpCentroExame()) {
                                                m80 = "checked";
                                            }
                                            if (muf.isMuiIfpInscrverCandidato()) {
                                                m81 = "checked";
                                            }
                                            if (muf.isMuiIfpValidarInscricao()) {
                                                m82 = "checked";
                                            }
                                            if (muf.isMuiIfpCandidatosInscritos()) {
                                                m83 = "checked";
                                            }
                                            if (muf.isMuiIfpCalendarioExames()) {
                                                m84 = "checked";
                                            }
                                            if (muf.isMuiIfpCriacaoJuris()) {
                                                m85 = "checked";
                                            }
                                            if (muf.isMuiIfpSalaExame()) {
                                                m86 = "checked";
                                            }
                                            if (muf.isMuiIfpGuiaoRespostas()) {
                                                m87 = "checked";
                                            }
                                            if (muf.isMuiIfpCarregarRespostas()) {
                                                m88 = "checked";
                                            }
                                            if (muf.isMuiIfpPautas()) {
                                                m89 = "checked";
                                            }

                                            
                                            String actividade = encryptUtils.decodeString(muf.getUsuario().getPessoapess().getPessActividade());
                                            String ufoto = muf.getUsuario().getUsuaFotoperfil();
                                            String nm = encryptUtils.decodeString(muf.getUsuario().getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(muf.getUsuario().getPessoapess().getPessApelido());

                                            File f = new File("C:\\wamp\\www\\suc\\images\\profile-pictures\\" + ufoto);

                                            if (!f.isFile()) {

                                                ufoto = "generic-user.png";
                                            }

                                            String act = encryptUtils.encodeString("accao#actualizar-modulos&us=" + muf.getMuiId());
                                            String actS = encryptUtils.encodeString("accao#selecionar-usuario-permissoes");


                                        %>

                                        </form>
                                        <!-- /basic layout -->

                                        <!-- Account settings -->
                                        <div class="panel panel-flat">
                                            <div class="panel-heading">
                                                <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Permissões da conta</h6>
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li><a data-action="collapse"></a></li>
                                                        <li><a data-action="reload"></a></li>
                                                    </ul>
                                                </div>
                                            </div>

                                            <div class="panel-body">

                                                <div class="col-md-6">
                                                </div>

                                                <div class="col-md-12">


                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="media-right media-middle">

                                                                <!-- Basic layout-->
                                                                <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="VXN1YXJpb1NlcnZsZXQjRENJ?<%=actS%>">

                                                                    <div class="form-group">
                                                                        <label class="text-bold text-danger-600 text-uppercase">Selecione o Utilizador:</label>
                                                                        <select class="select" name="idModuloUsuario" onchange="this.form.submit()">
                                                                            <optgroup label="Selecione o usuário">
                                                                                <%
                                                                                    if (modulosUsuario != null) {
                                                                                        for (ModulosUsuario m : modulosUsuario) {

                                                                                            String nmU = encryptUtils.decodeString(m.getUsuario().getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(m.getUsuario().getPessoapess().getPessApelido());
                                                                                            int id = m.getMuiId();

                                                                                            String sel = "";

                                                                                            if (muf != null) {
                                                                                                if (muf.getMuiId() == m.getMuiId()) {
                                                                                                    sel = "selected";
                                                                                                }
                                                                                %>
                                                                                <option value="<%=id%>" <%=sel%>><%=nmU%></option>
                                                                                <%
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                %>
                                                                            </optgroup>
                                                                        </select>
                                                                    </div>
                                                                </form>

                                                            </div>

                                                        </div>
                                                        <div class="col-md-6">
                                                            <!-- Cover area -->
                                                            <div class="media">
                                                                <div class="media-left">
                                                                    <a href="#" class="profile-thumb">
                                                                        <img src="http://<%=ip%>:8081/suc/images/profile-pictures/<%=ufoto%>" class="img-circle" alt="<%=nm%>">
                                                                    </a>
                                                                </div>

                                                                <div class="media-body">
                                                                    <h1><%=nm%> <small class="display-block"><%=actividade%></small></h1>
                                                                </div>
                                                            </div>
                                                            <!-- /cover area -->
                                                            <br>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <hr>
                                                    </div>

                                                    <form method="post" accept-charset="ISO-8859-1" action="VXN1YXJpb1NlcnZsZXQjRENJ?<%=act%>">
                                                        <div class="row">
                                                            <div class="col-md-9">

                                                                <div class="panel-group panel-group-control content-group-lg">
                                                                    <div class="panel panel-white">
                                                                        <div class="panel-heading">
                                                                            <h6 class="panel-title">
                                                                                <a data-toggle="collapse" href="#group1" class="text-uppercase text-bold">Painel Principal</a>
                                                                            </h6>
                                                                        </div>
                                                                        <div id="group1" class="panel-collapse collapse in">
                                                                            <div class="panel-body">

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m58" <%=m58%>>
                                                                                        <b>Configuração e Parametrização</b>
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m1" <%=m1%>>
                                                                                        Informação Académica Escolar
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m55" <%=m55%>>
                                                                                        Exames Finais da 12ª classe
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m57" <%=m57%>>
                                                                                        Exames Extraordinários
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"    name="m48" <%=m48%>>
                                                                                        Exames de Admissão aos Institutos de Formação de Professores
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m47" <%=m47%>>
                                                                                        Exames dos Alunos do Ensino à Distância
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m40" <%=m40%>>
                                                                                        <b>Módulo Controlo de Acesso</b>
                                                                                    </label>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="panel panel-white">
                                                                        <div class="panel-heading">
                                                                            <h6 class="panel-title">
                                                                                <a class="collapsed text-uppercase text-bold" data-toggle="collapse" href="#group2">Informação Académica Escolar</a>
                                                                            </h6>
                                                                        </div>
                                                                        <div id="group2" class="panel-collapse collapse">
                                                                            <div class="panel-body">

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m2" <%=m2%>>
                                                                                        Gestão de Alunos
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m3" <%=m3%>>
                                                                                        Gestão de Professores
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m4" <%=m4%>>
                                                                                        Gestão de Turmas
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m5" <%=m5%>>
                                                                                        Gestão de Matriculas
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m6" <%=m6%>>
                                                                                        Gestão de Escolas
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m7"  <%=m7%>>
                                                                                        Gestão de Parceiros
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m8" <%=m8%>>
                                                                                        <b>Módulo Gestão de Classes</b>
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m9" <%=m9%>>
                                                                                        Gestão de Classes
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m10"  <%=m10%>>
                                                                                        Gestão de Áreas de Formação
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m11" <%=m11%>>
                                                                                        Gestão de Módulos de Classes
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m12" <%=m12%>>
                                                                                        Gestão de Classes para Escolas
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m13" <%=m13%>>
                                                                                        <b>Módulo Gestão de Calendário</b>
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m14" <%=m14%>>
                                                                                        Gestão de Horários para turmas
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m15" <%=m15%>>
                                                                                        Gestão de Horários para testes
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m16" <%=m16%>>
                                                                                        Gestão de Horários para exames
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m17" <%=m17%>>
                                                                                        Gestão de Horários para recorrencias
                                                                                    </label>
                                                                                </div>


                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m18" <%=m18%>>
                                                                                        <b>Módulo Gestão de avaliação</b>
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m19" <%=m19%>>
                                                                                        Gestão de notas
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m20" <%=m20%>>
                                                                                        Gestão de pautas
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m21" <%=m21%>>
                                                                                        Gestão de presenças
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m22" <%=m22%>>
                                                                                        Gestão de observações
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m23" <%=m23%>>
                                                                                        Gestão de boletins
                                                                                    </label>
                                                                                </div>


                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m49" <%=m49%>>
                                                                                        <b>Módulo Gestão de Disciplinas</b>
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"    name="m50" <%=m50%>>
                                                                                        Gerir Disciplinas
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m51" <%=m51%>>
                                                                                        Disciplinas Curso
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"    name="m52" <%=m52%>>
                                                                                        Disciplinas Turma
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"    name="m53" <%=m53%>>
                                                                                        Disciplinas Docente
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m32" <%=m32%>>
                                                                                        <b>Módulo Gestão de pagamentos</b>
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m33" <%=m33%>>
                                                                                        Gestão de Taxas
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m34" <%=m34%>>
                                                                                        Gestão de Propinas
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m35" <%=m35%>>
                                                                                        Gestão de Multas
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m36" <%=m36%>>
                                                                                        Gestão de Pagamentos Online
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m37" <%=m37%>>
                                                                                        Gestão de Outros Pagamentos
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m38" <%=m38%>>
                                                                                        Visualizar Situação de Pagamentos
                                                                                    </label>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="panel panel-white">
                                                                        <div class="panel-heading">
                                                                            <h6 class="panel-title">
                                                                                <a class="collapsed text-bold text-uppercase" data-toggle="collapse" href="#group3">Relatórios e Estatísticas</a>
                                                                            </h6>
                                                                        </div>
                                                                        <div id="group3" class="panel-collapse collapse">
                                                                            <div class="panel-body">

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m24" <%=m24%>>
                                                                                        <b>Módulo Estatístico</b>
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m25" <%=m25%>>
                                                                                        Visualizar Estatísticas Gerais
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m26" <%=m26%>>
                                                                                        Visualizar Estatísticas por Província
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"  name="m39" <%=m39%>>
                                                                                        <b>Visualizar Mapa de Resultados</b>
                                                                                    </label>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="panel panel-white">
                                                                        <div class="panel-heading">
                                                                            <h6 class="panel-title">
                                                                                <a class="collapsed text-bold text-uppercase" data-toggle="collapse" href="#group4">Exames Finais da 12ª classe</a>
                                                                            </h6>
                                                                        </div>
                                                                        <div id="group4" class="panel-collapse collapse">
                                                                            <div class="panel-body">


                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m72" <%=m72%>>
                                                                                        <b>Candidatos Apurados</b>
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m73" <%=m73%>>
                                                                                        Calendários de Exame
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m74" <%=m74%>>
                                                                                        Criação de Júris
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m75" <%=m75%>>
                                                                                        Lista de Júris
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m76" <%=m76%>>
                                                                                        Guião de Respostas
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m77" <%=m77%>>
                                                                                        Carregar Respostas
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m78" <%=m78%>>
                                                                                        Pautas de Exame
                                                                                    </label>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="panel panel-white">
                                                                        <div class="panel-heading">
                                                                            <h6 class="panel-title">
                                                                                <a class="collapsed text-bold text-uppercase" data-toggle="collapse" href="#group5">Exames Extraordinários</a>
                                                                            </h6>
                                                                        </div>
                                                                        <div id="group5" class="panel-collapse collapse">
                                                                            <div class="panel-body">

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m61" <%=m61%>>
                                                                                        Períodos de Inscrição
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m62" <%=m62%>>
                                                                                        Centros de Exame
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m63" <%=m63%>>
                                                                                        Inscrever Candidatos
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m64" <%=m64%>>
                                                                                        Validar Inscrições
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m65" <%=m65%>>
                                                                                        Candidatos Inscritos
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m66" <%=m66%>>
                                                                                        Calendário de Exames
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m67" <%=m67%>>
                                                                                        Criação de Júris
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m68" <%=m68%>>
                                                                                        Lista de Júris
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m69" <%=m69%>>
                                                                                        Guião de Respostas
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m70" <%=m70%>>
                                                                                        Carregar Respostas
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m71" <%=m71%>>
                                                                                        Presenças/Fraudes
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>


                                                                    <div class="panel panel-white">
                                                                        <div class="panel-heading">
                                                                            <h6 class="panel-title">
                                                                                <a class="collapsed text-bold text-uppercase" data-toggle="collapse" href="#group6">Exames de Admissão aos Institutos de Formação de Professores</a>
                                                                            </h6>
                                                                        </div>
                                                                        <div id="group6" class="panel-collapse collapse">
                                                                            <div class="panel-body">

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m79" <%=m79%>>
                                                                                        Períodos de Inscrição
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m80" <%=m80%>>
                                                                                        Centros de Exame
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m81" <%=m81%>>
                                                                                        Inscrever Candidatos
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m82" <%=m82%>>
                                                                                        Validar Inscrições
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m83" <%=m83%>>
                                                                                        Candidatos Inscritos
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m84" <%=m84%>>
                                                                                        Calendário de Exames
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m85" <%=m85%>>
                                                                                        Criação de Júris
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m86" <%=m86%>>
                                                                                        Lista de Júris
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m87" <%=m87%>>
                                                                                        Guião de Respostas
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m88" <%=m88%>>
                                                                                        Carregar Respostas
                                                                                    </label>
                                                                                </div>
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m89" <%=m89%>>
                                                                                        Presenças/Fraudes
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>


                                                                    <div class="panel panel-white">
                                                                        <div class="panel-heading">
                                                                            <h6 class="panel-title">
                                                                                <a class="collapsed text-bold text-uppercase" data-toggle="collapse" href="#group7">Exames dos Alunos do Ensino à Distância</a>
                                                                            </h6>
                                                                        </div>
                                                                        <div id="group7" class="panel-collapse collapse">
                                                                            <div class="panel-body">
                                                                                Definir Permissões Aqui
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="panel panel-white">
                                                                        <div class="panel-heading">
                                                                            <h6 class="panel-title">
                                                                                <a class="collapsed text-bold text-uppercase" data-toggle="collapse" href="#group8">Controlo de Acesso</a>
                                                                            </h6>
                                                                        </div>
                                                                        <div id="group8" class="panel-collapse collapse">
                                                                            <div class="panel-body">

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"    name="m41" <%=m41%>>
                                                                                        Cadastrar Utilizadores
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"   name="m42" <%=m42%>>
                                                                                        Visualizar Logs
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"    name="m43" <%=m43%>>
                                                                                        Atribuir Permissões
                                                                                    </label>
                                                                                </div>

                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="styled"    name="m44" <%=m44%>>
                                                                                        Alterar Estados
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <!-- /collapsible with left control button -->

                                                            </div>
                                                        </div>

                                                        <div class="text-left">
                                                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase bg-teal">Actualizar permissões <i class="icon-user-lock position-right"></i></button>
                                                        </div>
                                                    </form>

                                                </div>
                                            </div>
                                        </div>
                                        <!-- /account settings -->

                                        <%
                                            //     }
                                        %>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /user profile -->
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
        <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>

    </body>
</html>
