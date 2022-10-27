<%-- 
    Document   : student-payments
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
        <title>SEGIA - Pagamentos do Aluno</title>

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

            List<Pagamento> pagamentos = null;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = "Estudante";

                pagamentos = (List<Pagamento>) session.getAttribute("pagamentos");
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
                                <li class="active"><a href="#settings" data-toggle="tab"  class="text-bold text-uppercase"><i class="icon-cash4 position-left"></i> Histórico de Pagamentos do Aluno</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->



                    <div class = "row">
                        <!-- Vertical form options -->
                        <div class="col-md-4">

                            <!-- Basic layout-->
                            <form action="UG9ydGFsU2VydmxldCNEQ0k=?YWNjYW8jcGFnYW1lbnRvcw==" method="post">
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Selecione o Periodo</h6>
                                        <div class="heading-elements">
                                            <ul class="icons-list">
                                                <li><a data-action="collapse"></a></li>
                                                <li><a data-action="reload"></a></li>

                                            </ul>
                                        </div>
                                    </div>

                                    <div class="panel-body">


                                        <div class="form-group">
                                            <label>Periodo (Data): </label>

                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icon-calendar22"></i></span>
                                                <input type="text" class="form-control daterange-weeknumbers"> 
                                            </div>
                                        </div>


                                        <div class="text-right">
                                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800">Filtrar Resultados <i class="icon-filter3 position-right"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- /basic layout -->

                        </div>

                    </div>


                    <div class="row">

                        <div class="col-md-12">
                            <!-- Basic responsive configuration -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Histórico de pagamentos</h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>

                                        </ul>
                                    </div>
                                </div>



                                <div class="panel-body">
                                    <p>
                                        <a href="QWx1bm9TZXJ2bGV0I0RDSQ==?YWNjYW8jaW1wcmltaXItcGFnYW1lbnRvcw==" target="_blank" class="btn bg-orange-400 btn-labeled btn-lg text-bold text-uppercase">
                                            <b><i class="icon-printer2"></i></b>
                                            Imprimir registos
                                        </a>

                                </div>

                                <table class="table datatable-responsive">
                                    <thead>
                                        <tr>
                                            <th class="text-bold text-uppercase">#</th>
                                            <th class="text-bold text-uppercase">REF.</th>
                                            <th class="text-bold text-uppercase">Descrição</th>
                                            <th class="text-bold text-uppercase">valor</th>
                                            <th class="text-bold text-uppercase">Data Lim.</th>
                                            <th class="text-bold text-uppercase">Data Pag.</th>
                                            <th class="text-bold text-uppercase">v. Multa</th>
                                            <th class="text-bold text-uppercase">v. Pago</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            double totalPago = 0;
                                            double totalPrestacoes = 0;
                                            double totalMultas = 0;

                                            if (pagamentos != null) {
                                                for (Pagamento p : pagamentos) {

                                                    int id = p.getPagId();
                                                    String ref = encryptUtils.decodeString(p.getPagRefOnline());
                                                    String desc = encryptUtils.decodeString(p.getPagDescricao());

                                                    String status = "Confirmado";
                                                    String lblStatus = "bg-success-600";

                                                    if (!p.isPagStatus()) {
                                                        status = "Pendente";
                                                        lblStatus = "bg-orange-600";
                                                    }

                                                    String dte = sdf.format(p.getPagData().toGregorianCalendar().getTime());;
                                                    String dteL = "---";

                                                    String dteP = "---";

                                                    if (p.getPagDataPagamento() != null) {
                                                        dteP = sdf.format(p.getPagDataPagamento().toGregorianCalendar().getTime());
                                                    }

                                                    String valor = df.format(p.getPagValor());
                                                    String valorPago = df.format(p.getPagValorPago());

                                                    double vMulta = 0;

                                                    int diasTrial = 0;

                                                    int multa = 0;

                                                    if (p.getPagDataLimite() != null) {
                                                        Date dtaProx = p.getPagDataLimite().toGregorianCalendar().getTime();
                                                        Date dtaHoje = new Date();
                                                        diasTrial = Days.daysBetween(new DateTime(dtaProx), new DateTime(dtaHoje)).getDays();

                                                        dteL = sdf.format(p.getPagDataLimite().toGregorianCalendar().getTime());

                                                    }

                                                    String lblD = "bg-success-300";
                                                    if (diasTrial > 0) {

                                                        lblD = "bg-danger-300";
                                                    }

                                                    if (diasTrial > 0 && diasTrial <= 10) {
                                                        multa = 10;
                                                    }

                                                    if (diasTrial > 10 && diasTrial <= 20) {
                                                        multa = 20;
                                                    }

                                                    if (diasTrial > 20 && diasTrial < 30) {
                                                        multa = 20;
                                                    }

                                                    if (diasTrial >= 20) {
                                                        multa = 30;
                                                    }

                                                    if (multa != 0) {
                                                        vMulta = p.getPagValor() * (multa / 100.f);
                                                    }
                                                    totalPrestacoes += p.getPagValor();

                                                    totalMultas += vMulta;

                                                    if (p.isPagStatus()) {
                                                        totalPago += p.getPagValorPago();
                                                    }

                                        %>
                                        <tr>
                                            <td><a href="#"><%=id%></a></td>
                                            <td><small><a href="#"><%=ref%></a></small></td>
                                            <td><%=desc%> - <br><span class="label <%=lblStatus%>"><%=status%></span></td>

                                            <td><%=valor%></td>
                                            <td><span class="label <%=lblD%>"><%=dte + " á " + dteL%></span></td>
                                            <td><span class="label bg-slate-400"><%=dteP%></span></td>
                                            <td  class="text-danger-600"><%=df.format(vMulta) + " - (" + multa + "%)"%></td>
                                            <td class="text-bold"><%=valorPago%></td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                    </tbody>
                                </table>

                                <div class="panel-footer">

                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="text-bold text-uppercase">Total Prestações</th>
                                                    <th class="text-bold text-uppercase">Total Multas</th>
                                                    <th class="text-bold text-uppercase">Total Pago</th>
                                                    <th class="text-bold text-uppercase">Total Saldo</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="text-semibold text-danger-700"><%=df.format(totalPrestacoes)%></td>
                                                    <td class="text-semibold text-danger-700"><%=df.format(totalMultas)%></td>
                                                    <td class="text-semibold text-danger-700"><%=df.format(totalPago)%></td>
                                                    <td class="text-semibold text-danger-700"><%=df.format(totalPrestacoes + totalMultas - totalPago)%></td>

                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                            <!-- /basic responsive configuration -->
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
