<%-- 
    Document   : ip-status
    Created on : Oct 23, 2017, 6:37:16 PM
    Author     : hamil
--%>

<%@page import="com.dciapps.webclient.Doc"%>
<%@page import="com.dciapps.webclient.ModulosUsuario"%>
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
        <title>SEGIA -  Documentos</title>

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
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
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

        <!-- START NOTIFICATION -->

        <!-- /theme JS files -->




        <%

            int timeout = session.getMaxInactiveInterval();

            GenericHandler gh = new GenericHandler(request, response);
            Usuario usuario = gh.loggedUser();

            String nome = "";
            String fotoPerfil = "";

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MMMM-yyyy");
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            EncryptUtils encryptUtils = new EncryptUtils();

            StringUtils stringUtils = new StringUtils();

            List<Doc> docs = null;

            String msgErro = "";
            String alerta = "";

            String dataSelecionada = "";
            String periodoSelecionado = "";
            String cargo = "";
            ModulosUsuario mu = null;

            String ae = "";

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");
                docs = (List<Doc>) session.getAttribute("docs");

                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();

                dataSelecionada = session.getAttribute("dataSelecionada").toString();
                periodoSelecionado = session.getAttribute("periodo").toString();

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
                <h6 class="text-semibold class text-uppercase" style="margin-left: 2em;">Sistema Electrónico de Gestão de Informação Académica</h6>

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
                            <ul class="nav navbar-nav element-active-success-400">

                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-stack-text position-left"></i> Documentos Emitidos </a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->



                    <div class = "row">

                        <!-- Vertical form options -->
                        <div class="col-md-3">

                            <!-- Basic layout-->
                            <form method="post" action="Q29uc2VsaG9TZXJ2bGV0I0RDSQ==?YWNjYW8jZG9jdW1lbnRvcw==">
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-bold text-uppercase">Selecione o Periodo</h6>
                                        <div class="heading-elements">
                                            <ul class="icons-list">
                                                <li><a data-action="collapse"></a></li>
                                                <li><a data-action="reload"></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="panel-body">



                                        <div class="form-group">
                                            <label class="text-bold text-uppercase">Periodo (Data): </label>

                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icon-calendar22"></i></span>
                                                <input type="text" class="form-control daterange-weeknumbers" value="<%=dataSelecionada%>" name="dataPesquisa"> 
                                            </div>
                                        </div>


                                        <div class="text-right">
                                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 text-bold text-uppercase">Filtrar requisicões <i class="icon-filter3 position-right"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- /basic layout -->

                        </div>

                    </div>	

                    <div class="row">



                        <!-- Vertical form options -->
                        <div class="col-md-12">
                            <!-- Basic responsive configuration -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-bold text-uppercase">Documentos Emitidos  <span class="text-danger"> (<%=periodoSelecionado%>)</span></h6>
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
                                            <th class="text-bold text-uppercase">#</th>
                                            <th class="text-bold text-uppercase">Data</th>
                                            <th  class="text-bold text-uppercase">Tipo Doc.</th>
                                            <th  class="text-bold text-uppercase">Destinatário</th>
                                            <th  class="text-bold text-uppercase">Assunto</th>
                                            <th  class="text-bold text-uppercase text-danger-400">---</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%

                                            if (docs != null) {

                                                for (Doc d : docs) {

                                                    int id = d.getDocId();
                                                    String dte = sdf.format(d.getDocData().toGregorianCalendar().getTime());

                                                    String ref = encryptUtils.decodeString(d.getDocTipo());
                                                    String ass = encryptUtils.decodeString(d.getDocAssunto());
                                                    String cc = encryptUtils.decodeString(d.getDocDestinatario());

                                                    String lblStatus = "bg-success-600";
                                                    String inkStatus = "icon-checkmark-circle";
                                                    String status = "";

                                                    if (status.equals("NÃO APROVADA")) {
                                                        lblStatus = "bg-danger-600";
                                                        inkStatus = "icon-close2";
                                                    }

                                                    if (status.equals("PENDENTE (DIRECTOR SECTOR)")) {
                                                        lblStatus = "bg-orange-600";
                                                        inkStatus = "icon-spinner3 spinner";
                                                    }

                                                    if (status.equals("PENDENTE (DIRECTOR GERAL)")) {
                                                        lblStatus = "bg-warning-600";
                                                        inkStatus = "icon-spinner10 spinner";
                                                    }

                                                    String dteA = "---";

                                                    if (d.getDocDataDespacho() != null) {
                                                        dteA = sdf.format(d.getDocDataDespacho().toGregorianCalendar().getTime());
                                                    }

                                                    String actE = encryptUtils.encodeString("accao#editar-documento&id=" + id);

                                                    String actI = encryptUtils.encodeString("accao#detalhes-documento&id=" + id);

                                                    String actP = encryptUtils.encodeString("accao#imprimir-documento&id=" + id);

                                                    String actR = encryptUtils.encodeString("accao#remover-documento&id=" + id);

                                                    Usuario u = d.getUsuario();

                                                    String text = encryptUtils.decodeString(d.getDocTexto());

                                                    String dteFull = sdf2.format(d.getDocData().toGregorianCalendar().getTime());

                                                    dteFull = dteFull.replace("January", "Janeiro");
                                                    dteFull = dteFull.replace("February", "Fevereiro");
                                                    dteFull = dteFull.replace("March", "Março");
                                                    dteFull = dteFull.replace("April", "Abril");
                                                    dteFull = dteFull.replace("May", "Maio");
                                                    dteFull = dteFull.replace("June", "Junho");
                                                    dteFull = dteFull.replace("July", "Julho");
                                                    dteFull = dteFull.replace("August", "Agosto");
                                                    dteFull = dteFull.replace("September", "Setembro");
                                                    dteFull = dteFull.replace("October", "Outubro");
                                                    dteFull = dteFull.replace("November", "Novembro");
                                                    dteFull = dteFull.replace("December", "Dezembro");
                                                    dteFull = dteFull.replace("-", " de ");

                                                    String esc = "---";
                                                    String prov = "---";

                                                    if (d.getEscola() != null) {
                                                        esc = encryptUtils.decodeString(d.getEscola().getEscDescricao());
                                                        prov = encryptUtils.decodeString(d.getEscola().getEscProvincia());
                                                    }

                                        %>
                                        <tr>
                                            <td><a href="#"><%=id%></a></td>
                                            <td><%=dte%></td>
                                            <td class="text-bold text-info-600"><small><%=ref%></small></td>
                                            <td class="text-bold"><small><%=cc%></small></td>
                                            <td class="text-bold text-danger"><small class="text-size-small"><%=ass%></small></td>
                                            <td>

                                                <div class="btn-group">
                                                    <button type="button" class="btn bg-slate-600 btn-icon dropdown-toggle" data-toggle="dropdown">
                                                        <i class="icon-menu7"></i> &nbsp;<span class="caret"></span>
                                                    </button>

                                                    <ul class="dropdown-menu dropdown-menu-right" style="width: 12em;
                                                        height: 3em;
                                                        line-height: 2em;
                                                        border: 1px solid #ccc;
                                                        padding: 0;
                                                        margin: 0;
                                                        overflow: scroll;
                                                        overflow-x: hidden;">

                                                        <li><a href="#" data-toggle="modal" data-target="#modal_large_<%=id%>" class="text-uppercase"><i class="icon-info22 text-blue-800"></i> Mais detalhes</a></li>
                                                        <li><a href="Q29uc2VsaG9TZXJ2bGV0I0RDSQ==?<%=actP%>" target="_blank" class="text-uppercase"><i class="icon-printer2"></i> Imprimir Doc.</a></li>

                                                        <li><a href="Q29uc2VsaG9TZXJ2bGV0I0RDSQ==?<%=actE%>" class="text-uppercase"><i class="icon-pencil6 text-info-800"></i>Editar Doc.</a></li>
                                                        <li><a href="Q29uc2VsaG9TZXJ2bGV0I0RDSQ==?<%=actR%>" class="text-uppercase"><i class="icon-cross2 text-danger-800"></i>Remover Doc.</a></li>


                                                    </ul>
                                                </div>


                                                <!-- Large modal -->
                                                <div id="modal_large_<%=id%>" class="modal fade">
                                                    <div class="modal-dialog modal-lg">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            </div>

                                                            <div class="modal-body">

                                                                <center>	
                                                                    <img src="http://<%=ip%>:8081/suc/images/app-icons/governo.png" alt="" class="img-responsive" style="width:50%; max-width: 60px;">
                                                                </center>

                                                                <h6 class="text-bold text-uppercase text-center">REPÚBLICA DE MOÇAMBIQUE</h6>
                                                                <h5 class="text-bold text-uppercase text-center"><%=esc%></h5>
                                                                <p></p>
                                                                <br>

                                                                <blockquote class="no-margin text-justify">
                                                                    <br>

                                                                    <h6 class="text-bold text-uppercase text-center"><u><%=ref%></u></h6>


                                                                    <%
                                                                        if (!cc.equals("N/D")) {
                                                                    %>
                                                                    <footer class="text-right">AO<br><%=cc%></footer>
                                                                    <br>
                                                                    <%
                                                                        }
                                                                    %>

                                                                    <%=text%>

                                                                    <br>

                                                                    <center>
                                                                        <b><%=prov%>, <%=dteFull%></b>

                                                                        <br><br><br><br>

                                                                        <%
                                                                            if (ref.equals("Carta Formal")) {
                                                                        %>

                                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td style="width:301px; text-transform: uppercase;">
                                                                                        <p align="center"><strong>O Presidente do Conselho da Escola</strong></p>
                                                                                    </td>
                                                                                    <td style="width:301px; text-transform: uppercase;">
                                                                                        <p align="center"><strong>O Director da Escola</strong></p>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="width:301px;">
                                                                                        <p align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>

                                                                                        <p align="center">________________________</p>
                                                                                    </td>
                                                                                    <td style="width:301px;">
                                                                                        <p align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>

                                                                                        <p align="center">_________________________</p>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                        <%
                                                                        } else {
                                                                        %>


                                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td style="width:301px; text-transform: uppercase;">
                                                                                        <p align="center"><strong>O Presidente do Conselho da Escola</strong></p>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="width:301px;">
                                                                                        <p align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>

                                                                                        <p align="center">________________________</p>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>

                                                                        <%
                                                                            }
                                                                        %>

                                                                    </center>

                                                                </blockquote>
                                                            </div>

                                                            <div class="modal-footer">
                                                                <button type="button" class="btn bg-danger-600 text-bold text-uppercase" data-dismiss="modal"><i class="icon-chevron-down"></i> Fechar </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /large modal -->

                                            </td>

                                        </tr>

                                        <%                                            }
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
