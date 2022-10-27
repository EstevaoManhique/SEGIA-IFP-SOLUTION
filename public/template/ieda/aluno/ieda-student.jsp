<%-- 
    Document   : student
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

        <%!
            private String getString(Object obj) {
                String s = "";
                if (obj == null) {
                    s = "N/D";
                } else {
                    s = obj.toString();
                }

                return s;
            }

        %>
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
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-profile position-left"></i> Gestão de estudantes</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->




                    <div class = "row">

                        <div class = "col-md-12 col-md-offset-0">


                            <%                                String lst = "";
                                String act = encryptUtils.encodeString("accao#registar-aluno");
                                String vlBtn = "Gravar Registo";
                                String lblReg = "Novo Registo";
                                String icnReg = "icon-file-plus";
                                String nm = getString(session.getAttribute("nome"));
                                String apl = getString(session.getAttribute("apelido"));
                                String bi = getString(session.getAttribute("bi"));
                                String nuit = getString(session.getAttribute("nuit"));
                                String sex = getString(session.getAttribute("sexo"));
                                String sM = "checked";
                                String sF = "";
                                String mail = getString(session.getAttribute("email"));
                                String cnt = getString(session.getAttribute("contacto"));
                                String prov = getString(session.getAttribute("provincia"));
                                String quar = getString(session.getAttribute("quarteirao"));
                                String casa = getString(session.getAttribute("casa"));
                                String end = getString(session.getAttribute("endereco"));
                                String doc = getString(session.getAttribute("documento"));
                                String distr = getString(session.getAttribute("distrito"));
                                String dNas = "";

                                String resp = getString(session.getAttribute("responsavel"));
                                String cntResp = getString(session.getAttribute("contactoResponsavel"));

                                String bS = "checked";
                                String bN = "";
                                String bI = "";

                                String dS = "";
                                String dN = "checked";

                                String niv = getString(session.getAttribute("nivel"));
                                String ocup = getString(session.getAttribute("ocupacao"));
                                String cat = getString(session.getAttribute("categoria"));

                                String bos = "NORMAL";

                                String tB = "checked";
                                String tD = "";
                                String cH = "";

                                String con = "";

                                String cD = "";
                                String cB = "";
                                String fT = "";

                                String nomeC = "";

                                if (aluno != null) {
                                    lst = "hide";
                                    act = encryptUtils.encodeString("accao#actualizar-aluno&fi=" + aluno.getAlunId());
                                    vlBtn = "Actualizar Registo";
                                    lblReg = "Actualizar Registo";
                                    icnReg = "icon-pencil4";

                                    niv = encryptUtils.decodeString(aluno.getAlunNivel());
                                    ocup = encryptUtils.decodeString(aluno.getPessoa().getPessActividade());
                                    cat = encryptUtils.decodeString(aluno.getAlunCategoria());

                                    Pessoa pessoa = aluno.getPessoa();

                                    nm = encryptUtils.decodeString(pessoa.getPessNome());
                                    apl = encryptUtils.decodeString(pessoa.getPessApelido());
                                    bi = encryptUtils.decodeString(pessoa.getPessBi());
                                    sex = encryptUtils.decodeString(pessoa.getPessSexo());
                                    mail = encryptUtils.decodeString(pessoa.getPessEmail());
                                    cnt = encryptUtils.decodeString(pessoa.getPessContacto());
                                    nuit = encryptUtils.decodeString(pessoa.getPessNuit());
                                    doc = encryptUtils.decodeString(pessoa.getPessDocumento());
                                    distr = encryptUtils.decodeString(pessoa.getPessDistrito());

                                    resp = encryptUtils.decodeString(pessoa.getPessResponsavel());
                                    cntResp = encryptUtils.decodeString(pessoa.getPessNomeMae());

                                    prov = encryptUtils.decodeString(pessoa.getPessProvincia());
                                    quar = encryptUtils.decodeString(pessoa.getPessRua());
                                    casa = encryptUtils.decodeString(pessoa.getPessNumeroCasa());
                                    end = encryptUtils.decodeString(pessoa.getPessBairro());
                                    dNas = sdf.format(pessoa.getPessDataNascimento().toGregorianCalendar().getTime());

                                    if (sex.equals("Feminino")) {
                                        sM = "";
                                        sF = "checked";
                                    }

                                    if (!aluno.isAlunDeficiente()) {

                                        dN = "checked";
                                        dS = "";
                                    }

                                    if (aluno.isAlunDeficiente()) {

                                        dN = "";
                                        dS = "checked";
                                    }

                                    bos = encryptUtils.decodeString(aluno.getAlunBolseiro());

                                    if (bos.equals("Bolseiro Parcial")) {
                                        bS = "";
                                        bI = "";
                                        bN = "checked";
                                    }

                                    if (bos.equals("Bolseiro Integral")) {
                                        bS = "";
                                        bI = "checked";
                                        bN = "";
                                    }

                                    if (mail.equals("N/D")) {
                                        mail = "";
                                    }

                                }

                                if (inscricao != null) {
                                    con = encryptUtils.decodeString(inscricao.getInscCondicao());

                                    String pg = encryptUtils.decodeString(inscricao.getInscNrTransfercia());

                                    if (pg.equals("Talão de Depósito")) {
                                        tB = "";
                                        tD = "checked";
                                        cH = "";
                                    }
                                    if (pg.equals("Cheque")) {
                                        tB = "";
                                        tD = "";
                                        cH = "checked";
                                    }

                                    if (inscricao.isInscCertificado()) {
                                        cD = "checked";
                                    }

                                    if (inscricao.isInscCopiaBI()) {
                                        cB = "checked";
                                    }

                                    if (inscricao.isInscFotos()) {
                                        fT = "checked";
                                    }
                                }

                                nomeC = nm;
                                if (!apl.isEmpty()) {
                                    nomeC += " " + apl;
                                }
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



                                            <div class="col-md-6">
                                                <fieldset>
                                                    <legend class="text-semibold"><i class="icon-reading position-left"></i> Dados do aluno</legend>

                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Nome Completo:</label>
                                                        <div class="col-lg-9">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group has-feedback has-feedback-right">

                                                                        <input type="text" placeholder="Nome Completo" class="form-control" name="nomeCompleto" value="<%=nomeC%>" required="">
                                                                        <div class="form-control-feedback">
                                                                            <i class="icon-regexp2 text-danger"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Identificação:</label>
                                                        <div class="col-lg-9">

                                                            <div class="row">
                                                                <div class="col-md-5">
                                                                    <select data-placeholder="Selecione o tipo" class="select" required="" name="documento">
                                                                        <option></option>
                                                                        <%
                                                                            String documentos[] = {"BI", "Passaporte", "DIRE", "Cédula pessoal", "Cartão de eleitor", "Carta de condução", "Outro"};

                                                                            for (String s : documentos) {

                                                                                String sel = "";

                                                                                if (s.equals(doc)) {
                                                                                    sel = "selected";
                                                                                }
                                                                        %>
                                                                        <option value="<%=s%>" <%=sel%>><%=s%></option> 
                                                                        <%
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>

                                                                <div class="col-md-7">
                                                                    <div class="form-group has-feedback has-feedback-right">

                                                                        <input type="text" placeholder="BI/DIRE/Passaporte N.º" class="form-control" name="bi" value="<%=bi%>" required="" maxlength="13">
                                                                        <div class="form-control-feedback">
                                                                            <i class="icon-regexp2 text-danger"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>



                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Validade Doc.:</label>
                                                        <div class="col-lg-9">

                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <input type="text" placeholder="Data de Validade" class="form-control mb-15  daterange-single" name="dataValidade">
                                                                </div>

                                                                <div class="col-md-6">
                                                                    <input type="number"  oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" maxlength="9" placeholder="NUIT" class="form-control" name="nuit" value="<%=nuit%>">
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Data Nascimento:</label>
                                                        <div class="col-lg-9">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group has-feedback has-feedback-right">

                                                                        <input type="text" placeholder="Data de Nascimento" class="form-control mb-15  daterange-single" name="dataNascimento" value="<%=dNas%>" required="">
                                                                        <div class="form-control-feedback">
                                                                            <i class="icon-regexp2 text-danger"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Sexo:</label>
                                                        <div class="col-lg-9">
                                                            <div class="row">

                                                                <label class="radio-inline">
                                                                    <input type="radio" name="sexo" class="styled" <%=sM%> value="Masculino">
                                                                    Masculino
                                                                </label>

                                                                <label class="radio-inline">
                                                                    <input type="radio" name="sexo" class="styled" <%=sF%> value="Feminino">
                                                                    Feminino
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </fieldset>


                                                <fieldset>
                                                    <legend class="text-semibold"><i class="icon-user position-left"></i> Encarregado Educação</legend>

                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Nome do Encarregado:</label>
                                                        <div class="col-lg-9">

                                                            <div class="row">
                                                                <div class="col-md-7">
                                                                    <div class="form-group has-feedback has-feedback-right">
                                                                        <input type="text" placeholder="Nome do Encarregado Educação" class="form-control"name="responsavel" value="<%=resp%>" required="">
                                                                        <div class="form-control-feedback">
                                                                            <i class="icon-regexp2 text-danger"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-5">
                                                                    <input type="text" placeholder="Contacto " class="form-control" name="contactoResponsavel" value="<%=cntResp%>" required="">

                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Contacto:</label>
                                                        <div class="col-lg-9">

                                                            <div class="row">
                                                                <div class="col-md-7">
                                                                    <input type="email" placeholder="E-mail" class="form-control"name="email" value="<%=mail%>">
                                                                </div>

                                                                <div class="col-md-5">
                                                                    <input type="text" placeholder="Telefone/telemóvel:" class="form-control" name="contacto" value="<%=cnt%>" required="">

                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>

                                                </fieldset>


                                                <fieldset>
                                                    <legend class="text-semibold"><i class="icon-man-woman position-left"></i> Filiação</legend>
                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Pai:</label>
                                                        <div class="col-lg-9">

                                                            <div class="row">
                                                                <div class="col-md-7">
                                                                    <input type="text" placeholder="Nome do Pai" class="form-control"name="nomePai">
                                                                </div>

                                                                <div class="col-md-5">
                                                                    <input type="text" placeholder="Contacto do Pai" class="form-control" name="contactoPai">
                                                                </div>
                                                            </div>
                                                            <br>
                                                            <div class="row">
                                                                <div class="col-md-7">
                                                                    <input type="text" placeholder="Local Trabalho do Pai" class="form-control"name="localPai">

                                                                </div>

                                                                <div class="col-md-5">
                                                                    <input type="text" placeholder="Profissão do Pai" class="form-control" name="profissaoPai">
                                                                </div>
                                                            </div>


                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Mãe:</label>
                                                        <div class="col-lg-9">

                                                            <div class="row">
                                                                <div class="col-md-7">
                                                                    <input type="text" placeholder="Nome do Mãe" class="form-control"name="nomeMae">
                                                                </div>

                                                                <div class="col-md-5">
                                                                    <input type="text" placeholder="Contacto da Mãe" class="form-control" name="contactoMae">
                                                                </div>
                                                            </div>
                                                            <br>
                                                            <div class="row">
                                                                <div class="col-md-7">
                                                                    <input type="text" placeholder="Local Trabalho da Mãe" class="form-control"name="localPai">

                                                                </div>

                                                                <div class="col-md-5">
                                                                    <input type="text" placeholder="Profissão da Mãe" class="form-control" name="profissaoPai">
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>


                                                </fieldset>

                                            </div>



                                            <div class="col-md-6">



                                                <fieldset>
                                                    <legend class="text-semibold"><i class="icon-home5 position-left"></i> ENDEREÇO</legend>


                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Localização:</label>
                                                        <div class="col-lg-9">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <select id="make" data-placeholder="Selecione a provincia" class="select" name="provincia" required="">
                                                                        <option></option>
                                                                        <%
                                                                            String provincias[] = {"Cidade de Maputo", "Maputo", "Gaza", "Inhambane", "Manica", "Niassa",
                                                                                "Nampula", "Sofala", "Tete", "Zambézia", "Cabo Delgado"};

                                                                            for (String s : provincias) {
                                                                                String sel = "";

                                                                                if (prov.equals(s)) {
                                                                                    sel = "selected";
                                                                                }
                                                                        %>
                                                                        <option value ="<%=s%>" <%=sel%>><%=s%></option>
                                                                        <%
                                                                            }
                                                                        %>
                                                                    </select>

                                                                </div>

                                                                <div class="col-md-6">
                                                                    <select id="models"  data-placeholder="Selecione o distrito" class="select" name="distrito" required="">
                                                                        <option></option>

                                                                        <%
                                                                            String distritos[] = {"KaMpfumo", "Nlhamankulu", "KaMaxaquene", "KaMavota", "KaMubukwana", "KaTembe", "KaNyaka"};

                                                                            for (String s : distritos) {
                                                                                String sel = "";

                                                                                if (distr.equals(s)) {
                                                                                    sel = "selected";
                                                                                }
                                                                        %>
                                                                        <option value ="<%=s%>" <%=sel%>><%=s%></option>
                                                                        <%
                                                                            }
                                                                        %>
                                                                    </select>       
                                                                </div>
                                                            </div>
                                                            <br>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group has-feedback has-feedback-right">

                                                                        <input type="text" placeholder="Bairro" class="form-control" name="endereco" value="<%=end%>" required="">
                                                                        <div class="form-control-feedback">
                                                                            <i class="icon-regexp2 text-danger"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <br>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <input type="text" placeholder="Quarteirão/Talhão" class="form-control mb-15"  name="quarteirao" value="<%=quar%>">
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <input type="text" placeholder="Nº da Casa" class="form-control"  name="casa" value="<%=casa%>">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>


                                                <fieldset>
                                                    <legend class="text-semibold"><i class="icon-accessibility position-left"></i> Informação adicional</legend>


                                                    <div class="form-group">
                                                        <label class="col-lg-7 control-label text-bold">Órfão/Vulnerável/Portador de Doença:</label>
                                                        <div class="col-lg-4">
                                                            <div class="row">

                                                                <label class="radio-inline">
                                                                    <input type="radio" name="deficiencia" class="styled" <%=dS%> value="Sim">
                                                                    Sim
                                                                </label>

                                                                <label class="radio-inline">
                                                                    <input type="radio" name="deficiencia" class="styled" <%=dN%> value="Não">
                                                                    Não
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </fieldset>

                                                <fieldset>
                                                    <legend class="text-semibold"><i class="icon-book position-left"></i> Habilitações</legend>


                                                    <div class="form-group">
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Formação:</label>
                                                        <div class="col-lg-9">
                                                            <div class="row">
                                                                <div class="col-md-8">
                                                                    <div class="mb-15">
                                                                        <select data-placeholder="Selecione a formação" class="select" required="" name="nivel">
                                                                            <option></option>
                                                                            <%
                                                                                String niveis[] = {"Ensino básico", "Ensino médio", "Ensino técnico", "Ensino técnico superior", "Ensino superior"};

                                                                                for (String s : niveis) {

                                                                                    String sel = "";

                                                                                    if (s.equals(niv)) {
                                                                                        sel = "selected";
                                                                                    }
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
                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Ocupação:</label>
                                                        <div class="col-lg-9">
                                                            <div class="row">
                                                                <div class="col-md-8">
                                                                    <div class="mb-15">
                                                                        <select data-placeholder="Selecione a ocupação" class="select" required="" name="ocupacao">
                                                                            <option></option>
                                                                            <%
                                                                                String ocupacoes[] = {"Estudante", "Funcionário Público", "Funcionário Privado", "Conta Própria", "Desempregado"};

                                                                                for (String s : ocupacoes) {

                                                                                    String sel = "";

                                                                                    if (s.equals(ocup)) {
                                                                                        sel = "selected";
                                                                                    }
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


                                                </fieldset>





                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label text-bold text-uppercase">Documentos:</label>
                                                    <div class="col-lg-9">
                                                        <div class="row">


                                                            <label class="radio-inline">
                                                                <input type="checkbox" name="certificado" class="styled"  <%=cD%>>
                                                                Certificado/ Declaração Provisória
                                                            </label>

                                                            <label class="radio-inline">
                                                                <input type="checkbox" name="copiaBI" class="styled" <%=cB%>>
                                                                Cópia do BI
                                                            </label>

                                                            <label class="radio-inline">
                                                                <input type="checkbox" name="fotos" class="styled" <%=fT%>>
                                                                Fotos
                                                            </label>
                                                        </div>
                                                    </div>

                                                </div>


                                            </div>

                                        </div>


                                        <div class="text-left">
                                            <i class="icon-regexp2 text-danger"></i> -  <span class="text-semibold text-muted">Campos de preenchimento obrigatório</span>
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


        <script>
            $(function () {

                var dist = '<%=distr%>';
                //setup arrays
                var cars = {
                    "Cidade de Maputo": ['KaMpfumo', 'Nlhamankulu', 'KaMaxaquene', 'KaMavota', 'KaMubukwana', 'KaTembe', 'KaNyaka'],
                    "Maputo": ['Boane', 'Cidade da Matola', 'Magude', 'Marracuene', 'Matutuíne', 'Moamba', 'Namaacha'],
                    "Gaza": ['Bilene - Macia', 'Chibuto', 'Chicualacuala', 'Chigubo', 'Chòkwé', 'Cidade de Xai-Xai', 'Guijá', 'Mabalane', 'Manjacaze - Dingane', 'Xai-Xai Distrito'],
                    "Inhambane": ['Cidade de Maxixe', 'Cidade de Inhambane', 'Funhalouro', 'Govuro', 'Homoíne', 'Inharrime', 'Inhassoro', 'Jangamo', 'Mabote', 'Massinga', 'Morrumbene', 'Panda', 'Vilankulo', 'Zavala'],
                    "Manica": ['Barué', 'Cidade de Chimoio', 'Gondola', 'Guro', 'Muchaze', 'Macossa', 'Manica', 'Mossurize', 'Sussundega', 'Tambara'],
                    "Nampula": ['Angoche', 'Cidade de Nampula', 'Ilha de Moçambique', 'Lalaua', 'Malema', 'Meconta', 'Mecubúri', 'Memba', 'Mongicual', 'Mogovolas', 'Moma', 'Mossuril', 'Muecate', 'Murrupula', 'Nacala - Porto', 'Nacala - Velha', 'Nacarôa', 'Namapa - Eráti', 'Nampula - Distrito', 'Ribaué'],
                    "Niassa": ['Chimbonila', 'Cuamba', 'Lago', 'Lichinga', 'Majune', 'Mandimba', 'Marrupa', 'Maúa', 'Mavago', 'Mecanhelas', 'Mecula', 'Metarica', 'Muembe', 'Ngauma', 'Nipepe', 'Sanga'],
                    "Sofala": ['Búzi', 'Caia', 'Magude', 'Chemba', 'Cheringoma', 'Chibabava', 'Cidade da Beira', 'Dondo', 'Gorongosa', 'Machanga', 'Marromeu', 'Maríngue', 'Muanza', 'Nhamatanda'],
                    "Tete": ['Angónia', 'Cahora Bassa', 'Changara', 'Chifunde', 'Chiúta', 'Cidade de Tete', 'Macanga', 'Marávia', 'Moatize', 'Mutarara', 'Mágoé', 'Tsangano', 'Zumbo'],
                    "Zambézia": ['Alto Molócué', 'Chinde', 'Cidade de Quelimane', 'Gilé', 'Gurué', 'Ile', 'Inhassunge', 'Lugela', 'Maganja da Costa', 'Milange', 'Mocuba', 'Mopeia', 'Morrumbala', 'Namacurra', 'Namarrói', 'Nicoadala', 'Pebane'],
                    "Cabo Delgado": ['Ancuabe', 'Balama', 'Chiúre', 'Cidade de Pemba', 'Ibo', 'Macomia', 'Mecúfi', 'Mocímboa da Praia', 'Montepuez', 'Mueda', 'Muidumbe', 'Namuno', 'Nangade', 'Pemba - Metuge', 'Quissanga']
                };

                $('#make').change(function () {
                    $("#models").html(""); //clear existing options
                    var newOptions = cars[this.value]; //finds the array w/the name of the selected value
                    //populate the new options
                    for (var i = 0; i < newOptions.length; i++) {

                        if (newOptions[i] === dist)
                        {
                            $("#models").append("<option value='" + newOptions[i] + "' selected>" + newOptions[i] + "</option>");
                        } else
                        {
                            $("#models").append("<option value='" + newOptions[i] + "'>" + newOptions[i] + "</option>");
                        }
                    }
                    $('#models').prop('disabled', false); //enable the dropdown
                });
            });
        </script>

        <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>
    </body>
</html>
