<%-- 
    Document   : print-ee-report-inscription-subject
    Created on : 20-Apr-2022, 11:06:01
    Author     : 25884
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dciapps.local.EEReport2"%>
<%@page import="com.dciapps.webclient.AnoLectivo"%>
<%@page import="com.dciapps.webclient.Curso"%>
<%@page import="com.dciapps.webclient.Disciplina"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="com.dciapps.webclient.SalaExame"%>
<%@page import="com.dciapps.webclient.Exame"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.webclient.Sistema"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:v="urn:schemas-microsoft-com:vml"
      xmlns:o="urn:schemas-microsoft-com:office:office"
      xmlns:w="urn:schemas-microsoft-com:office:word"
      xmlns:m="http://schemas.microsoft.com/office/2004/12/omml"
      xmlns="http://www.w3.org/TR/REC-html40">

    <head>
        <meta http-equiv=Content-Type content="text/html; charset=windows-1252">
        <meta name=ProgId content=Word.Document>
        <meta name=Generator content="Microsoft Word 15">
        <meta name=Originator content="Microsoft Word 15">

        <!-- Page Description, Author and Keywords -->
        <meta name="description" content="Sistema Electrónico de Gestão de Informação Académica">
        <meta name="author" content="Hamilton Jhonas">
        <meta name="keywords" content="SEGIA" />

        <title> SEGIA - Número de Candidatos Inscritos Disciplina</title>


        <!-- Favicon -->
        <%
            String ip = "localhost";

            if (session.getAttribute("ip") != null) {
                ip = session.getAttribute("ip").toString();
                Sistema sistema = (Sistema) session.getAttribute("sistema");

                if (!sistema.isSistEstado()) {
                    response.sendRedirect("error-manitence");
                }

            } else {
                response.sendRedirect("startup");
            }
        %>
        <link rel="shortcut icon" href="http://<%=ip%>:8081/suc/images/favicons/governo/apple-touch-icon.png">

        <style>

            body:before{
                content: '';
                position: absolute;
                top: 0;
                bottom: 0;
                background:  url(Certidao_files/image002.png);
                background-repeat: no-repeat;
                background-position: center;
                z-index: -1;
                opacity: 0.05;
                width: 100%;
                height: 100%;
            }

            <!--
            /* Font Definitions */
            @font-face
            {font-family:"Cambria Math";
             panose-1:2 4 5 3 5 4 6 3 2 4;
             mso-font-charset:0;
             mso-generic-font-family:roman;
             mso-font-pitch:variable;
             mso-font-signature:-536869121 1107305727 33554432 0 415 0;}
            @font-face
            {font-family:Calibri;
             panose-1:2 15 5 2 2 2 4 3 2 4;
             mso-font-charset:0;
             mso-generic-font-family:swiss;
             mso-font-pitch:variable;
             mso-font-signature:-469750017 -1073732485 9 0 511 0;}
            @font-face
            {font-family:Poppins;
             panose-1:0 0 5 0 0 0 0 0 0 0;
             mso-font-charset:0;
             mso-generic-font-family:modern;
             mso-font-format:other;
             mso-font-pitch:variable;
             mso-font-signature:32775 0 0 0 147 0;}
            /* Style Definitions */
            p.MsoNormal, li.MsoNormal, div.MsoNormal
            {mso-style-unhide:no;
             mso-style-qformat:yes;
             mso-style-parent:"";
             margin-top:0cm;
             margin-right:0cm;
             margin-bottom:8.0pt;
             margin-left:0cm;
             line-height:105%;
             mso-pagination:widow-orphan;
             font-size:11.0pt;
             font-family:"Calibri",sans-serif;
             mso-fareast-font-family:"Times New Roman";
             mso-fareast-theme-font:minor-fareast;}
            p.msonormal0, li.msonormal0, div.msonormal0
            {mso-style-name:msonormal;
             mso-style-unhide:no;
             mso-margin-top-alt:auto;
             margin-right:0cm;
             mso-margin-bottom-alt:auto;
             margin-left:0cm;
             mso-pagination:widow-orphan;
             font-size:12.0pt;
             font-family:"Times New Roman",serif;
             mso-fareast-font-family:"Times New Roman";
             mso-fareast-theme-font:minor-fareast;}
            p.msochpdefault, li.msochpdefault, div.msochpdefault
            {mso-style-name:msochpdefault;
             mso-style-unhide:no;
             mso-margin-top-alt:auto;
             margin-right:0cm;
             mso-margin-bottom-alt:auto;
             margin-left:0cm;
             mso-pagination:widow-orphan;
             font-size:10.0pt;
             font-family:"Calibri",sans-serif;
             mso-fareast-font-family:"Times New Roman";
             mso-fareast-theme-font:minor-fareast;}
            span.SpellE
            {mso-style-name:"";
             mso-spl-e:yes;}
            span.GramE
            {mso-style-name:"";
             mso-gram-e:yes;}
            .MsoChpDefault
            {mso-style-type:export-only;
             mso-default-props:yes;
             font-size:10.0pt;
             mso-ansi-font-size:10.0pt;
             mso-bidi-font-size:10.0pt;
             font-family:"Calibri",sans-serif;
             mso-ascii-font-family:Calibri;
             mso-hansi-font-family:Calibri;
             mso-bidi-font-family:Calibri;}
            @page WordSection1
            {size:595.3pt 841.9pt;
             margin:36.0pt 36.0pt 36.0pt 36.0pt;
             mso-header-margin:35.4pt;
             mso-footer-margin:35.4pt;
             mso-paper-source:0;}
            div.WordSection1
            {page:WordSection1;}
            -->
        </style>

        <%

            String provinciaSel = "";
            String escolaSel = "";
            String lblEscolas = "";
            DecimalFormat df2 = new DecimalFormat("#,###,##0");
            EncryptUtils encryptUtils = new EncryptUtils();

            List<EEReport2> eReport2s = (List<EEReport2>) session.getAttribute("eReport2s");

            Disciplina disciplina = (Disciplina) session.getAttribute("disciplinaSelecionada");
            Curso curso = (Curso) session.getAttribute("cursoSelecionado");
            AnoLectivo anoLectivo = (AnoLectivo) session.getAttribute("anoLectivoActivo");

            String location = "TODAS AS PROVÍNCIAS";
            if (session.getAttribute("provinciaSel") != null) {
                provinciaSel = session.getAttribute("provinciaSel").toString();
                if (!provinciaSel.equals("N/D")) {
                    location = provinciaSel;
                }
            }

            if (session.getAttribute("escolaSel") != null) {
                escolaSel = session.getAttribute("escolaSel").toString();

                if (!escolaSel.equals("N/D")) {
                    location += " | " + escolaSel;
                }
            }

            if (session.getAttribute("lblEscolas") != null) {
                lblEscolas = session.getAttribute("lblEscolas").toString();
            }
        %>
    </head>

    <body lang=PT style='tab-interval:35.4pt;word-wrap:break-word'  onload="window.print();" oncontextmenu="return false">

        <div class=WordSection1>



            <%
                String dd = "";
                String cur = "";
                String di = "";

                String an = "";

                if (disciplina != null) {
                    cur = "12ª Classe";
                    di = encryptUtils.decodeString(disciplina.getDiscDescricao());
                }

                if (anoLectivo != null) {
                    an = encryptUtils.decodeString(anoLectivo.getAnolDescricao());
                }
            %>

            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center'><span
                    style='mso-no-proof:yes'><img width=53 height=55 id="_x0000_i1025"
                                              src="http://<%=ip%>:8081/suc/images/app-icons/governo.png"></span><span style='font-size:8.0pt;
                                                                                        line-height:105%;font-family:Poppins'><o:p></o:p></span></p>

            <p class=MsoNormal align=center style='text-align:center'><b><span
                        style='font-size:8.0pt;line-height:107%;font-family:Poppins'>REPÚBLICA DE
                        MOÇAMBIQUE</span></b></p>

            <p class=MsoNormal align=center style='text-align:center'><span
                    style='font-size:8.0pt;line-height:107%;font-family:Poppins'>MINISTÉRIO DA
                    EDUCAÇÃO E DESENVOLVIMENTO HUMANO</span></p>

            <p class=MsoNormal align=center style='text-align:center'><b><span
                        style='font-size:9.0pt;line-height:107%;font-family:Poppins'>Instituto Nacional
                        de Exames Certificação e Equivalências</span></b></p>

            <p class=MsoNormal align=center style='text-align:center'>
                <span style='font-size:10.0pt;line-height:107%;font-family:Poppins; font-weight: bold;'>
                    <%=location%>
                </span>
            </p>

            <table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
                   style='border-collapse:collapse;border:none'>
                <tr>
                    <td width=601 valign=top style='width:450.8pt;border:solid windowtext 1.0pt;
                        background:#D5DCE4;padding:0cm 5.4pt 0cm 5.4pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>NÚMERO DE CANDIDATOS INSCRITOS POR DISCIPLINA - ANO LECTIVO <%=an%></span></b></p>
                    </td>
                </tr>
            </table>

            <p class=MsoNormal align=center style='text-align:center'><span
                    style='font-size:8.0pt;line-height:107%;font-family:Poppins'>&nbsp;</span></p>

            <table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
                   style='border-collapse:collapse;border:none'>
                <tr style='height:30.65pt'>
                    <td width=47 rowspan=2 style='width:35.2pt;border:solid windowtext 1.0pt;
                        background:#323E4F;padding:0cm 5.4pt 0cm 5.4pt;height:30.65pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:white'>Nº</span></b></p>
                    </td>
                    <td width=102 rowspan=2 style='width:76.8pt;border:solid windowtext 1.0pt;
                        border-left:none;background:#323E4F;padding:0cm 5.4pt 0cm 5.4pt;height:30.65pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:white'>DISCIPLINA</span></b></p>
                    </td>
                    <td width=113 colspan=2 style='width:3.0cm;border:solid windowtext 1.0pt;
                        border-left:none;background:#323E4F;padding:0cm 5.4pt 0cm 5.4pt;height:30.65pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:white'>HOMENS</span></b></p>
                    </td>
                    <td width=136 colspan=2 style='width:101.9pt;border:solid windowtext 1.0pt;
                        border-left:none;background:#323E4F;padding:0cm 5.4pt 0cm 5.4pt;height:30.65pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:white'>MULHERES</span></b></p>
                    </td>
                    <td width=75 rowspan=2 style='width:56.05pt;border:solid windowtext 1.0pt;
                        border-left:none;background:#323E4F;padding:0cm 5.4pt 0cm 5.4pt;height:30.65pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:white'>TOTAL</span></b></p>
                    </td>
                </tr>
                <tr style='height:14.9pt'>
                    <td width=57 style='width:42.55pt;border-top:none;border-left:none;
                        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        background:#D9E2F3;padding:0cm 5.4pt 0cm 5.4pt;height:14.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><span style='font-size:8.0pt;font-family:Poppins;
                                color:black'>Nº</span></p>
                    </td>
                    <td width=57 style='width:42.5pt;border-top:none;border-left:none;border-bottom:
                        solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;background:#D9E2F3;
                        padding:0cm 5.4pt 0cm 5.4pt;height:14.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><span style='font-size:8.0pt;font-family:Poppins;
                                color:black'>%</span></p>
                    </td>
                    <td width=61 style='width:45.85pt;border-top:none;border-left:none;
                        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        background:#D9E2F3;padding:0cm 5.4pt 0cm 5.4pt;height:14.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><span style='font-size:8.0pt;font-family:Poppins;
                                color:black'>Nº</span></p>
                    </td>
                    <td width=75 style='width:56.05pt;border-top:none;border-left:none;
                        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        background:#D9E2F3;padding:0cm 5.4pt 0cm 5.4pt;height:14.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><span style='font-size:8.0pt;font-family:Poppins;
                                color:black'>%</span></p>
                    </td>
                </tr>
                <%
                    int i = 0;
                    int ttH = 0;
                    int ttM = 0;
                    int ttI = 0;
                    if (eReport2s != null) {

                        for (EEReport2 eer : eReport2s) {

                            String s1 = eer.getDisciplina();
                            int n1 = eer.getNumH();
                            int per1 = eer.getPerH();
                            int n2 = eer.getNumM();
                            int per2 = eer.getPerM();
                            int tt = eer.getNumTotal();

                            ttH += n1;
                            ttM += n2;
                            ttI += tt;

                            i++;

                %>
                <tr style='height:14.9pt'>
                    <td width=47 style='width:35.2pt;border:solid windowtext 1.0pt;border-top:
                        none;padding:0cm 5.4pt 0cm 5.4pt;height:14.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><span style='font-size:8.0pt;font-family:Poppins'><%=i%></span></p>
                    </td>
                    <td width=102 style='width:76.8pt;border-top:none;border-left:none;
                        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:14.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><span style='font-size:8.0pt;font-family:Poppins'><%=s1%></span></p>
                    </td>
                    <td width=57 style='width:42.55pt;border-top:none;border-left:none;
                        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:14.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><span style='font-size:8.0pt;font-family:Poppins'><%=df2.format(n1)%></span></p>
                    </td>
                    <td width=57 style='width:42.5pt;border-top:none;border-left:none;border-bottom:
                        solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
                        height:14.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><span style='font-size:8.0pt;font-family:Poppins'><%=df2.format(per1)%></span></p>
                    </td>
                    <td width=61 style='width:45.85pt;border-top:none;border-left:none;
                        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:14.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><span style='font-size:8.0pt;font-family:Poppins'><%=df2.format(n2)%></span></p>
                    </td>
                    <td width=75 style='width:56.05pt;border-top:none;border-left:none;
                        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:14.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><span style='font-size:8.0pt;font-family:Poppins'><%=df2.format(per2)%></span></p>
                    </td>
                    <td width=75 style='width:56.05pt;border-top:none;border-left:none;
                        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:14.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><span style='font-size:8.0pt;font-family:Poppins'><%=df2.format(tt)%></span></p>
                    </td>
                </tr>


                <%                                                }
                    }
                %>


                <%
                    int perTH = 0;
                    int perTM = 0;

                    if (ttI != 0) {
                        perTH = Math.round((ttH * 100.0f) / ttI);
                        perTM = Math.round((ttM * 100.0f) / ttI);
                    }
                %>
                <tr style='height:14.9pt'>
                    <td width=274 colspan=2 style='width:205.3pt;border:solid windowtext 1.0pt;
                        border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:14.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:10.0pt;font-family:Poppins'>TOTAL</span></b></p>
                    </td>
                    <td width=57 style='width:42.55pt;border-top:none;border-left:none;
                        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:14.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:10.0pt;font-family:Poppins'><%=df2.format(ttH)%></span></b></p>
                    </td>
                    <td width=57 style='width:42.5pt;border-top:none;border-left:none;border-bottom:
                        solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
                        height:14.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:10.0pt;font-family:Poppins'><%=df2.format(perTH)%></span></b></p>
                    </td>
                    <td width=61 style='width:45.85pt;border-top:none;border-left:none;
                        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:14.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:10.0pt;font-family:Poppins'><%=df2.format(ttM)%></span></b></p>
                    </td>
                    <td width=75 style='width:56.05pt;border-top:none;border-left:none;
                        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:14.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:10.0pt;font-family:Poppins'><%=df2.format(perTM)%></span></b></p>
                    </td>
                    <td width=75 style='width:56.05pt;border-top:none;border-left:none;
                        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:14.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:10.0pt;font-family:Poppins'><%=df2.format(ttI)%></span></b></p>
                    </td>
                </tr>
            </table>

        </div>

    </body>

</html>
