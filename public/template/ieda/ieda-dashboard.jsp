<%-- 
    Document   : ee-dashboard
    Created on : Nov 2, 2018, 10:43:21 AM
    Author     : hamil
--%>

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
        <title>SEGIA - Dashboard (Ensino a Distância)</title>


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
        <script type="text/javascript" src="assets/js/plugins/pickers/pickadate/picker.date.js"></script>

        <script type="text/javascript" src="assets/js/core/app.js"></script>



        <script type="text/javascript" src="assets/js/pages/form_layouts.js"></script>
        <script type="text/javascript" src="assets/js/pages/datatables_responsive.js"></script>
        <!-- /theme JS files -->

        <!-- START NOTIFICATION -->


        <!-- /Notification JS files -->
        <script type="text/javascript" src="assets/js/plugins/notifications/jgrowl.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/notifications/sweet_alert.min.js"></script>
        <script type="text/javascript" src="assets/js/pages/components_popups.js"></script>
        <!-- /Notification JS files -->
        <!-- velocity animation menu -->
        <script type="text/javascript" src="assets/js/plugins/visualization/echarts/echarts.js"></script>


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

            ModulosUsuario mu = null;

            String lblFaltas = "";
            String lblPeriodos = "";
            String lblAprovacoes = "";
            String lblReprovacoes = "";
            String lblDesvio = "";
            String lblAnalise = "";

            int numEstudantes = 0;
            int numDocentes = 0;
            int numCursos = 0;
            int numDisciplinas = 0;
            int numTurmas = 0;

            int pAprovacoes = 0;
            int pAprovacoesAno = 0;

            List<Curso> cursosRanking = null;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

                if (session.getAttribute("pAprovacoes") != null) {
                    pAprovacoes = Integer.parseInt(session.getAttribute("pAprovacoes").toString());
                }

                if (session.getAttribute("pAprovacoesAno") != null) {
                    pAprovacoesAno = Integer.parseInt(session.getAttribute("pAprovacoesAno").toString());
                }

                if (session.getAttribute("numEstudantes") != null) {
                    numEstudantes = Integer.parseInt(session.getAttribute("numEstudantes").toString());
                }

                if (session.getAttribute("numDocentes") != null) {
                    numDocentes = Integer.parseInt(session.getAttribute("numDocentes").toString());
                }

                if (session.getAttribute("numCursos") != null) {
                    numCursos = Integer.parseInt(session.getAttribute("numCursos").toString());
                }

                if (session.getAttribute("numDisciplinas") != null) {
                    numDisciplinas = Integer.parseInt(session.getAttribute("numDisciplinas").toString());
                }

                if (session.getAttribute("numTurmas") != null) {
                    numTurmas = Integer.parseInt(session.getAttribute("numTurmas").toString());
                }

                if (session.getAttribute("lblFaltas") != null) {
                    lblFaltas = session.getAttribute("lblFaltas").toString();
                }

                if (session.getAttribute("lblPeriodos") != null) {
                    lblPeriodos = session.getAttribute("lblPeriodos").toString();
                }

                if (session.getAttribute("lblAprovacoes") != null) {
                    lblAprovacoes = session.getAttribute("lblAprovacoes").toString();
                }

                if (session.getAttribute("lblReprovacoes") != null) {
                    lblReprovacoes = session.getAttribute("lblReprovacoes").toString();
                }

                if (session.getAttribute("lblDesvio") != null) {
                    lblDesvio = session.getAttribute("lblDesvio").toString();
                }

                if (session.getAttribute("lblAnalise") != null) {
                    lblAnalise = session.getAttribute("lblAnalise").toString();
                }

                cursosRanking = (List<Curso>) session.getAttribute("cursosRanking");

                response.setHeader("Refresh", timeout + "; URL =VXN1YXJpb1NlcnZsZXQjRENJ?" + encryptUtils.encodeString("accao#lockscreen&user=" + encryptUtils.decodeString(usuario.getUsuaUsuario())));

            }
        %>

    </head>

    <body oncontextmenu="return false">


        <!-- Main navbar -->
        <%@ include file="navebar.jsp" %> 
        <!-- /main navbar -->

        <!-- Page header -->
        <%@ include file="header.jsp" %> 
        <!-- /page header -->

        <%@ include file="menu.jsp" %>  


        <%                    String ano = session.getAttribute("ano").toString();
        %>


        <!-- Main content -->
        <div class="content-wrapper">

            <!-- Toolbar -->
            <div class="navbar navbar-default navbar-component navbar-xs">
                <ul class="nav navbar-nav visible-xs-block">
                    <li class="full-width text-center"><a data-toggle="collapse" data-target="#navbar-filter"><i class="icon-menu7"></i></a></li>
                </ul>

                <div class="navbar-collapse collapse" id="navbar-filter">
                    <ul class="nav navbar-nav element-active-orange-400">
                        <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-pencil6 position-left"></i> Gestão de Ensino a Distância  <span class="text-danger-400"> (Painel Principal)</span> </a></li>
                    </ul>

                </div>
            </div>
            <!-- /toolbar -->

