<%-- 
    Document   : summaries
    Created on : Feb 11, 2017, 7:30:25 PM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.Sumario"%>
<%@page import="com.dciapps.webclient.Disciplina"%>
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
        <title>SEGIA - Planos de Aulas</title>

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
            List<Sumario> sumarios = null;

            String msgErro = "";
            String alerta = "";
            Entidade entidade = (Entidade) session.getAttribute("entidadeSelecionada");

            List<Curso> cursos = null;
            List<Disciplina> disciplinas = null;

            Disciplina disciplina = null;
            Curso curso = null;

            if (entidade == null) {
                entidade = (Entidade) session.getAttribute("entidade");
            }

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

                sumarios = (List<Sumario>) session.getAttribute("sumarios");

                disciplina = (Disciplina) session.getAttribute("disciplinaSelecionada");
                curso = (Curso) session.getAttribute("cursoSelecionado");

                disciplinas = (List<Disciplina>) session.getAttribute("disciplinas");
                cursos = (List<Curso>) session.getAttribute("cursos");

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

    <body class="navbar-top">



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
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-books position-left"></i> Planos de Aulas</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->





                    <div class = "row">
                        <!-- Vertical form options -->
                        <div class="col-md-6"> 
                            <!-- Basic layout-->

                            <form method="post" accept-charset="ISO-8859-1" action="UGxhbm9zU2VydmxldCNEQ0k=?YWNjYW8jcGxhbm9hdWxh">
                                <div class="panel panel-flat">
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <div class="row">

                                                    <div class="col-md-7">

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


                            <form method="post" accept-charset="ISO-8859-1" action="UGxhbm9zU2VydmxldCNEQ0k=?YWNjYW8jcGxhbm9hdWxh">
                                <div class="panel panel-flat">
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <div class="row">

                                                    <div class="col-md-7">


                                                        <select class="select" name="idDisciplina">
                                                            <optgroup label="Selecione disciplina">

                                                                <%
                                                                    if (disciplinas != null) {
                                                                        for (Disciplina d : disciplinas) {

                                                                            int id = d.getDiscId();
                                                                            String desc = encryptUtils.decodeString(d.getDiscDescricao());

                                                                            String sel = "";

                                                                            if (disciplina != null) {
                                                                                if (id == disciplina.getDiscId()) {
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
                                                        <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                            <b><i class="icon-search4 position-right"></i></b> 
                                                            Filtrar Disciplina
                                                        </button>

                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </form>
                            <!-- /basic layout -->

                        </div>
                        <!-- /vertical form options -->
                    </div>
                    <!-- /row.1-->



                    <div class = "row">

                        <%
                            String cur = "";
                            String dis = "";

                            if (curso != null) {
                                cur = encryptUtils.decodeString(curso.getCursDescricao());
                            }

                            if (disciplina != null) {
                                dis = encryptUtils.decodeString(disciplina.getDiscDescricao());
                            }

                        %>


                        <div class = "col-md-10 col-md-offset-1">

                            <!-- Basic responsive configuration -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">

                                    <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Programa Temático <span class="text-danger-600">[<%=cur%> | <%=dis%>]</span></h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>
                                        </ul>
                                    </div>
                                </div>


                                <div class="panel-body">
                                    <p>
                                        <a href="#" target="_blank" class="btn bg-slate-400 btn-labeled btn-lg text-bold text-uppercase">
                                            <b><i class="icon-printer2"></i></b>
                                            Imprimir registos
                                        </a>

                                </div>

                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="text-bold text-uppercase">#</th>
                                            <th class="text-bold text-uppercase">Contéudo</th>
                                            <th class="text-bold text-uppercase">Tema</th>
                                            <th class="text-bold text-uppercase">Data</th>
                                            <th class="text-bold text-uppercase text-center text-danger-600">---</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            int t1 = 0;
                                            int t2 = 0;

                                            if (sumarios != null) {

                                                int i = 0;
                                                for (Sumario s : sumarios) {

                                                    int id = s.getSumaId();
                                                    i++;

                                                    String s1 = encryptUtils.decodeString(s.getSumaDescricao());
                                                    String s2 = encryptUtils.decodeString(s.getSumaBibliografia());
                                                    String s3 = encryptUtils.decodeString(s.getSumaAvaliacao());
                                                    String s4 = encryptUtils.decodeString(s.getSumaMetodologia());
                                                    String s5 = encryptUtils.decodeString(s.getSumaObjectivo());
                                                    String s6 = encryptUtils.decodeString(s.getSumaRecursos());
                                                    String s7 = encryptUtils.decodeString(s.getSumaResumo());
                                                    String t = encryptUtils.decodeString(s.getTema().getTemaDescricao());
                                                    String dte = sdf.format(s.getSumaData().toGregorianCalendar().getTime());

                                                    String actR = encryptUtils.encodeString("accao#remover-sumario&ei=" + id);


                                        %>
                                        <tr>
                                            <td><a href="#"><%=i%></a></td>
                                            <td><%=s1%></td>
                                            <td class="text-bold text-danger-600"><%=t%></td>
                                            <td class="text-bold"><%=dte%></td>

                                            <td>
                                                <a  href="#" data-toggle="modal" data-target="#modal_resp_<%=id%>" data-popup="tooltip" title="Mais detalhes do plano de aula"><i class="icon-info22 text-primary-600"></i></a>
                                                <a  href="#" data-toggle="modal" data-target="#modal_rem_<%=id%>" data-popup="tooltip" title="Remover registo"><i class="icon-cancel-circle2 text-danger-800"></i></a>



                                                <!-- Danger modal -->
                                                <div id="modal_rem_<%=id%>" class="modal fade">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                <h6 class="modal-title text-semibold">Confirma a remoção do sumário com a referência #<%=id%> ?</h6>
                                                            </div>
                                                            <div class="modal-body text-center">
                                                                <h6 class="text-bold text-danger" ><i class="icon-question6 text-danger" style="font-size: 100px"></i></h6>

                                                            </div>

                                                            <div class="modal-footer">
                                                                <button type="button" class="btn text-bold text-uppercase btn-link" data-dismiss="modal">Cancelar</button>

                                                                <a href="UGxhbm9zU2VydmxldCNEQ0k=?<%=actR%>" class="btn text-bold text-uppercase btn-danger">Sim, confirmo !</a>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /danger modal -->   


                                                <!-- Table modal -->
                                                <div id="modal_resp_<%=id%>" class="modal fade">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                <h6 class="modal-title text-bold">PLANO DE AULA</h6>
                                                            </div>
                                                            <div class="modal-body">

                                                                <table class="table table-bordered table-striped">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td class="text-bold text-uppercase text-danger-600">Disciplina</td>
                                                                            <td><%=dis%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="text-bold text-uppercase text-danger-600">Tema</td>
                                                                            <td><%=t%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="text-bold text-uppercase text-danger-600">Contéudo</td>
                                                                            <td><%=s1%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="text-bold text-uppercase text-danger-600">Data</td>
                                                                            <td><%=dte%></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>


                                                                <h6 class="text-danger-600 text-uppercase text-bold">OBJECTIVOS</h6>
                                                                <%=s5%>
                                                                <hr>
                                                                <h6 class="text-danger-600 text-uppercase text-bold">RESUMO DO CONTEÚDO A SER TRABALHADO</h6>
                                                                <%=s7%>
                                                                <hr>
                                                                <h6 class="text-danger-600 text-uppercase text-bold">METODOLOGIA</h6>
                                                                <%=s4%>
                                                                <hr>
                                                                <h6 class="text-danger-600 text-uppercase text-bold">RECURSOS NECESSÁRIOS</h6>
                                                                <%=s6%>
                                                                <hr>
                                                                <h6 class="text-danger-600 text-uppercase text-bold">AVALIAÇÃO</h6>
                                                                <%=s3%>
                                                                <hr>
                                                                <h6 class="text-danger-600 text-uppercase text-bold">BIBLIOGRAFIA DE APOIO</h6>
                                                                <%=s2%>
                                                            </div>

                                                            <div class="modal-footer">
                                                                <button type="button" class="btn text-bold text-uppercase btn-link" data-dismiss="modal">Fechar</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /table modal -->   


                                            </td>

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
