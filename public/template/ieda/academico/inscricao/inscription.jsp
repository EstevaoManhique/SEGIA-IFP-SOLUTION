<%-- 
    Document   : inscription
    Created on : Feb 11, 2017, 7:30:25 PM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.Inscricao"%>
<%@page import="com.dciapps.webclient.Turma"%>
<%@page import="com.dciapps.webclient.Aluno"%>
<%@page import="com.dciapps.webclient.Pessoa"%>
<%@page import="com.dciapps.webclient.Docente"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="com.dciapps.webclient.Parceiro"%>
<%@page import="com.dciapps.webclient.Curso"%>
<%@page import="com.dciapps.webclient.AreaFormacao"%>
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
        <title>SEGIA - Matricular Aluno</title>

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
            EncryptUtils encryptUtils = new EncryptUtils();

            ModulosUsuario mu = null;
            List<Aluno> alunos = null;
            Aluno aluno = null;
            Inscricao inscricao = null;
            List<Turma> turmas = null;

            String msgErro = "";
            String alerta = "";
            int numRegistos = 0;
            Entidade entidade = (Entidade) session.getAttribute("entidadeSelecionada");

            if (entidade == null) {
                entidade = (Entidade) session.getAttribute("entidade");
            }

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

                alunos = (List<Aluno>) session.getAttribute("alunos");
                turmas = (List<Turma>) session.getAttribute("turmas");
                aluno = (Aluno) session.getAttribute("aluno");
                inscricao = (Inscricao) session.getAttribute("inscricao");

                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();

                if (alunos != null) {
                    numRegistos = alunos.size();
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
    </head>

    <body   class="navbar-top">



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
                        <form method="post" action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jZG9VcGRhdGU=">
                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase btn-labeled btn-labeled-left bg-danger-400 heading-btn">Voltar ao painel principal<b><i class="icon-chevron-left"></i></b></button>
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
                            <ul class="nav navbar-nav element-active-slate-400">
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-profile position-left"></i> Registo de Matriculas</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->




                    <div class = "row">

                        <div class = "col-md-8 col-md-offset-1">


                            <%
                                String lst = "";
                                String act = encryptUtils.encodeString("accao#matricular-aluno");
                                String vlBtn = "Matricular Aluno";

                            %>


                            <!-- 2 columns form -->
                            <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="QWx1bm9TZXJ2bGV0I0RDSQ==?<%=act%>">
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Informe os dados do aluno</h6>
                                        <div class="heading-elements">
                                            <ul class="icons-list">
                                                <li><a data-action="collapse"></a></li>
                                                <li><a data-action="reload"></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="panel-body">
                                        <div class="row">



                                            <div class="col-md-12">

                                                <fieldset>
                                                    <legend class="text-semibold"><i class="icon-clipboard2 position-left"></i> Inscrição</legend>


                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Aluno:</label>
                                                        <div class="col-lg-9">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="mb-15">
                                                                        <select data-placeholder="Selecione o aluno" class="select" required="" name="idAluno">
                                                                            <option></option>
                                                                            <%

                                                                                if (alunos != null) {
                                                                                    for (Aluno a : alunos) {

                                                                                        String sel = "";
                                                                                        int id = a.getAlunId();
                                                                                        String nm = encryptUtils.decodeString(a.getAlunBadgnumber()) + " - " + encryptUtils.decodeString(a.getPessoa().getPessNome()) + " " + encryptUtils.decodeString(a.getPessoa().getPessApelido());
                                                                            %>
                                                                            <option value="<%=id%>" <%=sel%>><%=nm%></option> 
                                                                            <%
                                                                                    }
                                                                                }
                                                                            %>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase"> Turma & Horário:</label>
                                                        <div class="col-lg-9">
                                                            <div class="row">
                                                                <div class="col-md-10">
                                                                    <select data-placeholder="Selecione a turma" class="select" name="idTurma" required="">
                                                                        <option></option>
                                                                        <%
                                                                            if (turmas != null) {
                                                                                for (Turma t : turmas) {

                                                                                    int id = t.getTurmId();

                                                                                    String desc = encryptUtils.decodeString(t.getTurmDescricao()) + "|" + encryptUtils.decodeString(t.getCurso().getCursDescricao()) + "|" + encryptUtils.decodeString(t.getTurmHorario());
                                                                                    String ens = "PRESENCIAL";

                                                                                    if (t.getXTipoEnsino() != null) {
                                                                                        ens = encryptUtils.decodeString(t.getXTipoEnsino());
                                                                                    }

                                                                                    desc += "|" + ens;

                                                                                    String sel = "";
                                                                                    if (aluno != null) {
                                                                                        if (t.getTurmId() == aluno.getAlunTurno()) {
                                                                                            sel = "selected";
                                                                                        }
                                                                                    }
                                                                        %>
                                                                        <option value="<%=id%>" <%=sel%> class="text-bold"><%=desc%></option> 
                                                                        <%
                                                                                }
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Categoria:</label>
                                                        <div class="col-lg-9">
                                                            <div class="row">
                                                                <div class="col-md-10">
                                                                    <div class="mb-15">
                                                                        <select data-placeholder="Selecione a categoria" class="select" required="" name="categoria">
                                                                            <option></option>
                                                                            <%
                                                                                String categorias[] = {"NOVO INGRESSO", "CONTINUANTE", "REPETENTE", "ASSISTENTE", "TRANSFERIDO"};

                                                                                for (String s : categorias) {

                                                                                    String sel = "";

                                                                            %>
                                                                            <option value="<%=s%>" <%=sel%>><%=s%></option> 
                                                                            <%
                                                                                }
                                                                            %>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Condição Matrícula:</label>
                                                        <div class="col-lg-9">
                                                            <div class="row">
                                                                <div class="col-md-10">
                                                                    <div class="mb-15">
                                                                        <select data-placeholder="Selecione a condição da matrícula" class="select" required="" name="condicao">
                                                                            <option></option>
                                                                            <%
                                                                                String condicoes[] = {"GLOBAL", "LETRAS", "CIÊNCIAS", "TÉCNICO"};

                                                                                for (String s : condicoes) {

                                                                                    String sel = "";

                                                                            %>
                                                                            <option value="<%=s%>" <%=sel%>><%=s%></option> 
                                                                            <%
                                                                                }
                                                                            %>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="form-group" hidden="">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Condição Pagamento:</label>
                                                        <div class="col-lg-9">
                                                            <div class="row">
                                                                <div class="col-md-7">
                                                                    <div class="mb-15">
                                                                        <select data-placeholder="Selecione a condição de pagamento" class="select" required="" name="bolseiro">
                                                                            <option></option>
                                                                            <%
                                                                                String bolsas[] = {"NORMAL", "BOLSA COMPLETA", "BOLSEIRO PARCIAL (15%)", "BOLSEIRO PARCIAL (20%)",
                                                                                    "BOLSEIRO PARCIAL (25%)", "BOLSEIRO PARCIAL (30%)", "BOLSEIRO PARCIAL (35%)",
                                                                                    "BOLSEIRO PARCIAL (40%)", "BOLSEIRO PARCIAL (45%)", "BOLSEIRO PARCIAL (50%)"};

                                                                                for (String s : bolsas) {

                                                                                    String sel = "";

                                                                            %>
                                                                            <option value="<%=s%>" <%=sel%>><%=s%></option> 
                                                                            <%
                                                                                }
                                                                            %>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Documentos:</label>
                                                        <div class="col-lg-9">
                                                            <div class="row">


                                                                <label class="radio-inline">
                                                                    <input type="checkbox" name="certificado" class="styled">
                                                                    Certificado/ Declaração Provisória
                                                                </label>

                                                                <label class="radio-inline">
                                                                    <input type="checkbox" name="copiaBI" class="styled">
                                                                    Cópia do BI
                                                                </label>

                                                                <label class="radio-inline">
                                                                    <input type="checkbox" name="fotos" class="styled">
                                                                    Fotos
                                                                </label>
                                                            </div>
                                                        </div>

                                                    </div>

                                                </fieldset>

                                            </div>

                                        </div>

                                        <div class="text-right">
                                            <%
                                                if (aluno != null) {
                                                    String actC = encryptUtils.encodeString("accao#cancelar-edicao");
                                            %>
                                            <a href="QWx1bm9TZXJ2bGV0I0RDSQ==?<%=actC%>" class="btn text-bold text-uppercase bg-danger-400 btn-labeled-left ml-10"><i class="icon-cross2"></i> Cancelar edição</a>
                                            <%
                                                }
                                            %>
                                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800"><%=vlBtn%> <i class="icon-arrow-right14 position-right"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- /2 columns form -->
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



        <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>
    </body>
</html>
