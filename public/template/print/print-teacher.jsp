<%-- 
    Document   :  print-teacher
    Created on : Jun 21, 2017, 10:06:44 AM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.Docente"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="com.dciapps.webclient.Produto"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dciapps.controller.GenericHandler"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SEGIA - Docentes</title>

        <!-- Page Description, Author and Keywords -->
        <meta name="description" content="Sistema Electrónico de Gestão de Informação Académica">
        <meta name="author" content="Hamilton Jhonas">
        <meta name="keywords" content="SEGIA" />

        <!-- Favicon -->  <link href="https://fonts.googleapis.com/css?family=Poppins:400,300,100,500,700,900" rel="stylesheet" type="text/css">
        <%
            String ip = "localhost";

            if (session.getAttribute("ip") != null) {
                ip = session.getAttribute("ip").toString();
            } else {
                response.sendRedirect("startup");
            }
        %>
        <link rel="shortcut icon" href="http://<%=ip%>:8081/suc/images/favicons/governo/apple-touch-icon.png">



        <style type="text/css">

            body
            {
                font-family: Poppins;
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


            .customers {
                border-collapse: collapse;
                width: 100%;
            }

            .customers td, #customers th {
                border: 1px solid #ddd;
                padding: 7px;
                font-size: 7px;
            }

            .customers tr:nth-child(even){background-color: #f2f2f2;}

            .customers tr:hover {background-color: #ddd;}

            .customers th {
                padding-top: 10px;
                padding-bottom: 10px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
            }

            
        </style>


        <%

            int timeout = session.getMaxInactiveInterval();

            GenericHandler gh = new GenericHandler(request, response);
            Usuario usuario = gh.loggedUser();

            String nome = "";

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy, HH:mm:ss");
            SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
            EncryptUtils encryptUtils = new EncryptUtils();

            List<Docente> docentes = null;
            Entidade entidade = null;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());

                docentes = (List<Docente>) session.getAttribute("docentes");
                entidade = (Entidade) session.getAttribute("entidade");

                response.setHeader("Refresh", timeout + "; URL =VXN1YXJpb1NlcnZsZXQjRENJ?" + encryptUtils.encodeString("accao#lockscreen&user=" + encryptUtils.decodeString(usuario.getUsuaUsuario())));

            }
        %>
    </head>

    <body oncontextmenu="return false" onload="window.print();">
        <table width="100%" border="0">

            <thead>
                <tr>
                    <th  style="font-weight:normal; text-align:left;">

                        <%
                            String nomeE = "";
                            String nuitE = "";
                            String enderecoE = "";
                            String contactoE = "";
                            String emailE = "";
                            String logoE = "";

                            if (entidade != null) {
                                nomeE = encryptUtils.decodeString(entidade.getEntiNome()).toUpperCase();
                                nuitE = encryptUtils.decodeString(entidade.getEntiNuit());
                                enderecoE = encryptUtils.decodeString(entidade.getEntiEndereco());
                                contactoE = encryptUtils.decodeString(entidade.getEntiContactos1());
                                emailE = encryptUtils.decodeString(entidade.getEntiEmail());
                                logoE = encryptUtils.decodeString(entidade.getEntiLogotipo());
                            }
                        %>
                        <table >
                            <tr><td><img width="135px" height="135px" style="margin-left:-20px;" src="http://<%=ip%>:8081/suc/images/invoice/<%=logoE%>"/></td></tr>
                            <tr>
                                <td style="font-size:10px;"> <b> <%=nomeE%></b> </td>
                            </tr>
                            <tr>
                                <td> <b>Contribuinte Nº:</b> <%=nuitE%></td>
                            </tr>
                            <tr> 
                                <td style="max-width:300px;"> <%=enderecoE%><br>Moçambique </td>
                            </tr>
                            <tr><td><br></td></tr>
                            <tr>
                                <td> <%=contactoE%></td>
                            </tr>
                            <tr>
                                <td>  <%=emailE%></td>
                            </tr>
                        </table>

                    </th>
                </tr>

                <tr>

                    <th scope="col" colspan="7">
                        <table width="100%">
                            <tr>
                                <td><br></td>
                            </tr>
                            <tr>
                                    <td style="font-weight:bold; font-size:12px;">LISTAGEM DOS DOCENTES</td>
                            </tr>
                            <tr>
                                <td><hr style="font-weight:bold; height:3px; color:#000; background-color:#000;"></td>
                            </tr>
                            <tr>
                                <td><br></td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%">

                                    </table>
                                </td>
                            </tr>
                        </table>
                    </th>
                </tr>
            </thead>

            <tbody>

                <tr>
                    <td scope="col" colspan="7">

                        <table width="100%" class="customers">


                            <thead>

                                <tr>
                                    <td style="text-align:left;border-bottom:3pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">#</td>
                                    <td style="text-align:left;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">Nome</td>
                                    <td style="text-align:left;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">Contacto</td>
                                    <td style="text-align:left;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">Especialidade</td>
                                    <td style="text-align:left;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">Área Formação</td>
                                    <td style="text-align:left;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">Tipo Contrato</td>
                                    <td style="text-align:left;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">Validade Contrato</td>

                                </tr>

                            </thead>
                            <tbody>
                                <%
                                    if (docentes != null) {
                                        DecimalFormat df = new DecimalFormat("#,###,##0.00");

                                        for (Docente d : docentes) {

                                            int id = d.getDoceId();

                                            String s1 = encryptUtils.decodeString(d.getPessoa().getPessNome()) + " " + encryptUtils.decodeString(d.getPessoa().getPessApelido());
                                            String s2 = encryptUtils.decodeString(d.getPessoa().getPessContacto());
                                            String s3 = encryptUtils.decodeString(d.getDoceEspecialidade());
                                            String s4 = encryptUtils.decodeString(d.getDoceGrauFormacao());
                                            String s5 = "---";

                                            String s6 = "---";
                                            
                                            if (d.getDoceValidadeContrato() != null) {
                                                s5 = sdf2.format(d.getDoceValidadeContrato().toGregorianCalendar().getTime());
                                            }
                                            
                                            if(d.getDoceTipoContrato() != null)
                                            {
                                                s6 = encryptUtils.decodeString(d.getDoceTipoContrato());
                                            }
                                %>
                                <tr>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=id%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin; max-width:300px;"><%=s1%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin; max-width:300px;"><%=s2%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin; max-width:300px;"><%=s3%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=s4%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=s6%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=s5%></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>

                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>


            <tfoot>

                <tr>
                    <td scope="col" colspan="7" style="height:40px;"></td>
                </tr>
                <tr>
                    <td  scope="col" colspan="7" ><hr style="font-weight:bold; height:3px; color:#000; background-color:#000;"></td>
                </tr>



                <tr>
                    <td scope="col" colspan="7" style="height:10px;"></td>
                </tr>


                <tr>
                    <td scope="col" colspan="6">
                        Data de Impressão: <%=sdf.format(new Date())%> <br>
                        Documento processado por computador © SEGIA/ Impresso por: <%=nome.toUpperCase()%>
                    </td>
                </tr>
            </tfoot>
        </table>
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
