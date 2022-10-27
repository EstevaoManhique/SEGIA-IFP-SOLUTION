<%-- 
    Document   : print-students-grade-2
    Created on : Jun 22, 2017, 4:22:03 PM
    Author     : HJC2K8
--%>

<%@page import="com.dciapps.localcontroler.Data"%>
<%@page import="com.dciapps.webclient.Inscricao"%>
<%@page import="com.dciapps.local.HCal"%>
<%@page import="com.dciapps.webclient.AnoLectivo"%>
<%@page import="com.dciapps.webclient.Turma"%>
<%@page import="com.dciapps.webclient.Curso"%>
<%@page import="com.dciapps.webclient.Calendario"%>
<%@page import="org.joda.time.Days"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="org.joda.time.DateTime"%>
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
        <title>SEGIA - Horários</title>

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


            #customers {
                border-collapse: collapse;
                width: 100%;
            }

            #customers td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #customers tr:nth-child(even){background-color: #f2f2f2;}

            #customers tr:hover {background-color: #ddd;}

            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
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
            String fotoPerfil = "";
            String cargo = "";
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            DecimalFormat df = new DecimalFormat("#,###,##0.00");
            EncryptUtils encryptUtils = new EncryptUtils();
            
            List<Inscricao> inscricoes = null;
            Inscricao inscricao = null;
            Turma turma = null;
            
            Entidade entidade = (Entidade) session.getAttribute("entidadeSelecionada");
            
            Data data = new Data();
            
            data.le_hora();
            
            if (entidade == null) {
                entidade = (Entidade) session.getAttribute("entidade");
            }
            
            if (usuario != null) {
                
                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();
                
                inscricoes = (List<Inscricao>) session.getAttribute("inscricoes");
                turma = (Turma) session.getAttribute("turma");
                
                if (inscricoes != null) {
                    inscricao = inscricoes.get(0);
                }
                
                response.setHeader("Refresh", timeout + "; URL =VXN1YXJpb1NlcnZsZXQjRENJ?" + encryptUtils.encodeString("accao#lockscreen&user=" + encryptUtils.decodeString(usuario.getUsuaUsuario()) + "&ei=" + entidade.getEntiId()));
                
            }
        %>

    </head>

    <body onload="window.print();" oncontextmenu="return false">
        <table width="100%" border="0">

            <thead>
                <tr>
                    <th  style="font-weight:normal;">


                        <%
                         
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
                        %>

                        <table >
                            <tr><td><img width="100px" height="100px" style="margin-left:-20px;" src="http://<%=ip%>:8081/suc/images/invoice/<%=logoE%>"/></td></tr>
                            <tr>
                                <td style="font-size:10px;"> <b> <%=nomeE%></b> </td>
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
                    String semestre = "";
                    
                    String dias[] = {"Nº", "NOME ALUNO", "GEN.", "A. NASC.", "RESIDÊNCIA", "CONT. PESSOAL", "CONT. FAMILIAR", "IDADE", "PROFISSÃO", "PROV.", "CODIGO"};

                    //Nº	Nome do Aluno	Gen.	A. Nasc.	Prov.	Idade	CODIGO
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
                        
                        dI = sdf.format(turma.getTurmDataInicio().toGregorianCalendar().getTime());
                        dF = sdf.format(turma.getTurmDataFim().toGregorianCalendar().getTime());
                        
                        min = turma.getTurmMinEstudantes() + "";
                        max = turma.getTurmMaxEstudantes() + "";
                    }
                    
                    if (inscricao != null) {
                        
                        semestre = encryptUtils.decodeString(inscricao.getInscSemestre());
                        an = encryptUtils.decodeString(inscricao.getAnoLectivo().getAnolDescricao());
                    }
                %>

                <tr>

                    <th scope="col" colspan="3">
                        <table width="100%">
                            <tr>
                                <td><br></td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold; font-size:11px;">HORÁRIO DA TURMA [<%=an + "|" + semestre%>]</td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold; font-size:11px;"><b style="color:#F44336;">CURSO:</b> <%=cur%></td>
                                <td style="font-weight:bold; font-size:11px;"><b style="color:#F44336;">TURMA:</b> <%=dd%></td>
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
                    <td scope="col" colspan="11">

                        <table width="100%" id="customers">


                            <thead>

                                <tr>

                                    <%                                                        for (String d : dias) {
                                    %>
                                    <td style="text-align:left;border-bottom:5pt solid #666; border-width:medium; text-transform:uppercase; font-weight:bold;"><%=d%></td>
                                    <%
                                        }
                                    %>
                                </tr>

                            </thead>
                            <tbody>


                                <%
                                    int ano = Integer.parseInt(data.getAno());
                                    
                                    if (inscricoes != null) {
                                        int x = 0;
                                        for (Inscricao i : inscricoes) {

                                            //String dias[] = {"Nº", "NOME ALUNO", "GEN.", 
                                            //"A. NASC.", "RESIDÊNCIA", "CONT. PESSOAL", 4
                                            //"CONT. FAMILIAR", "IDADE","PROFISSÃO", 
                                            //"PROV.", "CODIGO"};
                                            x++;
                                            
                                            String cod = encryptUtils.decodeString(i.getAluno().getAlunBadgnumber());
                                            String nom = encryptUtils.decodeString(i.getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(i.getAluno().getPessoa().getPessApelido());
                                            String cat = encryptUtils.decodeString(i.getAluno().getAlunCategoria());
                                            String def = "Não";
                                            
                                            String gen = encryptUtils.decodeString(i.getAluno().getPessoa().getPessSexo()).charAt(0) + "";
                                            
                                            String prov = encryptUtils.decodeString(i.getAluno().getAlunCategoria());
                                            
                                            String end = encryptUtils.decodeString(i.getAluno().getPessoa().getPessBairro());
                                            String con = encryptUtils.decodeString(i.getAluno().getPessoa().getPessContacto());
                                            String conF = encryptUtils.decodeString(i.getAluno().getPessoa().getPessNomeMae());
                                            String prof = encryptUtils.decodeString(i.getAluno().getPessoa().getPessActividade());
                                            int anoNasc = i.getAluno().getPessoa().getPessDataNascimento().getYear();
                                            int idade = ano - anoNasc;
                                            
                                            if (i.getAluno().isAlunDeficiente()) {
                                                def = "sim";
                                            }
                                            

                                %>
                                <tr>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin; max-width:150px; font-weight:bold;"><%=x%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin;display: table-cell;vertical-align: middle;max-width:150px;"><%=nom%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin; max-width:150px; font-weight:bold;"><%=gen%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin; max-width:150px;"><%=anoNasc%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin; max-width:150px;"><%=end%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin; max-width:150px;"><%=con%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin; max-width:150px;"><%=conF%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin; max-width:150px;"><%=idade%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin; max-width:150px;"><%=prof%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin; max-width:150px;"><%=prov%></td>
                                    <td style="text-align:left;border-right:0.01em  solid #bababa; border-width:0.01em thin; max-width:150px; font-weight:bold;"><%=cod%></td>

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


                <%                    String field1 = "Departamento Pedagógico".toUpperCase();
                    String field2 = "Director Adjunto Pedagogico".toUpperCase();
                    
                    String field3 = "(Beneficio Benedito Manjate)".toUpperCase();
                    String field4 = "(Guedes de Argentina Armando)".toUpperCase();
                    

                %>




                <tr>
                    <td scope="col" colspan="3" style="height:30px;"></td>
                </tr>
                <tr>
                    <td style="text-align:center; width: 50%"><%=field1%></td>
                    <td></td>
                    <td style="text-align:center;  width: 50%"><%=field2%></td>

                </tr> 

                <tr>
                    <td scope="col" colspan="3" style="height:20px;"></td>
                </tr>
                <tr>
                    <td><hr style="font-weight:bold; height:1px; color:#000; background-color:#000; width:80%;"></td>
                    <td></td>
                    <td><hr style="font-weight:bold; height:1px; color:#000; background-color:#000; width:80%;"></td>

                </tr>


                <tr>
                    <td scope="col" colspan="3" style="height:10px;"></td>
                </tr>

                <tr>
                    <td style="text-align:center; width: 50%"><%=field3%></td>
                    <td></td>
                    <td style="text-align:center;  width: 50%"><%=field4%></td>

                </tr>
                <tr>
                    <td scope="col" colspan="11" style="height:20px;"></td>
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
