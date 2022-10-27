<%-- 
    Document   : print-juri
    Created on : 20-Apr-2022, 11:06:01
    Author     : 25884
--%>

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

        <title> SEGIA - Júri</title>


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

            List<Exame> exames = (List<Exame>) session.getAttribute("exames");
            SalaExame salaExame = (SalaExame) session.getAttribute("salaExame");
            EncryptUtils encryptUtils = new EncryptUtils();

            String sal = "";
            String cur = "";
            String dis = "";
            String esc = "";

            String decJ1 = "";
            String decJ2 = "";

            if (salaExame != null) {

                sal = encryptUtils.decodeString(salaExame.getSala().getSalaDescricao());

                if (salaExame.getJuri1() != null) {
                    decJ1 = encryptUtils.decodeString(salaExame.getJuri1().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(salaExame.getJuri1().getPessoa().getPessApelido());

                } else if (salaExame.getSalaeJuri1() != null) {
                    decJ1 = encryptUtils.decodeString(salaExame.getSalaeJuri1());
                }

                if (salaExame.getJuri2() != null) {
                    decJ2 = encryptUtils.decodeString(salaExame.getJuri2().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(salaExame.getJuri2().getPessoa().getPessApelido());

                } else if (salaExame.getSalaeJuri2() != null) {
                    decJ2 = encryptUtils.decodeString(salaExame.getSalaeJuri2());
                }

                if (salaExame.getDisciplina() != null) {
                    dis = encryptUtils.decodeString(salaExame.getDisciplina().getDiscDescricao());
                }

                if (salaExame.getCurso() != null) {
                    dis = encryptUtils.decodeString(salaExame.getCurso().getCursDescricao());
                }

                if (salaExame.getSalaeEscola() != null) {
                    esc = encryptUtils.decodeString(salaExame.getSalaeEscola());
                }
            }
        %>
    </head>

    <body lang=PT style='tab-interval:35.4pt;word-wrap:break-word'  onload="window.print();" oncontextmenu="return false">

        <div class=WordSection1>

            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center'><span
                    style='mso-no-proof:yes'><img width=53 height=55 id="_x0000_i1025"
                                              src="http://<%=ip%>:8081/suc/images/app-icons/governo.png"></span><span style='font-size:8.0pt;
                                                                                        line-height:105%;font-family:Poppins'><o:p></o:p></span></p>

            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center'><span
                    style='font-size:8.0pt;line-height:105%;font-family:Poppins'>REPÚBLICA DE
                    MOÇAMBIQUE</span></p>

            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center'><span
                    style='font-size:8.0pt;line-height:105%;font-family:Poppins'>MINISTÉRIO DA
                    EDUCAÇÃO E DESENVOLVIMENTO HUMANO</span></p>

            <p class=MsoNormal align=center style='text-align:center'><b><span
                        style='font-size:9.0pt;line-height:105%;font-family:Poppins'><%=sal%> | <%=cur%> - <%=dis%> -</span></b><span style='font-size:9.0pt;line-height:
                                                                                                                              105%;font-family:Poppins'> Local de Realização:<b> <%=esc%></b></span></p>

            <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=765
                   style='width:574.1pt;border-collapse:collapse;mso-yfti-tbllook:
                   1184;mso-padding-alt:0cm 0cm 0cm 0cm'>
                <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:26.9pt'>
                    <td width=95 nowrap style='width:70.9pt;border:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:26.9pt'>
                        <p class=MsoNormal align=center style='text-align:center'><b><span
                                    style='font-size:8.0pt;line-height:105%;font-family:Poppins'>Cód. Candidato</span></b></p>
                    </td>
                    <td width=38 nowrap style='width:1.0cm;border:solid windowtext 1.0pt;
                        border-left:none;padding:0cm 5.4pt 0cm 5.4pt;height:26.9pt'>
                        <p class=MsoNormal align=center style='text-align:center'><b><span
                                    style='font-size:8.0pt;line-height:105%;font-family:Poppins'>Nº</span></b></p>
                    </td>
                    <td width=232 nowrap style='width:174.35pt;border:solid windowtext 1.0pt;
                        border-left:none;padding:0cm 5.4pt 0cm 5.4pt;height:26.9pt'>
                        <p class=MsoNormal align=center style='text-align:center'><b><span
                                    style='font-size:8.0pt;line-height:105%;font-family:Poppins'>Nome do
                                    Candidato</span></b></p>
                    </td>
                    <td width=70 nowrap style='width:52.45pt;border:solid windowtext 1.0pt;
                        border-left:none;padding:0cm 5.4pt 0cm 5.4pt;height:26.9pt'>
                        <p class=MsoNormal align=center style='text-align:center'><b><span
                                    style='font-size:8.0pt;line-height:105%;font-family:Poppins'>Género</span></b></p>
                    </td>
                </tr>

                <%
                    if (exames != null) {
                        int x = 0;
                        for (Exame e : exames) {

                            x++;

                            String ref = encryptUtils.decodeString(e.getAluno().getAlunBadgnumber());
                            String nom = encryptUtils.decodeString(e.getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(e.getAluno().getPessoa().getPessApelido());
                            String sex = encryptUtils.decodeString(e.getAluno().getPessoa().getPessSexo()).toUpperCase();
                            String bi = encryptUtils.decodeString(e.getAluno().getPessoa().getPessBi()).toUpperCase();

                            int idA = e.getExamId();
                %>
                <tr style='mso-yfti-irow:1;height:.35pt'>
                    <td width=95 nowrap style='width:70.9pt;border:solid windowtext 1.0pt;
                        border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:.35pt'>
                        <p class=MsoNormal style='text-align:justify'><span style='font-size:7.0pt;
                                                                            line-height:105%;font-family:Poppins'><%=ref%></span></p>
                    </td>
                    <td width=38 nowrap style='width:1.0cm;border-top:none;border-left:none;
                        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:.35pt'>
                        <p class=MsoNormal style='text-align:justify'><span style='font-size:7.0pt;
                                                                            line-height:105%;font-family:Poppins'><%=x%></span></p>
                    </td>
                    <td width=232 nowrap style='width:174.35pt;border-top:none;border-left:none;
                        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:.35pt'>
                        <p class=MsoNormal style='text-align:justify'><span style='font-size:7.0pt;
                                                                            line-height:105%;font-family:Poppins'><%=nom%></span></p>
                    </td>
                    <td width=70 nowrap style='width:52.45pt;border-top:none;border-left:none;
                        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:.35pt'>
                        <p class=MsoNormal style='text-align:justify'><span style='font-size:7.0pt;
                                                                            line-height:105%;font-family:Poppins'><%=sex%></span></p>
                    </td>
                </tr


                <%
                        }
                    }
                %>
            </table>


        </div>

    </body>

</html>
