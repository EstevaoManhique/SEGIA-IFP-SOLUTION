<%-- 
    Document   : ee-answers
    Created on : Sep 14, 2017, 12:26:26 PM
    Author     : hamil
--%>

<%@page import="com.dciapps.webclient.Resposta"%>
<%@page import="com.dciapps.webclient.Inscricao"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="com.dciapps.webclient.Notas"%>
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
        <title>SEGIA - Folhas de Resposta (Exames do Ensino a Distância)</title>

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
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            EncryptUtils encryptUtils = new EncryptUtils();

            List<Curso> cursos = null;
            List<Disciplina> disciplinas = null;
            List<Resposta> respostas = null;

            Disciplina disciplina = null;
            Curso curso = null;

            String msgErro = "";
            String alerta = "";

            ModulosUsuario mu = null;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = encryptUtils.decodeString(usuario.getPessoapess().getPessActividade());

                disciplina = (Disciplina) session.getAttribute("disciplinaSelecionada");
                curso = (Curso) session.getAttribute("cursoSelecionado");

                disciplinas = (List<Disciplina>) session.getAttribute("disciplinas");
                cursos = (List<Curso>) session.getAttribute("cursos");
                respostas = (List<Resposta>) session.getAttribute("respostas");

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
                        <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-stack-check position-left"></i> Folhas de Resposta (Exames do Ensino a Distância)</a></li>
                    </ul>

                </div>
            </div>
            <!-- /toolbar -->

            <div class="row">
                <!-- Vertical form options -->
                <div class="col-md-6">
                    <!-- Basic layout-->

                    <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?YWNjYW8jZm9saGE=">
                        <div class="panel panel-flat">
                            <div class="panel-body">

                                <div class="form-group">
                                    <div class="col-lg-12">
                                        <div class="row">

                                            <div class="col-md-7">

                                                <select class="select" name="idCurso" readonly>
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


                    <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?YWNjYW8jZm9saGE=">
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

            <!-- User profile -->
            <div class="row">

                <%
                    String cur = "";
                    String dis = "";

                    if (curso != null) {
                        cur = encryptUtils.decodeString(curso.getCursDescricao());
                    }

                    if (disciplina != null) {
                        dis = encryptUtils.decodeString(disciplina.getDiscDescricao());
                    }

                    String act = encryptUtils.encodeString("accao#registar-respostas");
                %>

                <div class="col-md-5">

                    <!-- Basic layout-->
                    <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?<%=act%>">
                        <div class="panel panel-flat">
                            <div class="panel-heading">
                                <h6 class="panel-title text-bold text-uppercase">Defina as questões para a folha de resposta</h6>
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
                                    <label class="text-bold text-uppercase">Chamada:</label>
                                    <select class="select" name="categoria">
                                        <optgroup label="Selecione a época">
                                            <option value="1ª Chamada">1ª Chamada</option>
                                        </optgroup>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label class="text-bold text-uppercase">Questão:</label>
                                    <textarea rows="5" cols="5" class="form-control" placeholder="Digite a descrição da questão..." name="pergunta" required=""></textarea>
                                </div>

                                <div class="form-group">
                                    <label class="text-bold text-uppercase"><b>a)</b>:</label>
                                    <input type="text" class="form-control" placeholder="Opção nº 1 ..." name="opcao1" required="">
                                </div>

                                <div class="form-group">
                                    <label class="text-bold text-uppercase"><b>b)</b>:</label>
                                    <input type="text" class="form-control" placeholder="Opção nº 2 ..." name="opcao2" required="">
                                </div>

                                <div class="form-group">
                                    <label class="text-bold text-uppercase"><b>c)</b>:</label>
                                    <input type="text" class="form-control" placeholder="Opção nº 3 ..." name="opcao3" required="">
                                </div>

                                <div class="form-group">
                                    <label class="text-bold text-uppercase"><b>d)</b>:</label>
                                    <input type="text" class="form-control" placeholder="Opção nº 4 ..." name="opcao4" required="">
                                </div>

                                <div class="form-group">
                                    <label class="display-block text-bold">Selecione a alternativa correcta:</label>

                                    <label class="radio-inline">
                                        <input type="radio" class="styled" name="op" checked="checked" value="1">
                                        <b>a)</b>
                                    </label>

                                    <label class="radio-inline">
                                        <input type="radio" class="styled" name="op" value="2">
                                        <b>b)</b>
                                    </label>

                                    <label class="radio-inline">
                                        <input type="radio" class="styled" name="op" value="3">
                                        <b>c)</b>
                                    </label>

                                    <label class="radio-inline">
                                        <input type="radio" class="styled" name="op" value="4">
                                        <b>d)</b>
                                    </label>
                                </div>



                                <div class="form-group">
                                    <label class="text-bold text-uppercase"><b>Pontuação</b>:</label>
                                    <input type="number" step="any" class="form-control" placeholder="Pontuação ..." name="pontuacao" required="">
                                </div>

                                <div class="text-right">
                                    <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-slate-800 text-bold text-uppercase">Definir Pergunta<i class="icon-file-check2 position-right"></i></button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- /basic layout -->

                </div>

                <div class="col-md-7">
                    <div class="panel panel-flat">
                        <div class="panel-heading">
                            <h6 class="panel-title text-bold text-uppercase">Listagem da Folha de Respota <span class="text-danger-600">[<%=cur%> | <%=dis%>]</span></h6>
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

                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th class="text-bold text-uppercase">#</th>
                                        <th class="text-bold text-uppercase">Pergunta</th>
                                        <th class="text-bold text-uppercase text-right">Pontuação</th>
                                        <th class="text-bold text-uppercase text-danger">---</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        if (respostas != null) {
                                            int i = 0;
                                            for (Resposta r : respostas) {

                                                int id = r.getRespId();
                                                i++;
                                                String desc = encryptUtils.decodeString(r.getRespPergunta());
                                                String op1 = encryptUtils.decodeString(r.getRespOpcao1());
                                                String op2 = encryptUtils.decodeString(r.getRespOpcao2());
                                                String op3 = encryptUtils.decodeString(r.getRespOpcao3());
                                                String op4 = encryptUtils.decodeString(r.getRespOpcao4());
                                                String categoria = encryptUtils.decodeString(r.getRespCategoria());
                                                String resposta = encryptUtils.decodeString(r.getRespResposta());
                                                String pontuacao = df.format(r.getRespPontuacao());

                                                String r1 = "<span class='bg-grey-600'><i class='icon-minus2'></i></span>";
                                                String r2 = "<span class='bg-grey-600'><i class='icon-minus2'></i></span>";
                                                String r3 = "<span class='bg-grey-600'><i class='icon-minus2'></i></span>";
                                                String r4 = "<span class='bg-grey-600'><i class='icon-minus2'></i></span>";

                                                if (resposta.equals(op1)) {
                                                    r1 = "<span class='bg-success-600'><i class='icon-check'></i></span>";
                                                } else if (resposta.equals(op2)) {
                                                    r2 = "<span class='bg-success-600'><i class='icon-check'></i></span>";
                                                } else if (resposta.equals(op3)) {
                                                    r3 = "<span class='bg-success-600'><i class='icon-check'></i></span>";
                                                } else if (resposta.equals(op4)) {
                                                    r4 = "<span class='bg-success-600'><i class='icon-check'></i></span>";
                                                }

                                                String actR = encryptUtils.encodeString("accao#remover-resposta&ei=" + id);

                                                if (categoria.equals("1ª Chamada")) {

                                    %>
                                    <tr>
                                        <td>
                                            <a href="#">
                                                <%=i%>
                                            </a>
                                        </td>
                                        <td class="text-bold">
                                            <%=desc%>
                                        </td>
                                        <td class="text-bold text-right text-warning">
                                            <%=pontuacao%>
                                        </td>
                                        <td>
                                            <a href="#" data-toggle="modal" data-target="#modal_resp_<%=id%>" data-popup="tooltip" title="Visualizar as alternativas"><i class="icon-info22 text-primary-600"></i></a>
                                            <a href="#" data-toggle="modal" data-target="#modal_rem_<%=id%>" data-popup="tooltip" title="Remover o registo"><i class="icon-cancel-circle2 text-danger-800"></i></a>



                                            <!-- Danger modal -->
                                            <div id="modal_rem_<%=id%>" class="modal fade">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h6 class="modal-title text-semibold">Confirma a remoção da resposta com a referência #
                                                                <%=id%> ?</h6>
                                                        </div>
                                                        <div class="modal-body text-center">
                                                            <h6 class="text-bold text-danger"><i class="icon-question6 text-danger" style="font-size: 100px"></i></h6>

                                                        </div>

                                                        <div class="modal-footer">
                                                            <button type="button" class="btn text-bold text-uppercase btn-link" data-dismiss="modal">Cancelar</button>

                                                            <a href="QXZhbGlhY2FvU2VydmxldCNEQ0k=?<%=actR%>" class="btn text-bold text-uppercase btn-danger">Sim, confirmo !</a>

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
                                                            <h6 class="modal-title text-bold text-uppercase">Respostas da Pergunta</h6>
                                                        </div>
                                                        <div class="modal-body">

                                                            <table class="table ">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="text-bold text-uppercase"></th>
                                                                        <th class="text-bold text-uppercase">Alternativas</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <%=r1%>
                                                                        </td>
                                                                        <td><b>a)</b> :
                                                                            <%=op1%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <%=r2%>
                                                                        </td>
                                                                        <td><b>b)</b> :
                                                                            <%=op2%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <%=r3%>
                                                                        </td>
                                                                        <td><b>c)</b> :
                                                                            <%=op3%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <%=r4%>
                                                                        </td>
                                                                        <td><b>d)</b> :
                                                                            <%=op4%>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>

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
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
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