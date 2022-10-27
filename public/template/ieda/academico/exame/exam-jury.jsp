<%-- 
    Document   : exam-jury
    Created on : Nov 12, 2018, 4:55:24 PM
    Author     : hamil
--%>

<%@page import="com.dciapps.webclient.SalaExame"%>
<%@page import="com.dciapps.webclient.Sala"%>
<%@page import="com.dciapps.webclient.Docente"%>
<%@page import="com.dciapps.webclient.CalendarioExame"%>
<%@page import="com.dciapps.webclient.Calendario"%>
<%@page import="com.dciapps.local.HCal"%>
<%@page import="com.dciapps.webclient.Agenda"%>
<%@page import="com.dciapps.webclient.Disciplina"%>
<%@page import="com.dciapps.webclient.Turma"%>
<%@page import="com.dciapps.webclient.Curso"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.webclient.ModulosUsuario"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="com.dciapps.controller.GenericHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SEGIA - Júri dos Exames</title>


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
        <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/datatables.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/extensions/responsive.min.js"></script>

        <script type="text/javascript" src="assets/js/plugins/forms/selects/select2.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/datepicker.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/effects.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/ui/moment/moment.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/daterangepicker.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/pickadate/picker.js"></script>

        <script type="text/javascript" src="assets/js/core/app.js"></script>
        <script type="text/javascript" src="assets/js/pages/form_layouts.js"></script>
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

            ModulosUsuario mu = null;

            List<Curso> cursos = null;
            List<Docente> docentes = null;
            List<Sala> salas = null;
            List<CalendarioExame> calendariosExame = null;
            List<SalaExame> salasExame = null;
            Curso curso = null;

            String semestre = "";

            String msgErro = "";
            String alerta = "";

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

                curso = (Curso) session.getAttribute("curso");

                cursos = (List<Curso>) session.getAttribute("cursos");
                salas = (List<Sala>) session.getAttribute("salas");
                docentes = (List<Docente>) session.getAttribute("docentes");
                calendariosExame = (List<CalendarioExame>) session.getAttribute("calendariosExame");
                salasExame = (List<SalaExame>) session.getAttribute("salasExame");

                if (session.getAttribute("semestre") != null) {
                    semestre = session.getAttribute("semestre").toString();
                }

                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();

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
                        <form method="post" action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jZG9VcGRhdGU=">
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
                            <ul class="nav navbar-nav element-active-orange-400">
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-users position-left"></i> Júris Exames</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->




                    <div class = "row">
                        <!-- Vertical form options -->
                        <div class="col-md-6"> 
                            <!-- Basic layout-->

                            <form method="post" accept-charset="ISO-8859-1" action="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?YWNjYW8janVyaXM=">
                                <div class="panel panel-flat">
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <div class="row">

                                                    <div class="col-md-8">

                                                        <select class="select" name="idCurso">
                                                            <optgroup label="Selecione a classe">

                                                                <%
                                                                    if (cursos != null) {
                                                                        for (Curso c : cursos) {

                                                                            int id = c.getCursId();
                                                                            String desc = encryptUtils.decodeString(c.getCursCod()) + " - " + encryptUtils.decodeString(c.getCursDescricao());

                                                                            String sel = "";

                                                                            if (curso != null) {
                                                                                if (id == curso.getCursId()) {
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

                                                    <div class="col-md-3">
                                                        <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-slate-800 btn-labeled text-bold text-uppercase">
                                                            <b><i class="icon-search4 position-right"></i></b> 
                                                            Filtrar Classe
                                                        </button>

                                                    </div>
                                                    <br> <br> <br>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </form>
                            <!-- /basic layout -->

                        </div>

                    </div>
                    <!-- /row.1-->




                    <!-- User profile -->
                    <div class="row">





                        <div class="col-md-4">

                            <%
                                String act2 = encryptUtils.encodeString("accao#definir-juri");
                            %>

                            <!-- Basic layout-->
                            <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?<%=act2%>">
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-bold text-uppercase">Definição de Calendário</h6>
                                        <div class="heading-elements">
                                            <ul class="icons-list">
                                                <li><a data-action="collapse"></a></li>
                                                <li><a data-action="reload"></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="panel-body">



                                        <div class="form-group">
                                            <label class="text-bold text-uppercase">Disciplina:</label>
                                            <select class="select" name="idCalendario" required="">
                                                <optgroup label="Selecione uma disciplina">
                                                    <%
                                                        if (calendariosExame != null) {

                                                            for (CalendarioExame ce : calendariosExame) {

                                                                int id = ce.getCaleeId();
                                                                String desc = encryptUtils.decodeString(ce.getDisciplina().getDiscDescricao());

                                                    %>
                                                    <option value="<%=id%>"><%=desc%></option>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </optgroup>
                                            </select>

                                        </div>

                                        <div class="form-group">
                                            <label class="text-bold text-uppercase">Sala:</label>
                                            <select class="select" name="idSala" required="">
                                                <optgroup label="Selecione uma sala">
                                                    <%
                                                        if (salas != null) {

                                                            for (Sala s : salas) {

                                                                int id = s.getSalaId();
                                                                String desc = encryptUtils.decodeString(s.getSalaDescricao());

                                                    %>
                                                    <option value="<%=id%>"><%=desc%></option>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </optgroup>
                                            </select>
                                        </div>


                                        <div class="form-group">
                                            <label class="text-bold text-uppercase">Chamada:</label>
                                            <select class="select" name="categoria">
                                                <optgroup label="Selecione a época">
                                                    <option value="1ª Chamada">1ª Chamada</option>
                                                    <option value="2ª Chamada">2ª Chamada</option>
                                                </optgroup>
                                            </select>
                                        </div>


                                        <div class="form-group">
                                            <label class="text-bold text-uppercase">Júri 1:</label>
                                            <select class="select" name="idDocente1" required="">
                                                <optgroup label="Selecione uma docente">
                                                    <%
                                                        if (docentes != null) {

                                                            for (Docente d: docentes) {

                                                                int id = d.getDoceId();
                                                                String desc = encryptUtils.decodeString(d.getPessoa().getPessNome())+" "+encryptUtils.decodeString(d.getPessoa().getPessApelido());

                                                    %>
                                                    <option value="<%=id%>"><%=desc%></option>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </optgroup>
                                            </select>
                                        </div>


                                        <div class="form-group">
                                            <label class="text-bold text-uppercase">Júri 2:</label>
                                            <select class="select" name="idDocente2" required="">
                                                <optgroup label="Selecione uma docente">
                                                    <%
                                                        if (docentes != null) {

                                                            for (Docente d: docentes) {

                                                                int id = d.getDoceId();
                                                                String desc = encryptUtils.decodeString(d.getPessoa().getPessNome())+" "+encryptUtils.decodeString(d.getPessoa().getPessApelido());

                                                    %>
                                                    <option value="<%=id%>"><%=desc%></option>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </optgroup>
                                            </select>
                                        </div>



                                        <div class="form-group">
                                            <label class="text-bold text-uppercase">Nº Máx. Alunos:</label>
                                            <input type="text" class="form-control" placeholder="Nº máximo de alunos ..." name="numAlunos" required="">
                                        </div>


                                        <div class="text-right">
                                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 text-uppercase text-bold">Definir Júri <i class="icon-circle-right2 position-right"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- /basic layout -->
                        </div>



                        <div class="col-md-8">

                            <%
                                String cur = "";

                                if (curso != null) {
                                    cur = encryptUtils.decodeString(curso.getCursDescricao());
                                }
                            %>
                            <!-- Bordered panel body table -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Júris dos Exames <span class="text-danger-600">[<%=cur%>]</span></h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>

                                        </ul>
                                    </div>
                                </div>

                                <div class="panel-body">

                                    <p>
                                        <a href="#" target="_blank" class="btn  bg-slate-800 btn-labeled btn-lg text-bold text-uppercase">
                                            <b><i class="icon-printer2"></i></b>
                                            Imprimir júris
                                        </a>

                                    </p>

                                    <table class="table datatable-responsive" width="100%">
                                        <thead>
                                            <tr>
                                                <th class="text-bold text-uppercase">Disciplina</th>
                                                <th class="text-bold text-uppercase">Sala</th>
                                                <th class="text-bold text-uppercase">Data</th>
                                                <th class="text-bold text-uppercase">Nº Máx. Alunos</th>
                                                <th class="text-bold text-uppercase">Júri 1</th>
                                                <th class="text-bold text-uppercase">Júri 2</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <%
                                                if (salasExame != null) {
                                                    for (SalaExame se: salasExame) {

                                                        String dis = encryptUtils.decodeString(se.getDisciplina().getDiscDescricao());

                                                        String d1 = sdf.format(se.getSalaeData().toGregorianCalendar().getTime());
                                                        String sa = encryptUtils.decodeString(se.getSala().getSalaDescricao());
                                                        int num = se.getSalaeMaxAlunos();
                                                        String j1 = encryptUtils.decodeString(se.getJuri1().getPessoa().getPessNome())+" "+encryptUtils.decodeString(se.getJuri1().getPessoa().getPessApelido());
                                                        String j2 = encryptUtils.decodeString(se.getJuri2().getPessoa().getPessNome())+" "+encryptUtils.decodeString(se.getJuri2().getPessoa().getPessApelido());
                                            %>
                                            <tr>
                                                <td><%=dis%></td>
                                                <td><%=sa%></td>
                                                <td><%=d1%></td>
                                                <td><%=num%></td> 
                                                <td><%=j1%></td> 
                                                <td><%=j2%></td>  
                                            </tr>
                                            <%
                                                    }
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /bordered panel body table -->

                        </div>
                    </div>
                    <!-- /row.2 -->
                </div>
                <!-- /main content -->

            </div>
            <!-- /page content -->


            <!-- Footer -->
            <div class="footer text-bold">

                <%                    String ano = session.getAttribute("ano").toString();
                %>

                &copy; <%=ano%>. <a href="#" class="text-bold">SEGIA</a>. Todos os direitos reservados
            </div>
            <!-- /footer -->

        </div>
        <!-- /page container -->
        <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>

    </body>
</html>
