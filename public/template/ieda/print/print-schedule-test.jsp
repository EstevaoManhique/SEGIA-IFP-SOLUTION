<%-- 
    Document   :  print-schedule-test
    Created on : Jun 22, 2017, 4:22:03 PM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.AnoLectivo"%>
<%@page import="com.dciapps.webclient.Turma"%>
<%@page import="com.dciapps.webclient.Curso"%>
<%@page import="com.dciapps.webclient.Calendario"%>
<%@page import="org.joda.time.Days"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="com.dciapps.webclient.Lembrete"%>
<%@page import="com.dciapps.webclient.RequisicaoFundo"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="com.dciapps.controller.GenericHandler"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SEGIA - Calendário de Avaliações</title>

        <!-- Page Description, Author and Keywords -->
        <meta name="description" content="Sistema Electrónico de Gestão de Informação Académica">
        <meta name="author" content="Hamilton Jhonas">
        <meta name="keywords" content="SEGIA, DC Inovaction, Software, Multimedia, Escola, School, Vendas, Stock, Market, Branding, Logo, Hotel, Hotelaria, RH, Recursos Humanos, Controle de Acesso, Web Design, Web Marketing, Development, Hosting" />

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

            DecimalFormat df = new DecimalFormat("#,###,##0.00");

            Entidade entidade = null;

            List<Calendario> calendarios = null;
            Curso curso = null;
            Turma turma = null;
            AnoLectivo anoLectivo = null;

            String semestre = "";

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());

                curso = (Curso) session.getAttribute("curso");
                turma = (Turma) session.getAttribute("turma");
                anoLectivo = (AnoLectivo) session.getAttribute("anoLectivoActivo");
                entidade = (Entidade) session.getAttribute("entidade");

                calendarios = (List<Calendario>) session.getAttribute("calendarios");

                if (session.getAttribute("semestre") != null) {
                    semestre = session.getAttribute("semestre").toString();
                }

                response.setHeader("Refresh", timeout + "; URL =VXN1YXJpb1NlcnZsZXQjRENJ?" + encryptUtils.encodeString("accao#lockscreen&user=" + encryptUtils.decodeString(usuario.getUsuaUsuario())));

            }
        %>

    </head>

    <body onload="window.print();" oncontextmenu="return false">
        <table width="100%" border="0">

            <thead>
                <tr>
                    <th  style="font-weight:normal;">


                        <%
                            /**
                             * ****** EMPRESA ******
                             */
                            String nomeE = "";
                            String enderecoE = "";
                            String contactoE = "";
                            String logoE = "";

                            if (entidade != null) {

                                nomeE = encryptUtils.decodeString(entidade.getEntiNome()).toUpperCase();
                                enderecoE = encryptUtils.decodeString(entidade.getEntiEndereco());
                                contactoE = encryptUtils.decodeString(entidade.getEntiContactos1());
                                logoE = encryptUtils.decodeString(entidade.getEntiLogotipo());

                            }
                            /**
                             * **** END EMPRESA ***
                             */
                            /**
                             * ********** CLIENTE *************
                             */
                            /**
                             * .
                             * **** END CLIENTE ***
                             */

                        %>

                        <table >
                            <tr><td><img width="135px" height="135px" style="margin-left:-20px;" src="http://<%=ip%>:8081/suc/images/invoice/<%=logoE%>"/></td></tr>
                            <tr>
                                <td style="font-size:10px;"> <b> <%=nomeE%></b> </td>
                            </tr>
                            <tr> 
                                <td style="max-width:300px;"> <%=enderecoE%><br>Moçambique </td>
                            </tr>
                            <tr><td><br></td></tr>
                            <tr>
                                <td> <%=contactoE%></td>
                            </tr>
                            <tr>
                            </tr>
                        </table>



                    </th>
                </tr>


                <%
                    String ref = "";
                    String dd = "";
                    String tur = "";
                    String cur = "";
                    String hor = "";
                    String dI = "";
                    String dF = "";
                    String min = "";
                    String max = "";
                    String an = "";

                    String testes[] = {"1ª ACS", "2ª ACS", "3ª ACS", "4ª ACS", "1ª ACP", "2ª ACP", "1ª Chamada", "2ª Chamada"};

                    String horarios[] = {"07:00 - 07:45", "07:50 - 08:35", "08:40 - 09:25", "09:45 - 10:30", "10:35 - 11:20", "11:25 - 12:10",
                        "12:15 - 13:00", "13:05 - 13:50", "13:55 - 14:10", "14:45 - 15:30", "15:45 - 16:30", "16:35 - 17:20", "17:25 - 18:10"};

                    if (turma != null) {

                        ref = encryptUtils.decodeString(turma.getTurmReferencia());
                        dd = encryptUtils.decodeString(turma.getTurmDescricao());
                        tur = encryptUtils.decodeString(turma.getTurmTurno());
                        hor = encryptUtils.decodeString(turma.getTurmHorario());
                        cur = encryptUtils.decodeString(turma.getCurso().getCursCod())
                                + " - " + encryptUtils.decodeString(turma.getCurso().getCursDescricao());
                        an = encryptUtils.decodeString(anoLectivo.getAnolDescricao());

                        dI = sdf.format(turma.getTurmDataInicio().toGregorianCalendar().getTime());
                        dF = sdf.format(turma.getTurmDataFim().toGregorianCalendar().getTime());

                        min = turma.getTurmMinEstudantes() + "";
                        max = turma.getTurmMaxEstudantes() + "";
                    }
                %>

                <tr>

                    <th scope="col" colspan="3">
                        <table width="100%">
                            <tr>
                                <td><br></td>
                            </tr>
                            <tr>
                                <td><br></td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold; font-size:12px;">CALENDÁRIO DE AVALIAÇÕES [<%=an + "|" + semestre%>]</td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold; font-size:12px;"><b style="color:#F44336;">CLASSE:</b> <%=cur%></td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold; font-size:12px;"><b style="color:#F44336;">TURMA:</b> <%=dd%></td>
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
                    <td scope="col" colspan="9">

                        <table width="100%" class="customers">


                            <thead>

                                <tr>
                                    <td style="text-align:left;border-bottom:3pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">Disciplina</td>

                                    <%                                                        for (String d : testes) {
                                    %>
                                    <td style="text-align:left;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;"><%=d%></td>
                                    <%
                                        }
                                    %>
                                </tr>

                            </thead>
                            <tbody>


                                <%
                                    if (calendarios != null) {
                                        for (Calendario c : calendarios) {

                                            String dis = encryptUtils.decodeString(c.getDisciplina().getDiscDescricao());

                                            String d1 = "---";
                                            String d2 = "---";
                                            String d3 = "---";
                                            String d4 = "---";
                                            String d5 = "---";
                                            String d6 = "---";
                                            String d7 = "---";
                                            String d8 = "---";

                                            if (c.getCaleTeste1() != null) {
                                                d1 = sdf2.format(c.getCaleTeste1().toGregorianCalendar().getTime());
                                            }

                                            if (c.getCaleTeste2() != null) {
                                                d2 = sdf2.format(c.getCaleTeste2().toGregorianCalendar().getTime());
                                            }

                                            if (c.getCaleTeste3() != null) {
                                                d3 = sdf2.format(c.getCaleTeste3().toGregorianCalendar().getTime());
                                            }

                                            if (c.getCaleTeste4() != null) {
                                                d4 = sdf2.format(c.getCaleTeste4().toGregorianCalendar().getTime());
                                            }

                                            if (c.getCaleAcp() != null) {
                                                d5 = sdf2.format(c.getCaleAcp().toGregorianCalendar().getTime());
                                            }

                                            if (c.getCaleAcp2() != null) {
                                                d6 = sdf2.format(c.getCaleAcp2().toGregorianCalendar().getTime());
                                            }

                                            if (c.getCaleExame() != null) {
                                                d7 = sdf2.format(c.getCaleExame().toGregorianCalendar().getTime());
                                            }

                                            if (c.getCaleRecorrencia() != null) {
                                                d8 = sdf2.format(c.getCaleRecorrencia().toGregorianCalendar().getTime());
                                            }
                                %>
                                <tr>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin; max-width:150px;"><%=dis%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=d1%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=d2%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=d3%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=d4%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=d5%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=d6%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=d7%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=d8%></td>
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
                    <td scope="col" colspan="9" style="height:40px;"></td>
                </tr>
                <tr>
                    <td  scope="col" colspan="9" ><hr style="font-weight:bold; height:3px; color:#000; background-color:#000;"></td>
                </tr>



                <tr>
                    <td scope="col" colspan="9" style="height:10px;"></td>
                </tr>

                <tr>
                    <td scope="col" colspan="9">
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
