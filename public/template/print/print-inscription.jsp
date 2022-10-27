<%-- 
    Document   : print-inscription
    Created on : 15-May-2022, 18:48:00
    Author     : 25884
--%>

<%@page import="java.util.Date"%>
<%@page import="com.dciapps.webclient.Aluno"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="com.dciapps.webclient.Inscricao"%>
<%@page import="com.dciapps.localcontroler.StringUtils"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dciapps.webclient.Sistema"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <head>
        <meta http-equiv=Content-Type content="text/html; charset=windows-1252">
        <meta name=ProgId content=Word.Document>
        <meta name=Generator content="Microsoft Word 15">
        <meta name=Originator content="Microsoft Word 15">

        <!-- Page Description, Author and Keywords -->
        <meta name="description" content="Sistema Electrónico de Gestão de Informação Académica">
        <meta name="author" content="Hamilton Jhonas">
        <meta name="keywords" content="SEGIA" />

        <title> SEGIA - Pré-Inscrição Exame</title>


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
            <!--
            /* Font Definitions */
            @font-face
            {font-family:"Cambria Math";
             panose-1:2 4 5 3 5 4 6 3 2 4;}
            @font-face
            {font-family:Calibri;
             panose-1:2 15 5 2 2 2 4 3 2 4;}
            @font-face
            {font-family:Poppins;
             panose-1:0 0 5 0 0 0 0 0 0 0;}
            /* Style Definitions */
            p.MsoNormal, li.MsoNormal, div.MsoNormal
            {margin-top:0cm;
             margin-right:0cm;
             margin-bottom:8.0pt;
             margin-left:0cm;
             line-height:107%;
             font-size:11.0pt;
             font-family:"Calibri",sans-serif;}
            .MsoChpDefault
            {font-family:"Calibri",sans-serif;}
            .MsoPapDefault
            {margin-bottom:8.0pt;
             line-height:107%;}
            @page WordSection1
            {size:595.3pt 841.9pt;
             margin:36.0pt 36.0pt 36.0pt 36.0pt;}
            div.WordSection1
            {page:WordSection1;}
            -->
        </style>

        <%

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");

            SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MMMM-yyyy");
            SimpleDateFormat sdfY = new SimpleDateFormat("yyyy");
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            EncryptUtils encryptUtils = new EncryptUtils();
            StringUtils stringUtils = new StringUtils();

            Inscricao inscricao = null;

            String alerta = "";
            Entidade entidade = (Entidade) session.getAttribute("entidadeSelecionada");

            if (entidade == null) {
                entidade = (Entidade) session.getAttribute("entidade");
            }

            inscricao = (Inscricao) session.getAttribute("inscricao");

        %>

    </head>

    <body lang=PT style='word-wrap:break-word' onload="window.print();" oncontextmenu="return false">

        <%            Aluno aluno = inscricao.getAluno();

            if (aluno != null) {

                String primeiroNome = encryptUtils.decodeString(aluno.getPessoa().getPessNome());
                String apelido = encryptUtils.decodeString(aluno.getPessoa().getPessApelido());
                String email = encryptUtils.decodeString(aluno.getPessoa().getPessEmail());
                String contacto = encryptUtils.decodeString(aluno.getPessoa().getPessContacto());
                String distrito = encryptUtils.decodeString(aluno.getPessoa().getPessDistrito());
                String dataNascimento = "";
                String dis = "readonly";
                String ocupacao = encryptUtils.decodeString(aluno.getPessoa().getPessActividade());

                if (aluno.getPessoa().getPessDataNascimento() != null) {
                    dataNascimento = sdf2.format(aluno.getPessoa().getPessDataNascimento().toGregorianCalendar().getTime());
                }
                String nacionalidade = "";

                if (aluno.getPessoa().getNacionalidadenaci() != null) {
                    nacionalidade = encryptUtils.decodeString(aluno.getPessoa().getNacionalidadenaci().getNaciDescricao());
                }
                String naturalidade = encryptUtils.decodeString(aluno.getPessoa().getPessProvincia());
                String sexo = encryptUtils.decodeString(aluno.getPessoa().getPessSexo()).charAt(0) + "";
                String cidade = encryptUtils.decodeString(aluno.getPessoa().getPessBairro());
                String cPostal = encryptUtils.decodeString(aluno.getPessoa().getPessRua()) + " / " + encryptUtils.decodeString(aluno.getPessoa().getPessNumeroCasa());
                String bi = encryptUtils.decodeString(aluno.getPessoa().getPessBi());
                String nuit = encryptUtils.decodeString(aluno.getPessoa().getPessNuit());
                String documento = encryptUtils.decodeString(aluno.getPessoa().getPessDocumento());
                String cod = "";

                if (aluno.getAlunUnico() != null) {
                    cod = encryptUtils.decodeString(aluno.getAlunUnico()) + " - ";
                }

                String provincia = encryptUtils.decodeString(aluno.getPessoa().getPessProvincia());
                String quar = encryptUtils.decodeString(aluno.getPessoa().getPessRua());
                String casa = encryptUtils.decodeString(aluno.getPessoa().getPessNumeroCasa());
                String end = encryptUtils.decodeString(aluno.getPessoa().getPessBairro());

                String validadeDocumento = encryptUtils.decodeString(aluno.getPessoa().getPessDataValidadeBi());
                String nomeMae = encryptUtils.decodeString(aluno.getPessoa().getPessNomeMae());
                String profissaoMae = encryptUtils.decodeString(aluno.getPessoa().getPessProfissaoMae());
                String contactoMae = encryptUtils.decodeString(aluno.getPessoa().getPessContactoMae());
                String trabalhoMae = encryptUtils.decodeString(aluno.getPessoa().getPessTrabalhoMae());

                String nomePai = encryptUtils.decodeString(aluno.getPessoa().getPessNomePai());
                String profissaoPai = encryptUtils.decodeString(aluno.getPessoa().getPessProfissaoPai());
                String contactoPai = encryptUtils.decodeString(aluno.getPessoa().getPessContactoPai());
                String trabalhoPai = encryptUtils.decodeString(aluno.getPessoa().getPessTrabalhoPai());

                String contactoResponsavel = "";
                String responsavel = encryptUtils.decodeString(aluno.getPessoa().getPessResponsavel());

                if (aluno.getAlunUnico() != null) {
                    cod = encryptUtils.decodeString(aluno.getAlunUnico());
                }

                String curs = "";
                String tur = "";

                String dteFull = sdf2.format(new Date());

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

                dataNascimento = dataNascimento.replace("January", "Janeiro");
                dataNascimento = dataNascimento.replace("February", "Fevereiro");
                dataNascimento = dataNascimento.replace("March", "Março");
                dataNascimento = dataNascimento.replace("April", "Abril");
                dataNascimento = dataNascimento.replace("May", "Maio");
                dataNascimento = dataNascimento.replace("June", "Junho");
                dataNascimento = dataNascimento.replace("July", "Julho");
                dataNascimento = dataNascimento.replace("August", "Agosto");
                dataNascimento = dataNascimento.replace("September", "Setembro");
                dataNascimento = dataNascimento.replace("October", "Outubro");
                dataNascimento = dataNascimento.replace("November", "Novembro");
                dataNascimento = dataNascimento.replace("December", "Dezembro");
                dataNascimento = dataNascimento.replace("-", " de ");

                String dteI = "---";
                String esc = "---";
                String refI = "---";
                String disc = "---";
                if (inscricao != null) {

                    curs = encryptUtils.decodeString(inscricao.getCurso().getCursDescricao());
                    if (inscricao.getInscReferencia() != null) {
                        refI = encryptUtils.decodeString(inscricao.getInscReferencia());
                    }

                    dteI = sdf.format(inscricao.getInscDataInscricao().toGregorianCalendar().getTime());
                    esc = encryptUtils.decodeString(inscricao.getInscEscola());
                    disc = encryptUtils.decodeString(inscricao.getInscDisciplinas());

                }


        %>  

        <div class=WordSection1>
            <br>
            <p class=MsoNormal align=center style='text-align:center; top: -22px;'>
                <span>
                    <img width=44  height=48 id="Picture 1" src="http://<%=ip%>:8081/suc/images/app-icons/governo.png">
                </span>
            </p>
            <p class=MsoNormal align=center style='text-align:center;line-height:normal'><span
                    style='font-size:8.0pt;font-family:Poppins'>REPÚBLICA DE MOÇAMBIQUE</span></p>

            <p class=MsoNormal align=center style='text-align:center;line-height:normal'><span
                    style='font-size:8.0pt;font-family:Poppins'>MINISTÉRIO DA EDUCAÇÃO E
                    DESENVOLVIMENTO HUMANO</span></p>

            <p class=MsoNormal align=center style='text-align:center;line-height:normal'><b><span
                        style='font-size:8.0pt;font-family:Poppins'>DIRECÇÃO DA EDUCAÇÃO E
                        DESENVOLVIMENTO HUMANO DA CIDADE DE MAPUTO</span></b></p>

            <p class=MsoNormal align=center style='text-align:center;line-height:normal'><b><span
                        style='font-size:8.0pt;font-family:Poppins;color:#4472C4'>FICHA DE INSCRIÇÃO DO
                        CANDIDATO (EXAMES DE EXTRAORDINÁRIOS)</span></b></p>

            <p class=MsoNormal style='line-height:normal'><b><span style='font-size:8.0pt;
                                                                   font-family:Poppins;color:#C00000'>&nbsp;</span></b></p>

            <div align=center>

                <table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
                       style='border-collapse:collapse;border:none'>
                    <tr>
                        <td width=301 valign=top style='width:225.4pt;border:none;border-right:solid windowtext 1.0pt;
                            padding:0cm 5.4pt 0cm 5.4pt'>
                            <p class=MsoNormal align=right style='margin-bottom:0cm;text-align:right;
                               line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                       color:#C00000'>Nº DA INSCRIÇÃO:</span></b></p>
                        </td>
                        <td width=301 valign=top style='width:225.4pt;border:solid windowtext 1.0pt;
                            border-left:none;padding:0cm 5.4pt 0cm 5.4pt'>
                            <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><b><span
                                        style='font-size:8.0pt;font-family:Poppins;color:#C00000'><%=refI%></span></b></p>
                        </td>
                    </tr>
                </table>

            </div>

            <p class=MsoNormal style='line-height:normal'><b><span style='font-size:8.0pt;
                                                                   font-family:Poppins'>&nbsp;</span></b></p>

            <p class=MsoNormal style='line-height:normal'><b><span style='font-size:8.0pt;
                                                                   font-family:Poppins'>INFORMAÇÃO PESSOAL DO CANDIDATO            </span></b></p>

            <table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=706
                   style='width:529.4pt;border-collapse:collapse;border:none'>
                <tr style='height:14.6pt'>
                    <td width=706 colspan=6 valign=top style='width:529.4pt;border:solid windowtext 1.0pt;
                        background:#D9E2F3;padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><b><span
                                    style='font-size:8.0pt;font-family:Poppins;color:black'>Nome do Candidato</span></b></p>
                    </td>
                </tr>
                <tr style='height:14.6pt'>
                    <td width=706 colspan=6 valign=top style='width:529.4pt;border:solid windowtext 1.0pt;
                        border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                           normal'><span style='font-size:8.0pt;font-family:Poppins'><%=cod + primeiroNome + " " + apelido%></span></p>
                    </td>
                </tr>
                <tr style='height:14.6pt'>
                    <td width=170 valign=top style='width:127.35pt;border:solid windowtext 1.0pt;
                        border-top:none;background:#D9E2F3;padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>Sexo</span></b></p>
                    </td>
                    <td width=163 valign=top style='width:122.05pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        background:#D9E2F3;padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>Data Nascimento</span></b></p>
                    </td>
                    <td width=244 colspan=3 valign=top style='width:183.05pt;border-top:none;
                        border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        background:#D9E2F3;padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>Documento</span></b></p>
                    </td>
                    <td width=129 valign=top style='width:96.95pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        background:#D9E2F3;padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>Validade</span></b></p>
                    </td>
                </tr>
                <tr style='height:14.6pt'>
                    <td width=170 valign=top style='width:127.35pt;border:solid windowtext 1.0pt;
                        border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal;text-align:center;'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=sexo%></span></p>
                    </td>
                    <td width=163 valign=top style='width:122.05pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=dataNascimento%></span></p>
                    </td>
                    <td width=244 colspan=3 valign=top style='width:183.05pt;border-top:none;
                        border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=documento + " - " + bi%></span></p>
                    </td>
                    <td width=129 valign=top style='width:96.95pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=validadeDocumento%></span></p>
                    </td>
                </tr>
                <tr style='height:13.95pt'>
                    <td width=170 valign=top style='width:127.35pt;border:solid windowtext 1.0pt;
                        border-top:none;background:#D9E2F3;padding:0cm 5.4pt 0cm 5.4pt;height:13.95pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>Contacto</span></b></p>
                    </td>
                    <td width=407 colspan=4 valign=top style='width:305.1pt;border-top:none;
                        border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        background:#D9E2F3;padding:0cm 5.4pt 0cm 5.4pt;height:13.95pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>E-mail</span></b></p>
                    </td>
                    <td width=129 valign=top style='width:96.95pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        background:#D9E2F3;padding:0cm 5.4pt 0cm 5.4pt;height:13.95pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>NUIT</span></b></p>
                    </td>
                </tr>
                <tr style='height:14.6pt'>
                    <td width=170 valign=top style='width:127.35pt;border:solid windowtext 1.0pt;
                        border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=contacto%></span></p>
                    </td>
                    <td width=407 colspan=4 valign=top style='width:305.1pt;border-top:none;
                        border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=email%></span></p>
                    </td>
                    <td width=129 valign=top style='width:96.95pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=nuit%></span></p>
                    </td>
                </tr>
                <tr style='height:14.6pt'>
                    <td width=453 colspan=3 valign=top style='width:339.95pt;border:solid windowtext 1.0pt;
                        border-top:none;background:#D9E2F3;padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><b><span
                                    style='font-size:8.0pt;font-family:Poppins;color:black'>Endereço</span></b></p>
                    </td>
                    <td width=123 valign=top style='width:92.15pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        background:#D9E2F3;padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>Quarteirão/Talhão</span></b></p>
                    </td>
                    <td width=130 colspan=2 valign=top style='width:97.3pt;border-top:none;
                        border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        background:#D9E2F3;padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>Nº da Casa</span></b></p>
                    </td>
                </tr>
                <tr style='height:14.6pt'>
                    <td width=453 colspan=3 valign=top style='width:339.95pt;border:solid windowtext 1.0pt;
                        border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                           normal'><span style='font-size:8.0pt;font-family:Poppins'><%=end%></span></p>
                    </td>
                    <td width=123 valign=top style='width:92.15pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                           normal'><span style='font-size:8.0pt;font-family:Poppins'><%=quar%></span></p>
                    </td>
                    <td width=130 colspan=2 valign=top style='width:97.3pt;border-top:none;
                        border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:14.6pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                           normal'><span style='font-size:8.0pt;font-family:Poppins'><%=casa%></span></p>
                    </td>
                </tr>
                <tr height=0>
                    <td width=170 style='border:none'></td>
                    <td width=163 style='border:none'></td>
                    <td width=121 style='border:none'></td>
                    <td width=123 style='border:none'></td>
                    <td width=0 style='border:none'></td>
                    <td width=129 style='border:none'></td>
                </tr>
            </table>

            <p class=MsoNormal style='line-height:normal'><span style='font-size:8.0pt;
                                                                font-family:Poppins'>&nbsp;</span></p>

            <p class=MsoNormal style='line-height:normal'><b><span style='font-size:8.0pt;
                                                                   font-family:Poppins'>INFORMAÇÃO DO ENCARREGADO DE EDUCAÇÃO</span></b></p>

            <table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=703
                   style='width:527.4pt;border-collapse:collapse;border:none'>
                <tr style='height:13.9pt'>
                    <td width=309 valign=top style='width:231.85pt;border:solid windowtext 1.0pt;
                        background:#E7E6E6;padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>Nome do Pai</span></b></p>
                    </td>
                    <td width=122 colspan=2 valign=top style='width:91.25pt;border:solid windowtext 1.0pt;
                        border-left:none;background:#E7E6E6;padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><span style='font-size:8.0pt;font-family:Poppins;
                                color:black'>Contacto</span></p>
                    </td>
                    <td width=133 valign=top style='width:99.5pt;border:solid windowtext 1.0pt;
                        border-left:none;background:#E7E6E6;padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><span style='font-size:8.0pt;font-family:Poppins;
                                color:black'>Local Trabalho</span></p>
                    </td>
                    <td width=140 valign=top style='width:104.8pt;border:solid windowtext 1.0pt;
                        border-left:none;background:#E7E6E6;padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><span style='font-size:8.0pt;font-family:Poppins;
                                color:black'>Profissão</span></p>
                    </td>
                </tr>
                <tr style='height:13.9pt'>
                    <td width=309 valign=top style='width:231.85pt;border:solid windowtext 1.0pt;
                        border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=nomePai%></span></p>
                    </td>
                    <td width=122 colspan=2 valign=top style='width:91.25pt;border-top:none;
                        border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=contactoPai%></span></p>
                    </td>
                    <td width=133 valign=top style='width:99.5pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=trabalhoPai%></span></p>
                    </td>
                    <td width=140 valign=top style='width:104.8pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=profissaoPai%></span></p>
                    </td>
                </tr>
                <tr style='height:13.9pt'>
                    <td width=309 valign=top style='width:231.85pt;border:solid windowtext 1.0pt;
                        border-top:none;background:#E7E6E6;padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>Nome da Mãe</span></b></p>
                    </td>
                    <td width=122 colspan=2 valign=top style='width:91.25pt;border-top:none;
                        border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        background:#E7E6E6;padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><span style='font-size:8.0pt;font-family:Poppins;
                                color:black'>Contacto</span></p>
                    </td>
                    <td width=133 valign=top style='width:99.5pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        background:#E7E6E6;padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><span style='font-size:8.0pt;font-family:Poppins;
                                color:black'>Local Trabalho</span></p>
                    </td>
                    <td width=140 valign=top style='width:104.8pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        background:#E7E6E6;padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><span style='font-size:8.0pt;font-family:Poppins;
                                color:black'>Profissão</span></p>
                    </td>
                </tr>
                <tr style='height:13.9pt'>
                    <td width=309 valign=top style='width:231.85pt;border:solid windowtext 1.0pt;
                        border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=nomeMae%></span></p>
                    </td>
                    <td width=122 colspan=2 valign=top style='width:91.25pt;border-top:none;
                        border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=contactoMae%></span></p>
                    </td>
                    <td width=133 valign=top style='width:99.5pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=trabalhoMae%></span></p>
                    </td>
                    <td width=140 valign=top style='width:104.8pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=profissaoMae%></span></p>
                    </td>
                </tr>
                <tr style='height:13.9pt'>
                    <td width=378 colspan=2 valign=top style='width:283.25pt;border:solid windowtext 1.0pt;
                        border-top:none;background:#E7E6E6;padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>Encarregado de Educação</span></b></p>
                    </td>
                    <td width=326 colspan=3 valign=top style='width:244.15pt;border-top:none;
                        border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        background:#E7E6E6;padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>Contacto do Encarregado de Educação</span></b></p>
                    </td>
                </tr>
                <tr style='height:13.9pt'>
                    <td width=378 colspan=2 valign=top style='width:283.25pt;border:solid windowtext 1.0pt;
                        border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=responsavel%></span></p>
                    </td>
                    <td width=326 colspan=3 valign=top style='width:244.15pt;border-top:none;
                        border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:13.9pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'>&nbsp;</span></p>
                    </td>
                </tr>
                <tr height=0>
                    <td width=309 style='border:none'></td>
                    <td width=69 style='border:none'></td>
                    <td width=53 style='border:none'></td>
                    <td width=133 style='border:none'></td>
                    <td width=140 style='border:none'></td>
                </tr>
            </table>

            <p class=MsoNormal style='line-height:normal'><b><span style='font-size:8.0pt;
                                                                   font-family:Poppins'>&nbsp;</span></b></p>

            <p class=MsoNormal style='line-height:normal'><b><span style='font-size:8.0pt;
                                                                   font-family:Poppins'>INFORMAÇÃO DA INSCRIÇÃO</span></b></p>

            <table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=707
                   style='width:530.0pt;border-collapse:collapse;border:none'>
                <tr style='height:12.85pt'>
                    <td width=198 valign=top style='width:148.55pt;border:solid windowtext 1.0pt;
                        background:#FFF2CC;padding:0cm 5.4pt 0cm 5.4pt;height:12.85pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>Província</span></b></p>
                    </td>
                    <td width=312 valign=top style='width:233.95pt;border:solid windowtext 1.0pt;
                        border-left:none;background:#FFF2CC;padding:0cm 5.4pt 0cm 5.4pt;height:12.85pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>Distrito</span></b></p>
                    </td>
                    <td width=197 valign=top style='width:147.5pt;border:solid windowtext 1.0pt;
                        border-left:none;background:#FFF2CC;padding:0cm 5.4pt 0cm 5.4pt;height:12.85pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>Data Inscrição</span></b></p>
                    </td>
                </tr>
                <tr style='height:12.85pt'>
                    <td width=198 valign=top style='width:148.55pt;border:solid windowtext 1.0pt;
                        border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:12.85pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=provincia%></span></p>
                    </td>
                    <td width=312 valign=top style='width:233.95pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:12.85pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=distrito%></span></p>
                    </td>
                    <td width=197 valign=top style='width:147.5pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:12.85pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=dteI%></span></p>
                    </td>
                </tr>
                <tr style='height:12.85pt'>
                    <td width=510 colspan=2 valign=top style='width:382.5pt;border:solid windowtext 1.0pt;
                        border-top:none;background:#FFF2CC;padding:0cm 5.4pt 0cm 5.4pt;height:12.85pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><b><span
                                    style='font-size:8.0pt;font-family:Poppins;color:black'>Escola</span></b></p>
                    </td>
                    <td width=197 valign=top style='width:147.5pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        background:#FFF2CC;padding:0cm 5.4pt 0cm 5.4pt;height:12.85pt'>
                        <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                           line-height:normal'><b><span style='font-size:8.0pt;font-family:Poppins;
                                   color:black'>Classe</span></b></p>
                    </td>
                </tr>
                <tr style='height:12.25pt'>
                    <td width=510 colspan=2 valign=top style='width:382.5pt;border:solid windowtext 1.0pt;
                        border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:12.25pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                           normal'><span style='font-size:8.0pt;font-family:Poppins'><%=esc%></span></p>
                    </td>
                    <td width=197 valign=top style='width:147.5pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:12.25pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                           normal'><span style='font-size:8.0pt;font-family:Poppins'><%=curs%></span></p>
                    </td>
                </tr>
            </table>

            <p class=MsoNormal style='line-height:normal'><span style='font-size:8.0pt;
                                                                font-family:Poppins'>&nbsp;</span></p>

            <p class=MsoNormal style='line-height:normal'><b><span style='font-size:8.0pt;
                                                                   font-family:Poppins'>DISCIPLINAS INSCRITAS</span></b></p>

            <table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=704
                   style='width:528.05pt;border-collapse:collapse;border:none'>
                <tr style='height:89.2pt'>
                    <td width=704 valign=top style='width:528.05pt;border:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:89.2pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;line-height:normal'><span
                                style='font-size:8.0pt;font-family:Poppins'><%=disc%></span></p>
                    </td>
                </tr>
            </table>

            <p class=MsoNormal style='line-height:normal'><span style='font-size:9.0pt;
                                                                font-family:Poppins'>&nbsp;</span></p>

        </div>

        <%
            }
        %>

    </body>

</html>
