<%-- 
    Document   : warehouse-print-document
    Created on : Jun 22, 2017, 12:21:13 PM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.Doc"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.dciapps.controller.GenericHandler"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>MEPT - Impressão de Documentos</title>

        <!-- Page Description, Author and Keywords -->
        <meta name="description" content="MEPT Moçambique - Movimento de Educação para Todos">
        <meta name="author" content="Hamilton Jhonas">
        <meta name="keywords" content="MEPT, DC Inovaction, Software, Multimedia, Escola, School, Vendas, Stock, Market, Branding, Logo, Hotel, Hotelaria, RH, Recursos Humanos, Controle de Acesso, Web Design, Web Marketing, Development, Hosting" />

       

        <!-- Global stylesheets -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
        <link href="assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
        <link href="assets/css/minified/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/minified/core.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/minified/components.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/minified/colors.min.css" rel="stylesheet" type="text/css">
        <!-- /global stylesheets -->

        
        <%
            String ip = "localhost";

            if (session.getAttribute("ip") != null) {
                ip = session.getAttribute("ip").toString();
            } else {
                response.sendRedirect("startup");
            }
        %>

        <link rel="shortcut icon" href="http://<%=ip%>:8081/suc/images/favicons/mept/favicon.ico" type="image/x-icon"/>
        <link rel="apple-touch-icon" href="http://<%=ip%>:8081/suc/images/favicons/mept/apple-touch-icon.png"/>
        <link rel="apple-touch-icon" sizes="57x57" href="http://<%=ip%>:8081/suc/images/favicons/mept/apple-touch-icon-57x57.png"/>
        <link rel="apple-touch-icon" sizes="72x72" href="http://<%=ip%>:8081/suc/images/favicons/mept/apple-touch-icon-72x72.png"/>
        <link rel="apple-touch-icon" sizes="76x76" href="http://<%=ip%>:8081/suc/images/favicons/mept/apple-touch-icon-76x76.png"/>
        <link rel="apple-touch-icon" sizes="114x114" href="http://<%=ip%>:8081/suc/images/favicons/mept/apple-touch-icon-114x114.png"/>
        <link rel="apple-touch-icon" sizes="120x120" href="http://<%=ip%>:8081/suc/images/favicons/mept/apple-touch-icon-120x120.png"/>
        <link rel="apple-touch-icon" sizes="144x144" href="http://<%=ip%>:8081/suc/images/favicons/mept/apple-touch-icon-144x144.png"/>
        <link rel="apple-touch-icon" sizes="152x152" href="http://<%=ip%>:8081/suc/images/favicons/mept/apple-touch-icon-152x152.png"/>
        <link rel="apple-touch-icon" sizes="180x180" href="http://<%=ip%>:8081/suc/images/favicons/mept/apple-touch-icon-180x180.png"/>



        <style type="text/css">

            body
            {
                font-family: 'Poppins';
                font-size: 8px;
                text-align:justify;
            }
            @page {
                counter-increment: page;
                counter-reset: page 1;
                @top-right {
                    content: "Page " counter(page) " of " counter(pages);


                    white-space: nowrap; 
                    z-index: 20px;
                    -moz-border-radius: 5px; 
                    -moz-box-shadow: 0px 0px 4px #222;  
                    background-image: -moz-linear-gradient(top, #eeeeee, #cccccc);  
                    background-image: -moz-linear-gradient(top, #eeeeee, #cccccc); 

                }


            }

        </style>


        <%

            int timeout = session.getMaxInactiveInterval();

            GenericHandler gh = new GenericHandler(request, response);
            Usuario usuario = gh.loggedUser();

            String nome = "";

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy, HH:mm:ss");
            SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MMMM-yyyy");
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            EncryptUtils encryptUtils = new EncryptUtils();

            Doc doc = null;
            Entidade entidade = null;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());

                doc = (Doc) session.getAttribute("doc");
                entidade = (Entidade) session.getAttribute("entidade");

                response.setHeader("Refresh", timeout + "; URL =VXN1YXJpb1NlcnZsZXQjRENJ?" + encryptUtils.encodeString("accao#lockscreen&user=" + encryptUtils.decodeString(usuario.getUsuaUsuario())));

            }
        %>
    </head>

    <body  onload="window.print();">

        <%
            Doc d = doc;

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

   <p align="center"><img height="59" src="http://<%=ip%>:8081/suc/images/app-icons/governo.png" width="56" /></p>

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
</body>
<script>

    <%
        String clock = request.getParameter("clock");
        if (clock
                == null) {
            clock = "30";
        }
    %>
    var timeout = <%=clock%>;
    function timer()
    {
        if (--timeout > 0)
        {
            window.setTimeout("timer()", 1000);
        } else
        {
            window.close();
            ///disable submit-button etc
        }
    }
    //-->
</script>

<script>

    timer();
    //-->
</script>
</html>
