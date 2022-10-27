<%-- 
    Document   : print-certificate
    Created on : 07-Nov-2021, 12:38:09
    Author     : 25884
--%>

<%@page import="com.dciapps.webclient.Media"%>
<%@page import="java.util.Date"%>
<%@page import="com.dciapps.localcontroler.StringUtils"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="com.dciapps.webclient.Notas"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.webclient.Inscricao"%>
<%@page import="com.dciapps.webclient.Aluno"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dciapps.webclient.Sistema"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <head>
        <meta http-equiv=Content-Type content="text/html; charset=windows-1252">

        <!-- Page Description, Author and Keywords -->
        <meta name="description" content="Sistema Electrónico de Gestão de Informação Académica">
        <meta name="author" content="Hamilton Jhonas">
        <meta name="keywords" content="SEGIA, DC Inovaction, Software, Multimedia, Escola, School, Vendas, Stock, Market, Branding, Logo, Hotel, Hotelaria, RH, Recursos Humanos, Controle de Acesso, Web Design, Web Marketing, Development, Hosting" />

        <title> SEGIA - Certificado</title>
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
            /* Page Definitions */
            @page WordSection1
            {size:595.3pt 841.9pt;
             margin:72.0pt 72.0pt 72.0pt 72.0pt;
             border:double windowtext 2.5pt;
             padding:24.0pt 24.0pt 24.0pt 24.0pt;}
            div.WordSection1
            {page:WordSection1;}
            -->
        </style>

        <%

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            EncryptUtils encryptUtils = new EncryptUtils();
            StringUtils stringUtils = new StringUtils();

            Aluno aluno = null;
            Inscricao inscricao = null;
            List<Media> medias = null;

            String alerta = "";
            Entidade entidade = (Entidade) session.getAttribute("entidadeSelecionada");

            if (entidade == null) {
                entidade = (Entidade) session.getAttribute("entidade");
            }

            medias = (List<Media>) session.getAttribute("medias");

            aluno = (Aluno) session.getAttribute("aluno");
            inscricao = (Inscricao) session.getAttribute("inscricao");

        %>
    </head>

    <body lang=PT style='word-wrap:break-word' onload="window.print();" oncontextmenu="return false">

        <%            String esc = "";

            String prov = "";
            if (entidade != null) {
                esc = encryptUtils.decodeString(entidade.getEntiNome()).toUpperCase();
                prov = encryptUtils.decodeString(entidade.getEntiProvincia());
            }
        %>


        <% if (aluno != null) {

                String primeiroNome = encryptUtils.decodeString(aluno.getPessoa().getPessNome());
                String apelido = encryptUtils.decodeString(aluno.getPessoa().getPessApelido());
                String email = encryptUtils.decodeString(aluno.getPessoa().getPessEmail());
                String contacto = encryptUtils.decodeString(aluno.getPessoa().getPessContacto());
                String endereco = encryptUtils.decodeString(aluno.getPessoa().getPessBairro());
                String dataNascimento = "";
                String dis = "readonly";
                String ocupacao = encryptUtils.decodeString(aluno.getPessoa().getPessActividade());

                if (aluno.getPessoa().getPessDataNascimento() != null) {
                    dataNascimento = sdf.format(aluno.getPessoa().getPessDataNascimento().toGregorianCalendar().getTime());
                }
                String nacionalidade = "";

                if (aluno.getPessoa().getNacionalidadenaci() != null) {
                    nacionalidade = encryptUtils.decodeString(aluno.getPessoa().getNacionalidadenaci().getNaciDescricao());
                }
                String naturalidade = encryptUtils.decodeString(aluno.getPessoa().getPessProvincia());
                String sexo = encryptUtils.decodeString(aluno.getPessoa().getPessSexo());
                String cidade = encryptUtils.decodeString(aluno.getPessoa().getPessBairro());
                String cPostal = encryptUtils.decodeString(aluno.getPessoa().getPessRua()) + " / " + encryptUtils.decodeString(aluno.getPessoa().getPessNumeroCasa());
                String bi = encryptUtils.decodeString(aluno.getPessoa().getPessBi());
                String nuit = encryptUtils.decodeString(aluno.getPessoa().getPessNuit());
                String documento = encryptUtils.decodeString(aluno.getPessoa().getPessDocumento());

                String curs = "";
                String tur = "";

                if (inscricao != null) {

                    curs = encryptUtils.decodeString(inscricao.getCurso().getCursDescricao());
                    tur = "TURMA: " + encryptUtils.decodeString(inscricao.getTurma().getTurmDescricao());
                }


        %>  

        <div class=WordSection1>

            <p class=MsoNormal align=center style='text-align:center'>
                <span style='font-size:10.0pt;line-height:107%;font-family:Poppins'>
                    <img width=74  height=78 id="Picture 1" src="http://<%=ip%>:8081/suc/images/app-icons/governo.png">
                </span>
            </p>

            <p class=MsoNormal align=center style='text-align:center'><b><span
                        style='font-size:9.0pt;line-height:107%;font-family:Poppins'>REPÚBLICA DE
                        MOÇAMBIQUE</span></b></p>

            <p class=MsoNormal align=center style='text-align:center'>
                <span style='font-size:9.0pt;line-height:107%;font-family:Poppins'><%=esc%></span>
            </p>

            <p class=MsoNormal align=center style='text-align:center'><b><u><span
                            style='font-size:14.0pt;line-height:107%;font-family:Poppins'>CERTIDÃO</span></u></b></p>

            <p class=MsoNormal style='text-align:justify'><span style='font-size:9.0pt;
                                                                line-height:107%;font-family:Poppins'>Pelo presente se certifica, em face dos
                    registos existentes nesta Instituição de Ensino que, <b><%=primeiroNome + " " + apelido%></b>,
                    natural de <b><%=naturalidade%></b>, nascido a <%=dataNascimento%>, portador do(a)<%=documento%> Nº <%=bi%>, 
                    frequentou a <%=curs%>, tendo sido aprovado nas seguintes disciplinas:</span></p>

            <p class=MsoNormal style='text-align:justify'><span style='font-size:9.0pt;
                                                                line-height:107%;font-family:Poppins'>&nbsp;</span></p>

            <table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=613
                   style='width:460.05pt;border-collapse:collapse;border:none'>
                <tr style='height:17.65pt'>
                    <td width=153 valign=top style='width:115.0pt;border:solid windowtext 1.0pt;
                        background:#AEAAAA;padding:0cm 5.4pt 0cm 5.4pt;height:17.65pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                           normal'><span style='font-size:9.0pt;font-family:Poppins'>Disciplina</span></p>
                    </td>
                    <td width=153 valign=top style='width:115.0pt;border:solid windowtext 1.0pt;
                        border-left:none;background:#AEAAAA;padding:0cm 5.4pt 0cm 5.4pt;height:17.65pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                           normal'><span style='font-size:9.0pt;font-family:Poppins;color:black'>Nota</span></p>
                    </td>
                    <td width=153 valign=top style='width:115.0pt;border:solid windowtext 1.0pt;
                        border-left:none;background:#AEAAAA;padding:0cm 5.4pt 0cm 5.4pt;height:17.65pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                           normal'><span style='font-size:9.0pt;font-family:Poppins;color:black'>Nota
                                (Ext.)</span></p>
                    </td>
                    <td width=153 valign=top style='width:115.05pt;border:solid windowtext 1.0pt;
                        border-left:none;background:#AEAAAA;padding:0cm 5.4pt 0cm 5.4pt;height:17.65pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                           normal'><span style='font-size:9.0pt;font-family:Poppins;color:black'>Status</span></p>
                    </td>
                </tr>
                <tr style='height:16.5pt'>
                    <td width=613 colspan=4 valign=top style='width:460.05pt;border:solid windowtext 1.0pt;
                        border-top:none;background:#E7E6E6;padding:0cm 5.4pt 0cm 5.4pt;height:16.5pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                           normal'><span style='font-size:9.0pt;font-family:Poppins;color:black'><%=tur%></span></p>
                    </td>
                </tr>

                <%
                    if (medias != null) {
                        for (Media n : medias) {
                            String disc = encryptUtils.decodeString(n.getDisciplina().getDiscDescricao());

                            int med = Math.round((n.getMediMedia()+n.getMediMedia2()+n.getMediMedia3())/3);
                            String nt = df.format(med);

                            String status = "Reprovado";

                            if (med >= 10) {
                                status = "Aprovado";
                            }

                            String ntExt = stringUtils.numeroPorExtenso(med, "");
                %>
                <tr style='height:22.4pt'>
                    <td width=153 valign=top style='width:115.0pt;border:solid windowtext 1.0pt;
                        border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:22.4pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                           normal'><span style='font-size:9.0pt;font-family:Poppins'><b><%=disc%></b></span></p>
                    </td>
                    <td width=153 valign=top style='width:115.0pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:22.4pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                           normal'><span style='font-size:9.0pt;font-family:Poppins'><%=med%></span></p>
                    </td>
                    <td width=153 valign=top style='width:115.0pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:22.4pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                           normal'><span style='font-size:9.0pt;font-family:Poppins'><%=ntExt%> Valores</span></p>
                    </td>
                    <td width=153 valign=top style='width:115.05pt;border-top:none;border-left:
                        none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                        padding:0cm 5.4pt 0cm 5.4pt;height:22.4pt'>
                        <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                           normal'><span style='font-size:9.0pt;font-family:Poppins'><%=status%></span></p>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </table>

            <p class=MsoNormal style='text-align:justify'><span style='font-size:9.0pt;
                                                                line-height:107%;font-family:Poppins'>&nbsp;</span></p>

            <p class=MsoNormal style='text-align:justify'><span style='font-size:9.0pt;
                                                                line-height:107%;font-family:Poppins'>Consta do Livro Número________________________
                    Folhas_______________________</span></p>

            <p class=MsoNormal style='text-align:justify'><span style='font-size:9.0pt;
                                                                line-height:107%;font-family:Poppins'>&nbsp;</span></p>

            <p class=MsoNormal style='text-align:justify'><span style='font-size:9.0pt;
                                                                line-height:107%;font-family:Poppins'>E por ser verdade a presente certidão que
                    assino e vai autenticada com o selo branco desta Escola.</span></p>

            <p class=MsoNormal style='text-align:justify'><span style='font-size:9.0pt;
                                                                line-height:107%;font-family:Poppins'>Secretária da <%=esc%>, <%=prov%>, <%=sdf.format(new Date())%></span></p>

            <p class=MsoNormal style='text-align:justify'><span style='font-size:9.0pt;
                                                                line-height:107%;font-family:Poppins'>&nbsp;</span></p>

            <div align=center>

                <table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0
                       style='border-collapse:collapse;border:none'>
                    <tr>
                        <td width=200 valign=top style='width:150.25pt;padding:0cm 5.4pt 0cm 5.4pt'>
                            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                               line-height:normal'><span style='font-size:9.0pt;font-family:Poppins'><b>Director
                                        da Escola</b></span></p>
                        </td>
                        <td width=200 rowspan=2 valign=top style='width:150.25pt;padding:0cm 5.4pt 0cm 5.4pt'>
                            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                               line-height:normal'><span style='font-size:9.0pt;font-family:Poppins'>&nbsp;</span></p>
                        </td>
                        <td width=200 valign=top style='width:150.3pt;padding:0cm 5.4pt 0cm 5.4pt'>
                            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                               line-height:normal'><span style='font-size:9.0pt;font-family:Poppins'><b>Chefe
                                        da Secretária</b></span></p>
                        </td>
                    </tr>
                    <tr>
                        <td width=200 valign=top style='width:150.25pt;padding:0cm 5.4pt 0cm 5.4pt'>
                            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                               line-height:normal'><span style='font-size:9.0pt;font-family:Poppins'>&nbsp;</span></p>
                            <br>
                            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                               line-height:normal'><span style='font-size:9.0pt;font-family:Poppins'>____________________</span></p>
                        </td>
                        <td width=200 valign=top style='width:150.3pt;padding:0cm 5.4pt 0cm 5.4pt'>
                            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                               line-height:normal'><span style='font-size:9.0pt;font-family:Poppins'>&nbsp;</span></p>
                            <br>
                            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                               line-height:normal'><span style='font-size:9.0pt;font-family:Poppins'>____________________</span></p>
                        </td>
                    </tr>
                </table>

            </div>

            <p class=MsoNormal style='text-align:justify'><span style='font-size:9.0pt;
                                                                line-height:107%;font-family:Poppins'>&nbsp;</span></p>

            <p class=MsoNormal style='text-align:justify'><span style='font-size:9.0pt;
                                                                line-height:107%;font-family:Poppins'>&nbsp;</span></p>

        </div>

        <%
            }
        %>

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
