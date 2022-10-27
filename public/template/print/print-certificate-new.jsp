<%-- 
    Document   : print-certificate-new
    Created on : 05-Apr-2022, 11:10:44
    Author     : 25884
--%>

<%@page import="com.dciapps.local.Auxiliar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="com.dciapps.webclient.Media"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.webclient.Inscricao"%>
<%@page import="com.dciapps.webclient.Aluno"%>
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



        <%

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

            SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MMMM-yyyy");
            SimpleDateFormat sdfY = new SimpleDateFormat("yyyy");
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

        <style>

            body{

                border: 1px solid rgba(48, 25, 52, .1);
                border-width: 3px;
                display:block;
                box-sizing: border-box;
            }
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
            p.MsoHeader, li.MsoHeader, div.MsoHeader
            {mso-style-priority:99;
             mso-style-link:"Header Char";
             margin:0cm;
             mso-pagination:widow-orphan;
             tab-stops:center 225.65pt right 451.3pt;
             font-size:11.0pt;
             font-family:"Calibri",sans-serif;
             mso-fareast-font-family:"Times New Roman";
             mso-fareast-theme-font:minor-fareast;}
            p.MsoFooter, li.MsoFooter, div.MsoFooter
            {mso-style-priority:99;
             mso-style-link:"Footer Char";
             margin:0cm;
             mso-pagination:widow-orphan;
             tab-stops:center 225.65pt right 451.3pt;
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
             font-size:12.0pt;
             font-family:"Calibri",sans-serif;
             mso-fareast-font-family:"Times New Roman";
             mso-fareast-theme-font:minor-fareast;}
            p.msopapdefault, li.msopapdefault, div.msopapdefault
            {mso-style-name:msopapdefault;
             mso-style-unhide:no;
             mso-margin-top-alt:auto;
             margin-right:0cm;
             margin-bottom:8.0pt;
             margin-left:0cm;
             line-height:105%;
             mso-pagination:widow-orphan;
             font-size:12.0pt;
             font-family:"Times New Roman",serif;
             mso-fareast-font-family:"Times New Roman";
             mso-fareast-theme-font:minor-fareast;}
            span.HeaderChar
            {mso-style-name:"Header Char";
             mso-style-priority:99;
             mso-style-unhide:no;
             mso-style-locked:yes;
             mso-style-link:Header;
             mso-ansi-font-size:11.0pt;
             mso-bidi-font-size:11.0pt;
             font-family:"Times New Roman",serif;
             mso-fareast-font-family:"Times New Roman";
             mso-fareast-theme-font:minor-fareast;}
            span.FooterChar
            {mso-style-name:"Footer Char";
             mso-style-priority:99;
             mso-style-unhide:no;
             mso-style-locked:yes;
             mso-style-link:Footer;
             mso-ansi-font-size:11.0pt;
             mso-bidi-font-size:11.0pt;
             font-family:"Times New Roman",serif;
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
            /* Page Definitions */

            -->
        </style>

    </head>

    <body lang=PT style='tab-interval:35.4pt;word-wrap:break-word' onload="window.print();" oncontextmenu="return false">


        <%            String esc = "";
            String prov = "";
            String dist = "---";

            if (entidade != null) {
                esc = encryptUtils.decodeString(entidade.getEntiNome()).toUpperCase();
                prov = encryptUtils.decodeString(entidade.getEntiProvincia());
                dist = encryptUtils.decodeString(entidade.getEntiDistrito());
            }
        %>


        <% if (aluno != null) {

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
                String nomeMae = encryptUtils.decodeString(aluno.getPessoa().getPessNomeMae());
                String nomePai = encryptUtils.decodeString(aluno.getPessoa().getPessNomePai());
                String cod = "---";

                String provincia = encryptUtils.decodeString(aluno.getPessoa().getPessProvincia());
                String quar = encryptUtils.decodeString(aluno.getPessoa().getPessRua());
                String casa = encryptUtils.decodeString(aluno.getPessoa().getPessNumeroCasa());
                String end = encryptUtils.decodeString(aluno.getPessoa().getPessBairro());

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
                String cond = "---";
                if (inscricao != null) {

                    curs = encryptUtils.decodeString(inscricao.getCurso().getCursDescricao());
                    tur = "TURMA: ";

                    if (inscricao.getTurma() != null) {
                        tur = "TURMA: " + encryptUtils.decodeString(inscricao.getTurma().getTurmDescricao());
                    }

                    dteI = sdfY.format(inscricao.getInscDataInscricao().toGregorianCalendar().getTime());
                    cond = encryptUtils.decodeString(inscricao.getInscCondicao());

                }


        %>  

        <div class=WordSection1>

            <br>
            <p class=MsoNormal align=center style='text-align:center; top: -22px;'>
                <span>
                    <img width=44  height=48 id="Picture 1" src="http://<%=ip%>:8081/suc/images/app-icons/governo.png">
                </span>
            </p>
            <p class=MsoNormal align=center style='text-align:center'><b><span
                        style='font-size:8.0pt;line-height:107%;font-family:Poppins'>REPÚBLICA DE
                        MOÇAMBIQUE</span></b></p>

            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center'><span
                    style='font-size:8.0pt;line-height:105%;font-family:Poppins'>MINISTÉRIO DA
                    EDUCAÇÃO E DESENVOLVIMENTO HUMANO<o:p></o:p></span></p>

            <p class=MsoNormal align=center style='margin-bottom:0.1cm;text-align:center'><b><span
                        style='font-size:8.0pt;line-height:105%;font-family:Poppins'>DIRECÇÃO DA
                        EDUCAÇÃO E DESENVOLVIMENTO HUMANO DA CIDADE DE MAPUTO<o:p></o:p></span></b></p>

            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center'><b><span
                        style='font-size:9.0pt;line-height:105%;font-family:Poppins; text-transform: uppercase;'>Instituto Nacional de Exames, Certificação e Equivalências</span></b><b><span style='font-family:Poppins'><o:p></o:p></span></b></p>
            <br>
            <p class=MsoNormal align=center style='text-align:center'><b><u><span
                            style='font-size:10.0pt;line-height:105%;font-family:Poppins'>CERTIDÃO</span></u></b><span
                    style='font-size:8.0pt;line-height:105%;font-family:Poppins'><o:p></o:p></span></p>

            <p class=MsoNormal style='text-align:justify; margin-left: 5px;margin-right: 5px;'><b><span style='font-size:9.0pt;
                                                                                                        font-family:Poppins'>ROSA MADALENA MUGAJE</span></b><span
                    style='font-size:8.5pt;font-family:Poppins'>, <b>Técnica
                        Superior N1</b>, <i>Chefe da Secretária da</i> <b><%=esc%></b><i> distrito</i> <span class=SpellE><b><%=dist%></b></span>
                    <i>província de</i> <b>Maputo</b>, <i>CERTIFICO</i> <i>em cumprimento do
                        despacho em requerimento que fica arquivado nesta secretaria que</i> <b><span
                            style='color:#C00000; text-transform: uppercase'><%=primeiroNome + " " + apelido%></span></b><span
                        style='color:#C00000'> </span><i>do sexo</i> <b><%=sexo%></b>, <i>natural de</i> <b><%=naturalidade%></b>
                    <i>distrito de</i> <b><%=distrito%></b>, <i>província de</i> <b><%=naturalidade%></b>, <i>nascido
                        no dia</i> <b><%=dataNascimento%></b>, <i>filho de</i>
                    <b><%=nomePai%></b> <i>e de </i><b><%=nomeMae%></b>, <i>frequentou a <b><%=esc%></b>, como
                        aluno c)</i> <b><%=cond%></b> <i>em</i> <b><%=dteI%></b> a <b><%=curs%></b> <i>na
                        área de</i> <b>Comunicação e Ciências Sociais</b>, <i>tendo obtido os seguintes
                        resultados</i>:<o:p></o:p></span></p>

            <center>
                <table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0 align=left
                       width=100% style='width:616.0pt;border-collapse:collapse;border:none;
                       ;mso-yfti-tbllook:1184;mso-table-lspace:
                       7.05pt;margin-left:4.8pt;mso-table-rspace:7.05pt;margin-right:4.8pt;
                       mso-table-anchor-vertical:paragraph;mso-table-anchor-horizontal:margin;
                       mso-table-left:center;mso-table-top:2.0pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt'>


                    <%
                        List<Auxiliar> auxs = new ArrayList();

                        int num = 0;
                        int sum = 0;
                        if (medias != null) {

                            int i = 0;

                            Auxiliar aux = null;
                            for (Media n : medias) {

                                num++;
                                String disc = encryptUtils.decodeString(n.getDisciplina().getDiscDescricao());

                                int med = Math.round((n.getMediMedia() + n.getMediMedia2() + n.getMediMedia3()) / 3);
                                sum += med;

                                String ntExt = stringUtils.numeroPorExtenso(med, "").toUpperCase();

                                String s = "<b style='font-size:12px;'>" + disc + ":</b>   " + ntExt + "  ( <b>" + med + "</b> ) Valores";

                                i++;

                                if (i == 1) {
                                    aux = new Auxiliar();
                                    aux.setN1(s);
                                }

                                if (i == 2) {
                                    aux.setN2(s);
                                }

                                if (i >= 3) {
                                    aux.setN3(s);
                                    auxs.add(aux);
                                    i = 0;
                                }

                            }
                        }

                        int medF = Math.round(sum / num);
                        String ntExtF = stringUtils.numeroPorExtenso(medF, "").toUpperCase();
                    %>

                    <%
                        if (auxs != null) {
                            for (Auxiliar a : auxs) {
                                String n1 = a.getN1();
                                String n2 = a.getN2();
                                String n3 = a.getN3();
                                String n4 = a.getN4();

                                if (n4 == null) {
                                    n4 = "";
                                }

                                if (n3 == null) {
                                    n3 = "";
                                }
                                if (n2 == null) {
                                    n2 = "";
                                }
                                if (n1 == null) {
                                    n1 = "";
                                }
                    %>
                    <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:16.35pt'>
                        <td width=205 valign=top style='width:154.0pt;
                            mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:5.35pt'>
                            <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                               normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
                               around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
                               margin;mso-element-left:center;mso-element-top:2.0pt;mso-height-rule:exactly'><span
                                    style='font-size:8.0pt;font-family:Poppins'><%=n1%></span><span
                                    style='font-size:8.0pt'><o:p></o:p></span></p>
                        </td>
                        <td width=205 valign=top style='width:154.0pt;
                            border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
                            solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:5.35pt'>
                            <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                               normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
                               around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
                               margin;mso-element-left:center;mso-element-top:2.0pt;mso-height-rule:exactly'><span
                                    style='font-size:8.0pt;font-family:Poppins'><%=n2%></span><span
                                    style='font-size:8.0pt'><o:p></o:p></span></p>
                        </td>
                        <td width=205 valign=top style='width:154.0pt;
                            border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
                            solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:5.35pt'>
                            <p class=MsoNormal style='margin-bottom:0cm;text-align:justify;line-height:
                               normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
                               around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
                               margin;mso-element-left:center;mso-element-top:2.0pt;mso-height-rule:exactly'><span
                                    style='font-size:8.0pt;font-family:Poppins'><%=n3%></span><span
                                    style='font-size:8.0pt'><o:p></o:p></span></p>
                        </td>
                    </tr>

                    <%
                            }
                        }
                    %>
                </table>
            </center>
            <br>
            <p class=MsoNormal style='text-align:justify'><span style='font-size:8.0pt;
                                                                line-height:105%;font-family:Poppins;color:white;mso-color-alt:windowtext'>&nbsp;</span><span
                                                                style='font-size:8.0pt;line-height:105%'><o:p></o:p></span></p>

            <p class=MsoNormal style='text-align:justify'><span style='font-size:8.0pt;
                                                                line-height:105%;font-family:Poppins'>&nbsp;<o:p></o:p></span></p>

            <p class=MsoNormal align=center style='text-align:center'><b><span
                        style='font-size:9.0pt;line-height:105%;font-family:Poppins'><o:p>&nbsp;</o:p></span></b></p>

            <p class=MsoNormal align=center style='text-align:center'><b><span
                        style='font-size:9.0pt;line-height:105%;font-family:Poppins'>Média Global: <span
                            style='color:#C00000'><%=ntExtF%> </span>(<span style='color:#C00000'><%=medF%></span>)
                        Valores<o:p></o:p></span></b></p>

            <p class=MsoNormal align=center style='text-align:center'><span
                    style='font-size:8.0pt;line-height:105%;font-family:Poppins'>Os resultados
                    constam da pauta nº <b>253</b>/<b>2020</b> e do livro de Termo de Exames nº <b>1921/2021</b>,
                    Código do Aluno <b><%=cod%></b>, EXTRA.<o:p></o:p></span></p>

            <p class=MsoNormal align=center style='text-align:center'><span
                    style='font-size:8.0pt;line-height:105%;font-family:Poppins'>E, por ser verdade
                    passo o presente Certificado que assino e autêntico com o carimbo de tinta de
                    óleo/ selo Branco em uso neste Estabelecimento de Ensino.</span><span
                    style='font-size:8.0pt;line-height:105%'><o:p></o:p></span></p>

            <p class=MsoNormal align=center style='text-align:center'><b><span
                        style='font-size:8.0pt;line-height:105%;font-family:Poppins'><%=prov%></span></b><span
                    style='font-size:8.0pt;line-height:105%;font-family:Poppins'>, aos de <%=dteFull%></span><span style='font-size:
                    8.0pt;line-height:105%'><o:p></o:p></span></p>

            <p class=MsoNormal style='text-align:justify'><span style='font-size:8.0pt;
                                                                line-height:105%;font-family:Poppins'>&nbsp;</span><span style='font-size:8.0pt;
                                                                line-height:105%'><o:p></o:p></span></p>

            <div align=center>

                <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
                       style='border-collapse:collapse;mso-yfti-tbllook:1184;mso-padding-alt:0cm 0cm 0cm 0cm'>
                    <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes'>
                        <td width=200 valign=top style='width:150.25pt;padding:0cm 5.4pt 0cm 5.4pt'>
                            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                               line-height:normal'><span style='font-size:8.0pt;font-family:Poppins'>Chefe
                                    da Secretária<o:p></o:p></span></p>
                        </td>
                        <td width=200 rowspan=2 valign=top style='width:150.25pt;padding:0cm 5.4pt 0cm 5.4pt'>
                            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                               line-height:normal'><span style='font-size:8.0pt;font-family:Poppins'>&nbsp;</span><span
                                    style='font-size:8.0pt'><o:p></o:p></span></p>
                        </td>
                        <td width=200 valign=top style='width:150.3pt;padding:0cm 5.4pt 0cm 5.4pt'>
                            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                               line-height:normal'><span class=SpellE><span style='font-size:8.0pt;
                                                       font-family:Poppins'>Director</span></span><span style='font-size:8.0pt;
                                                              font-family:Poppins'> da Escola</span><span style='font-size:8.0pt'><o:p></o:p></span></p>
                        </td>
                    </tr>
                    <tr style='mso-yfti-irow:1;mso-yfti-lastrow:yes'>
                        <td width=200 valign=top style='width:150.25pt;padding:0cm 5.4pt 0cm 5.4pt'>
                            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                               line-height:normal'><span style='font-size:8.0pt;font-family:Poppins'>&nbsp;</span><span
                                    style='font-size:8.0pt'><o:p></o:p></span></p>
                            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                               line-height:normal'><span style='font-size:8.0pt;font-family:Poppins'>____________________</span><span
                                    style='font-size:8.0pt'><o:p></o:p></span></p>
                        </td>
                        <td width=200 valign=top style='width:150.3pt;padding:0cm 5.4pt 0cm 5.4pt'>
                            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                               line-height:normal'><span style='font-size:8.0pt;font-family:Poppins'>&nbsp;</span><span
                                    style='font-size:8.0pt'><o:p></o:p></span></p>
                            <p class=MsoNormal align=center style='margin-bottom:0cm;text-align:center;
                               line-height:normal'><span style='font-size:8.0pt;font-family:Poppins'>____________________</span><span
                                    style='font-size:8.0pt'><o:p></o:p></span></p>
                        </td>
                    </tr>
                </table>

            </div>
            <br>
            <p class=MsoNormal style='text-align:justify; margin-left: 15px;'>
                <span style='mso-ignore:vglayout'>

                    <table cellpadding=0 cellspacing=0 align=left>
                        <tr>
                            <td><img width=60 height=60 src="Certidao_files/image006.gif" v:shapes="Picture_x0020_2"></td>
                        </tr>
                    </table>

                </span>
            </p>

        </div>
        <%
            }
        %> 
    </body>



</html>
