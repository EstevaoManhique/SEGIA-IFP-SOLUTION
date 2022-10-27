<%-- 
    Document   : dc-inefp-charts-course
    Created on : Apr 9, 2017, 1:23:07 PM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="com.dciapps.webclient.Curso"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.webclient.ModulosUsuario"%>
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
        <title> SEGIA - Estatísticas Por Curso</title>

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
        <script type="text/javascript" src="assets/js/plugins/media/fancybox.min.js"></script>

        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/datepicker.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/effects.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/ui/moment/moment.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/daterangepicker.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/pickadate/picker.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/pickadate/picker.date.js"></script>


        <script type="text/javascript" src="assets/js/core/app.js"></script>
        <script type="text/javascript" src="assets/js/pages/form_layouts.js"></script>
        <script type="text/javascript" src="assets/js/pages/datatables_responsive.js"></script>
        <script type="text/javascript" src="assets/js/pages/gallery.js"></script>

        <!-- /theme JS files -->

        <%

            int timeout = session.getMaxInactiveInterval();

            GenericHandler gh = new GenericHandler(request, response);
            Usuario usuario = gh.loggedUser();

            String nome = "";
            String fotoPerfil = "";
            String cargo = "";

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy, HH:mm:ss");
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            EncryptUtils encryptUtils = new EncryptUtils();

            ModulosUsuario mu = null;
            List<Curso> cursos = null;
            Curso curso = null;

            String msgErro = "";
            String alerta = "";

            String anoSelecionado = "";
            String descCurso = "";

            String lblInscricoes = "";
            String lblMenor18 = "";
            String lbl18_29 = "";
            String lbl30_39 = "";
            String lbl40_49 = "";
            String lbl50_59 = "";
            String lblMaior60 = "";
            int numHomens = 0;
            int numMulheres = 0;
            Entidade entidade = (Entidade) session.getAttribute("entidadeSelecionada");

            if (entidade == null) {
                entidade = (Entidade) session.getAttribute("entidade");
            }

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

                cursos = (List<Curso>) session.getAttribute("cursos");
                curso = (Curso) session.getAttribute("curso");

                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();

                anoSelecionado = session.getAttribute("anoSelecionado").toString();

                lblInscricoes = session.getAttribute("lblInscricoes").toString();
                lblMenor18 = session.getAttribute("lblMenor18").toString();
                lbl18_29 = session.getAttribute("lbl18_29").toString();
                lbl30_39 = session.getAttribute("lbl30_39").toString();
                lbl40_49 = session.getAttribute("lbl40_49").toString();
                lbl50_59 = session.getAttribute("lbl50_59").toString();
                lblMaior60 = session.getAttribute("lblMaior60").toString();

                numHomens = Integer.parseInt(session.getAttribute("numHomens").toString());
                numMulheres = Integer.parseInt(session.getAttribute("numMulheres").toString());

                if (curso != null) {
                    descCurso = encryptUtils.decodeString(curso.getCursDescricao());
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

        <!-- velocity animation menu -->
        <script type="text/javascript" src="assets/js/plugins/visualization/d3/d3.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/visualization/d3/d3_tooltip.js"></script>


        <script type="text/javascript" src="assets/js/plugins/visualization/d3/d3.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/visualization/c3/c3.min.js"></script>

        <script type="text/javascript" src="assets/js/plugins/visualization/echarts/echarts.js"></script>


    </head>

    <body oncontextmenu="return false"  class="navbar-top">




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
                        <button onClick="history.back();" class="btn text-bold text-uppercase btn-labeled btn-labeled-left bg-danger-400 heading-btn">Voltar ao painel principal<b><i class="icon-chevron-left"></i></b></button>
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
                                <li class="active text-bold"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-book3 position-left"></i> Ánalise do curso <span class="text-danger">(<%=descCurso%>)</span></a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->


                    <div class="row col-md-offset-4">

                        <div class="col-md-5">


                            <!-- Basic layout-->
                            <form action="#" class="form-horizontal">
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-uppercase text-bold">Periodo de Pesquisa</h6>
                                        <div class="heading-elements">
                                            <ul class="icons-list">
                                                <li><a data-action="collapse"></a></li>
                                                <li><a data-action="reload"></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="panel-body">

                                        <div class="form-group">
                                            <label class="text-bold text-uppercase">Classe:</label>
                                            <select class="select">
                                                <optgroup label="Selecione a classe">
                                                    <%
                                                        if (cursos != null) {
                                                            for (Curso c : cursos) {
                                                                String sel = "";
                                                                int id = c.getCursId();
                                                                String desc = encryptUtils.decodeString(c.getCursCod())+" - "+ encryptUtils.decodeString(c.getCursDescricao());

                                                                if (curso != null) {
                                                                    if (c.getCursId() == curso.getCursId()) {
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


                                        <div class="form-group">
                                            <label class="col-lg-3 control-label text-bold text-uppercase">Periodo:</label>
                                            <div class="col-lg-9">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <select class="select">
                                                            <optgroup label="Selecione ano">

                                                                <%
                                                                    for (int i = 2017; i <= 2022; i++) {
                                                                        String sel = "";
                                                                        if (!anoSelecionado.isEmpty()) {
                                                                            if (i == Integer.parseInt(anoSelecionado)) {
                                                                                sel = "selected";
                                                                            }
                                                                        }

                                                                %>
                                                                <option value="<%=i%>" <%=sel%>><%=i%></option>
                                                                <%
                                                                    }
                                                                %>
                                                            </optgroup>
                                                        </select>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>



                                        <div class="text-right">
                                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase btn-primary">Filtrar resultados <i class="icon-filter3 position-right"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- /basic layout -->

                        </div>


                    </div>


                    <div class ="row">

                        <div class = "col-md-6">

                            <!-- Line and bar combination -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-uppercase text-bold  text-bold text-uppercase">Inscrições <span class="text-danger">(<%=descCurso%>)</span></h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>

                                        </ul>
                                    </div>
                                </div>

                                <div class="panel-body">
                                    <div class="chart-container">
                                        <div class="chart has-fixed-height" id="line_bar1"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- /line and bar combination -->

                        </div>

                        <div class = "col-md-6">

                            <!-- Line and bar combination -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Distribuição dos Alunos por Idade <span class="text-danger">(<%=descCurso%>)</span></h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>

                                        </ul>
                                    </div>
                                </div>

                                <div class="panel-body">
                                    <div class="chart-container">
                                        <div class="chart has-fixed-height" id="line_bar2"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- /line and bar combination -->

                        </div>


                    </div>


                    <div class ="row">

                        <div class = "col-md-6">

                            <!-- Line and bar combination -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Avaliação dos alunos <span class="text-danger">(<%=descCurso%>)</span></h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>

                                        </ul>
                                    </div>
                                </div>

                                <div class="panel-body">
                                    <div class="chart-container">
                                        <div class="chart has-fixed-height" id="line_bar3"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- /line and bar combination -->

                        </div>

                        <div class = "col-md-6">

                            <!-- Line and bar combination -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Género <span class="text-danger">(<%=descCurso%>)</span></h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>

                                        </ul>
                                    </div>
                                </div>

                                <div class="panel-body">
                                    <div class="chart-container">
                                        <div class="chart has-fixed-height" id="line_bar4"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- /line and bar combination -->

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

                // Set paths
                // ------------------------------

                require.config({
                    paths: {
                        echarts: 'assets/js/plugins/visualization/echarts'
                    }
                });



                // Configuration
                // ------------------------------

                require(
                        // Add necessary charts
                                [
                                    'echarts',
                                    'echarts/theme/limitless',
                                    'echarts/chart/line',
                                    'echarts/chart/bar',
                                    'echarts/chart/pie',
                                    'echarts/chart/scatter',
                                    'echarts/chart/k',
                                    'echarts/chart/radar',
                                    'echarts/chart/gauge'
                                ],
                                // Charts setup
                                        function (ec, limitless) {


                                            // Initialize charts
                                            // ------------------------------

                                            var line_bar1 = ec.init(document.getElementById('line_bar1'), limitless);
                                            var line_bar2 = ec.init(document.getElementById('line_bar2'), limitless);
                                            var line_bar4 = ec.init(document.getElementById('line_bar4'), limitless);



                                            // Charts options
                                            // ------------------------------


                                            //
                                            // Qualificações Académicas 
                                            //

                                            line_bar_options1 = {
                                                // Add tooltip
                                                tooltip: {
                                                    trigger: 'axis'
                                                },
                                                // Add legend
                                                legend: {
                                                    data: ['Nº de Inscrições']
                                                },
                                                // Add custom colors
                                                color: ['#EF5350'],
                                                // Enable drag recalculate
                                                calculable: true,
                                                // Horizontal axis
                                                xAxis: [{
                                                        type: 'category',
                                                        data: ['JAN', 'FEV', 'MAR', 'ABR', 'MAI', 'JUN', 'JUL', 'AGO', 'SET', 'OUT', 'NOV', 'DEZ']
                                                    }],
                                                // Vertical axis
                                                yAxis: [{
                                                        type: 'value'
                                                    }],
                                                // Add series
                                                series: [
                                                    {
                                                        name: 'Nº de Inscrições',
                                                        type: 'bar',
                                                        data: [<%=lblInscricoes%>],
                                                        itemStyle: {
                                                            normal: {
                                                                label: {
                                                                    show: true,
                                                                    textStyle: {
                                                                        fontWeight: 500
                                                                    }
                                                                }
                                                            }
                                                        },
                                                        markLine: {
                                                            data: [{type: 'average', name: 'Average'}]
                                                        }
                                                    }
                                                ]
                                            };

                                            line_bar_options2 = {
                                                // Add tooltip
                                                tooltip: {
                                                    trigger: 'axis'
                                                },
                                                // Add legend
                                                legend: {
                                                    data: ['Menor de 18 anos', '18 á 29 anos', '30 á 39 anos', '40 á 49 anos', '50 á 59 anos', 'Maior de 60 anos']
                                                },
                                                // Add custom colors
                                                color: ['#98abc5', '#8a89a6', '#7b6888', '#6b486b', '#a05d56', '#d0743c', '#ff8c00'],
                                                // Enable drag recalculate 
                                                calculable: true,
                                                // Horizontal axis
                                                xAxis: [{
                                                        type: 'category',
                                                        data: ['JAN', 'FEV', 'MAR', 'ABR', 'MAI', 'JUN', 'JUL', 'AGO', 'SET', 'OUT', 'NOV', 'DEZ']
                                                    }],
                                                // Vertical axis
                                                yAxis: [{
                                                        type: 'value'
                                                    }],
                                                // Add series
                                                series: [
                                                    {
                                                        name: 'Menor de 18 anos',
                                                        type: 'bar',
                                                        data: [<%=lblMenor18%>],
                                                        itemStyle: {
                                                            normal: {
                                                                label: {
                                                                    show: true,
                                                                    textStyle: {
                                                                        fontWeight: 500
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    },
                                                    {
                                                        name: '18 á 29 anos',
                                                        type: 'bar',
                                                        data: [<%=lbl18_29%>],
                                                        itemStyle: {
                                                            normal: {
                                                                label: {
                                                                    show: true,
                                                                    textStyle: {
                                                                        fontWeight: 500
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    },
                                                    {
                                                        name: '30 á 39 anos',
                                                        type: 'bar',
                                                        data: [<%=lbl30_39%>],
                                                        itemStyle: {
                                                            normal: {
                                                                label: {
                                                                    show: true,
                                                                    textStyle: {
                                                                        fontWeight: 500
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    },
                                                    {
                                                        name: '40 á 49 anos',
                                                        type: 'bar',
                                                        data: [<%=lbl40_49%>],
                                                        itemStyle: {
                                                            normal: {
                                                                label: {
                                                                    show: true,
                                                                    textStyle: {
                                                                        fontWeight: 500
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    },
                                                    {
                                                        name: '50 á 59 anos',
                                                        type: 'bar',
                                                        data: [<%=lbl50_59%>],
                                                        itemStyle: {
                                                            normal: {
                                                                label: {
                                                                    show: true,
                                                                    textStyle: {
                                                                        fontWeight: 500
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    },
                                                    {
                                                        name: 'Maior de 60 anos',
                                                        type: 'bar',
                                                        data: [<%=lblMaior60%>],
                                                        itemStyle: {
                                                            normal: {
                                                                label: {
                                                                    show: true,
                                                                    textStyle: {
                                                                        fontWeight: 500
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                ]
                                            };


                                            //
                                            // Género
                                            //
                                            line_bar_options4 = {
                                                // Add title
                                                title: {
                                                    text: 'Estatísticas para <%=anoSelecionado%>',
                                                    subtext: 'Curso -  <%=descCurso%>',
                                                    x: 'center'
                                                },
                                                // Add legend
                                                legend: {
                                                    orient: 'vertical',
                                                    x: 'left',
                                                    data: ['Homens', 'Mulheres']
                                                },
                                                // Enable drag recalculate
                                                calculable: true,
                                                // Add series
                                                series: [
                                                    {
                                                        name: 'Genero',
                                                        type: 'pie',
                                                        radius: ['50%', '70%'],
                                                        center: ['50%', '57.5%'],
                                                        itemStyle: {
                                                            normal: {
                                                                label: {
                                                                    show: true
                                                                },
                                                                labelLine: {
                                                                    show: true
                                                                }
                                                            },
                                                            emphasis: {
                                                                label: {
                                                                    show: true,
                                                                    formatter: '{b}' + '\n\n' + '{c} ({d}%)',
                                                                    position: 'center',
                                                                    textStyle: {
                                                                        fontSize: '17',
                                                                        fontWeight: '500'
                                                                    }
                                                                }
                                                            }
                                                        },
                                                        data: [
                                                            {value: <%=numHomens%>, name: 'Homens'},
                                                            {value: <%=numMulheres%>, name: 'Mulheres'}
                                                        ]
                                                    }
                                                ]
                                            };





                                            // Apply options
                                            // ------------------------------

                                            line_bar1.setOption(line_bar_options1);
                                            line_bar2.setOption(line_bar_options2);
                                            line_bar4.setOption(line_bar_options4);


                                            // Resize charts
                                            // ------------------------------

                                            window.onresize = function () {
                                                setTimeout(function () {
                                                    line_bar1.resize();
                                                    line_bar2.resize();
                                                    line_bar4.resize();
                                                }, 200);
                                            };
                                        }
                                );
                            });

        </script>

        <script>

                    $(function () {


// Line chart with regions
// ------------------------------

// Generate chart
                        var chart_line_regions = c3.generate({
                            bindto: '#line_bar3',
                            size: {height: 400},
                            point: {
                                r: 4
                            },
                            color: {
                                pattern: ['#5E35B1', '#E53935']
                            },
                            data: {
                                columns: [
                                    ['Reprovações', 30, 20, 10, 40, 15, 25],
                                    ['Aprovações', 50, 17, 14, 36, 18, 33]
                                ],
                                regions: {
                                    'Reprovações': [{'start': 1, 'end': 2, 'style': 'dashed'}, {'start': 3}],
                                    'Aprovações': [{'end': 3}]
                                }
                            },
                            grid: {
                                y: {
                                    show: true
                                }
                            }
                        });



// Resize chart on sidebar width change
                        $(".sidebar-control").on('click', function () {
                            chart_line_regions.resize();
                        });
                    });

        </script>

        <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>
    </body>
</html>
