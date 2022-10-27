<%-- 
    Document   :  -invoice-print
    Created on : Feb 17, 2017, 6:05:57 AM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.localcontroler.StringUtils"%>
<%@page import="com.dciapps.webclient.Recibo"%>
<%@page import="java.util.Date"%>
<%@page import="com.dciapps.webclient.Cliente"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="com.dciapps.webclient.Factura"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="com.dciapps.controller.GenericHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=8">
        <%
            String title = "---";

            if (session.getAttribute("title") != null) {
                title = session.getAttribute("title").toString();
            }
        %>

        <title><%=title%></title>

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

            body {margin-top: 0px;margin-left: 0px;}

            #page_1 {position:relative; overflow: hidden;margin: 30px 0px 37px 0px;padding: 0px;border: none;width: 793px;}
            #page_1 #id_1 {border:none;margin: 0px 0px 0px 0px;padding: 0px;border:none;width: 793px;overflow: hidden;}
            #page_1 #id_2 {border:none;margin: 25px 0px 0px 83px;padding: 0px;border:none;width: 710px;overflow: hidden;}

            #page_1 #p1dimg1 {position:absolute;top:2px;left:83px;z-index:-1;width:673px;height:582px;}
            #page_1 #p1dimg1 #p1img1 {width:673px;height:582px;}




            .ft0{font: 9px 'Poppins';line-height: 11px;}
            .ft1{font: 9px 'Poppins';line-height: 15px;}
            .ft2{font: bold 9px 'Poppins';line-height: 15px;}
            .ft3{font: 1px 'Poppins';line-height: 1px;}
            .ft4{font: 8px 'Poppins';line-height: 10px;}
            .ft5{font: 11px 'Poppins';line-height: 13px;}
            .ft6{font: 1px 'Poppins';line-height: 3px;}
            .ft7{font: bold 9px 'Poppins';line-height: 11px;}
            .ft8{font: 1px 'Poppins';line-height: 9px;}
            .ft9{font: bold 14px 'Poppins';line-height: 17px;}
            .ft10{font: 1px 'Poppins';line-height: 7px;}
            .ft11{font: 1px 'Poppins';line-height: 2px;}
            .ft12{font: 1px 'Poppins';line-height: 4px;}
            .ft13{font: 7px 'Poppins';line-height: 9px;}

            .p0{text-align: right;padding-right: 37px;margin-top: 0px;margin-bottom: 0px;}
            .p1{text-align: left;padding-left: 83px;padding-right: 582px;margin-top: 77px;margin-bottom: 0px; width: 350px;}
            .p2{text-align: left;padding-left: 83px;margin-top: 31px;margin-bottom: 0px;}
            .p3{text-align: left;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
            .p4{text-align: left;padding-left: 30px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
            .p5{text-align: left;padding-left: 1px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
            .p6{text-align: left;padding-left: 3px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
            .p7{text-align: left;padding-left: 8px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
            .p8{text-align: left;padding-left: 68px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
            .p9{text-align: left;padding-left: 83px;margin-top: 24px;margin-bottom: 0px;}
            .p10{text-align: left;padding-left: 7px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
            .p11{text-align: right;padding-right: 51px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
            .p12{text-align: right;padding-right: 7px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
            .p13{text-align: right;padding-right: 8px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
            .p14{text-align: right;padding-right: 1px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
            .p15{text-align: left;padding-left: 19px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
            .p16{text-align: right;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
            .p17{text-align: left;padding-left: 83px;margin-top: 65px;margin-bottom: 0px;}
            .p18{text-align: left;margin-top: 0px;margin-bottom: 0px;}

            .td0{padding: 0px;margin: 0px;width: 129px;vertical-align: bottom;}
            .td1{padding: 0px;margin: 0px;width: 8px;vertical-align: bottom;}
            .td2{padding: 0px;margin: 0px;width: 136px;vertical-align: bottom;}
            .td3{padding: 0px;margin: 0px;width: 68px;vertical-align: bottom;}
            .td4{padding: 0px;margin: 0px;width: 312px;vertical-align: bottom;}
            .td5{padding: 0px;margin: 0px;width: 20px;vertical-align: bottom;}
            .td6{padding: 0px;margin: 0px;width: 61px;vertical-align: bottom;}
            .td7{padding: 0px;margin: 0px;width: 7px;vertical-align: bottom;}
            .td8{padding: 0px;margin: 0px;width: 114px;vertical-align: bottom;}
            .td9{padding: 0px;margin: 0px;width: 115px;vertical-align: bottom;}
            .td10{padding: 0px;margin: 0px;width: 76px;vertical-align: bottom;}
            .td11{padding: 0px;margin: 0px;width: 45px;vertical-align: bottom;}
            .td12{padding: 0px;margin: 0px;width: 204px;vertical-align: bottom;}
            .td13{padding: 0px;margin: 0px;width: 42px;vertical-align: bottom;}
            .td14{padding: 0px;margin: 0px;width: 80px;vertical-align: bottom;}
            .td15{padding: 0px;margin: 0px;width: 273px;vertical-align: bottom;}
            .td16{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 76px;vertical-align: bottom;}
            .td17{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 8px;vertical-align: bottom;}
            .td18{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 45px;vertical-align: bottom;}
            .td19{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 42px;vertical-align: bottom;}
            .td20{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 7px;vertical-align: bottom;}
            .td21{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 80px;vertical-align: bottom;}
            .td22{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 68px;vertical-align: bottom;}
            .td23{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 61px;vertical-align: bottom;}
            .td24{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 114px;vertical-align: bottom;}
            .td25{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 115px;vertical-align: bottom;}
            .td26{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 20px;vertical-align: bottom;}
            .td27{padding: 0px;margin: 0px;width: 244px;vertical-align: bottom;}
            .td28{border-bottom: #c8c8c8 1px solid;padding: 0px;margin: 0px;width: 76px;vertical-align: bottom;}
            .td29{border-bottom: #c8c8c8 1px solid;padding: 0px;margin: 0px;width: 8px;vertical-align: bottom;}
            .td30{border-bottom: #c8c8c8 1px solid;padding: 0px;margin: 0px;width: 45px;vertical-align: bottom;}
            .td31{border-bottom: #c8c8c8 1px solid;padding: 0px;margin: 0px;width: 42px;vertical-align: bottom;}
            .td32{border-bottom: #c8c8c8 1px solid;padding: 0px;margin: 0px;width: 7px;vertical-align: bottom;}
            .td33{border-bottom: #c8c8c8 1px solid;padding: 0px;margin: 0px;width: 80px;vertical-align: bottom;}
            .td34{border-bottom: #c8c8c8 1px solid;padding: 0px;margin: 0px;width: 68px;vertical-align: bottom;}
            .td35{border-bottom: #c8c8c8 1px solid;padding: 0px;margin: 0px;width: 61px;vertical-align: bottom;}
            .td36{border-bottom: #c8c8c8 1px solid;padding: 0px;margin: 0px;width: 114px;vertical-align: bottom;}
            .td37{padding: 0px;margin: 0px;width: 57px;vertical-align: bottom;}
            .td38{padding: 0px;margin: 0px;width: 182px;vertical-align: bottom;}
            .td39{padding: 0px;margin: 0px;width: 653px;vertical-align: bottom;}
            .td40{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 87px;vertical-align: bottom;}
            .td41{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 122px;vertical-align: bottom;}
            .td42{padding: 0px;margin: 0px;width: 87px;vertical-align: bottom;}
            .td43{border-bottom: #c8c8c8 1px solid;padding: 0px;margin: 0px;width: 115px;vertical-align: bottom;}
            .td44{border-bottom: #c8c8c8 1px solid;padding: 0px;margin: 0px;width: 20px;vertical-align: bottom;}
            .td45{padding: 0px;margin: 0px;width: 91px;vertical-align: bottom;}
            .td46{padding: 0px;margin: 0px;width: 110px;vertical-align: bottom;}
            .td47{padding: 0px;margin: 0px;width: 104px;vertical-align: bottom;}
            .td48{padding: 0px;margin: 0px;width: 99px;vertical-align: bottom;}
            .td49{padding: 0px;margin: 0px;width: 76px;vertical-align: bottom;background: #c8c8c8;}
            .td50{padding: 0px;margin: 0px;width: 103px;vertical-align: bottom;background: #c8c8c8;}
            .td51{padding: 0px;margin: 0px;width: 97px;vertical-align: bottom;background: #c8c8c8;}
            .td52{padding: 0px;margin: 0px;width: 99px;vertical-align: bottom;background: #c8c8c8;}
            .td53{padding: 0px;margin: 0px;width: 103px;vertical-align: bottom;}
            .td54{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 103px;vertical-align: bottom;}
            .td55{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 97px;vertical-align: bottom;}
            .td56{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 99px;vertical-align: bottom;}
            .td57{padding: 0px;margin: 0px;width: 117px;vertical-align: bottom;}
            .td58{padding: 0px;margin: 0px;width: 185px;vertical-align: bottom;}
            .td59{padding: 0px;margin: 0px;width: 116px;vertical-align: bottom;}

            .tr0{height: 17px;}
            .tr1{height: 14px;}
            .tr2{height: 3px;}
            .tr3{height: 16px;}
            .tr4{height: 18px;}
            .tr5{height: 47px;}
            .tr6{height: 56px;}
            .tr7{height: 9px;}
            .tr8{height: 29px;}
            .tr9{height: 7px;}
            .tr10{height: 26px;}
            .tr11{height: 2px;}
            .tr12{height: 12px;}
            .tr13{height: 37px;}
            .tr14{height: 36px;}
            .tr15{height: 13px;}
            .tr16{height: 15px;}
            .tr17{height: 4px;}
            .tr18{height: 20px;}

            .t0{width: 673px;margin-left: 83px;font: 9px 'Poppins';}
            .t1{width: 673px;margin-left: 83px;margin-top: 20px;font: bold 9px 'Poppins';}
            .t2{width: 301px;margin-left: 83px;margin-top: 12px;font: bold 14px 'Poppins';}


            #watermark
            {
                position:fixed;
                top: 50%;
                left: 50%;
                opacity:0.5;
                color:red;
                font-size: 70px;
                -ms-transform: rotate(-50deg); /* IE 9 */
                -webkit-transform: rotate(-50deg); /* Chrome, Safari, Opera */
                transform: rotate(-50deg);
                margin-left: -265px;
                font-family: Poppins;
            }



        </style>

        <%

            int timeout = session.getMaxInactiveInterval();

            GenericHandler gh = new GenericHandler(request, response);
            Usuario usuario = gh.loggedUser();

            String nome = "";

            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyy");
            SimpleDateFormat sdf1 = new SimpleDateFormat("yy");
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            StringUtils su = new StringUtils();

            EncryptUtils encryptUtils = new EncryptUtils();
            Recibo recibo = null;

            if (usuario != null) {

                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());

                recibo = (Recibo) session.getAttribute("recibo");

                response.setHeader("Refresh", timeout + "; URL =VXN1YXJpb1NlcnZsZXQjRENJ?" + encryptUtils.encodeString("accao#lockscreen&user=" + encryptUtils.decodeString(usuario.getUsuaUsuario())));

            }
        %>
    </head>

    <body onload="window.print();">
        <%
            if (recibo != null) {
        %>
        <div id="page_1">
            <%
                /**
                 * ****** EMPRESA ******
                 */
                Factura factura = recibo.getFactura();

                Entidade entidade = factura.getEntidade();

                String nomeE = encryptUtils.decodeString(entidade.getEntiNome()).toUpperCase();
                String nuitE = encryptUtils.decodeString(entidade.getEntiNuit());
                String enderecoE = encryptUtils.decodeString(entidade.getEntiEndereco());
                String contactoE = encryptUtils.decodeString(entidade.getEntiContactos1());
                String emailE = encryptUtils.decodeString(entidade.getEntiEmail());
                String logoE = encryptUtils.decodeString(entidade.getEntiLogotipo());
                String siglaE = encryptUtils.decodeString(entidade.getEntiSigla()).toUpperCase();

                /**
                 * **** END EMPRESA ***
                 */
                /**
                 * ********** CLIENTE *************
                 */
                Cliente cliente = null;

                String nomeC = "";
                String nuitC = "";
                String enderecoC = "";
                String contactoC = "";
                String provinciaC = "";
                String exmo = "";
                int idClie = 0;

                if (factura.getVenda() != null) {
                    cliente = factura.getVenda().getCliente();
                    nomeC = encryptUtils.decodeString(cliente.getPessoapess().getPessNome());
                    nuitC = encryptUtils.decodeString(cliente.getPessoapess().getPessNuit());
                    enderecoC = encryptUtils.decodeString(cliente.getPessoapess().getPessBairro());
                    contactoC = encryptUtils.decodeString(cliente.getPessoapess().getPessContacto());
                    provinciaC = encryptUtils.decodeString(cliente.getPessoapess().getPessProvincia());
                    idClie = cliente.getClieId();
                    exmo = "Exmo.(s) Sr.(s)";
                }

                String status = "";

                if (factura.getFactStatus() != null) {
                    status = encryptUtils.decodeString(factura.getFactStatus());
                }

                if (usuario.getUsuaEstado().equals("Demo")) {
                    status = "Demo - " + status;
                }
                /**
                 * **** END CLIENTE ***
                 */

            %>

            <div id="p1dimg1">
                <img src="http://<%=ip%>:8081/suc/images/invoice/<%=logoE%>" alt="" width="145px" height="145px"></div>


            <div id="id_1">
                <p class="p0 ft0"><b>pág. 1</b></p>
                <br><br>
                <p class="p1 ft2"><%=nomeE%> <SpAN class="ft1"><br><%=enderecoE%>. Maputo - Moçambique</SpAN></p>
                <p class="p2 ft0">Tel: <%=contactoE%><br>Contribuinte N.º: <%=nuitE%><br><%=emailE%></p>
                <table cellpadding=0 cellspacing=0 class="t0">
                    <tr>
                        <td class="tr1 td1"><p class="p3 ft3">&nbsp;</p></td>
                        <td colspan=7 rowspan=2 class="tr0 td2"><p class="p4 ft4">&nbsp;</p></td>
                        <td class="tr1 td3"><p class="p3 ft3">&nbsp;</p></td>
                        <td colspan=6 class="tr1 td4"><p class="p3 ft5"><b><%=exmo%></b></p></td>
                        <td class="tr1 td5"><p class="p3 ft3">&nbsp;</p></td>
                    </tr>
                    <tr>
                        <td class="tr2 td1"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr2 td3"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr2 td6"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr2 td7"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr2 td8"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr2 td1"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr2 td7"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr2 td9"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr2 td5"><p class="p3 ft6">&nbsp;</p></td>
                    </tr>
                    <tr>
                        <td colspan=3 class="tr3 td0"><p class="p3 ft0">&nbsp;</p></td>
                        <td class="tr3 td1"><p class="p3 ft3">&nbsp;</p></td>
                        <td colspan=4 class="tr3 td2"><p class="p4 ft0">&nbsp;</p></td>
                        <td class="tr3 td3"><p class="p3 ft3">&nbsp;</p></td>
                        <td colspan=6 class="tr3 td4"><p class="p3 ft5"><%=nomeC%></p></td>
                        <td class="tr3 td5"><p class="p3 ft3">&nbsp;</p></td>
                    </tr>
                    <tr>
                        <td class="tr4 td10"><p class="p5 ft0">---</p></td>
                        <td class="tr4 td1"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr4 td11"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr4 td1"><p class="p3 ft3">&nbsp;</p></td>
                        <td colspan=5 class="tr4 td12"><p class="p4 ft0">&nbsp;</p></td>
                        <td colspan=6  width="100px"><p><%=enderecoC%><br><%=contactoC%><br><%=provinciaC%></p></td>
                        <td class="tr4 td5"><p class="p3 ft3">&nbsp;</p></td>
                    </tr>
                    <tr>
                        <td class="tr5 td10"><p class="p3 ft7">Original</p></td>
                        <td class="tr5 td1"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr5 td11"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr5 td1"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr5 td13"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr5 td7"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr5 td14"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr5 td7"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr5 td3"><p class="p3 ft3">&nbsp;</p></td>
                        <td colspan=6 rowspan=2 class="tr6 td4"><p class="p6 ft5">Maputo</p></td>
                        <td class="tr5 td5"><p class="p3 ft3">&nbsp;</p></td>
                    </tr>
                    <tr>
                        <td class="tr7 td10"><p class="p3 ft8">&nbsp;</p></td>
                        <td class="tr7 td1"><p class="p3 ft8">&nbsp;</p></td>
                        <td class="tr7 td11"><p class="p3 ft8">&nbsp;</p></td>
                        <td class="tr7 td1"><p class="p3 ft8">&nbsp;</p></td>
                        <td class="tr7 td13"><p class="p3 ft8">&nbsp;</p></td>
                        <td class="tr7 td7"><p class="p3 ft8">&nbsp;</p></td>
                        <td class="tr7 td14"><p class="p3 ft8">&nbsp;</p></td>
                        <td class="tr7 td7"><p class="p3 ft8">&nbsp;</p></td>
                        <td class="tr7 td3"><p class="p3 ft8">&nbsp;</p></td>
                        <td class="tr7 td5"><p class="p3 ft8">&nbsp;</p></td>
                    </tr>
                    <%
                        /**
                         * ******* FACTURA ********
                         */

                        Date data = new Date();
                        Date dataLimite = factura.getFactDataLimite().toGregorianCalendar().getTime();

                        double valorPago = recibo.getRecValor();
                        double valorIva = factura.getFactValoriva();
                        double valorTotal = factura.getFactValortotal();

                        double vDescontos = factura.getFactDesconto();

                        String referencia = encryptUtils.decodeString(recibo.getRecReferencia());
                        String obs = encryptUtils.decodeString(recibo.getRecObservacoes());
                        long lancamento = factura.getFactNumerolancamento();

                        String doc = encryptUtils.decodeString(recibo.getRecRecebemosDe());
                        String nrDoc = encryptUtils.decodeString(recibo.getRefNrDocumentoPagamento());
                        String bnc = encryptUtils.decodeString(recibo.getRefBancoPagamento());

                        /**
                         * ******* END FACTURA ****
                         */
                    %>
                    <tr>
                        <td colspan=8 class="tr8 td15"><p class="p3 ft9"><%=referencia%></p></td>
                        <td class="tr8 td3"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr8 td6"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr8 td7"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr8 td8"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr8 td1"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr8 td7"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr8 td9"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr8 td5"><p class="p3 ft3">&nbsp;</p></td>
                    </tr>
                    <tr>
                        <td class="tr9 td16"><p class="p3 ft10">&nbsp;</p></td>
                        <td class="tr9 td17"><p class="p3 ft10">&nbsp;</p></td>
                        <td class="tr9 td18"><p class="p3 ft10">&nbsp;</p></td>
                        <td class="tr9 td17"><p class="p3 ft10">&nbsp;</p></td>
                        <td class="tr9 td19"><p class="p3 ft10">&nbsp;</p></td>
                        <td class="tr9 td20"><p class="p3 ft10">&nbsp;</p></td>
                        <td class="tr9 td21"><p class="p3 ft10">&nbsp;</p></td>
                        <td class="tr9 td20"><p class="p3 ft10">&nbsp;</p></td>
                        <td class="tr9 td22"><p class="p3 ft10">&nbsp;</p></td>
                        <td class="tr9 td23"><p class="p3 ft10">&nbsp;</p></td>
                        <td class="tr9 td20"><p class="p3 ft10">&nbsp;</p></td>
                        <td class="tr9 td24"><p class="p3 ft10">&nbsp;</p></td>
                        <td class="tr9 td17"><p class="p3 ft10">&nbsp;</p></td>
                        <td class="tr9 td20"><p class="p3 ft10">&nbsp;</p></td>
                        <td class="tr9 td25"><p class="p3 ft10">&nbsp;</p></td>
                        <td class="tr9 td26"><p class="p3 ft10">&nbsp;</p></td>
                    </tr>
                    <tr>
                        <td class="tr10 td10"><p class="p3 ft7">V/Nº Contrib.</p></td>
                        <td class="tr10 td1"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr10 td11"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr10 td1"><p class="p3 ft3">&nbsp;</p></td>
                        <td colspan=4 class="tr10 td2"><p class="p3 ft7">Data Doc.</p></td>
                        <td class="tr10 td3"><p class="p3 ft7">Moeda</p></td>
                        <td class="tr10 td6"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr10 td7"><p class="p3 ft3">&nbsp;</p></td>
                        <td colspan=4 class="tr10 td27"><p class="p3 ft7">Entidade</p></td>
                        <td class="tr10 td5"><p class="p3 ft3">&nbsp;</p></td>
                    </tr>
                    <tr>
                        <td class="tr11 td28"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td29"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td30"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr2 td1"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr11 td31"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td32"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td33"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr2 td7"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr11 td34"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td35"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr2 td7"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr11 td36"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td29"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td32"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr2 td9"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr2 td5"><p class="p3 ft6">&nbsp;</p></td>
                    </tr>
                    <tr>
                        <td class="tr12 td10"><p class="p3 ft0"><%=nuitC%></p></td>
                        <td class="tr12 td1"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr12 td11"><p class="p3 ft3">&nbsp;</p></td>
                        <td colspan=3 class="tr12 td37"><p class="p7 ft0"><%=sdf.format(data)%></p></td>
                        <td class="tr12 td14"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr12 td7"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr12 td3"><p class="p3 ft0">MT</p></td>
                        <td colspan=3 class="tr12 td38"><p class="p8 ft0"><%=idClie%></p></td>
                        <td class="tr12 td1"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr12 td7"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr12 td9"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr12 td5"><p class="p3 ft3">&nbsp;</p></td>
                    </tr>
                    <tr>
                        <td colspan=15 class="tr13 td39" style="width: 300px;"><p><%=obs%></p></td>
                        <td class="tr13 td5"><p class="p3 ft3">&nbsp;</p></td>
                    </tr>
                    <tr>
                        <td class="tr14 td16"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr14 td17"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr14 td18"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr14 td17"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr14 td19"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr14 td20"><p class="p3 ft3">&nbsp;</p></td>
                        <td colspan=2 class="tr14 td40"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr14 td22"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr14 td23"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr14 td20"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr14 td24"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr14 td17"><p class="p3 ft3">&nbsp;</p></td>
                        <td colspan=2 class="tr14 td41"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr14 td26"><p class="p3 ft3">&nbsp;</p></td>
                    </tr>
                    <tr>
                        <td class="tr15 td10"><p class="p3 ft7">Movimento</p></td>
                        <td class="tr15 td1"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr15 td11"><p class="p3 ft7">Número</p></td>
                        <td class="tr15 td1"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr15 td13"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr15 td7"><p class="p3 ft3">&nbsp;</p></td>
                        <td colspan=2 class="tr15 td42"><p class="p3 ft7">Descrição</p></td>
                        <td class="tr15 td3"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr15 td6"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr15 td7"><p class="p3 ft3">&nbsp;</p></td>
                        <td colspan=4 class="tr15 td27"><p class="p3 ft7">Balcão</p></td>
                        <td class="tr15 td5"><p class="p3 ft7">Valor</p></td>
                    </tr>
                    <tr>
                        <td class="tr11 td28"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr2 td1"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr11 td30"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td29"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td31"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr2 td7"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr11 td33"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td32"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td34"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td35"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr2 td7"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr11 td36"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr2 td1"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr11 td32"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td43"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td44"><p class="p3 ft11">&nbsp;</p></td>
                    </tr>
                </table>
                <p class="p9 ft0">Recebemos de V.Exas. para pagamento do(s) seguinte(s) documento(s):</p>
                <table cellpadding=0 cellspacing=0 class="t1">

                    <%
                        if (status.equals("Cancelado")) {
                    %>
                    <p id="watermark">CANCELADO </p>
                    <%
                        }
                    %>
                    <tr>
                        <td class="tr16 td10"><p class="p3 ft7">Documento</p></td>
                        <td colspan=3 class="tr16 td45"><p class="p10 ft7">Num. Doc.</p></td>
                        <td class="tr16 td10"><p class="p11 ft7">Nº prt.</p></td>
                        <td class="tr16 td7"><p class="p3 ft3">&nbsp;</p></td>
                        <td colspan=2 class="tr16 td46"><p class="p12 ft7">Valor Documento</p></td>
                        <td colspan=2 class="tr16 td46"><p class="p12 ft7">Valor Atribuído</p></td>
                        <td colspan=2 class="tr16 td47"><p class="p13 ft7">Valor Desconto</p></td>
                        <td class="tr16 td48"><p class="p14 ft7">Valor pendente</p></td>
                    </tr>
                    <tr>
                        <td class="tr11 td49"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td1"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td49"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td7"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td49"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td7"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td50"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td7"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td50"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td7"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td51"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td7"><p class="p3 ft11">&nbsp;</p></td>
                        <td class="tr11 td52"><p class="p3 ft11">&nbsp;</p></td>
                    </tr>
                    <tr>
                        <td class="tr12 td10"><p class="p3 ft0">FA</p></td>
                        <td class="tr12 td1"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr12 td10"><p class="p15 ft0"><%=lancamento%></p></td>
                        <td class="tr12 td7"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr12 td10"><p class="p16 ft0">1</p></td>
                        <td class="tr12 td7"><p class="p3 ft3">&nbsp;</p></td>
                        <td colspan=2 class="tr12 td46"><p class="p12 ft0"><%=df.format(valorPago)%></p></td>
                        <td class="tr12 td53"><p class="p16 ft0"><%=df.format(valorTotal)%></p></td>
                        <td class="tr12 td7"><p class="p3 ft3">&nbsp;</p></td>
                        <td colspan=2 class="tr12 td47"><p class="p12 ft0"><%=df.format(vDescontos)%></p></td>
                        <td class="tr12 td48"><p class="p16 ft0"><%=df.format(valorTotal - valorPago)%></p></td>
                    </tr>
                    <tr>
                        <td class="tr2 td16"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr2 td17"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr2 td16"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr2 td20"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr2 td16"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr17 td7"><p class="p3 ft12">&nbsp;</p></td>
                        <td class="tr2 td54"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr17 td7"><p class="p3 ft12">&nbsp;</p></td>
                        <td class="tr2 td54"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr17 td7"><p class="p3 ft12">&nbsp;</p></td>
                        <td class="tr2 td55"><p class="p3 ft6">&nbsp;</p></td>
                        <td class="tr17 td7"><p class="p3 ft12">&nbsp;</p></td>
                        <td class="tr2 td56"><p class="p3 ft6">&nbsp;</p></td>
                    </tr>
                    <tr>
                        <td class="tr15 td10"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr15 td1"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr15 td10"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr15 td7"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr15 td10"><p class="p16 ft7">Total</p></td>
                        <td colspan=3 class="tr15 td57"><p class="p12 ft7"><%=df.format(valorPago)%></p></td>
                        <td colspan=2 class="tr15 td46"><p class="p12 ft7"><%=df.format(valorTotal)%></p></td>
                        <td colspan=2 class="tr15 td47"><p class="p12 ft7"><%=df.format(vDescontos)%></p></td>
                        <td class="tr15 td48"><p class="p16 ft7"><%=df.format(valorTotal - valorPago)%></p></td>
                    </tr>
                    <tr>
                        <td class="tr15 td10"><p class="p3 ft3"><h6><b><%=doc%></b>: <%=nrDoc%></h6></p></td>
                        <td class="tr15 td1"><p class="p3 ft3"><h6><b><%=bnc%></b></h6></p></td>
                        <td class="tr15 td10"><p class="p3 ft3"></p></td>
                        <td class="tr15 td7"><p class="p3 ft3">&nbsp;</p></td>
                        <td class="tr15 td10"><p class="p16 ft7">&nbsp;</p></td>
                        <td colspan=3 class="tr15 td57"><p class="p12 ft7">&nbsp;</p></td>
                        <td colspan=2 class="tr15 td46"><p class="p12 ft7">&nbsp;</p></td>
                        <td colspan=2 class="tr15 td47"><p class="p12 ft7">&nbsp;</p></td>
                        <td class="tr15 td48"><p class="p16 ft7">&nbsp;</p></td>
                    </tr>
                </table>
                <table cellpadding=0 cellspacing=0 class="t2">
                    <tr>
                        <td class="tr18 td58"><p class="p3 ft9">Total Recebido (MT)</p></td>
                        <td class="tr18 td59"><p class="p16 ft9"><%=df.format(valorPago)%></p></td>

                    </tr>

                </table>

                <p class="p17 ft0"> <%=su.valorPorExtenso(valorPago, "MZN").toUpperCase()%></p>
                <p class="p17 ft0">Respeitosos Cumprimentos.</p>
            </div>
            <div id="id_2">
                <p class="p18 ft13"><b>Documento processado por Computador / © SEGIA -  -  / Impresso por: <%=nome%> </b></p>
            </div>
        </div>
        <%
            }
        %>
    </body>

    <script>

        <%
            String clock = request.getParameter("clock");
            if (clock == null) {
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
