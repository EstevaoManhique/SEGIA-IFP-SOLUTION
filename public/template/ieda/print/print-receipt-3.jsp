<%-- 
    Document   : print-receipt-2
    Created on : Jan 31, 2018, 6:37:51 AM
    Author     : hamil
--%>

<%@page import="java.util.List"%>
<%@page import="com.dciapps.webclient.ReciboPagamento"%>
<%@page import="com.dciapps.webclient.Inscricao"%>
<%@page import="org.joda.time.Days"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="java.util.Date"%>
<%@page import="com.dciapps.webclient.Aluno"%>
<%@page import="com.dciapps.webclient.Pagamento"%>
<%@page import="com.dciapps.localcontroler.StringUtils"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="com.dciapps.controller.GenericHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SEGIA - Recibo Pagamento</title>

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
            body, td, th {
                font-family: Poppins;
                font-size: 11px;
            }
            table
            {
                border-style: solid;
            }
        </style>




        <%

            int timeout = session.getMaxInactiveInterval();

            GenericHandler gh = new GenericHandler(request, response);
            Usuario usuario = gh.loggedUser();

            String nome = "";

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy, HH:mm:ss");
            SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            StringUtils stringUtils = new StringUtils();
            EncryptUtils encryptUtils = new EncryptUtils();
            Entidade entidade = null;

            List<Pagamento> pagamentos = null;
            ReciboPagamento reciboPagamento = null;

            Aluno aluno = null;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());

                entidade = (Entidade) session.getAttribute("entidade");
                aluno = (Aluno) session.getAttribute("aluno");

                reciboPagamento = (ReciboPagamento) session.getAttribute("reciboPagamento");
                pagamentos = (List<Pagamento>) session.getAttribute("pagamentos");

                response.setHeader("Refresh", timeout + "; URL =VXN1YXJpb1NlcnZsZXQjRENJ?" + encryptUtils.encodeString("accao#lockscreen&user=" + encryptUtils.decodeString(usuario.getUsuaUsuario())));

            }
        %>
    </head>

    <body oncontextmenu="return false" onload="window.print();">
        <table width="1065" border="0">
            <tr>


                <%
                    String nomeE = "";
                    String nuitE = "";
                    String enderecoE = "";
                    String contactoE = "";
                    String emailE = "";
                    String logoE = "";
                    String provE = "";
                    String entiE = "";

                    if (entidade != null) {
                        nomeE = encryptUtils.decodeString(entidade.getEntiNome()).toUpperCase();
                        nuitE = encryptUtils.decodeString(entidade.getEntiNuit());
                        enderecoE = encryptUtils.decodeString(entidade.getEntiEndereco());
                        contactoE = encryptUtils.decodeString(entidade.getEntiContactos1());
                        emailE = encryptUtils.decodeString(entidade.getEntiEmail());
                        logoE = encryptUtils.decodeString(entidade.getEntiLogotipo());
                        entiE = "98100";

                        if (entidade.getEntiProvincia() != null) {
                            provE = encryptUtils.decodeString(entidade.getEntiProvincia());
                        }
                    }

                    /**
                     * ********** CLIENTE *************
                     */
                    String nomeC = "";
                    String nomeP = "";
                    String enderecoC = "";
                    String contactoC = "";
                    String provinciaC = "";
                    String exmo = "";

                    String ref = "";
                    String dte = "";
                    String dteP = "";

                    int idP = 0;

                    String cap = "";

                    double vj = 0;

                    double td = 0;

                    double total = 0;

                    String valorP = "";
                    String valorM = "";
                    String valorT = "";

                    String formaP = "";
                    String obs = "";
                    String us = "";
                    String refC = "";
                    String refO = "";

                    String prestacao = "";

                    if (reciboPagamento != null) {

                        refO = encryptUtils.decodeString(reciboPagamento.getRecpReferencia());

                        if (aluno != null) {

                            refC += encryptUtils.decodeString(aluno.getAlunBadgnumber());

                            nomeC = encryptUtils.decodeString(aluno.getPessoa().getPessNome()) + " " + encryptUtils.decodeString(aluno.getPessoa().getPessApelido());
                            enderecoC = encryptUtils.decodeString(aluno.getPessoa().getPessBairro());
                            contactoC = encryptUtils.decodeString(aluno.getPessoa().getPessContacto());
                            provinciaC = encryptUtils.decodeString(aluno.getPessoa().getPessProvincia());
                            exmo = "Exmo.(s) Sr.(s)";
                        }

                        obs = encryptUtils.decodeString(reciboPagamento.getRecpObservacoes());
                        formaP = encryptUtils.decodeString(reciboPagamento.getRefBancoPagamento());

                        total = reciboPagamento.getRecpValor();

                        valorP = df.format(reciboPagamento.getRecpValor());
                        valorM = df.format(reciboPagamento.getRecpMulta());
                        valorT = df.format(reciboPagamento.getRecpTotal());

                        dte = sdf2.format(reciboPagamento.getRecpData().toGregorianCalendar().getTime());
                    }

                    /**
                     * .
                     * **** END CLIENTE ***
                     */
                %>

                <td width="630"><p><img src="http://<%=ip%>:8081/suc/images/invoice/<%=logoE%>"  width="135px" height="135px" alt=""/> <br>
                        <br>
                        <b><%=nomeE%></b><br>
                        <%=enderecoE%> <br>
                        <b>NUIT: </b><%=nuitE%><br>
                        <b>ENTIDADE: </b><%=entiE%><br>
                        <%=provE%> - Moçambique</p>
                    <p><br>
                        <b>ATENDIMENTO AO CLIENTE</b><br>
                        Contacto.: <%=contactoE%><br>
                        Email: <%=emailE%> </p></td>
                <td width="431"><p>ORIGINAL<br>
                        <b>RECIBO</b></p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>


                    <p><b><%=exmo%></b><br>
                        <%=nomeC%><br>
                        <%=enderecoC%><br>
                        <%=provinciaC%><br>
                        <b>Contacto: <%=contactoC%></b><br>

            </tr>
            <tr>
                <td>&nbsp;</td>
                <td></td>
            </tr>
            <tr>
                <td colspan="2"><table width="1031" border="0">
                        <tr>
                            <td width="313"><table width="272">
                                    <tr>
                                        <td width="242" align="center"><b>Código Aluno: </b> <%=refC%></td>
                                    </tr>
                                </table></td>
                            <td width="79">&nbsp;</td>
                            <td width="313"><table width="272">
                                    <tr>
                                        <td width="242" align="center"><b>Data de pgto.: </b> <%=dte%></td>
                                    </tr>
                                </table></td>
                            <td width="79">&nbsp;</td>
                            <td width="313"><table width="272">
                                    <tr>
                                        <td width="242" align="center"><b><%=refO%></b></td>
                                    </tr>
                                </table></td>
                        </tr>
                    </table></td>
            </tr>
            <tr>
                <td>Resumo</td>
                <td align="right" style="font-size:10px;">Informação de valor em MT</td>
            </tr>
            <tr>
                <td colspan="2">

                    <table width="1065"  style="border-top:none;border-left:none;border-right:none;border-bottom:none;">
                        <tr>
                            <th bgcolor="#CCCCCC" scope="col" align="left">#</th>
                            <th bgcolor="#CCCCCC" scope="col">Referência</th>
                            <th bgcolor="#CCCCCC" scope="col">Prestação</th>
                            <th bgcolor="#CCCCCC" scope="col">Data Pgto.</th>
                            <th bgcolor="#CCCCCC" scope="col">Valor Prestação</th>
                            <th bgcolor="#CCCCCC" scope="col">Valor Multa</th>
                            <th bgcolor="#CCCCCC" scope="col">Total de Débito</th>
                        </tr>
                        <tbody>

                            <%
                                if (pagamentos != null) {

                                    for (Pagamento p : pagamentos) {

                                        idP = p.getPagId();
                                        ref = "---";

                                        if (p.getPagRefOnline() != null) {
                                            ref = encryptUtils.decodeString(p.getPagRefOnline());
                                        }

                                        prestacao = encryptUtils.decodeString(p.getPagDescricao());
                                        dteP = sdf2.format(p.getPagData().toGregorianCalendar().getTime());
                                        cap = df.format(p.getPagValor());
                                        vj = p.getPagMulta();
                                        td = p.getPagValorPago();
                            %>
                            <tr style="border:none;">
                                <td align="left"><%=idP%></td>
                                <td align="left"><%=ref%></td>  
                                <td align="left"><%=prestacao%></td>  
                                <td align="left"><%=dteP%></td>  
                                <td align="right"><%=cap%></td>
                                <td align="right"><%=df.format(vj)%></td>
                                <td align="right"><%=df.format(td)%></td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>


                </td>
            </tr>
            <tr>
                <td>
                    <br>
                    <span style="margin-left:500px;"><b>VALOR À PAGAR</b></span> 
                    <span style="margin-left:500px;"><b>TOTAL EM MULTAS</b></span><br>
                    <span style="margin-left:500px;"><b>VALOR PAGO</b></span><br>
                </td>
                <td align="right">
                    <br>
                    <span style="text-align:right;"><%=valorP%></span><br>
                    <span style="text-align:right;"><%=valorM%></span><br>
                    <span style="text-align:right;"><%=valorT%></span>
                </td>
            </tr>
            <tr>
                <td><br>
                    <br>
                    <br></td>
                <td><br>
                    <br>
                    <br></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><p> <b>Recebemos a quantia de: </b><%=(stringUtils.valorPorExtenso(total, "MZN").toUpperCase()).replaceAll("UM MIL", "MIL")%><br>
                        <b>Método de pagamento: </b><%=formaP%><br>
                        <b>Obs.: </b><%=obs%><br>
                <td><p style="margin-left:30px;"> <b>Utilizador:</b> <%=us.toUpperCase()%><br>
                        <br><br>
                        <b>Assinatura:</b> _____________________________________________<br>
                        <br>
                        <b>Data de impressão:</b> <%=sdf.format(new Date())%><br>
                    </p></td>
            </tr>
            <tr>
                <td style="font-size:8px"><b>Documento processado por computador © SEGIA/ Impresso por: <%=nome.toUpperCase()%></b></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2"><div style="background:#00695C;color:#00695C; height:20px;">aaaa</div>
                    <br></td>
            </tr>
        </table>

        <BR>
        --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


        <table width="1065" border="0">
            <tr>

                <td width="630"><p><img src="http://<%=ip%>:8081/suc/images/invoice/<%=logoE%>"  width="135px" height="135px" alt=""/> <br>
                        <br>
                        <b><%=nomeE%></b><br>
                        <%=enderecoE%> <br>
                        <b>NUIT: </b><%=nuitE%><br>
                        <b>ENTIDADE: </b><%=entiE%><br>
                        <%=provE%> - Moçambique</p>
                    <p><br>
                        <b>ATENDIMENTO AO CLIENTE</b><br>
                        Contacto.: <%=contactoE%><br>
                        Email: <%=emailE%> </p></td>
                <td width="431"><p>CÓPIA<br>
                        <b>RECIBO</b></p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>


                    <p><b><%=exmo%></b><br>
                        <%=nomeC%><br>
                        <%=enderecoC%><br>
                        <%=provinciaC%><br>
                        <b>Contacto: <%=contactoC%></b><br>

            </tr>
            <tr>
                <td>&nbsp;</td>
                <td></td>
            </tr>
            <tr>
                <td colspan="2"><table width="1031" border="0">
                        <tr>
                            <td width="313"><table width="272">
                                    <tr>
                                        <td width="242" align="center"><b>Código Aluno: </b> <%=refC%></td>
                                    </tr>
                                </table></td>
                            <td width="79">&nbsp;</td>
                            <td width="313"><table width="272">
                                    <tr>
                                        <td width="242" align="center"><b>Data de pgto.: </b> <%=dte%></td>
                                    </tr>
                                </table></td>
                            <td width="79">&nbsp;</td>
                            <td width="313"><table width="272">
                                    <tr>
                                        <td width="242" align="center"><b><%=refO%></b></td>
                                    </tr>
                                </table></td>
                        </tr>
                    </table></td>
            </tr>
            <tr>
                <td>Resumo</td>
                <td align="right" style="font-size:10px;">Informação de valor em MT</td>
            </tr>
            <tr>
                <td colspan="2">

                    <table width="1065"  style="border-top:none;border-left:none;border-right:none;border-bottom:none;">
                        <tr>
                            <th bgcolor="#CCCCCC" scope="col" align="left">#</th>
                            <th bgcolor="#CCCCCC" scope="col">Referência</th>
                            <th bgcolor="#CCCCCC" scope="col">Prestação</th>
                            <th bgcolor="#CCCCCC" scope="col">Data Pgto.</th>
                            <th bgcolor="#CCCCCC" scope="col">Valor Prestação</th>
                            <th bgcolor="#CCCCCC" scope="col">Valor Multa</th>
                            <th bgcolor="#CCCCCC" scope="col">Total de Débito</th>
                        </tr>
                        <tbody>

                            <%
                                if (pagamentos != null) {

                                    for (Pagamento p : pagamentos) {

                                        idP = p.getPagId();
                                        ref = "---";

                                        if (p.getPagRefOnline() != null) {
                                            ref = encryptUtils.decodeString(p.getPagRefOnline());
                                        }

                                        prestacao = encryptUtils.decodeString(p.getPagDescricao());
                                        dteP = sdf2.format(p.getPagData().toGregorianCalendar().getTime());
                                        cap = df.format(p.getPagValor());
                                        vj = p.getPagMulta();
                                        td = p.getPagValorPago();
                            %>
                            <tr style="border:none;">
                                <td align="left"><%=idP%></td>
                                <td align="left"><%=ref%></td>  
                                <td align="left"><%=prestacao%></td>  
                                <td align="left"><%=dteP%></td>  
                                <td align="right"><%=cap%></td>
                                <td align="right"><%=df.format(vj)%></td>
                                <td align="right"><%=df.format(td)%></td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>


                </td>
            </tr>
            <tr>
                <td>
                    <br>
                    <span style="margin-left:500px;"><b>VALOR À PAGAR</b></span> 
                    <span style="margin-left:500px;"><b>TOTAL EM MULTAS</b></span><br>
                    <span style="margin-left:500px;"><b>VALOR PAGO</b></span><br>
                </td>
                <td align="right">
                    <br>
                    <span style="text-align:right;"><%=valorP%></span><br>
                    <span style="text-align:right;"><%=valorM%></span><br>
                    <span style="text-align:right;"><%=valorT%></span>
                </td>
            </tr>
            <tr>
                <td><br>
                    <br>
                    <br></td>
                <td><br>
                    <br>
                    <br></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><p> <b>Recebemos a quantia de: </b><%=(stringUtils.valorPorExtenso(total, "MZN").toUpperCase()).replaceAll("UM MIL", "MIL")%><br>
                        <b>Método de pagamento: </b><%=formaP%><br>
                        <b>Obs.: </b><%=obs%><br>
                <td><p style="margin-left:30px;"> <b>Utilizador:</b> <%=us.toUpperCase()%><br>
                        <br><br>
                        <b>Assinatura:</b> _____________________________________________<br>
                        <br>
                        <b>Data de impressão:</b> <%=sdf.format(new Date())%><br>
                    </p></td>
            </tr>
            <tr>
                <td style="font-size:8px"><b>Documento processado por computador © SEGIA/ Impresso por: <%=nome.toUpperCase()%></b></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2"><div style="background:#00695C;color:#00695C; height:20px;">aaaa</div>
                    <br></td>
            </tr>
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
