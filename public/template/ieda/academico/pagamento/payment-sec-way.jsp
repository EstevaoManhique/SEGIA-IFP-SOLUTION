<%-- 
    Document   : payment-sec-way
    Created on : Apr 5, 2017, 8:39:19 AM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="com.dciapps.local.PInscricao"%>
<%@page import="com.dciapps.webclient.Pagamento"%>
<%@page import="com.dciapps.webclient.Inscricao"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.webclient.ModulosUsuario"%>
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
        <title>SEGIA - 2ª Via</title>

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
        <link href="assets/css/minified/bg.css" rel="stylesheet" type="text/css">
        <!-- /global stylesheets -->

        <!-- Core JS files -->
        <script type="text/javascript" src="assets/js/plugins/loaders/pace.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/loaders/blockui.min.js"></script>
        <!-- /core JS files -->

        <!-- Theme JS files -->

        <!-- Theme JS files -->
        <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/switchery.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/switch.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/datatables.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/extensions/fixed_columns.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/selects/select2.min.js"></script>



        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/datepicker.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/effects.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/ui/moment/moment.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/daterangepicker.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/pickadate/picker.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/pickadate/picker.date.js"></script>

        <script type="text/javascript" src="assets/js/pages/form_layouts.js"></script>

        <script type="text/javascript" src="assets/js/core/app.js"></script>
        <!-- /theme JS files -->


        <!-- Velocity animation  menu -->
        <script type="text/javascript" src="assets/js/plugins/velocity/velocity.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/velocity/velocity.ui.min.js"></script>


        <script type="text/javascript" src="assets/js/pages/datatables_extension_fixed_columns.js"></script>
        <script type="text/javascript" src="assets/js/pages/datatables_basic.js"></script>
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

            ModulosUsuario mu = null;
            List<Pagamento> pagamentos = null;

            String msgErro = "";
            String alerta = "";
            Entidade entidade = (Entidade) session.getAttribute("entidadeSelecionada");

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

        <script  type="text/javascript">
            /* ------------------------------------------------------------------------------
             *
             *  # Fixed Columns extension for Datatables
             *
             *  Specific JS code additions for datatable_extension_fixed_columns.html page
             *
             *  Version: 1.0
             *  Latest update: Aug 1, 2015
             *
             * ---------------------------------------------------------------------------- */

            $(function () {


                // Table setup
                // ------------------------------

                // Setting datatable defaults
                $.extend($.fn.dataTable.defaults, {
                    columnDefs: [{
                            orderable: false,
                            width: '250px',
                            targets: [5]
                        }],
                    dom: '<"datatable-header"fl><"datatable-scroll datatable-scroll-wrap"t><"datatable-footer"ip>',
                    language: {
                        search: '<span>Filtrar:</span> _INPUT_',
                        lengthMenu: '<span>Listar:</span> _MENU_',
                        paginate: {'first': 'First', 'last': 'Last', 'next': '&rarr;', 'previous': '&larr;'}
                    }
                });

                // Left and right fixed columns
                $('.datatable-fixed-both').DataTable({

                    scrollX: true,
                    scrollY: '450px',
                    scrollCollapse: true,
                    fixedColumns: {
                        leftColumns: 1,
                        rightColumns: 1
                    }
                });


                // External table additions
                // ------------------------------

                // Add placeholder to the datatable filter option
                $('.dataTables_filter input[type=search]').attr('placeholder', 'Digite para filtrar...');


                // Enable Select2 select for the length option
                $('.dataTables_length select').select2({
                    minimumResultsForSearch: "-1"
                });

            });

        </script>




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
                            <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase btn-labeled btn-labeled-left bg-danger-400 heading-btn">Voltar ao painel principal<b><i class="icon-chevron-left"></i></b></button>
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
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-copy4 position-left"></i> 2ª Via dos Pagamentos</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->



                    <div class="row">

                        <div class="col-md-6"> 
                            <!-- Basic layout-->

                            <form method="post" accept-charset="ISO-8859-1" action="UGFnYW1lbnRvU2VydmxldCNEQ0k=?YWNjYW8jMmEtdmlh">
                                <div class="panel panel-flat">
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <div class="row">

                                                    <div class="col-md-4">

                                                        <select class="select" name="mesPesquisa">
                                                            <optgroup label="Selecione o mês">

                                                                <%
                                                                    String ids[] = {"01", "02", "03", "04", "05", "06", "07", "08",
                                                                        "09", "10", "11", "12"};

                                                                    String meses[] = {"JAN", "FEV", "MAI", "ABR", "MAI", "JUN",
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
                                                        <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn bg-grey-800 btn-labeled text-bold text-uppercase">
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



                    <div class = "row">




                        <!-- Basic responsive configuration -->
                        <div class="panel panel-flat">
                            <div class="panel-heading">
                                <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Lista dos pagamentos <span class="text-danger-600">[<%=mesPesquisa + "|" + anoPesquisa%>]</span></h6>
                                <div class="heading-elements">
                                    <ul class="icons-list">
                                        <li><a data-action="collapse"></a></li>
                                        <li><a data-action="reload"></a></li>
                                    </ul>
                                </div>
                            </div>

                            <table class="table datatable-fixed-left">
                                <thead>
                                    <tr>
                                        <th class="text-bold text-uppercase">Aluno</th>
                                        <th class="text-bold text-uppercase">Turma</th>
                                        <th class="text-bold text-uppercase">Prestação</th>
                                        <th class="text-bold text-uppercase">Referência</th>
                                        <th class="text-bold text-uppercase">V. Prestação</th>
                                        <th class="text-bold text-uppercase">Estado</th>
                                        <th class="text-bold text-uppercase text-center">Nova Data</th>
                                        <th class="text-bold text-center text-uppercase">Multa %</th>
                                        <th class="text-center text-bold text-uppercase text-danger-600">---</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        if (pagamentos != null) {
                                            for (Pagamento p : pagamentos) {

                                                if (p != null) {

                                                    if (!p.isPagStatus()) {
                                                        
                                                        if(p.getInscricao() != null)

                                                        {
                                                        String alu = encryptUtils.decodeString(p.getInscricao().getAluno().getAlunBadgnumber())
                                                                + " - "
                                                                + encryptUtils.decodeString(p.getInscricao().getAluno().getPessoa().getPessNome())
                                                                + " " + encryptUtils.decodeString(p.getInscricao().getAluno().getPessoa().getPessApelido());

                                                        String tur = encryptUtils.decodeString(p.getTurma().getTurmDescricao()) + "|" + encryptUtils.decodeString(p.getTurma().getCurso().getCursDescricao());
                                                        String prestacao = encryptUtils.decodeString(p.getPagDescricao());

                                                        String valorP = df.format(p.getPagValor());

                                                        String ref = encryptUtils.decodeString(p.getPagRefOnline());

                                                        int id = p.getPagId();
                                                        String act = encryptUtils.encodeString("accao#gerar-2a-via&id=" + id);

                                                        String dis = "";
                                                        String bt = "submit";

                                                        String lbl = "bg-warning-600";
                                                        String lblBtn = "bg-success-700";

                                                        String status = "Pendente";

                                                        status = encryptUtils.decodeString(p.getPagEstado());

                                                        if (status.equals("Pago")) {
                                                            lbl = "bg-success-800";
                                                            dis = "disabled";
                                                            bt = "button";
                                                            lblBtn = "bg-slate-400";
                                                        }

                                                        if (status.equals("Pago Parcialmente")) {
                                                            lbl = "bg-success-400";
                                                            dis = "disabled";
                                                            bt = "button";
                                                            lblBtn = "bg-slate-400";
                                                        }

                                                        if (status.equals("Cancelado")) {
                                                            lbl = "bg-danger-600";
                                                            dis = "disabled";
                                                            bt = "button";
                                                            lblBtn = "bg-slate-400";
                                                        }

                                                        if (status.equals("Atrasado")) {
                                                            lbl = "bg-slate-600";
                                                        }

                                                        if (status.equals("Pago (Ref.)")) {
                                                            lbl = "bg-teal-600";
                                                            dis = "disabled";
                                                            bt = "button";
                                                            lblBtn = "bg-slate-400";

                                                        }


                                    %>
                                    <tr>
                                        <td><a href="#"><%=alu%></a></td>
                                        <td class="text-italic"><%=tur%></td>
                                        <td  class="text-bold text-danger-600"><%=prestacao%></td>
                                        <td  class="text-bold text-italic"><%=ref%></td>
                                        <td  class="text-bold"><%=valorP%></td>
                                        <td><span class="label <%=lbl%>"><%=status%></span></td>
                                <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="UGFnYW1lbnRvU2VydmxldCNEQ0k=?<%=act%>">
                                    <td>
                                        <div class="col-md-12" style=" width: 150px;">
                                            <input type="text" class="form-control daterange-single" placehorlder="Data..." name="dataPagamento" required="" <%=dis%>>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="col-md-7" style=" width: 100px;">
                                            <input type="number" placeholder="Multa em %" class="form-control" min="0" name="multa" value="0" <%=dis%>>
                                        </div>
                                    </td>
                                    <td class="text-center">
                                        <button type="<%=bt%>" class="btn text-bold text-uppercase <%=lblBtn%>"><i class="icon-barcode2 position-center"></i> Gerar</button>
                                    </td>
                                </form>
                                </tr>
                                <%

                                    }
                                                }

                                            }
                                        }
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                        <!-- /basic responsive configuration -->
                    </div>					


                </div>
                <!-- /main content -->


            </div>
            <!-- /page content -->



            <!-- Footer -->
            <div class="footer text-bold text-grey-300">
                <%
                    String ano = session.getAttribute("ano").toString();
                %>
                &copy; <%=ano%>. <a href="#" class="text-bold">SEGIA</a>. Todos os direitos reservados
            </div>
            <!-- /footer -->

        </div>
        <!-- /page container -->

    </body>
    <script type="text/javascript" src="assets/js/pages/picker_date.js"></script>
</html>
