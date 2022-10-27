<%-- 
    Document   : school-dashboard
    Created on : Feb 8, 2017, 7:04:20 PM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.Pessoa"%>
<%@page import="com.dciapps.webclient.Aluno"%>
<%@page import="com.dciapps.local.ImpAluno"%>
<%@page import="com.dciapps.webclient.ModulosUsuario"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="com.dciapps.controller.GenericHandler"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SEGIA - Importar Alunos</title>

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
        <script type="text/javascript" src="assets/js/plugins/forms/styling/switchery.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
        <script type="text/javascript" src="assets/js/plugins/ui/moment/moment.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/daterangepicker.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/core.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/wizards/form_wizard/form.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/wizards/form_wizard/form_wizard.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/selects/select2.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jasny_bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/validation/validate.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/notifications/sweet_alert.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/datatables.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/extensions/responsive.min.js"></script>

        <script type="text/javascript" src="assets/js/core/app.js"></script>
        <script type="text/javascript" src="assets/js/pages/components_popups.js"></script>



        <script type="text/javascript" src="assets/js/plugins/visualization/d3/d3.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/visualization/d3/d3_tooltip.js"></script>


        <script type="text/javascript" src="assets/js/plugins/visualization/d3/d3.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/visualization/c3/c3.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/visualization/echarts/echarts.js"></script>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>


        <script type="text/javascript" src="assets/js/pages/wizard_form.js"></script>

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
            SimpleDateFormat sdf2 = new SimpleDateFormat("MM/yyyy");
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            EncryptUtils encryptUtils = new EncryptUtils();

            ModulosUsuario mu = null;

            String msgErro = "";
            String alerta = "";
            Entidade entidade = (Entidade) session.getAttribute("entidadeSelecionada");

            List<Aluno> alunos = null;
            List<ImpAluno> importacoes = null;

            if (entidade == null) {
                entidade = (Entidade) session.getAttribute("entidade");
            }

            boolean have = false;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

                alunos = (List<Aluno>) session.getAttribute("alunosReg");

                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();

                importacoes = (List<ImpAluno>) session.getAttribute("importacoesAluno");

                if (importacoes != null) {
                    if (!importacoes.isEmpty()) {
                        have = true;
                    }
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

    <body  oncontextmenu="return false" class="navbar-top">


        <!-- Main navbar -->
        <div class="navbar navbar-inverse navbar-fixed-top">
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


                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-file-upload position-left"></i> Importar Alunos</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->



                    <!-- Vertical form options -->
                    <div class="row">
                        <div class="col-md-4">

                            <%
                                String act = encryptUtils.encodeString("accao#carregar-ficheiro");
                            %>
                            <!-- Basic layout-->
                            <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="QWx1bm9TZXJ2bGV0I0RDSQ==?<%=act%>">
                                <div class="panel panel-flat">

                                    <div class="panel-body">
                                        <div class ="row">
                                            <div class="col-md-12">

                                                <fieldset>
                                                    <legend class="text-bold text-uppercase"><i class="icon-download10 position-left"></i>Carregamento de ficheiro</legend>




                                                    <div class="form-group">
                                                        <label class="text-bold text-uppercase">Localizar ficheiro:</label>
                                                        <br>


                                                        Faça aqui o carregamento do documento com as senhas:

                                                        <span class="help-block">Formatos aceites: xls, xlxs. Tamanho máximo 2Mb</span>

                                                        <center>
                                                            <iframe src="http://<%=ip%>:8081/suc/index-import-segia.php" style=" width: 90%; height: 25em; background: transparent;" frameBorder="0" scrolling="no" id="upload_target" name="upload_target"> </iframe>
                                                        </center>

                                                    </div>


                                                </fieldset>

                                            </div>

                                        </div>

                                        <div class="text-right">
                                            <button type="submit" id='btn3' onclick="this.disabled = 'disabled'; this.form.submit();" class="text-bold text-uppercase btn bg-danger-600 text-bold text-uppercase">Carregar Ficheiro <i class="icon-download4 position-right"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- /basic layout -->


                        </div>


                        <div class="col-md-8">

                            <!-- Basic responsive configuration -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-bold text-uppercase">Listagem de dados à importar</h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>
                                        </ul>
                                    </div>
                                </div>


                                <div class="panel-body">
                                    <p>

                                        <a  href="http://<%=ip%>:8081/suc/excel/segia/modelos/imp_segia_alunos_modelo.xlsx" class="btn bg-success-600 btn-labeled btn-labeled-left text-bold text-uppercase">
                                            <b><i class="icon-file-excel"></i></b>
                                            Descarregar modelo de Importação
                                        </a>


                                        <%
                                            if (have) {
                                        %>

                                    <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="QWx1bm9TZXJ2bGV0I0RDSQ==?YWNjYW8jY29uZmlybWFyLXVwbG9hZA==">

                                        <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="text-bold text-uppercase btn bg-primary-600 text-bold text-uppercase"> Confirmar importação de dados <i class="icon-check position-right"></i></button>
                                    </form>
                                    <%
                                        }
                                    %>

                                    </p>

                                </div>


                                <table class="table datatable-responsive">
                                    <thead>
                                        <tr>
                                            <th class="text-bold text-uppercase">#</th>
                                            <th class="text-bold text-uppercase">Nome Aluno</th>
                                            <th class="text-bold text-uppercase">Documento</th>
                                            <th class="text-bold text-uppercase">Data Nasc.</th>
                                            <th class="text-bold text-uppercase">Sexo</th>
                                            <th class="text-bold text-uppercase">Província</th>
                                            <th class="text-bold text-uppercase">Encarregado</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            int i = 0;

                                            if (importacoes != null) {
                                                for (ImpAluno imp : importacoes) {

                                                    i++;

                                                    String nomeCompleto = imp.getNomeCompleto();
                                                    String documento = imp.getDocumento();
                                                    String bi = imp.getBi();
                                                    String validadeDocumento = imp.getValidadeDocumento();
                                                    String dataNascimento = imp.getDataNascimento();
                                                    String nuit = imp.getNuit();
                                                    String sexo = imp.getSexo();
                                                    String provincia = imp.getProvincia();
                                                    String endereco = imp.getEndereco();
                                                    String deficiencia = imp.getDeficiencia();
                                                    String responsavel = imp.getResponsavel();
                                                    String contactoResponsavel = imp.getContactoResponsavel();
                                                    String email = imp.getEmail();

                                                    String nomePai = imp.getNomePai();
                                                    String contactoPai = imp.getContactoPai();
                                                    String profissaoPai = imp.getProfissaoPai();
                                                    String trabalhoPai = imp.getTrabalhoPai();

                                                    String nomeMae = imp.getNomeMae();
                                                    String contactoMae = imp.getContactoMae();
                                                    String profissaoMae = imp.getProfissaoMae();
                                                    String trabalhoMae = imp.getTrabalhoMae();

                                                    String nivel = imp.getNivel();
                                                    String ocupacao = imp.getOcupacao();

                                        %>
                                        <tr>
                                            <td>

                                                <a  href="#" data-toggle="modal" data-target="#modal_info_<%=i%>"  data-popup="tooltip" title="Mais Detalhes" class="text-bold"><%=i%></a>



                                                <!-- Danger modal -->
                                                <div id="modal_info_<%=i%>" class="modal fade">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                <h6 class="modal-title text-bold text-uppercase">Informações do aluno: <span class="text-danger-600"><%=nomeCompleto%></span></h6>
                                                            </div>
                                                            <div class="modal-body">


                                                                <!-- Bordered striped table -->
                                                                <div class="panel panel-flat">

                                                                    <div class="table-responsive">
                                                                        <table class="table table-bordered table-striped">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td class="text-bold">Validade Doc. Identificação</td>
                                                                                    <td><%=validadeDocumento%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Nuit</td>
                                                                                    <td><%=nuit%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Endereço</td>
                                                                                    <td><%=endereco%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Contato Responsável</td>
                                                                                    <td><%=contactoResponsavel%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">E-mail</td>
                                                                                    <td><%=email%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Órfão/Vulnerável/Portador de Doença</td>
                                                                                    <td><%=deficiencia%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold text-center text-uppercase text-danger" colspan="2">Filiação</td>
                                                                                </tr>

                                                                                <tr>
                                                                                    <td class="text-bold">Nome Pai</td>
                                                                                    <td><%=nomePai%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Contacto Pai</td>
                                                                                    <td><%=contactoPai%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Profissão Pai</td>
                                                                                    <td><%=profissaoPai%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Local Trabalho Pai</td>
                                                                                    <td><%=trabalhoPai%></td>
                                                                                </tr>

                                                                                <tr>
                                                                                    <td class="text-bold">Nome Mãe</td>
                                                                                    <td><%=nomeMae%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Contacto Mãe</td>
                                                                                    <td><%=contactoMae%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Profissão Mãe</td>
                                                                                    <td><%=profissaoMae%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Local Trabalho Mãe</td>
                                                                                    <td><%=trabalhoMae%></td>
                                                                                </tr>

                                                                                <tr>
                                                                                    <td class="text-bold text-center text-uppercase text-danger" colspan="2">Habilitações</td>
                                                                                </tr>

                                                                                <tr>
                                                                                    <td class="text-bold">Formação</td>
                                                                                    <td><%=nivel%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Ocupação</td>
                                                                                    <td><%=ocupacao%></td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                                <!-- /bordered striped table -->

                                                            </div>

                                                            <div class="modal-footer">
                                                                <button type="button" class="btn bg-danger-600 text-bold text-uppercase" data-dismiss="modal"><i class="icon-chevron-down"></i> Fechar</button>


                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /default modal -->   

                                            </td>
                                            <td> <a  href="#" data-toggle="modal" data-target="#modal_info_<%=i%>"  data-popup="tooltip" title="Mais Detalhes" class="text-bold"><%=nomeCompleto%></a></td>
                                            <td><small><%=documento + " - " + bi%></small></td>
                                            <td><%=dataNascimento%></td>
                                            <td><%=sexo%></td>
                                            <td><%=provincia%></td>
                                            <td><%=responsavel%></td>
                                        </tr>
                                        <%                                                }
                                            }
                                        %>

                                    </tbody>
                                </table>

                            </div>
                            <!-- /basic responsive configuration -->
                        </div>


                    </div>
                    <!-- /vertical form options -->

                    <div class="row">

                        <div class="col-md-12">
                            <!-- Basic setup -->
                            <div class="panel panel-white">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-bold text-uppercase">RESUMO DOS ALUNOS IMPORTADOS</h6>
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
                                            <th class="text-bold text-uppercase">Cod. Aluno</th>
                                            <th class="text-bold text-uppercase">Categoria</th>
                                            <th class="text-bold text-uppercase">Nome Aluno</th>
                                            <th class="text-bold text-uppercase">Documento</th>
                                            <th class="text-bold text-uppercase">Data Nasc.</th>
                                            <th class="text-bold text-uppercase">Sexo</th>
                                            <th class="text-bold text-uppercase">Província</th>
                                            <th class="text-bold text-uppercase">Encarregado</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            if (alunos != null) {

                                                for (Aluno a : alunos) {

                                                    Pessoa p = a.getPessoa();
                                                    String cod = encryptUtils.decodeString(a.getAlunBadgnumber());
                                                    String cat = encryptUtils.decodeString(a.getAlunCategoria());

                                                    String nomeCompleto = encryptUtils.decodeString(p.getPessNome()) + " " + encryptUtils.decodeString(p.getPessApelido());
                                                    String documento = encryptUtils.decodeString(p.getPessDocumento());
                                                    String bi = encryptUtils.decodeString(p.getPessBi());
                                                    String validadeDocumento = encryptUtils.decodeString(p.getPessDataValidadeBi());
                                                    String dataNascimento = "";

                                                    if (p.getPessDataNascimento() != null) {
                                                        dataNascimento = sdf.format(p.getPessDataNascimento().toGregorianCalendar().getTime());
                                                    }

                                                    String nuit = encryptUtils.decodeString(p.getPessNuit());
                                                    String sexo = encryptUtils.decodeString(p.getPessSexo());
                                                    String provincia = encryptUtils.decodeString(p.getPessProvincia());
                                                    String endereco = encryptUtils.decodeString(p.getPessBairro());
                                                    String deficiencia = "Não";

                                                    if (a.isAlunDeficiente()) {
                                                        deficiencia = "Sim";
                                                    }

                                                    String responsavel = encryptUtils.decodeString(p.getPessResponsavel());
                                                    String contactoResponsavel = encryptUtils.decodeString(p.getPessContacto());
                                                    String email = encryptUtils.decodeString(p.getPessEmail());

                                                    String nomePai = encryptUtils.decodeString(p.getPessNomePai());
                                                    String contactoPai = encryptUtils.decodeString(p.getPessContactoPai());
                                                    String profissaoPai = encryptUtils.decodeString(p.getPessProfissaoPai());
                                                    String trabalhoPai = encryptUtils.decodeString(p.getPessTrabalhoPai());

                                                    String nomeMae = encryptUtils.decodeString(p.getPessNomeMae());
                                                    String contactoMae = encryptUtils.decodeString(p.getPessContactoMae());
                                                    String profissaoMae = encryptUtils.decodeString(p.getPessProfissaoMae());
                                                    String trabalhoMae = encryptUtils.decodeString(p.getPessTrabalhoMae());

                                                    String nivel = encryptUtils.decodeString(a.getAlunNivel());
                                                    String ocupacao = encryptUtils.decodeString(p.getPessActividade());


                                        %>
                                        <tr>
                                            <td>

                                                <a  href="#" data-toggle="modal" data-target="#modal_info_<%=cod%>"  data-popup="tooltip" title="Mais Detalhes" class="text-bold"><%=cod%></a>



                                                <!-- Danger modal -->
                                                <div id="modal_info_<%=cod%>" class="modal fade">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                <h6 class="modal-title text-bold text-uppercase">Informações do aluno: <span class="text-danger-600"><%=nomeCompleto%></span></h6>
                                                            </div>
                                                            <div class="modal-body">


                                                                <!-- Bordered striped table -->
                                                                <div class="panel panel-flat">

                                                                    <div class="table-responsive">
                                                                        <table class="table table-bordered table-striped">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td class="text-bold">Validade Doc. Identificação</td>
                                                                                    <td><%=validadeDocumento%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Nuit</td>
                                                                                    <td><%=nuit%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Endereço</td>
                                                                                    <td><%=endereco%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Contato Responsável</td>
                                                                                    <td><%=contactoResponsavel%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">E-mail</td>
                                                                                    <td><%=email%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Órfão/Vulnerável/Portador de Doença</td>
                                                                                    <td><%=deficiencia%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold text-center text-uppercase text-danger" colspan="2">Filiação</td>
                                                                                </tr>

                                                                                <tr>
                                                                                    <td class="text-bold">Nome Pai</td>
                                                                                    <td><%=nomePai%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Contacto Pai</td>
                                                                                    <td><%=contactoPai%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Profissão Pai</td>
                                                                                    <td><%=profissaoPai%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Local Trabalho Pai</td>
                                                                                    <td><%=trabalhoPai%></td>
                                                                                </tr>

                                                                                <tr>
                                                                                    <td class="text-bold">Nome Mãe</td>
                                                                                    <td><%=nomeMae%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Contacto Mãe</td>
                                                                                    <td><%=contactoMae%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Profissão Mãe</td>
                                                                                    <td><%=profissaoMae%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Local Trabalho Mãe</td>
                                                                                    <td><%=trabalhoMae%></td>
                                                                                </tr>

                                                                                <tr>
                                                                                    <td class="text-bold text-center text-uppercase text-danger" colspan="2">Habilitações</td>
                                                                                </tr>

                                                                                <tr>
                                                                                    <td class="text-bold">Formação</td>
                                                                                    <td><%=nivel%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-bold">Ocupação</td>
                                                                                    <td><%=ocupacao%></td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                                <!-- /bordered striped table -->

                                                            </div>

                                                            <div class="modal-footer">
                                                                <button type="button" class="btn bg-danger-600 text-bold text-uppercase" data-dismiss="modal"><i class="icon-chevron-down"></i> Fechar</button>


                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /default modal -->   

                                            </td>
                                            <td class="text-bold text-danger-600"><%=cat%></td>
                                            <td> <a  href="#" data-toggle="modal" data-target="#modal_info_<%=i%>"  data-popup="tooltip" title="Mais Detalhes" class="text-bold"><%=nomeCompleto%></a></td>

                                            <td><small><%=documento + " - " + bi%></small></td>
                                            <td><%=dataNascimento%></td>
                                            <td><%=sexo%></td>
                                            <td><%=provincia%></td>
                                            <td><%=responsavel%></td>
                                        </tr>
                                        <%

                                                }
                                            }

                                        %>


                                    </tbody>
                                </table>


                            </div>
                            <!-- /basic setup -->
                        </div>
                    </div>

                    <!-- Content area -->
                    <div class="content">



                        <!-- Footer -->
                        <div class="footer text-bold text-grey-300">
                            <%                                String ano = session.getAttribute("ano").toString();
                            %>
                            &copy; <%=ano%>. <a href="#" class="text-bold">SEGIA</a>. Todos os direitos reservados
                        </div>
                        <!-- /footer -->


                    </div>
                    <!-- /content area -->

                </div>
                <!-- /main content -->

            </div>
            <!-- /page content -->

        </div>
        <!-- /page container -->
    </body>
</html>
