<%-- 
    Document   : dc-print-students-grade
    Created on : Apr 17, 2017, 6:55:05 AM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.webclient.Inscricao"%>
<%@page import="com.dciapps.webclient.Entidade"%>
<%@page import="com.dciapps.webclient.Turma"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="com.dciapps.controller.GenericHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns='http://www.w3.org/1999/xhtml'>
    <head>
        <meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name='viewport' content='width=device-width, initial-scale=1' />
            <title>SEGIA - Alunos da Turma</title>


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

                        <!-- Latest compiled and minified CSS -->
                        <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css' integrity='sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7' crossorigin='anonymous'>

                            <!-- Optional theme -->
                            <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css' integrity='sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r' crossorigin='anonymous'>

                                <style type="text/css">

                                    /* Take care of image borders and formatting */

                                    img {
                                        max-width: 600px;
                                        outline: none;
                                        text-decoration: none;
                                        -ms-interpolation-mode: bicubic;
                                    }

                                    a {
                                        border: 0;
                                        outline: none;
                                    }

                                    a img {
                                        border: none;
                                    }

                                    /* General styling */

                                    td, h1, h2, h3  {
                                        font-family: Poppins, Arial, sans-serif;
                                        font-weight: 400;
                                    }

                                    td {
                                        font-size: 8px;
                                        line-height: 19px;
                                        text-align: left;
                                    }

                                    body {
                                        -webkit-font-smoothing:antialiased  !important; 
                                        -webkit-text-size-adjust:none  !important;
                                        width: 100%  !important;
                                        height: 100%  !important;
                                        color: #37302d  !important;
                                        background: #ffffff  !important;
                                    }

                                    table {
                                        border-collapse: collapse !important;
                                    }


                                    h1, h2, h3, h4 {
                                        padding: 0;
                                        margin: 0;
                                        color: #444444  !important; 
                                        font-weight: 400;
                                        line-height: 110%;
                                    }

                                    h1 {
                                        font-size: 35px;
                                    }

                                    h2 {
                                        font-size: 30px;
                                    }

                                    h3 {
                                        font-size: 24px;
                                    }

                                    h4 {
                                        font-size: 18px;
                                        font-weight: normal;
                                    }

                                    .important-font {
                                        color: #21BEB4  !important;
                                        font-weight: bold  !important;
                                    }

                                    .hide {
                                        display: none !important;
                                    }

                                    .force-full-width {
                                        width: 100% !important;
                                    }

                                    table.table-style-two {
                                        font-family: verdana, arial, sans-serif  !important;
                                        font-size: 8px  !important;
                                        color: #333333  !important;
                                        border-width: 1px  !important;
                                        border-color: #3A3A3A  !important;
                                        border-collapse: collapse  !important;
                                    }

                                    table.table-style-two th {
                                        border-width: 1px  !important;
                                        padding: 8px  !important;
                                        border-style: solid  !important;
                                        border-color: #517994  !important;
                                        background-color: #AED581  !important;
                                    }

                                    table.table-style-two tr:hover td {
                                        background-color: #DFEBF1  !important;
                                    }

                                    table.table-style-two td {
                                        border-width: 1px  !important;
                                        padding: 8px  !important;
                                        border-style: solid  !important;
                                        border-color: #517994  !important;
                                        background-color: #ffffff  !important;
                                    }

                                    @media screen {
                                        @import url(http://fonts.googleapis.com/css?family=Open+Sans:400);

                                        /* Thanks Outlook 2013! */
                                        td, h1, h2, h3 {
                                            font-family: Poppins,'Open Sans', 'Helvetica Neue', Arial, sans-serif !important;
                                        }
                                    }

                                    /* Mobile styles */
                                    @media only screen and (max-width: 600px) {

                                        table[class='w320'] {
                                            width: 320px !important;
                                        }

                                        table[class='w300'] {
                                            width: 300px !important;
                                        }

                                        table[class='w290'] {
                                            width: 290px !important;
                                        }

                                        td[class='w320'] {
                                            width: 320px !important;
                                        }

                                        td[class~='mobile-padding'] {
                                            padding-left: 14px !important;
                                            padding-right: 14px !important;
                                        }

                                        td[class*='mobile-padding-left'] {
                                            padding-left: 14px !important;
                                        }

                                        td[class*='mobile-padding-right'] {
                                            padding-right: 14px !important;
                                        }

                                        td[class*='mobile-padding-left-only'] {
                                            padding-left: 14px !important;
                                            padding-right: 0 !important;
                                        }

                                        td[class*='mobile-padding-right-only'] {
                                            padding-right: 14px !important;
                                            padding-left: 0 !important;
                                        }

                                        td[class*='mobile-block'] {
                                            display: block !important;
                                            width: 100% !important;
                                            text-align: left !important;
                                            padding-left: 0 !important;
                                            padding-right: 0 !important;
                                            padding-bottom: 15px !important;
                                        }

                                        td[class*='mobile-no-padding-bottom'] {
                                            padding-bottom: 0 !important;
                                        }

                                        td[class~='mobile-center'] {
                                            text-align: center !important;
                                        }

                                        table[class*='mobile-center-block'] {
                                            float: none !important;
                                            margin: 0 auto !important;
                                        }

                                        *[class*='mobile-hide'] {
                                            display: none !important;
                                            width: 0 !important;
                                            height: 0 !important;
                                            line-height: 0 !important;
                                            font-size: 0 !important;
                                        }

                                        td[class*='mobile-border'] {
                                            border: 0 !important;
                                        }
                                    }

                                </style>


                                <%

                                    int timeout = session.getMaxInactiveInterval();

                                    GenericHandler gh = new GenericHandler(request, response);
                                    Usuario usuario = gh.loggedUser();

                                    String nome = "";
                                    String fotoPerfil = "";
                                    String cargo = "";

                                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                    DecimalFormat df = new DecimalFormat("#,###,##0.00");
                                    EncryptUtils encryptUtils = new EncryptUtils();

                                    List<Inscricao> inscricoes = null;
                                    Turma turma = null;

                                    Entidade entidade = (Entidade) session.getAttribute("entidadeSelecionada");

                                    if (entidade == null) {
                                        entidade = (Entidade) session.getAttribute("entidade");
                                    }

                                    if (usuario != null) {

                                        nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                                        fotoPerfil = usuario.getUsuaFotoperfil();
                                        cargo = usuario.getTipoUsuariotipu().getTipuDescricao();

                                        inscricoes = (List<Inscricao>) session.getAttribute("inscricoes");
                                        turma = (Turma) session.getAttribute("turma");

                                        response.setHeader("Refresh", timeout + "; URL =VXN1YXJpb1NlcnZsZXQjRENJ?" + encryptUtils.encodeString("accao#lockscreen&user=" + encryptUtils.decodeString(usuario.getUsuaUsuario()) + "&ei=" + entidade.getEntiId()));

                                    }
                                %>
                                </head>
                                <body class='body' style='padding:0; margin:0; display:block; background:#ffffff; -webkit-text-size-adjust:none' bgcolor='#ffffff'>
                                    <table align='center' cellpadding='0' cellspacing='0' width='100%' height='100%'>
                                        <tr>
                                            <td align='center' valign='top' bgcolor='#ffffff'  width='100%'>

                                                <table cellspacing='0' cellpadding='0' width='100%'>
                                                    <tr>
                                                        <td style='background:#558B2F !important' width='100%'>


                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style='border-bottom:1px solid #e7e7e7;'>

                                                            <table cellpadding='0' cellspacing='0' width='100%' class='w320'>
                                                                <tr>
                                                                    <td align='left' class='mobile-padding' style='padding:20px 20px 0'>
                                                                        <table width="572">
                                                                            <tr>
                                                                                <td width="353">

                                                                                    <%
                                                                                        String nomeE = "";
                                                                                        String endE = "";
                                                                                        String telE = "";

                                                                                        if (entidade != null) {
                                                                                            nomeE = encryptUtils.decodeString(entidade.getEntiNome());
                                                                                            endE = encryptUtils.decodeString(entidade.getEntiEndereco());
                                                                                            telE = encryptUtils.decodeString(entidade.getEntiContactos1());
                                                                                        }
                                                                                    %>

                                                                                    <b><%=nomeE%></b><br>
                                                                                        <%=endE%><br>
                                                                                            Tel: <%=telE%>
                                                                                            </td>
                                                                                            <td width="307">
                                                                                                <p>Visto<br>
                                                                                                        <b>O Pedagógico</b><br>
                                                                                                            ___________________________________
                                                                                                            </td>
                                                                                                            </tr>
                                                                                                            </table>
                                                                                                            </p>
                                                                                                            <table class='table-style-two'>
                                                                                                                <thead>

                                                                                                                    <tr  align='center'>
                                                                                                                        <th class='text-center text-bold text-uppercase' colspan="13"><strong>LISTA DE ESTUDANTES</strong></th>

                                                                                                                    </tr>


                                                                                                                    <tr  align='center'>
                                                                                                                        <th class='text-center text-bold text-uppercase'>Nº</th>
                                                                                                                        <th class='text-center text-bold text-uppercase'>cÓDIGO</th>
                                                                                                                        <th class='text-center text-bold text-uppercase'>ESTUDANTE</th>
                                                                                                                        <th class='text-center text-bold text-uppercase'>CATEGORIA</th>
                                                                                                                        <th class='text-center text-bold text-uppercase'>CONDIÇÃO</th>
                                                                                                                        <th class='text-center text-bold text-uppercase'>PORTADOR DE DEFICIÊNCIA ?</th>

                                                                                                                    </tr>
                                                                                                                </thead>
                                                                                                                <tbody>

                                                                                                                    <%
                                                                                                                        String decT = "---";
                                                                                                                        String decC = "---";
                                                                                                                        String decH = "---";

                                                                                                                        int id = -1;

                                                                                                                        if (turma != null) {
                                                                                                                            decT = encryptUtils.decodeString(turma.getTurmDescricao());
                                                                                                                            decC = encryptUtils.decodeString(turma.getCurso().getCursDescricao());
                                                                                                                            decH = encryptUtils.decodeString(turma.getTurmHorario());
                                                                                                                            id = turma.getTurmId();
                                                                                                                        }
                                                                                                                    %>


                                                                                                                    <tr><td  colspan='7'  class ='text-center'scope='col'style='color:#fff !important; background-color:#558B2F !important; text-transform:uppercase;'><b style="color:#fff !important;">CURSO: <%=decC%> | TURMA: <%=decT%> | DURAÇÃO: <%=decH%></b></td></tr>


                                                                                                                    <%
                                                                                                                        if (inscricoes != null) {
                                                                                                                            int x = 0;
                                                                                                                            for (Inscricao i : inscricoes) {

                                                                                                                                x++;

                                                                                                                                String ref = encryptUtils.decodeString(i.getAluno().getAlunBadgnumber());
                                                                                                                                String nom = encryptUtils.decodeString(i.getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(i.getAluno().getPessoa().getPessApelido());
                                                                                                                                String cat = encryptUtils.decodeString(i.getAluno().getAlunCategoria());
                                                                                                                                String con = encryptUtils.decodeString(i.getAluno().getAlunBolseiro());
                                                                                                                                String def = "Não";
                                                                                                                                
                                                                                                                                if(i.getAluno().isAlunDeficiente())
                                                                                                                                {
                                                                                                                                    def = "sim";
                                                                                                                                }
                                                                                                                    
                                                                                                                    
                                                                                                                    %>
                                                                                                                    <tr>
                                                                                                                        <td><b><%=x%></b></td>
                                                                                                                        <td class='text-semibold text-center'><center><b><%=ref%></b></center></td>
                                                                                                                        <td class='text-semibold'><b><%=nom%></b></td>
                                                                                                                        <td class='text-semibold text-center'><center><b><%=cat%></b></center></td>
                                                                                                                        <td class='text-semibold text-center'><center><b><%=con%></b></center></td>
                                                                                                                        <td class='text-semibold text-center'><center><b><%=def%></b></center></td>
                                                                                                                    </tr>
                                                                                                                    <%    }
                                                                                                                        }
                                                                                                                    %>
                                                                                                                </tbody>
                                                                                                            </table> 
                                                                                                            <br>
                                                                                                                </td>
                                                                                                                </tr>
                                                                                                                </table>

                                                                                                                </td>
                                                                                                                </tr>
                                                                                                                </table>

                                                                                                                </td>
                                                                                                                </tr>
                                                                                                                </table>
                                                                                                                </body>
                                                                                                                </html>