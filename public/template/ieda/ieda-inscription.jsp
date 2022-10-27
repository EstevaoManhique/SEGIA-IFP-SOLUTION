<%-- 
    Document   : ee-inscription
    Created on : Nov 12, 2018, 4:55:24 PM
    Author     : hamil
--%>

<%@page import="com.dciapps.webclient.Exame"%>
<%@page import="com.dciapps.webclient.Aluno"%>
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
        <title>SEGIA - Inscrição do Aluno</title>


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
            List<Disciplina> disciplinas = null;
            List<Exame> exames = null;
            Curso curso = null;
            Aluno aluno = null;

            String semestre = "";

            String msgErro = "";
            String alerta = "";

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

                curso = (Curso) session.getAttribute("curso");
                aluno = (Aluno) session.getAttribute("aluno");

                cursos = (List<Curso>) session.getAttribute("cursos");
                disciplinas = (List<Disciplina>) session.getAttribute("disciplinas");
                exames = (List<Exame>) session.getAttribute("examesAluno");

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

                if (bg !== '') {
                    /*$.jGrowl(erro, {
                     position: 'center',
                     header: hd,
                     theme: bg
                     });*/

                    if (bg === 'bg-error') {
                        cl = "#EF5350";
                        tp = "error";
                    }

                    if (bg === 'bg-warning') {
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
        <%@ include file="navebar.jsp" %> 
        <!-- /main navbar -->

        <!-- Page header -->
        <%@ include file="header.jsp" %> 
        <!-- /page header -->

        <!-- Main sidebar -->
        <%@ include file="menu.jsp" %>  
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
                        <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-file-plus position-left"></i> Inscrição do Aluno (Exames do Ensino a Distância)</a></li>
                    </ul>

                </div>
            </div>
            <!-- /toolbar -->




            <div class="row">
                <!-- Vertical form options -->
                <div class="col-md-6">
                    <!-- Basic layout-->

                    <form method="post" accept-charset="ISO-8859-1" action="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jaW5zY3JpY2Fv">
                        <div class="panel panel-flat">
                            <div class="panel-body">

                                <div class="form-group">
                                    <div class="col-lg-12">
                                        <div class="row">

                                            <div class="col-md-8">

                                                <select class="select" name="idCurso">
                                                    <optgroup label="Selecione a classe">

                                                        <%                                                                    if (cursos != null) {
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


                <!-- Vertical form options -->
                <div class="col-md-6">
                    <!-- Basic layout-->

                    <form method="post" accept-charset="ISO-8859-1" action="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jcGVzcXVpc2FyLWFsdW5v">
                        <div class="panel panel-flat">
                            <div class="panel-body">

                                <div class="form-group">
                                    <div class="col-lg-12">
                                        <div class="row">

                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="Código do Aluno ..." name="codAluno" required="">
                                            </div>

                                            <div class="col-md-3">
                                                <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-slate-800 btn-labeled text-bold text-uppercase">
                                                    <b><i class="icon-search4 position-right"></i></b> 
                                                    Pesquisar
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
                        String act2 = encryptUtils.encodeString("accao#lancar-frequencia");
                    %>

                    <!-- Basic layout-->
                    <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="SUVEQVNlcnZsZXQjRENJ?<%=act2%>">
                        <div class="panel panel-flat">
                            <div class="panel-heading">
                                <h6 class="panel-title text-bold text-uppercase">Lançar Notas de Frequência</h6>
                                <div class="heading-elements">
                                    <ul class="icons-list">
                                        <li>
                                            <a data-action="collapse"></a>
                                        </li>
                                        <li>
                                            <a data-action="reload"></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div class="panel-body">



                                <div class="form-group">
                                    <label class="text-bold text-uppercase">Disciplina:</label>
                                    <select class="select" name="idDisciplina" required="">
                                        <optgroup label="Selecione uma disciplina">
                                            <%
                                                if (disciplinas != null) {

                                                    for (Disciplina d : disciplinas) {

                                                        int id = d.getDiscId();
                                                        String desc = encryptUtils.decodeString(d.getDiscDescricao());

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
                                    <label class="text-bold text-uppercase">Nota de Frequência:</label>
                                    <input type="number" class="form-control" placeholder="Nota de Frequência ..." name="nota" required="">
                                </div>


                                <div class="text-right">
                                    <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 text-uppercase text-bold">Lançar Nota <i class="icon-circle-right2 position-right"></i></button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- /basic layout -->
                </div>



                <div class="col-md-8">

                    <%
                        String cur = "";
                        String nmAluno = "";

                        if (curso != null) {
                            cur = encryptUtils.decodeString(curso.getCursDescricao());
                        }

                        if (aluno != null) {
                            nmAluno = encryptUtils.decodeString(aluno.getPessoa().getPessNome()) + " " + encryptUtils.decodeString(aluno.getPessoa().getPessApelido());
                        }
                    %>
                    <!-- Bordered panel body table -->
                    <div class="panel panel-flat">
                        <div class="panel-heading">
                            <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Notas de Frequência do Aluno <span class="text-danger-600">[<%=cur%> - <%=nmAluno%>]</span></h6>
                            <div class="heading-elements">
                                <ul class="icons-list">
                                    <li>
                                        <a data-action="collapse"></a>
                                    </li>
                                    <li>
                                        <a data-action="reload"></a>
                                    </li>

                                </ul>
                            </div>
                        </div>

                        <div class="panel-body">

                            <table class="table datatable-responsive" width="100%">
                                <thead>
                                    <tr>
                                        <th class="text-bold text-uppercase">Disciplina</th>
                                        <th class="text-bold text-uppercase">Nota de Frequência</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%
                                        if (exames != null) {
                                            for (Exame e : exames) {

                                                String dis = encryptUtils.decodeString(e.getDisciplina().getDiscDescricao());

                                                float nota = e.getExamMedia();

                                    %>
                                    <tr>
                                        <td>
                                            <%=dis%>
                                        </td>
                                        <td>
                                            <%=nota%>
                                        </td>
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


        <!-- Footer -->
        <%@ include file="footer2.jsp" %> 
        <!-- /Footer -->

        <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>

    </body>

</html>