<%-- 
    Document   : dc-inefp-grades
    Created on : Feb 11, 2017, 7:30:25 PM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="com.dciapps.webclient.Turma"%>
<%@page import="com.dciapps.webclient.Inscricao"%>
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
        <title>SEGIA - Alunos da Turma</title>

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
        <script type="text/javascript" src="assets/js/plugins/visualization/d3/d3.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/visualization/d3/d3_tooltip.js"></script>
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

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy, HH:mm:ss");
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            EncryptUtils encryptUtils = new EncryptUtils();

            ModulosUsuario mu = null;
            List<Inscricao> inscricoes = null;
            List<Turma> turmas = null;
            Turma turma = null;

            String msgErro = "";
            String alerta = "";
            Entidade entidade = (Entidade) session.getAttribute("entidadeSelecionada");

            if (entidade == null) {
                entidade = (Entidade) session.getAttribute("entidade");
            }

            int homens = 0;
            int mulheres = 0;

            double totalFacturado = 0;
            double totalCobrado = 0;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

                inscricoes = (List<Inscricao>) session.getAttribute("inscricoes");
                turmas = (List<Turma>) session.getAttribute("turmas");
                turma = (Turma) session.getAttribute("turma");

                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();

                homens = Integer.parseInt(session.getAttribute("homens").toString());
                mulheres = Integer.parseInt(session.getAttribute("mulheres").toString());

                totalFacturado = Double.parseDouble(session.getAttribute("totalFacturado").toString());
                totalCobrado = Double.parseDouble(session.getAttribute("totalCobrado").toString());

                response.setHeader("Refresh", timeout + "; URL =VXN1YXJpb1NlcnZsZXQjRENJ?" + encryptUtils.encodeString("accao#lockscreen&user=" + encryptUtils.decodeString(usuario.getUsuaUsuario()) + "&ei=" + entidade.getEntiId()));

            }
        %>

        <!-- START NOTIFICATION -->


        <!-- /Notification JS files -->
        <script type="text/javascript" src="assets/js/plugins/notifications/jgrowl.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/notifications/sweet_alert.min.js"></script>
        <!-- /Notification JS files -->
        <script type="text/javascript" src="assets/js/plugins/visualization/echarts/echarts.js"></script>

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
                        <button type="button" onclick="history.back()" class="btn text-bold text-uppercase btn-labeled btn-labeled-left bg-danger-400 heading-btn">Voltar as turmas<b><i class="icon-table"></i></b></button>

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
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-users4 position-left"></i> Alunos da turma</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->



                    <div class = "row">

                        <%                            String decT = "---";
                            String decC = "---";
                            String decH = "---";

                            int id = -1;

                            if (turma != null) {
                                decT = encryptUtils.decodeString(turma.getTurmDescricao());
                                decC = encryptUtils.decodeString(turma.getCurso().getCursDescricao());
                                decH = encryptUtils.decodeString(turma.getTurmHorario());
                                id = turma.getTurmId();
                            }
                        %>
                        <div class="col-md-5">


                            <div class="row">
                                <!-- Basic table -->
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Detalhes da turma</h6>
                                        <div class="heading-elements">
                                            <ul class="icons-list">
                                                <li><a data-action="collapse"></a></li>
                                                <li><a data-action="reload"></a></li>

                                            </ul>
                                        </div>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <td class="text-bold">Turma: </td>
                                                    <td><%=decT%></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-bold">Classe: </td>
                                                    <td><%=decC%></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-bold">Horário: </td>
                                                    <td><%=decH%></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- /basic table -->
                            </div>

                            <div class="row">

                                <!-- Line and bar combination -->
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-uppercase text-bold">Distribuição por Genero</h6>
                                        <div class="heading-elements">
                                            <ul class="icons-list">
                                                <li><a data-action="collapse"></a></li>
                                                <li><a data-action="reload"></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <%
                                        int total = homens + mulheres;

                                        int perH = Math.round((homens * 100.0f) / total);
                                        int perM = Math.round((mulheres * 100.0f) / total);

                                        int difH = 100 - perH;
                                        int difM = 100 - perM;
                                    %>
                                    <div class="panel-body">
                                        <div class="chart-container">
                                            <div class="chart has-fixed-height has-minimum-width" id="multiple_donuts" style="height: 250px;"></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /line and bar combination -->


                            </div>


                            <div class="row">

                                <!-- Today's revenue -->
                                <div class="panel bg-orange-400">

                                    <div class="panel-heading">
                                        <h6 class="panel-title text-uppercase text-bold">Análise de Recebimentos</h6>
                                        <div class="heading-elements">
                                            <ul class="icons-list">
                                                <li><a href="VHVybWFTZXJ2bGV0I0RDSQ==?YWNjYW8jaW1wcmltaXItYWx1bm9zLXR1cm1hLTM=" target="_blank" class="btn text-bold text-uppercase bg-orange-700 btn-labeled btn-lg text-bold text-uppercase"><b><i class="icon-printer2"></i></b> Imprimir resumo</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="panel-body">

                                        <h3 class="no-margin"><%=df.format(totalFacturado)%> MT</h3>
                                        Valor total esperado
                                        <div class="text-muted text-size-small"><%=df.format(totalCobrado)%> MT, Valor total cobrado</div>
                                    </div>

                                    <div id="today-revenue"></div>
                                </div>
                                <!-- /today's revenue -->

                            </div>

                        </div>

                        <div class = "col-md-7">
                            <!-- Vertical form options -->



                            <!-- Basic responsive configuration -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Lista dos Alunos da turma <span class="text-danger">(<%=decT%>)</span></h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>
                                        </ul>
                                    </div>
                                </div>


                                <div class="panel-body">
                                    <p>

                                        <a href="VHVybWFTZXJ2bGV0I0RDSQ==?YWNjYW8jaW1wcmltaXItYWx1bm9zLXR1cm1hLTI=" target="_blank" class="btn text-bold text-uppercase bg-teal-700 btn-labeled btn-lg text-bold text-uppercase"><b><i class="icon-printer2"></i></b> Lista de alunos</a>


                                        <a href="VHVybWFTZXJ2bGV0I0RDSQ==?YWNjYW8jaW1wcmltaXItYWx1bm9zLXR1cm1h" target="_blank" class="btn text-bold text-uppercase bg-grey-700 btn-labeled btn-lg text-bold text-uppercase"><b><i class="icon-printer2"></i></b> Lista Completa</a>


                                        <a href="#"  data-toggle="modal" data-target="#modal_inscricao" class="btn bg-danger-600 btn-labeled btn-lg text-bold text-uppercase">
                                            <b><i class="icon-reading"></i></b>
                                            Inscrever Alunos
                                        </a>

                                    </p>
                                </div>

                                <%

                                    String act = encryptUtils.encodeString("accao#confirmar-inscricao");
                                %>

                                <form method="post" accept-charset="ISO-8859-1" action="VHVybWFTZXJ2bGV0I0RDSQ==?<%=act%>">

                                    <!-- Alterar plano -->
                                    <div id="modal_inscricao" class="modal fade">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                                <div class="modal-body">


                                                    <!-- 2 columns form -->

                                                    <div class="panel panel-flat">
                                                        <div class="panel-heading">
                                                            <h6 class="panel-title text-uppercase text-bold text-bold">Inscrever estudante em uma nova turma</h6>

                                                        </div>

                                                        <div class="panel-body">
                                                            <div class="row">


                                                                <div class="col-md-12">



                                                                    <fieldset>
                                                                        <legend class="text-semibold"><i class="icon-clipboard2 position-left"></i> Inscrição</legend>

                                                                        <div class="form-group">
                                                                            <label class="col-lg-3 control-label">Data:</label>
                                                                            <div class="col-lg-9">
                                                                                <div class="row">
                                                                                    <div class="col-md-5">
                                                                                        <input type="text" placeholder="Data da inscrição" class="form-control mb-15  daterange-single" name="dataMensalidade">
                                                                                    </div>

                                                                                    <div class="col-md-7">
                                                                                        <select data-placeholder="Selecione a turma" class="select" name="idTurma" required="">
                                                                                            <option></option>
                                                                                            <%
                                                                                                if (turmas != null) {
                                                                                                    for (Turma t : turmas) {

                                                                                                        int idT = t.getTurmId();

                                                                                                        String desc = encryptUtils.decodeString(t.getTurmDescricao()) + "|" + encryptUtils.decodeString(t.getCurso().getCursDescricao()) + "|" + encryptUtils.decodeString(t.getTurmHorario());

                                                                                                        String sel = "";

                                                                                            %>
                                                                                            <option value="<%=idT%>" <%=sel%> class="text-bold"><%=desc%></option> 
                                                                                            <%
                                                                                                    }
                                                                                                }
                                                                                            %>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>


                                                                    </fieldset>
                                                                </div>

                                                            </div>

                                                            <div class="text-right">
                                                                <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800">Actualizar Info <i class="icon-reload-alt position-right"></i></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /2 columns form -->
                                                </div>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn text-bold text-uppercase btn-danger" data-dismiss="modal"><i class="icon-chevron-down"></i>  Fechar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /alterar plano -->


                                    <table class="table datatable-responsive">
                                        <thead>
                                            <tr>
                                                <th class="text-bold text-uppercase"><input type="checkbox" class="styled"></th>
                                                <th class="text-bold text-uppercase">#</th>
                                                <th class="text-bold text-uppercase">COD</th>
                                                <th class="text-bold text-uppercase">Nome</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                if (inscricoes != null) {
                                                    int x = 0;
                                                    for (Inscricao i : inscricoes) {

                                                        x++;

                                                        String ref = encryptUtils.decodeString(i.getAluno().getAlunBadgnumber());
                                                        String nom = encryptUtils.decodeString(i.getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(i.getAluno().getPessoa().getPessApelido());

                                                        int idA = i.getInscId();
                                            %>
                                            <tr>
                                                <td><input type="checkbox" name="noty_list" value="<%=idA%>" class="styled"></td>
                                                <td><a href="#"><%=x%></a></td>
                                                <td><a href="#"><%=ref%></a></td>
                                                <td><%=nom%></td>


                                            </tr>

                                            <%
                                                    }
                                                }
                                            %>
                                        </tbody>
                                    </table>

                                </form>
                            </div>
                            <!-- /basic responsive configuration -->



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





        <script>

            /* ------------------------------------------------------------------------------
             *
             *  # Echarts - pies and donuts
             *
             *  Pies and donuts chart configurations
             *
             *  Version: 1.0
             *  Latest update: August 1, 2015
             *
             * ---------------------------------------------------------------------------- */

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
                        [
                            'echarts',
                            'echarts/theme/limitless',
                            'echarts/chart/pie',
                            'echarts/chart/funnel'
                        ],
                        // Charts setup
                                function (ec, limitless) {


                                    // Initialize charts
                                    // ------------------------------


                                    var multiple_donuts = ec.init(document.getElementById('multiple_donuts'), limitless);

                                    // Charts setup
                                    // ------------------------------                    
                                    //
                                    // Multiple donuts options
                                    //

                                    // Top text label
                                    var labelTop = {
                                        normal: {
                                            label: {
                                                show: true,
                                                position: 'center',
                                                formatter: '{b}\n',
                                                textStyle: {
                                                    baseline: 'middle',
                                                    fontWeight: 300,
                                                    fontSize: 15
                                                }
                                            },
                                            labelLine: {
                                                show: false
                                            }
                                        }
                                    };

                                    // Format bottom label
                                    var labelFromatter = {
                                        normal: {
                                            label: {
                                                formatter: function (params) {
                                                    return '\n\n' + (100 - params.value) + '%'
                                                }
                                            }
                                        }
                                    }

                                    // Bottom text label
                                    var labelBottom = {
                                        normal: {
                                            color: '#eee',
                                            label: {
                                                show: true,
                                                position: 'center',
                                                textStyle: {
                                                    baseline: 'middle'
                                                }
                                            },
                                            labelLine: {
                                                show: false
                                            }
                                        },
                                        emphasis: {
                                            color: 'rgba(0,0,0,0)'
                                        }
                                    };

                                    // Set inner and outer radius
                                    var radius = [60, 75];

                                    // Add options
                                    multiple_donuts_options = {

                                        // Add legend
                                        legend: {
                                            x: 'left',
                                            y: '80%',
                                            data: ['Homens', 'Mulheres']
                                        },

                                        // Add series
                                        series: [
                                            {
                                                type: 'pie',
                                                center: ['20%', '32.5%'],
                                                radius: radius,
                                                itemStyle: labelFromatter,
                                                data: [
                                                    {name: 'other', value: <%=difH%>, itemStyle: labelBottom},
                                                    {name: 'Homens', value: <%=perH%>, itemStyle: labelTop}
                                                ]
                                            },
                                            {
                                                type: 'pie',
                                                center: ['55%', '32.5%'],
                                                radius: radius,
                                                itemStyle: labelFromatter,
                                                data: [
                                                    {name: 'other', value: <%=difM%>, itemStyle: labelBottom},
                                                    {name: 'Mulheres', value: <%=perM%>, itemStyle: labelTop}
                                                ]
                                            }
                                        ]
                                    };


                                    // Apply options
                                    // ------------------------------

                                    multiple_donuts.setOption(multiple_donuts_options);


                                    // Resize charts
                                    // ------------------------------

                                    window.onresize = function () {
                                        setTimeout(function () {
                                            multiple_donuts.resize();
                                        }, 200);
                                    };
                                }
                        );
                    });


        </script>


        <script>

            // Daily revenue line chart
            // ------------------------------

            dailyRevenue('#today-revenue', 50); // initialize chart

            // Chart setup
            function dailyRevenue(element, height) {


                // Basic setup
                // ------------------------------

                // Add data set
                var dataset = [
                    {
                        "date": "04/13/14",
                        "alpha": "60"
                    }, {
                        "date": "04/14/14",
                        "alpha": "35"
                    }, {
                        "date": "04/15/14",
                        "alpha": "65"
                    }, {
                        "date": "04/16/14",
                        "alpha": "50"
                    }, {
                        "date": "04/17/14",
                        "alpha": "65"
                    }, {
                        "date": "04/18/14",
                        "alpha": "20"
                    }, {
                        "date": "04/19/14",
                        "alpha": "60"
                    }
                ];

                // Main variables
                var d3Container = d3.select(element),
                        margin = {top: 0, right: 0, bottom: 0, left: 0},
                        width = d3Container.node().getBoundingClientRect().width - margin.left - margin.right,
                        height = height - margin.top - margin.bottom,
                        padding = 20;

                // Format date
                var parseDate = d3.time.format("%m/%d/%y").parse,
                        formatDate = d3.time.format("%a, %B %e");



                // Add tooltip
                // ------------------------------

                var tooltip = d3.tip()
                        .attr('class', 'd3-tip')
                        .html(function (d) {
                            return "<ul class='list-unstyled mb-5'>" +
                                    "<li>" + "<div class='text-size-base mt-5 mb-5'><i class='icon-check2 position-left'></i>" + formatDate(d.date) + "</div>" + "</li>" +
                                    "<li>" + "Sales: &nbsp;" + "<span class='text-semibold pull-right'>" + d.alpha + "</span>" + "</li>" +
                                    "<li>" + "Revenue: &nbsp; " + "<span class='text-semibold pull-right'>" + "$" + (d.alpha * 25).toFixed(2) + "</span>" + "</li>" +
                                    "</ul>";
                        });



                // Create chart
                // ------------------------------

                // Add svg element
                var container = d3Container.append('svg');

                // Add SVG group
                var svg = container
                        .attr('width', width + margin.left + margin.right)
                        .attr('height', height + margin.top + margin.bottom)
                        .append("g")
                        .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
                        .call(tooltip);



                // Load data
                // ------------------------------

                dataset.forEach(function (d) {
                    d.date = parseDate(d.date);
                    d.alpha = +d.alpha;
                });



                // Construct scales
                // ------------------------------

                // Horizontal
                var x = d3.time.scale()
                        .range([padding, width - padding]);

                // Vertical
                var y = d3.scale.linear()
                        .range([height, 5]);



                // Set input domains
                // ------------------------------

                // Horizontal
                x.domain(d3.extent(dataset, function (d) {
                    return d.date;
                }));

                // Vertical
                y.domain([0, d3.max(dataset, function (d) {
                        return Math.max(d.alpha);
                    })]);



                // Construct chart layout
                // ------------------------------

                // Line
                var line = d3.svg.line()
                        .x(function (d) {
                            return x(d.date);
                        })
                        .y(function (d) {
                            return y(d.alpha)
                        });



                //
                // Append chart elements
                //

                // Add mask for animation
                // ------------------------------

                // Add clip path
                var clip = svg.append("defs")
                        .append("clipPath")
                        .attr("id", "clip-line-small");

                // Add clip shape
                var clipRect = clip.append("rect")
                        .attr('class', 'clip')
                        .attr("width", 0)
                        .attr("height", height);

                // Animate mask
                clipRect
                        .transition()
                        .duration(1000)
                        .ease('linear')
                        .attr("width", width);



                // Line
                // ------------------------------

                // Path
                var path = svg.append('path')
                        .attr({
                            'd': line(dataset),
                            "clip-path": "url(#clip-line-small)",
                            'class': 'd3-line d3-line-medium'
                        })
                        .style('stroke', '#fff');

                // Animate path
                svg.select('.line-tickets')
                        .transition()
                        .duration(1000)
                        .ease('linear');



                // Add vertical guide lines
                // ------------------------------

                // Bind data
                var guide = svg.append('g')
                        .selectAll('.d3-line-guides-group')
                        .data(dataset);

                // Append lines
                guide
                        .enter()
                        .append('line')
                        .attr('class', 'd3-line-guides')
                        .attr('x1', function (d, i) {
                            return x(d.date);
                        })
                        .attr('y1', function (d, i) {
                            return height;
                        })
                        .attr('x2', function (d, i) {
                            return x(d.date);
                        })
                        .attr('y2', function (d, i) {
                            return height;
                        })
                        .style('stroke', 'rgba(255,255,255,0.3)')
                        .style('stroke-dasharray', '4,2')
                        .style('shape-rendering', 'crispEdges');

                // Animate guide lines
                guide
                        .transition()
                        .duration(1000)
                        .delay(function (d, i) {
                            return i * 150;
                        })
                        .attr('y2', function (d, i) {
                            return y(d.alpha);
                        });



                // Alpha app points
                // ------------------------------

                // Add points
                var points = svg.insert('g')
                        .selectAll('.d3-line-circle')
                        .data(dataset)
                        .enter()
                        .append('circle')
                        .attr('class', 'd3-line-circle d3-line-circle-medium')
                        .attr("cx", line.x())
                        .attr("cy", line.y())
                        .attr("r", 3)
                        .style('stroke', '#fff')
                        .style('fill', '#29B6F6');



                // Animate points on page load
                points
                        .style('opacity', 0)
                        .transition()
                        .duration(250)
                        .ease('linear')
                        .delay(1000)
                        .style('opacity', 1);


                // Add user interaction
                points
                        .on("mouseover", function (d) {
                            tooltip.offset([-10, 0]).show(d);

                            // Animate circle radius
                            d3.select(this).transition().duration(250).attr('r', 4);
                        })

                        // Hide tooltip
                        .on("mouseout", function (d) {
                            tooltip.hide(d);

                            // Animate circle radius
                            d3.select(this).transition().duration(250).attr('r', 3);
                        });

                // Change tooltip direction of first point
                d3.select(points[0][0])
                        .on("mouseover", function (d) {
                            tooltip.offset([0, 10]).direction('e').show(d);

                            // Animate circle radius
                            d3.select(this).transition().duration(250).attr('r', 4);
                        })
                        .on("mouseout", function (d) {
                            tooltip.direction('n').hide(d);

                            // Animate circle radius
                            d3.select(this).transition().duration(250).attr('r', 3);
                        });

                // Change tooltip direction of last point
                d3.select(points[0][points.size() - 1])
                        .on("mouseover", function (d) {
                            tooltip.offset([0, -10]).direction('w').show(d);

                            // Animate circle radius
                            d3.select(this).transition().duration(250).attr('r', 4);
                        })
                        .on("mouseout", function (d) {
                            tooltip.direction('n').hide(d);

                            // Animate circle radius
                            d3.select(this).transition().duration(250).attr('r', 3);
                        })



                // Resize chart
                // ------------------------------

                // Call function on window resize
                $(window).on('resize', revenueResize);

                // Call function on sidebar width change
                $('.sidebar-control').on('click', revenueResize);

                // Resize function
                // 
                // Since D3 doesn't support SVG resize by default,
                // we need to manually specify parts of the graph that need to 
                // be updated on window resize
                function revenueResize() {

                    // Layout variables
                    width = d3Container.node().getBoundingClientRect().width - margin.left - margin.right;


                    // Layout
                    // -------------------------

                    // Main svg width
                    container.attr("width", width + margin.left + margin.right);

                    // Width of appended group
                    svg.attr("width", width + margin.left + margin.right);

                    // Horizontal range
                    x.range([padding, width - padding]);


                    // Chart elements
                    // -------------------------

                    // Mask
                    clipRect.attr("width", width);

                    // Line path
                    svg.selectAll('.d3-line').attr("d", line(dataset));

                    // Circles
                    svg.selectAll('.d3-line-circle').attr("cx", line.x());

                    // Guide lines
                    svg.selectAll('.d3-line-guides')
                            .attr('x1', function (d, i) {
                                return x(d.date);
                            })
                            .attr('x2', function (d, i) {
                                return x(d.date);
                            });
                }
            }

        </script>

        <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>
    </body>
</html>
