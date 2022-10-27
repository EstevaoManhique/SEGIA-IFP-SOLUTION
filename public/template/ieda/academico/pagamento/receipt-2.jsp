<%-- 
    Document   :  -receipt
    Created on : Feb 11, 2017, 7:30:25 PM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.Cliente"%>
<%@page import="com.dciapps.webclient.ReciboPagamento"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dciapps.webclient.Fornecedor"%>
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
        <title>SEGIA -  ReciboPagamentos</title>

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

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy, HH:mm:ss");
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            EncryptUtils encryptUtils = new EncryptUtils();

            ModulosUsuario mu = null;
            List<ReciboPagamento> recibosPagamentos = null;
            String dataSelecionada = "";
            String periodo = "";

            String msgErro = "";
            String alerta = "";

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();

                dataSelecionada = session.getAttribute("dataSelecionada").toString();
                periodo = session.getAttribute("periodo").toString();

                recibosPagamentos = (List<ReciboPagamento>) session.getAttribute("recibosPagamentos");

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

    <body oncontextmenu="return false"  class="navbar-top">



        <!-- Main navbar -->
        <div class="navbar navbar-inverse  navbar-fixed-top">
            <div class="navbar-header">
                <h6 class="text-semibold class text-uppercase" style="margin-left: 2em;">Sistema Electrónico de Gestão de Informação Académica</h6>

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


                        <!-- <ul class="dropdown-menu">
                             <li><a class="english"><img src="assets/images/flags/gb.png" alt=""> English</a></li>
                         </ul> -->
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
                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase text-uppercase text-bold btn-labeled btn-labeled-left bg-danger-400 heading-btn">Voltar ao painel principal<b><i class="icon-chevron-left"></i></b></button>
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
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-printer2 position-left"></i> ReciboPagamentos de Pagamento</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->




                    <div class = "row">

                        <div class = "col-md-12 col-md-offset-0">
                            <!-- Vertical form options -->
                            <div class="col-md-3">

                                <!-- Basic layout-->
                                <form method="post" action="UGFnYW1lbnRvU2VydmxldCNEQ0k=?YWNjYW8jcmVjaWJvc1BhZ2FtZW50b3M=">
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
                                                <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase text-uppercase text-bold bg-orange-800">Filtrar Resultados <i class="icon-filter3 position-right"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!-- /basic layout -->

                            </div>

                            <div class="col-md-9">




                                <!-- Basic responsive configuration -->
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-bold text-uppercase">Extracto dos recibos DE Pagamentos <span class="text-danger">(<%=periodo%>)</span></h6>
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
                                                <th class = "text-bold text-uppercase">#</th>
                                                <th class = "text-bold text-uppercase">Data</th>
                                                <th class = "text-bold text-uppercase">Ref.</th>
                                                <th class = "text-bold text-uppercase">Aluno</th>
                                                <th class = "text-bold text-uppercase">Valor Total</th>
                                                <th class="text-bold text-uppercase text-danger-400">Opções</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <%
                                                if (recibosPagamentos != null) {

                                                    SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
                                                    for (ReciboPagamento r : recibosPagamentos) {

                                                        int id = r.getRecpId();
                                                        String nrDoc = encryptUtils.decodeString(r.getRecpReferencia());
                                                        String desc = encryptUtils.decodeString(r.getRecpObservacoes());
                                                        String cat = "";
                                                        String forn = encryptUtils.decodeString(r.getRecpReferencia());
                                                        String dte = sdf1.format(r.getRecpData().toGregorianCalendar().getTime());
                                                        String val = df.format(r.getRecpTotal());
                                                        String nuit = "---";

                                                        if (r.getPessoa() != null) {

                                                            nuit = encryptUtils.decodeString(r.getPessoa().getPessNome()) + " " + encryptUtils.decodeString(r.getPessoa().getPessApelido());
                                                        }

                                                        String actRC = encryptUtils.encodeString("accao#imprimir-reciboPagamento&id=" + id);
                                                        String act = encryptUtils.encodeString("accao#remover-reciboPagamento&id=" + id);

                                                        String status = "";

                                                        status = "LIQUIDADO";

                                            %>
                                            <tr>
                                                <td><a href="#"><%=id%></a></td>
                                                <td><%=dte%></td>
                                                <td><%=nrDoc%></td>
                                                <td><%=nuit%></td>
                                                <td><%=val%></td>
                                                <td>
                                                    <ul class="icons-list">
                                                        <li><a href="#" data-toggle="modal" data-target="#modal_<%=id%>"><i class="icon-eye"></i></a></li>

                                                        <%
                                                            if (!status.equals("Cancelado")) {
                                                        %>
                                                        <li><a href="UGFnYW1lbnRvU2VydmxldCNEQ0k=?<%=actRC%>" target="_blank"><i class="icon-printer4"></i></a></li>

                                                        <%
                                                            }
                                                            if (usuario.getTipoUsuariotipu().getTipuId() == 1) {
                                                        %>

                                                        <li><a href="#" data-toggle="modal" data-target="#modal_rem_<%=id%>"><i class="icon-cancel-circle2 text-danger-800"></i></a></li>



                                                        <!-- Danger modal -->
                                                        <div id="modal_rem_<%=id%>" class="modal fade">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                        <h6 class="modal-title text-semibold">Confirma a remoção do recibo de pagamento com a referência #<%=id%> ?</h6>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <h6 class="text-bold text-danger" ><i class="icon-question6 text-danger" style="font-size: 100px"></i></h6>

                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn text-uppercase text-bold btn-link" data-dismiss="modal">Cancelar</button>

                                                                        <a href="UGFnYW1lbnRvU2VydmxldCNEQ0k=?<%=act%>" class="btn btn-danger text-bold text-uppercase">Sim, confirmo !</a>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- /default modal -->       

                                                        <%
                                                        } else {
                                                        %>
                                                        <li><a href="#"><i class="icon-minus2 text-black"></i></a></li>
                                                                <%
                                                                    }
                                                                %>

                                                    </ul>

                                                    <!-- Modal with consult -->
                                                    <div id="modal_<%=id%>" class="modal fade">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="panel-body no-padding-bottom">

                                                                    <div class="row">
                                                                        <div class="col-md-6 col-lg-9 content-group">
                                                                            <span class="text-muted text-bold">Detalhes do ReciboPagamento:</span>
                                                                            <ul class="list-condensed list-unstyled invoice-payment-details">
                                                                                <li>Nº Documento: <span class="text-semibold"><%=nrDoc%></span></li>
                                                                                <li>Cliente: <span><%=nuit%></span></li>
                                                                                <li>Valor: <span><%=val%></span></li>
                                                                                <li>
                                                                                    <div class="content-group">
                                                                                        <h6><strong>Observações</strong></h6>
                                                                                        <div class="mb-15 mt-15" style="text-align:justify;">
                                                                                            <%=desc%>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn text-uppercase text-bold btn-default" data-dismiss="modal">Fechar</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /modal with consult -->           
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
                        <!-- /vertical form options -->
                    </div>	
                    <!-- /vertical form options -->
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
