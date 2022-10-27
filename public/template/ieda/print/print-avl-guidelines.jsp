<%-- 
    Document   :  print-avl-guidelines
    Created on : Jun 22, 2017, 4:22:03 PM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.Notas"%>
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
        <title>SEGIA - Pauta</title>

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

            List<Notas> notas = null;

            String semestre = "";
            Turma turma = null;
            Calendario calendario = null;
            AnoLectivo anoLectivo = null;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());

                turma = (Turma) session.getAttribute("turma");
                calendario = (Calendario) session.getAttribute("calendario");
                notas = (List<Notas>) session.getAttribute("notas");
                anoLectivo = (AnoLectivo) session.getAttribute("anoLectivoActivo");
                entidade = (Entidade) session.getAttribute("entidade");

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
                    String tt = "";
                    String tur = "";
                    String cur = "";
                    String hor = "";
                    String dI = "";
                    String dF = "";
                    String min = "";
                    String max = "";
                    String an = "";
                    String dd = "";

                    String testes[] = {"1ª ACS", "2ª ACS", "3ª ACS", "4ª ACS", "1ª ACP", "2ª ACP", "1ª Chamada", "2ª Chamada"};

                    String horarios[] = {"07:00 - 07:45", "07:50 - 08:35", "08:40 - 09:25", "09:45 - 10:30", "10:35 - 11:20", "11:25 - 12:10",
                        "12:15 - 13:00", "13:05 - 13:50", "13:55 - 14:10", "14:45 - 15:30", "15:45 - 16:30", "16:35 - 17:20", "17:25 - 18:10"};

                    if (turma != null) {

                        ref = encryptUtils.decodeString(turma.getTurmReferencia());
                        tt = encryptUtils.decodeString(turma.getTurmDescricao());
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

                    if (calendario != null) {
                        if (calendario.getDisciplina() != null) {
                            dd = encryptUtils.decodeString(calendario.getDisciplina().getDiscDescricao());
                        }
                    }

                    boolean haveT3 = false;
                    boolean haveT4 = false;
                    boolean haveA2 = false;

                    int nACS = 2;
                    int nACP = 1;

                    if (calendario != null) {

                        haveT3 = calendario.isCaleHaveTeste3();
                        haveT4 = calendario.isCaleHaveTeste4();
                        haveA2 = calendario.isCaleHaveAcp();
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
                                <td style="font-weight:bold; font-size:12px;">PAUTA DA TURMA [<%=an + "|" + semestre%>]</td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold; font-size:12px;"><b style="color:#F44336;">CLASSE:</b> <%=cur%></td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold; font-size:12px;"><b style="color:#F44336;">TURMA:</b> <%=tt%> -  <b style="color:#F44336;">DISCIPLINA:</b> <%=dd%></td>
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


            <%
                String di = "";
            %>

            <tbody>

                <tr>
                    <td scope="col" colspan="11">

                        <table width="100%" class="customers">


                            <thead>

                                <tr>
                                    <td style="text-align:left;border-bottom:3pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">Aluno</td>

                                    <td style="text-align:right;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">1ª ACS</td>
                                    <td style="text-align:right;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">2ª ACS</td>
                                    <%
                                        if (haveT3) {
                                            nACS++;
                                    %>
                                    <td style="text-align:right;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">3ª ACS</td>

                                    <%
                                        }
                                    %>

                                    <%
                                        if (haveT4) {
                                            nACS++;
                                    %>
                                    <td style=;"text-align:right;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">4ª ACS</td>

                                    <%
                                        }
                                    %>
                                    <td style="text-align:right;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">M. ACS</td>
                                    <td style="text-align:right;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">1ª ACP</td>
                                    <%
                                        if (haveA2) {
                                            nACP++;
                                    %>
                                    <td style="text-align:right;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">2ª ACP</td>
                                    <%
                                        }
                                    %>
                                    <td style="text-align:right;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">M. ACP</td>
                                    <td style="text-align:right;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">M. FINAL</td>
                                    <td style="text-align:left;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;">ESTADO</td>

                                </tr>

                            </thead>
                            <tbody>

                                <%
                                    if (notas != null) {
                                        for (Notas n : notas) {
                                            int id = n.getAluno().getAlunId();
                                            String s1 = encryptUtils.decodeString(n.getAluno().getAlunBadgnumber()) + " - " + encryptUtils.decodeString(n.getAluno().getPessoa().getPessNome()) + " "
                                                    + encryptUtils.decodeString(n.getAluno().getPessoa().getPessApelido());

                                            String n1 = df.format(n.getNotaTeste1());
                                            String n2 = df.format(n.getNotaTeste2());
                                            String n3 = df.format(n.getNotaTeste3());
                                            String n4 = df.format(n.getNotaTeste4());
                                            String n5 = df.format(n.getNotaAcp());
                                            String n6 = df.format(n.getNotaAcp2());

                                            float media = n.getNotaMedia();
                                            float mediaACS = Math.round((n.getNotaTeste1() + n.getNotaTeste2() + n.getNotaTeste3() + n.getNotaTeste4()) / nACS);
                                            float mediaACP = Math.round((n.getNotaAcp() + n.getNotaAcp2()) / nACP);

                                            String l1 = "text-danger";
                                            String l2 = "text-danger";
                                            String l3 = "text-danger";
                                            String l4 = "text-danger";
                                            String l5 = "text-danger";
                                            String l6 = "text-danger";

                                            if (n.getNotaTeste1() >= 10) {
                                                l1 = "text-success";
                                            }

                                            if (n.getNotaTeste2() >= 10) {
                                                l2 = "text-success";
                                            }

                                            if (n.getNotaTeste3() >= 10) {
                                                l3 = "text-success";
                                            }

                                            if (n.getNotaTeste4() >= 10) {
                                                l4 = "text-success";
                                            }

                                            if (n.getNotaAcp() >= 10) {
                                                l5 = "text-success";
                                            }

                                            if (n.getNotaAcp2() >= 10) {
                                                l6 = "text-success";
                                            }

                                            String lblMediaACS = "text-success-400";
                                            String lblMediaACP = "text-success-400";

                                            if (mediaACS < 10) {
                                                lblMediaACS = "text-danger-700";
                                            }

                                            if (mediaACP < 10) {
                                                lblMediaACP = "text-danger-700";
                                            }

                                            String status = "Aprovado";
                                            String lblStatus = "bg-success-400";
                                            String lblMedia = "text-success-400";

                                            if (media < 10) {
                                                if (calendario.isCaleHaveExame()) {
                                                    status = "Excluido";
                                                } else {
                                                    status = "Reprovado";
                                                }

                                                lblStatus = "bg-danger-700";
                                                lblMedia = "text-danger-700";
                                            }

                                            if (media >= 14) {
                                                if (calendario.isCaleHaveExame()) {
                                                    status = "Dispensado";
                                                }

                                                lblStatus = "bg-success-800";
                                                lblMedia = "text-success-800";
                                            }


                                %>
                                <tr>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin; max-width:150px;"><%=s1%></td>
                                    <td style="text-align:right;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=n1%></td>
                                    <td style="text-align:right;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=n2%></td>
                                    <%
                                        if (haveT3) {
                                    %>
                                    <td style="text-align:right;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=n3%></td>
                                    <%
                                        }
                                    %>
                                    <%
                                        if (haveT4) {
                                    %>
                                    <td style="text-align:right;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=n4%></td>
                                    <%
                                        }
                                    %>
                                    <td style="text-align:right;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle; font-weight: bold;"><%=mediaACS%></td>
                                    <td style="text-align:right;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=n5%></td>

                                    <%
                                        if (haveA2) {
                                    %>
                                    <td style="text-align:right;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;"><%=n6%></td>
                                    <%
                                        }
                                    %>
                                    <td style="text-align:right;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle; font-weight: bold;"><%=mediaACP%></td>
                                    <td style="text-align:right;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle; font-weight: bold;"><%=media%></td>
                                    <td style="text-align:left;display: table-cell;vertical-align: middle; font-weight: bold;"><%=status%></td>
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
                    <td scope="col" colspan="11" style="height:40px;"></td>
                </tr>
                <tr>
                    <td  scope="col" colspan="11" ><hr style="font-weight:bold; height:3px; color:#000; background-color:#000;"></td>
                </tr>



                <tr>
                    <td scope="col" colspan="11" style="height:10px;"></td>
                </tr>

                <tr>
                    <td scope="col" colspan="11">
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
