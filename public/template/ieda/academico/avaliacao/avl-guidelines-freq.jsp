<%-- 
    Document   : avl-guidelines-freq
    Created on : Feb 8, 2017, 7:04:20 PM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.local.DN"%>
<%@page import="com.dciapps.local.PM"%>
<%@page import="com.dciapps.webclient.DisciplinaCurso"%>
<%@page import="com.dciapps.webclient.Calendario"%>
<%@page import="com.dciapps.webclient.Curso"%>
<%@page import="com.dciapps.webclient.Turma"%>
<%@page import="com.dciapps.webclient.Notas"%>
<%@page import="com.dciapps.local.ImpNota"%>
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
        <title>SEGIA - Pauta de Frequência</title>

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
            DecimalFormat df = new DecimalFormat("#,###,##0");
            EncryptUtils encryptUtils = new EncryptUtils();

            ModulosUsuario mu = null;

            String msgErro = "";
            String alerta = "";
            Entidade entidade = (Entidade) session.getAttribute("entidadeSelecionada");

            List<Turma> turmas = null;
            List<Curso> cursos = null;
            List<DisciplinaCurso> disciplinasCurso = null;
            List<PM> pms = null;

            Turma turma = null;
            Curso curso = null;

            if (entidade == null) {
                entidade = (Entidade) session.getAttribute("entidade");
            }

            boolean have = false;

            int num = 0;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                mu = (ModulosUsuario) session.getAttribute("modulosUsuarioLogin");

                turma = (Turma) session.getAttribute("turma");
                curso = (Curso) session.getAttribute("cursoSelecionado");

                turmas = (List<Turma>) session.getAttribute("turmas");
                cursos = (List<Curso>) session.getAttribute("cursos");
                disciplinasCurso = (List<DisciplinaCurso>) session.getAttribute("disciplinasCurso");
                pms = (List<PM>) session.getAttribute("pms");

                if (disciplinasCurso != null) {
                    num = disciplinasCurso.size();
                }

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


                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-grid2 position-left"></i> Pauta de Frequência</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->


                    <div class = "row">
                        <!-- Vertical form options -->
                        <div class="col-md-6"> 
                            <!-- Basic layout-->

                            <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?YWNjYW8jbGlzdGEtZXhhbWVz">
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
                            <%                                String act3 = encryptUtils.encodeString("accao#filtrar-turma&to=avl-guidelines-freq");
                            %>

                            <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?<%=act3%>">
                                <div class="panel panel-flat">
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <div class="row">

                                                    <div class="col-md-7">


                                                        <select class="select" name="idTurma">
                                                            <optgroup label="Selecione a turma">

                                                                <%
                                                                    if (turmas != null) {
                                                                        for (Turma t : turmas) {

                                                                            int id = t.getTurmId();
                                                                            String desc = encryptUtils.decodeString(t.getTurmReferencia()) + " - " + encryptUtils.decodeString(t.getTurmDescricao());

                                                                            String sel = "";

                                                                            if (turma != null) {
                                                                                if (id == turma.getTurmId()) {
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
                                                            Filtrar Turma
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

                    <div class="row">



                        <%
                            String dd = "";
                            String cur = "";

                            if (turma != null) {

                                dd = encryptUtils.decodeString(turma.getTurmDescricao());
                                cur = encryptUtils.decodeString(turma.getCurso().getCursCod())
                                        + " - " + encryptUtils.decodeString(turma.getCurso().getCursDescricao());

                            }
                        %>

                        <div class="col-md-12">
                            <!-- Basic setup -->
                            <div class="panel panel-white">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-bold text-uppercase">PAUTA DE FREQUÊNCIA ANUAL <span class="text-danger-600">[<%=cur + " | Turma:" + dd%>]</h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>

                                        </ul>
                                    </div>
                                </div>





                                <div class="panel-body">

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <button id="btnExport" onclick="fnExcelReport('id18', 'PAUTA DE FREQUÊNCIA ANUAL', '<%=cur%> | TURMA: <%=dd%>');" class="btn bg-success-600 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                <b><i class="icon-file-excel"></i></b>
                                                Exportar registos
                                            </button>
                                        </div>
                                    </div>

                                </div>


                                <table class="table table-bordered table-striped"  id="id18">
                                    <thead>
                                        <tr>
                                            <th class="text-bold text-uppercase" rowspan="2">Nº</th>
                                            <th class="text-bold text-uppercase" rowspan="2">Cod.</th>
                                            <th class="text-bold text-uppercase" rowspan="2">Nome Aluno</th>
                                            <th class="text-bold text-uppercase text-center" rowspan="2">Sexo</th>
                                            <th class="text-bold text-uppercase text-center" colspan="<%=num%>">Disciplinas</th>
                                            <th class="text-bold text-uppercase text-center" rowspan="2">Média</th>
                                            <th class="text-bold text-uppercase text-center" rowspan="2">Comp.</th>
                                            <th class="text-bold text-uppercase text-center" rowspan="2">Resultado</th>
                                        </tr>
                                        <%
                                            if (disciplinasCurso != null) {
                                        %>
                                        <tr>

                                            <%
                                                for (DisciplinaCurso dc : disciplinasCurso) {

                                                    String desc = encryptUtils.decodeString(dc.getDisciplina().getDiscDescricao());
                                                    if (desc.length() >= 4) {
                                                        desc = desc.substring(0, 3);
                                                    }
                                            %>
                                            <td class="text-bold text-uppercase text-right"><%=desc%></td>
                                            <%
                                                }
                                            %>

                                        </tr> 
                                        <%
                                            }
                                        %>
                                    </thead>
                                    <tbody>

                                        <%
                                            int i = 0;
                                            if (pms != null) {

                                                for (PM pm : pms) {

                                                    String s1 = encryptUtils.decodeString(pm.getInscricao().getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(pm.getInscricao().getAluno().getPessoa().getPessApelido());
                                                    String s2 = encryptUtils.decodeString(pm.getInscricao().getAluno().getAlunBadgnumber());
                                                    String s3 = encryptUtils.decodeString(pm.getInscricao().getAluno().getPessoa().getPessSexo()).charAt(0) + "";
                                                    String s4 = df.format(Math.round(pm.getMediaFinal()));
                                                    String s5 = pm.getComportamentoFinal();
                                                    String res = "Reprovado";

                                                    String lblM = "text-danger-600";

                                                    if (Math.round(pm.getMediaFinal()) > 9.5) {
                                                        lblM = "text-success-600";
                                                        res = "Admitido";
                                                    }

                                                    List<DN> dns = pm.getDns();

                                                    i++;

                                        %>
                                        <tr>
                                            <td><%=i%></td>
                                            <td><%=s2%></td>
                                            <td><%=s1%></td>
                                            <td class=" text-center"><%=s3%></td>
                                            <%
                                                if (dns != null) {
                                                    for (DN d : dns) {

                                                        float m = Math.round(d.getMed());
                                                        String lbl = "text-danger-400";
                                                        if (m > 9.5) {
                                                            lbl = "text-teal-400";
                                                        }

                                            %>
                                            <td class="text-right text-bold <%=lbl%>"><%=df.format(m)%></td>
                                            <%
                                                    }
                                                }
                                            %>
                                            <td class="text-black text-center <%=lblM%>"><%=s4%></td>
                                            <td class=" text-center"><%=s5%></td>
                                            <td class="text-bold text-center <%=lblM%>"><%=res%></td>
                                        </tr>

                                        <%                                                }
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
                        <div class="footer text-bold">
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
        
        


        <script type="text/javascript">

            function fnExcelReport(idTable, title, cur)
            {
                var tab_text = "<meta http-equiv='content-type' content='application/vnd.ms-excel; charset=UTF-8'> <style type='text/css'>  body {font-family: Verdana;}</style> <br><br><h4 style='text-align: center; font-family: Verdana;'><b>" + title + "</b></h4><br>\n\
         <br><h4 style='text-align: center; font-family: Verdana;'><b>CLASSE: " + cur + "</b></h4><br>\n\
                                \n\
                             <table border='2px'><tr bgcolor='#87AFC6'>";
                var textRange;
                var j = 0;
                tab = document.getElementById(idTable); // id of table

                for (j = 0; j < tab.rows.length; j++)
                {
                    tab_text = tab_text + tab.rows[j].innerHTML + "</tr>";
                    //tab_text=tab_text+"</tr>";
                }

                tab_text = tab_text + "</table>";
                tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
                tab_text = tab_text.replace(/<img[^>]*>/gi, ""); // remove if u want images in your table
                tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params

                var ua = window.navigator.userAgent;
                var msie = ua.indexOf("MSIE");

                if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
                {
                    txtArea1.document.open("txt/html", "replace");
                    txtArea1.document.write(tab_text);
                    txtArea1.document.close();
                    txtArea1.focus();
                    sa = txtArea1.document.execCommand("SaveAs", true, "Exportação com sucesso");
                } else                 //other browser not tested on IE 11
                {
                    sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));
                }
                return (sa);
            }

        </script>
        <!-- /scripts -->

    </body>
</html>
