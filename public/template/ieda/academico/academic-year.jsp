<%-- 
    Document   : academic-year
    Created on : Sep 14, 2017, 12:26:26 PM
    Author     : hamil
--%>

<%@page import="com.dciapps.webclient.Vagas"%>
<%@page import="com.dciapps.webclient.AnoLectivo"%>
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
        <title>SEGIA -  Vagas</title>

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
            DecimalFormat df = new DecimalFormat("#,###,##0");
            EncryptUtils encryptUtils = new EncryptUtils();
            
            List<Vagas> vagas = null;

            AnoLectivo anoLectivo = null;

            String msgErro = "";
            String alerta = "";

            ModulosUsuario mu = null;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = encryptUtils.decodeString(usuario.getPessoapess().getPessActividade());

                anoLectivo = (AnoLectivo) session.getAttribute("anoLectivoActivo");
                
                vagas = (List<Vagas>) session.getAttribute("vagas");
                
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
                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn btn-labeled btn-labeled-left bg-danger-400 heading-btn text-bold text-uppercase">Voltar ao painel principal<b><i class="icon-chevron-left"></i></b></button>
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
                            <ul class="nav navbar-nav element-active-orange-400">
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-list-numbered position-left"></i> Vagas</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->



                    <!-- User profile -->
                    <div class="row">

                        <div class="col-md-7 col-md-offset-2">



                            <%
                                String an = "";

                                if (anoLectivo != null) {
                                    an = encryptUtils.decodeString(anoLectivo.getAnolDescricao());
                                }
                            %>


                            <!-- Basic responsive configuration -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">

                                    <h6 class="panel-title text-bold text-uppercase">Vagas do Ano Lectivo  <span class="text-danger-600">[<%=an%>]</h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>
                                        </ul>
                                    </div>
                                </div>

                                <table class="table datatable-responsive" width="100%">
                                    <thead>
                                        <tr>
                                            <th class="text-bold text-uppercase">Classe</th>
                                            <th class="text-bold text-uppercase text-right">Total</th>
                                            <th class="text-bold text-uppercase text-right">Preenchidas</th>
                                            <th class="text-bold text-uppercase text-danger-600">---</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            if (vagas != null) {
                                                for (Vagas v: vagas) {
                                                    int id = v.getVagaId();
                                                    String s1 = encryptUtils.decodeString(v.getCurso().getCursDescricao());
                                                    
 
                                                    String n1 = v.getVagaTotal()+"";
                                                    String n2 = df.format(v.getVagaPreechidas());


                                                    String actN = encryptUtils.encodeString("accao#actualizar-vagas&vi=" + id);

                                        %>
                                        <tr>
                                            <td><%=s1%></td>

                                    <form method="post" accept-charset="ISO-8859-1" action="QW5vTGVjdGl2b1NlcnZsZXQjRENJ?<%=actN%>">

                                        <td>

                                            <input type="number" step="any" class="form-control" placeholder="Total" name="nr" required="" value="<%=n1%>">


                                        </td>
                                        
                                        <td class="text-bold text-danger-600 text-right"><%=n2%></td>
                                        
                                        <td>

                                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-slate-800 text-bold text-uppercase">
                                                <b><i class="icon-reload-alt position-right"></i> act</b> 

                                            </button>

                                        </td>
                                    </form>
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
                    <!-- /row.2 -->

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

        <script type="text/javascript">

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

                                        // Add title
                                        title: {
                                            text: 'PERCENTAGENS DAS AVALIAÇÕES',
                                            subtext: 'Defina a percentagem de cada avaliação',
                                            x: 'center'
                                        },

                                        // Add legend
                                        legend: {
                                            x: 'center',
                                            y: '56%',
                                            data: ['Teste 1', 'Teste 2', 'Teste 3', 'Teste 4']
                                        },

                                        // Add series
                                        series: [
                                            {
                                                type: 'pie',
                                                center: ['10%', '32.5%'],
                                                radius: radius,
                                                itemStyle: labelFromatter,
                                                data: [
                                                    {name: 'other', value: 46, itemStyle: labelBottom},
                                                    {name: 'Teste 1', value: 54, itemStyle: labelTop}
                                                ]
                                            },
                                            {
                                                type: 'pie',
                                                center: ['30%', '32.5%'],
                                                radius: radius,
                                                itemStyle: labelFromatter,
                                                data: [
                                                    {name: 'other', value: 56, itemStyle: labelBottom},
                                                    {name: 'Teste 2', value: 44, itemStyle: labelTop}
                                                ]
                                            },
                                            {
                                                type: 'pie',
                                                center: ['50%', '32.5%'],
                                                radius: radius,
                                                itemStyle: labelFromatter,
                                                data: [
                                                    {name: 'other', value: 65, itemStyle: labelBottom},
                                                    {name: 'Teste 3', value: 35, itemStyle: labelTop}
                                                ]
                                            },
                                            {
                                                type: 'pie',
                                                center: ['70%', '32.5%'],
                                                radius: radius,
                                                itemStyle: labelFromatter,
                                                data: [
                                                    {name: 'other', value: 70, itemStyle: labelBottom},
                                                    {name: 'Teste 4', value: 30, itemStyle: labelTop}
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
        <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>

    </body>
</html>
