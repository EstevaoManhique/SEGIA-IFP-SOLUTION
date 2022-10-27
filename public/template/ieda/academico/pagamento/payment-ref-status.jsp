<%-- 
    Document   : payment-ref-status
    Created on : Feb 8, 2017, 7:04:20 PM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.Pagamento"%>
<%@page import="com.dciapps.webclient.Turma"%>
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
        <title>SEGIA - Estados Pagamentos</title>

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

            List<Pagamento> pagamentos = null;

            if (entidade == null) {
                entidade = (Entidade) session.getAttribute("entidade");
            }

            String mesPesquisa = "";
            String anoPesquisa = "";

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

                pagamentos = (List<Pagamento>) session.getAttribute("pagamentosPeriodo");

                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();

                if (session.getAttribute("mesPesquisa") != null) {
                    mesPesquisa = session.getAttribute("mesPesquisa").toString();
                }

                if (session.getAttribute("anoPesquisa") != null) {
                    anoPesquisa = session.getAttribute("anoPesquisa").toString();
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



                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-file-spreadsheet position-left"></i> Estado dos pagamentos</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->




                    <div class="row">

                        <div class="col-md-6"> 
                            <!-- Basic layout-->

                            <form method="post" accept-charset="ISO-8859-1" action="UGFnYW1lbnRvU2VydmxldCNEQ0k=?YWNjYW8jc2l0dWFjYW8tcmVmZXJlbmNpYXM=">
                                <div class="panel panel-flat">
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <div class="row">

                                                    <div class="col-md-4">

                                                        <select class="select" name="mesPesquisa">
                                                            <optgroup label="Selecione o mês">

                                                                <%                                                                    String ids[] = {"01", "02", "03", "04", "05", "06", "07", "08",
                                                                        "09", "10", "11", "12"};

                                                                    String meses[] = {"JAN", "FEV", "MAR", "ABR", "MAI", "JUN",
                                                                        "JUL", "AGO", "SET", "OUT", "NOV", "DEZ"};

                                                                    for (int i = 0; i < ids.length; i++) {

                                                                        String sel = "";

                                                                        if (mesPesquisa.equals(ids[i])) {
                                                                            sel = "selected";
                                                                        }
                                                                %>


                                                                <option value="<%=ids[i]%>" <%=sel%>><%=meses[i]%></option>

                                                                <%
                                                                    }
                                                                %>

                                                            </optgroup>
                                                        </select>
                                                    </div>

                                                    <div class="col-md-4">

                                                        <select class="select" name="anoPesquisa">
                                                            <optgroup label="Selecione o ano">

                                                                <%
                                                                    for (int k = 2010; k <= 2025; k++) {

                                                                        String sel = "";

                                                                        if (anoPesquisa.equals(k + "")) {
                                                                            sel = "selected";
                                                                        }
                                                                %>
                                                                <option value="<%=k%>" <%=sel%>><%=k%></option>
                                                                <%
                                                                    }
                                                                %>
                                                            </optgroup>
                                                        </select>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-grey-800 btn-labeled text-bold text-uppercase">
                                                            <b><i class="icon-calendar52 position-right"></i></b> 
                                                            Filtrar
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

                    </div>

                    <div class="row">






                        <!-- Basic responsive configuration -->
                        <div class="panel panel-flat">
                            <div class="panel-heading">
                                <h6 class="panel-title text-uppercase text-bold text-uppercase">Histórico de pagamentos <span class="text-danger-600">[<%=mesPesquisa + "|" + anoPesquisa%>]</span></h6>
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
                                        <th class="text-bold text-uppercase">Aluno</th>
                                        <th class="text-bold text-uppercase">Descrição</th>
                                        <th class="text-bold text-uppercase">Estado</th>
                                        <th class="text-bold text-uppercase">Periodo</th>
                                        <th class="text-bold text-uppercase">Valor</th>
                                        <th class="text-bold text-uppercase">V. Pago</th>
                                        <th class="text-bold text-uppercase">Comissão</th>
                                        <th class="text-bold text-uppercase">Referência</th>
                                        <th class="text-bold text-uppercase">Dta. Pag</th>
                                        <th class="text-bold text-uppercase text-danger-600">---</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%                                                    int numReg = 0;

                                        double total = 0;

                                        double totalPago = 0;

                                        double comissoes = 0;

                                        if (pagamentos != null) {

                                            numReg = pagamentos.size();
                                            for (Pagamento p : pagamentos) {

                                                if (p.getPagRefOnline() != null) {
                                                    int id = p.getPagId();
                                                    String alu = encryptUtils.decodeString(p.getInscricao().getAluno().getAlunBadgnumber())
                                                            + " - "
                                                            + encryptUtils.decodeString(p.getInscricao().getAluno().getPessoa().getPessNome())
                                                            + " " + encryptUtils.decodeString(p.getInscricao().getAluno().getPessoa().getPessApelido());

                                                    String per = sdf2.format(p.getPagData().toGregorianCalendar().getTime());

                                                    String value = df.format(p.getPagValor());
                                                    String valueP = df.format(p.getPagValorPago());
                                                    String ref = encryptUtils.decodeString(p.getPagRefOnline());
                                                    String desc = encryptUtils.decodeString(p.getPagDescricao());

                                                    double com = p.getPagComissao();

                                                    String lbl = "bg-warning-600";

                                                    String status = "Pendente";

                                                    status = encryptUtils.decodeString(p.getPagEstado());

                                                    if (status.equals("Pago")) {
                                                        lbl = "bg-success-800";
                                                    }

                                                    if (status.equals("Pago Parcialmente")) {
                                                        lbl = "bg-success-400";
                                                    }

                                                    if (status.equals("Cancelado")) {
                                                        lbl = "bg-danger-600";
                                                    }

                                                    if (status.equals("Atrasado")) {
                                                        lbl = "bg-slate-600";
                                                    }

                                                    if (status.equals("Pago (Ref.)")) {
                                                        lbl = "bg-teal-600";

                                                    }

                                                    String bgPrint = "bg-danger-400";
                                                    String actP = "#";
                                                    String tar = "";

                                                    if (p.isPagStatus()) {
                                                        status = "Confirmado";
                                                        bgPrint = "bg-success-400";

                                                        actP = "UGFnYW1lbnRvU2VydmxldCNEQ0k=?" + encryptUtils.encodeString("accao#imprimir-pagamento&id=" + id);
                                                        tar = "target ='_blank'";
                                                    }

                                                    String dte = "---";

                                                    if (p.getPagDataPagamento() != null) {
                                                        dte = sdf.format(p.getPagDataPagamento().toGregorianCalendar().getTime());
                                                    }

                                                    totalPago += p.getPagValorPago();

                                                    total += p.getPagValor();

                                                    comissoes += p.getPagComissao();

                                    %>
                                    <tr>
                                        <td><a href="#"><%=id%></a></td>
                                        <td><a href="#"><%=alu%></a></td>
                                        <td class="text-italic"><%=desc%></td>
                                        <td><span class="label <%=lbl%>"><%=status%></span></td>
                                        <td><%=per%></td>
                                        <td><%=value%></td>
                                        <td><%=valueP%></td>
                                        <td class="text-danger-600"><%=df.format(com)%></td>
                                        <td class="text-bold"><%=ref%></td>
                                        <td><%=dte%></td>
                                        <td><a href="<%=actP%>" class="btn <%=bgPrint%>" <%=tar%>><i class="icon-printer"></i></a></td>
                                    </tr>
                                    <%
                                                }
                                            }
                                        }

                                    %>


                                </tbody>
                            </table>


                            <div class="panel-footer">

                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="text-bold text-uppercase">Número total de registos</th>
                                                <th class="text-bold text-uppercase">Valor total pagamentos esperados</th>
                                                <th class="text-bold text-uppercase">Valor total pagamentos feitos</th>
                                                <th class="text-bold text-uppercase">Valor total das comissões</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="text-semibold text-danger-700"><%=numReg%></td>
                                                <td class="text-semibold text-danger-700"><%=df.format(total)%></td>
                                                <td class="text-semibold text-danger-700"><%=df.format(totalPago)%></td>
                                                <td class="text-semibold text-danger-700"><%=df.format(comissoes)%></td>

                                            </tr>

                                        </tbody>
                                    </table>
                                </div>

                            </div>

                        </div>
                        <!-- /basic responsive configuration -->
                    </div>

                    <!-- Content area -->
                    <div class="content">



                        <!-- Footer -->
                        <div class="footer text-bold text-grey-300">
                            <%
                                String ano = session.getAttribute("ano").toString();
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
