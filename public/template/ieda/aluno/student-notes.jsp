<%-- 
    Document   : student-notes
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
        <title>SEGIA - Notas do Aluno</title>

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
            List<Notas> notas = null;
            List<Inscricao> inscricoes = null;
            Inscricao inscricao = null;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = "Estudante";

                notas = (List<Notas>) session.getAttribute("notas");
                inscricoes = (List<Inscricao>) session.getAttribute("inscricoes");
                inscricao = (Inscricao) session.getAttribute("inscricao");

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
                                <li class="active"><a href="#settings" data-toggle="tab"  class="text-bold text-uppercase"><i class="icon-file-text position-left"></i> Histórico das Avaliações do Aluno</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->


                    <div class="row col-md-offset-2">

                        <div class="col-md-8">


                            <!-- Basic layout-->
                            <form action="UG9ydGFsU2VydmxldCNEQ0k=?YWNjYW8jYXZhbGlhY29lcw==" class="form-horizontal" method="post">
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Periodo de Pesquisa</h6>
                                        <div class="heading-elements">
                                            <ul class="icons-list">
                                                <li><a data-action="collapse"></a></li>
                                                <li><a data-action="reload"></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="panel-body">


                                        <div class="form-group">
                                            <label class="col-lg-3 control-label text-bold text-uppercase">Inscrição:</label>
                                            <div class="col-lg-6">

                                                <select class="select">
                                                    <optgroup label="Selecione a inscrição">

                                                        <%
                                                            String refI= "";
                                                            if (inscricoes != null) {

                                                                for (Inscricao i : inscricoes) {
                                                                    int id = i.getInscId();
                                                                    String ref = encryptUtils.decodeString(i.getInscReferencia());
                                                                    String sel = "";

                                                                    if (inscricao != null) {
                                                                        if (id == inscricao.getInscId()) {
                                                                            sel = "selected";
                                                                         
                                                                            refI = "Inscrição: "+ref;
                                                                        }
                                                                    }
                                                        %>
                                                        <option value="<%=id%>" <%=sel%>><%=ref%></option>
                                                        <%
                                                                }
                                                            }
                                                        %>
                                                    </optgroup>
                                                </select>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Grupo:</label>
                                            <div class="col-lg-9">
                                                <div class="row">

                                                    <label class="radio-inline">
                                                        <input type="radio" name="grupo" class="styled"  value="Avaliações Normais" checked>
                                                        Avaliações Normais
                                                    </label>

                                                    <label class="radio-inline">
                                                        <input type="radio" name="grupo" class="styled" value="Exames">
                                                        Exames
                                                    </label>
                                                </div>
                                            </div>
                                        </div>



                                        <div class="text-right">
                                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800">Filtrar resultados <i class="icon-filter3 position-right"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- /basic layout -->

                        </div>


                    </div>



                    <div class= "row">

                        <div class="col-md-12">

                            <!-- Basic responsive configuration -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Histórico das Avaliações do Aluno <span class="text-danger-600">[<%=refI%>]</span></h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>

                                        </ul>
                                    </div>
                                </div>


                                <table class="table datatable-responsive">
                                    <thead>
                                        <tr>
                                        <tr>
                                            <th class="text-bold text-uppercase">#</th>
                                            <th class="text-bold text-uppercase">Trimestre</th>
                                            <th class="text-bold text-uppercase">1ª ACS</th>
                                            <th class="text-bold text-uppercase">2ª ACS</th>
                                            <th class="text-bold text-uppercase">3ª ACS</th>
                                            <th class="text-bold text-uppercase">4ª ACS</th>
                                            <th class="text-bold text-uppercase text-primary-400">Média ACS</th>
                                            <th class="text-bold text-uppercase">1ª ACP</th>
                                            <th class="text-bold text-uppercase">2ª ACP</th>
                                            <th class="text-bold text-uppercase text-primary-400">Média ACP</th>
                                            <th class="text-bold text-uppercase text-danger-600">Média Final</th>
                                        </tr>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            if (notas != null) {
                                                for (Notas n : notas) {

                                                    
                                                    String dis = "-";
                                                    
                                                    String n1 = "-";
                                                    String n2 = "-";
                                                    String n3 = "-";
                                                    String n4 = "-";
                                                    String n5 = "-";
                                                    String n6 = "-";

                                                    String l1 = "text-danger";
                                                    String l2 = "text-danger";
                                                    String l3 = "text-danger";
                                                    String l4 = "text-danger";
                                                    String l5 = "text-danger";
                                                    String l6 = "text-danger";

                                                    String lblMediaACS = "text-slate-400";
                                                    String lblMediaACP = "text-slate-400";

                                                    String lblMedia = "text-slate-400";

                                                    float media = 0;
                                                    float mediaACS = 0;
                                                    float mediaACP = 0;

                                                    String comp = "-";
                                                    int numACS = 0;
                                                    int numACP = 0;
                                                    if (n != null) {

                                                        dis = encryptUtils.decodeString(n.getDisciplina().getDiscDescricao());
                                                        
                                                        n1 = df.format(n.getNotaTeste1());
                                                        n2 = df.format(n.getNotaTeste2());
                                                        n3 = df.format(n.getNotaTeste3());
                                                        n4 = df.format(n.getNotaTeste4());
                                                        n5 = df.format(n.getNotaAcp());
                                                        n6 = df.format(n.getNotaAcp2());

                                                        if (!n1.equals("0.00")) {
                                                            numACS++;
                                                        } else {
                                                            n1 = "<i class ='icon-minus2 text-teal-600'></i>";
                                                        }

                                                        if (!n2.equals("0.00")) {
                                                            numACS++;
                                                        } else {
                                                            n2 = "<i class ='icon-minus2 text-teal-600'></i>";
                                                        }

                                                        if (!n3.equals("0.00")) {
                                                            numACS++;
                                                        } else {
                                                            n3 = "<i class ='icon-minus2 text-teal-600'></i>";
                                                        }

                                                        if (!n4.equals("0.00")) {
                                                            numACS++;
                                                        } else {
                                                            n4 = "<i class ='icon-minus2 text-teal-600'></i>";
                                                        }

                                                        if (!n5.equals("0.00")) {
                                                            numACP++;
                                                        } else {
                                                            n5 = "<i class ='icon-minus2 text-teal-600'></i>";
                                                        }

                                                        if (!n6.equals("0.00")) {
                                                            numACP++;
                                                        } else {
                                                            n6 = "<i class ='icon-minus2 text-teal-600'></i>";
                                                        }
                                                        media = n.getNotaMedia();

                                                        if (numACS != 0) {
                                                            mediaACS = Math.round((n.getNotaTeste1() + n.getNotaTeste2() + n.getNotaTeste3() + n.getNotaTeste4()) / numACS);
                                                        }

                                                        if (numACP != 0) {
                                                            mediaACP = Math.round((n.getNotaAcp() + n.getNotaAcp2()) / numACP);
                                                        }

                                                        if (n.getNotaTeste1() >= 10) {
                                                            l1 = "text-success";
                                                        }

                                                        if (n.getNotaTeste2() >= 10) {
                                                            l2 = "text-success";
                                                        }

                                                        if (n.getNotaTeste3() >= 10) {
                                                            l3 = "text-success";
                                                        }

                                                        if (n.getNotaTeste4() >= 10) {
                                                            l4 = "text-success";
                                                        }

                                                        if (n.getNotaAcp() >= 10) {
                                                            l5 = "text-success";
                                                        }

                                                        if (n.getNotaAcp2() >= 10) {
                                                            l6 = "text-success";
                                                        }

                                                        if (mediaACS < 10) {
                                                            lblMediaACS = "text-danger-700";
                                                        } else {
                                                            lblMediaACS = "text-success-700";
                                                        }

                                                        if (mediaACP < 10) {
                                                            lblMediaACP = "text-danger-700";
                                                        } else {
                                                            lblMediaACP = "text-success-700";
                                                        }

                                                        if (media < 10) {
                                                            lblMedia = "text-danger-700";
                                                        } else {
                                                            lblMedia = "text-success-400";
                                                        }

                                                        if (media >= 14) {
                                                            lblMedia = "text-success-800";
                                                        }

                                                        String sem = encryptUtils.decodeString(n.getNotaSemestre());
                                                        int id = n.getNotaId();

                                        %>
                                        <tr>         
                                            <td class="text-bold text-primary"><%=dis%></td>
                                            <td class="text-bold"><%=sem%></td>
                                            <td class="text-bold <%=l1%> text-right"><%=n1%></td>
                                            <td class="text-bold <%=l2%> text-right"><%=n2%></td>
                                            <td class="text-bold <%=l3%> text-right"><%=n3%></td>

                                            <td class="text-bold <%=l4%> text-right"><%=n4%></td>
                                            <td class="text-bold <%=lblMediaACS%> text-right"><%=mediaACS%></td>
                                            <td class="text-bold <%=l5%> text-right"><%=n5%></td>
                                            <td class="text-bold <%=l6%> text-right"><%=n6%></td>
                                            <td class="text-bold <%=lblMediaACP%> text-right"><%=mediaACP%></td>
                                            <td class="text-bold <%=lblMedia%> text-right"><%=media%></td>
                                        </tr>
                                        <%
                                                    }
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