<!-- Main charts -->
                    <div class="row">
                        <div class="col-lg-10">

                            <!-- Error wrapper -->
                            <div class="container-fluid text-center">
                                <h1 class="error-title text-center">

                                    <center>
                                        <img src="http://<%=ip%>:8081/suc/images/app-icons/governo.png" alt="" class="img-responsive" style="width:50%; max-width: 150px;">

                                    </center>

                                </h1>
                                <h6 class="text-bold content-group text-grey-800">
                                    REPÚBLICA DE MOÇAMBIQUE<br>
                                    MINISTÉRIO DA EDUCAÇÃO E DESENVOLVIMENTO HUMANO
                                </h6>

                                <div class="row">
                                    <div class="col-lg-4 col-lg-offset-4 col-sm-6 col-sm-offset-3">
                                        <form  class="main-search">

                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <button class="btn text-bold text-uppercase bg-slate-600 btn-block content-group">Gestão de Informação Académica Escolar</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- /error wrapper -->
                        </div>
                    </div>
                    <!-- /main charts -->



        </div>
        <!-- /content area -->

    </div>
    <!-- /main content -->



    <!-- Footer -->
    <div class="footer text-bold">
        &copy;
        <%=ano%>. <a href="#" class="text-bold">SEGIA</a>. Todos os direitos reservados
    </div>
    <!-- /footer -->


</div>
<!-- /page content -->
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



                                    // Charts options
                                    // ------------------------------


                                    //
                                    // Ligações Existentes e Activas 
                                    //

                                    line_bar_options1 = {

                                        // Setup grid
                                        grid: {
                                            x: 55,
                                            x2: 45,
                                            y: 35,
                                            y2: 25
                                        },

                                        // Add tooltip
                                        tooltip: {
                                            trigger: 'axis'
                                        },

                                        // Enable drag recalculate
                                        calculable: true,

                                        // Add legend
                                        legend: {
                                            data: ['Aprovações', 'Reprovações', 'Desvio']
                                        },
                                        // Add custom colors
                                        color: ['#26A69A', '#D81B60', '#FF9800'],

                                        // Horizontal axis
                                        xAxis: [{
                                                type: 'category',
                                                data: [<%=lblPeriodos%>]
                                            }],

                                        // Vertical axis
                                        yAxis: [{
                                                type: 'value',
                                                name: 'Nº',
                                                axisLabel: {
                                                    formatter: '{value}'
                                                }
                                            }, {
                                                type: 'value',
                                                name: 'Índice',
                                                axisLabel: {
                                                    formatter: '{value} %'
                                                }
                                            }],

                                        // Add series
                                        series: [{
                                                name: 'Aprovações',
                                                type: 'bar',
                                                data: [<%=lblAprovacoes%>]
                                            }, {
                                                name: 'Reprovações',
                                                type: 'bar',
                                                data: [<%=lblReprovacoes%>]
                                            }, {
                                                name: 'Desvio',
                                                type: 'line',
                                                yAxisIndex: 1,
                                                data: [<%=lblDesvio%>]
                                            }]
                                    };


                                    // Apply options
                                    // ------------------------------

                                    line_bar1.setOption(line_bar_options1);


                                    // Resize charts
                                    // ------------------------------

                                    window.onresize = function () {
                                        setTimeout(function () {
                                            line_bar1.resize();
                                        }, 200);
                                    };
                                }
                        );
                    });
</script>

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

                                            var line_bar4 = ec.init(document.getElementById('line_bar4'), limitless);



                                            // Charts options
                                            // ------------------------------
                                            //
                                            // Género
                                            //
                                            line_bar_options4 = {

                                                // Add legend
                                                legend: {
                                                    orient: 'vertical',
                                                    x: 'left',
                                                    data: ['Aprovados (Exame)', 'Aprovados (Dispensa)', 'Reprovados', 'Excluídos']
                                                },

                                                // Display toolbox
                                                toolbox: {
                                                    show: true,
                                                    orient: 'vertical'
                                                },
                                                // Add custom colors
                                                color: ['#00796B', '#689F38', '#EF6C00', '#D32F2F'],

                                                // Enable drag recalculate
                                                calculable: true,

                                                // Add series
                                                series: [{
                                                        name: 'Caixas',
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

                                                        data: [<%=lblAnalise%>]
                                                    }]
                                            };





                                            // Apply options
                                            // ------------------------------

                                            line_bar4.setOption(line_bar_options4);


                                            // Resize charts
                                            // ------------------------------

                                            window.onresize = function () {
                                                setTimeout(function () {
                                                    line_bar4.resize();
                                                }, 200);
                                            };
                                        }
                                );
                            });
