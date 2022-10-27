<%-- 
    Document   : print-nationality
    Created on : Jun 22, 2017, 5:14:25 AM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.Nacionalidade"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.dciapps.webclient.Pessoa"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="com.dciapps.controller.GenericHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SEGIA - Nacionalidades</title>

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

        </style>


        <%

            int timeout = session.getMaxInactiveInterval();

            GenericHandler gh = new GenericHandler(request, response);
            Usuario usuario = gh.loggedUser();

            String nome = "";

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy, HH:mm:ss");
            EncryptUtils encryptUtils = new EncryptUtils();

            List<Nacionalidade> nacionalidades = null;
            Entidade entidade = null;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());

                nacionalidades = (List<Nacionalidade>) session.getAttribute("nacionalidades");
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

                    <th scope="col" colspan="3">
                        <table width="100%">
                            <tr>
                                <td><br></td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold; font-size:12px;">LISTAGEM DAS NACIONALIDADES</td>
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
                    <td scope="col" colspan="2">

                        <table width="100%">


                            <thead>

                                <tr>
                                    <td style="text-align:left;border-bottom:3pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">#</td>
                                    <td style="text-align:left;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">Descrição</td>
                                </tr>

                            </thead>
                            <tbody>
                                <%
                                    if (nacionalidades != null) {

                                        for (Nacionalidade n : nacionalidades) {

                                            int id = n.getNaciId();

                                            String s1 = encryptUtils.decodeString(n.getNaciDescricao());
                                %>
                                <tr>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=id%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin; max-width:150px;"><%=s1%></td>
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
                    <td scope="col" colspan="2" style="height:40px;"></td>
                </tr>
                <tr>
                    <td  scope="col" colspan="2" ><hr style="font-weight:bold; height:3px; color:#000; background-color:#000;"></td>
                </tr>



                <tr>
                    <td scope="col" colspan="2" style="height:10px;"></td>
                </tr>

                <tr>
                    <td scope="col" colspan="2">
                        Data de Impressão: <%=sdf.format(new Date())%> <br>
                        Documento processado por computador © SEGIA - Microfinanças/ Impresso por: <%=nome.toUpperCase()%>
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