</script>



<script>
                    /* ------------------------------------------------------------------------------
                     *
                     *  # Echarts - lines and areas
                     *
                     *  Lines and areas chart configurations
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
                                    'echarts/chart/bar',
                                    'echarts/chart/line'
                                ],
                                // Charts setup
                                        function (ec, limitless) {


                                            // Initialize charts
                                            // ------------------------------

                                            var basic_lines = ec.init(document.getElementById('basic_lines'), limitless);



                                            // Charts setup
                                            // ------------------------------

                                            //
                                            // Basic lines options
                                            //

                                            basic_lines_options = {

                                                // Setup grid
                                                grid: {
                                                    x: 40,
                                                    x2: 40,
                                                    y: 35,
                                                    y2: 25
                                                },

                                                // Add tooltip
                                                tooltip: {
                                                    trigger: 'axis'
                                                },

                                                // Add legend
                                                legend: {
                                                    data: ['Maximum']
                                                },

                                                // Add custom colors
                                                color: ['#EF5350'],

                                                // Enable drag recalculate
                                                calculable: true,

                                                // Horizontal axis
                                                xAxis: [{
                                                        type: 'category',
                                                        boundaryGap: false,
                                                        data: [<%=lblPeriodos%>]
                                                    }],

                                                // Vertical axis
                                                yAxis: [{
                                                        type: 'value',
                                                        axisLabel: {
                                                            formatter: '{value}'
                                                        }
                                                    }],

                                                // Add series
                                                series: [{
                                                        name: 'Maximum',
                                                        type: 'line',
                                                        data: [<%=lblFaltas%>],
                                                        markLine: {
                                                            data: [{
                                                                    type: 'average',
                                                                    name: 'Average'
                                                                }]
                                                        }
                                                    }]
                                            };


                                            // Apply options
                                            // ------------------------------

                                            basic_lines.setOption(basic_lines_options);



                                            // Resize charts
                                            // ------------------------------

                                            window.onresize = function () {
                                                setTimeout(function () {
                                                    basic_lines.resize();
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
                        var dataset = [{
                                "date": "04/13/18",
                                "alpha": "60"
                            }, {
                                "date": "04/14/18",
                                "alpha": "35"
                            }, {
                                "date": "04/15/18",
                                "alpha": "65"
                            }, {
                                "date": "04/16/18",
                                "alpha": "50"
                            }, {
                                "date": "04/17/18",
                                "alpha": "65"
                            }, {
                                "date": "04/18/18",
                                "alpha": "20"
                            }, {
                                "date": "04/19/18",
                                "alpha": "60"
                            }];

                        // Main variables
                        var d3Container = d3.select(element),
                                margin = {
                                    top: 0,
                                    right: 0,
                                    bottom: 0,
                                    left: 0
                                },
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
                                    return y(d.alpha);
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
                                });



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



                    sparkline("#server-load", "area", 30, 50, "basis", 750, 2000, "rgba(255,255,255,0.5)");


                    // Chart setup
                    function sparkline(element, chartType, qty, height, interpolation, duration, interval, color) {


                        // Basic setup
                        // ------------------------------

                        // Define main variables
                        var d3Container = d3.select(element),
                                margin = {
                                    top: 0,
                                    right: 0,
                                    bottom: 0,
                                    left: 0
                                },
                                width = d3Container.node().getBoundingClientRect().width - margin.left - margin.right,
                                height = height - margin.top - margin.bottom;


                        // Generate random data (for demo only)
                        var data = [];
                        for (var i = 0; i < qty; i++) {
                            data.push(Math.floor(Math.random() * qty) + 5);
                        }



                        // Construct scales
                        // ------------------------------

                        // Horizontal
                        var x = d3.scale.linear().range([0, width]);

                        // Vertical
                        var y = d3.scale.linear().range([height - 5, 5]);



                        // Set input domains
                        // ------------------------------

                        // Horizontal
                        x.domain([1, qty - 3]);

                        // Vertical
                        y.domain([0, qty]);



                        // Construct chart layout
                        // ------------------------------

                        // Line
                        var line = d3.svg.line()
                                .interpolate(interpolation)
                                .x(function (d, i) {
                                    return x(i);
                                })
                                .y(function (d, i) {
                                    return y(d);
                                });

                        // Area
                        var area = d3.svg.area()
                                .interpolate(interpolation)
                                .x(function (d, i) {
                                    return x(i);
                                })
                                .y0(height)
                                .y1(function (d) {
                                    return y(d);
                                });



                        // Create SVG
                        // ------------------------------

                        // Container
                        var container = d3Container.append('svg');

                        // SVG element
                        var svg = container
                                .attr('width', width + margin.left + margin.right)
                                .attr('height', height + margin.top + margin.bottom)
                                .append("g")
                                .attr("transform", "translate(" + margin.left + "," + margin.top + ")");



                        // Add mask for animation
                        // ------------------------------

                        // Add clip path
                        var clip = svg.append("defs")
                                .append("clipPath")
                                .attr('id', function (d, i) {
                                    return "load-clip-" + element.substring(1);
                                });

                        // Add clip shape
                        var clips = clip.append("rect")
                                .attr('class', 'load-clip')
                                .attr("width", 0)
                                .attr("height", height);

                        // Animate mask
                        clips
                                .transition()
                                .duration(1000)
                                .ease('linear')
                                .attr("width", width);



                        //
                        // Append chart elements
                        //

                        // Main path
                        var path = svg.append("g")
                                .attr("clip-path", function (d, i) {
                                    return "url(#load-clip-" + element.substring(1) + ")";
                                })
                                .append("path")
                                .datum(data)
                                .attr("transform", "translate(" + x(0) + ",0)");

                        // Add path based on chart type
                        if (chartType === "area") {
                            path.attr("d", area).attr('class', 'd3-area').style("fill", color); // area
                        } else {
                            path.attr("d", line).attr("class", "d3-line d3-line-medium").style('stroke', color); // line
                        }

                        // Animate path
                        path
                                .style('opacity', 0)
                                .transition()
                                .duration(750)
                                .style('opacity', 1);



                        // Set update interval. For demo only
                        // ------------------------------

                        setInterval(function () {

                            // push a new data point onto the back
                            data.push(Math.floor(Math.random() * qty) + 5);

                            // pop the old data point off the front
                            data.shift();

                            update();

                        }, interval);



                        // Update random data. For demo only
                        // ------------------------------

                        function update() {

                            // Redraw the path and slide it to the left
                            path
                                    .attr("transform", null)
                                    .transition()
                                    .duration(duration)
                                    .ease("linear")
                                    .attr("transform", "translate(" + x(0) + ",0)");

                            // Update path type
                            if (chartType === "area") {
                                path.attr("d", area).attr('class', 'd3-area').style("fill", color);
                            } else {
                                path.attr("d", line).attr("class", "d3-line d3-line-medium").style('stroke', color);
                            }
                        }



                        // Resize chart
                        // ------------------------------

                        // Call function on window resize
                        $(window).on('resize', resizeSparklines);

                        // Call function on sidebar width change
                        $('.sidebar-control').on('click', resizeSparklines);

                        // Resize function
                        // 
                        // Since D3 doesn't support SVG resize by default,
                        // we need to manually specify parts of the graph that need to 
                        // be updated on window resize
                        function resizeSparklines() {

                            // Layout variables
                            width = d3Container.node().getBoundingClientRect().width - margin.left - margin.right;


                            // Layout
                            // -------------------------

                            // Main svg width
                            container.attr("width", width + margin.left + margin.right);

                            // Width of appended group
                            svg.attr("width", width + margin.left + margin.right);

                            // Horizontal range
                            x.range([0, width]);


                            // Chart elements
                            // -------------------------

                            // Clip mask
                            clips.attr("width", width);

                            // Line
                            svg.select(".d3-line").attr("d", line);

                            // Area
                            svg.select(".d3-area").attr("d", area);
                        }
                    }



                    generateBarChart("#members-online", 24, 50, true, "elastic", 1200, 50, "rgba(255,255,255,0.5)", "members");

                    // Chart setup
                    function generateBarChart(element, barQty, height, animate, easing, duration, delay, color, tooltip) {


                        // Basic setup
                        // ------------------------------

                        // Add data set
                        var bardata = [];
                        for (var i = 0; i < barQty; i++) {
                            bardata.push(Math.round(Math.random() * 10) + 10);
                        }

                        // Main variables
                        var d3Container = d3.select(element),
                                width = d3Container.node().getBoundingClientRect().width;



                        // Construct scales
                        // ------------------------------

                        // Horizontal
                        var x = d3.scale.ordinal()
                                .rangeBands([0, width], 0.3);

                        // Vertical
                        var y = d3.scale.linear()
                                .range([0, height]);



                        // Set input domains
                        // ------------------------------

                        // Horizontal
                        x.domain(d3.range(0, bardata.length));

                        // Vertical
                        y.domain([0, d3.max(bardata)]);



                        // Create chart
                        // ------------------------------

                        // Add svg element
                        var container = d3Container.append('svg');

                        // Add SVG group
                        var svg = container
                                .attr('width', width)
                                .attr('height', height)
                                .append('g');



                        //
                        // Append chart elements
                        //

                        // Bars
                        var bars = svg.selectAll('rect')
                                .data(bardata)
                                .enter()
                                .append('rect')
                                .attr('class', 'd3-random-bars')
                                .attr('width', x.rangeBand())
                                .attr('x', function (d, i) {
                                    return x(i);
                                })
                                .style('fill', color);



                        // Tooltip
                        // ------------------------------

                        var tip = d3.tip()
                                .attr('class', 'd3-tip')
                                .offset([-10, 0]);

                        // Show and hide
                        if (tooltip === "hours" || tooltip === "goal" || tooltip === "members") {
                            bars.call(tip)
                                    .on('mouseover', tip.show)
                                    .on('mouseout', tip.hide);
                        }

                        // Daily meetings tooltip content
                        if (tooltip === "hours") {
                            tip.html(function (d, i) {
                                return "<div class='text-center'>" +
                                        "<h6 class='no-margin'>" + d + "</h6>" +
                                        "<span class='text-size-small'>meetings</span>" +
                                        "<div class='text-size-small'>" + i + ":00" + "</div>" +
                                        "</div>";
                            });
                        }

                        // Statements tooltip content
                        if (tooltip === "goal") {
                            tip.html(function (d, i) {
                                return "<div class='text-center'>" +
                                        "<h6 class='no-margin'>" + d + "</h6>" +
                                        "<span class='text-size-small'>statements</span>" +
                                        "<div class='text-size-small'>" + i + ":00" + "</div>" +
                                        "</div>";
                            });
                        }

                        // Online members tooltip content
                        if (tooltip === "members") {
                            tip.html(function (d, i) {
                                return "<div class='text-center'>" +
                                        "<h6 class='no-margin'>" + d + "0" + "</h6>" +
                                        "<span class='text-size-small'>members</span>" +
                                        "<div class='text-size-small'>" + i + ":00" + "</div>" +
                                        "</div>";
                            });
                        }



                        // Bar loading animation
                        // ------------------------------

                        // Choose between animated or static
                        if (animate) {
                            withAnimation();
                        } else {
                            withoutAnimation();
                        }

                        // Animate on load
                        function withAnimation() {
                            bars
                                    .attr('height', 0)
                                    .attr('y', height)
                                    .transition()
                                    .attr('height', function (d) {
                                        return y(d);
                                    })
                                    .attr('y', function (d) {
                                        return height - y(d);
                                    })
                                    .delay(function (d, i) {
                                        return i * delay;
                                    })
                                    .duration(duration)
                                    .ease(easing);
                        }

                        // Load without animateion
                        function withoutAnimation() {
                            bars
                                    .attr('height', function (d) {
                                        return y(d);
                                    })
                                    .attr('y', function (d) {
                                        return height - y(d);
                                    });
                        }



                        // Resize chart
                        // ------------------------------

                        // Call function on window resize
                        $(window).on('resize', barsResize);

                        // Call function on sidebar width change
                        $('.sidebar-control').on('click', barsResize);

                        // Resize function
                        // 
                        // Since D3 doesn't support SVG resize by default,
                        // we need to manually specify parts of the graph that need to 
                        // be updated on window resize
                        function barsResize() {

                            // Layout variables
                            width = d3Container.node().getBoundingClientRect().width;


                            // Layout
                            // -------------------------

                            // Main svg width
                            container.attr("width", width);

                            // Width of appended group
                            svg.attr("width", width);

                            // Horizontal range
                            x.rangeBands([0, width], 0.3);


                            // Chart elements
                            // -------------------------

                            // Bars
                            svg.selectAll('.d3-random-bars')
                                    .attr('width', x.rangeBand())
                                    .attr('x', function (d, i) {
                                        return x(i);
                                    });
                        }
                    }
</script>

</body>

</html>