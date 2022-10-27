<%-- 
    Document   : dc-user-first-login
    Created on : May 27, 2016, 6:29:56 AM
    Author     : HJC2K8
--%>

<%@page import="java.util.List"%>
<%@page import="com.dciapps.webclient.Nacionalidade"%>
<%@page import="com.dciapps.localcontroler.EncryptUtils"%>
<%@page import="com.dciapps.webclient.Usuario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SEGIA - Primeiro Login</title>

        <!-- Page Description, Author and Keywords -->
        <meta name="description" content="Sistema Electrónico de Gestão de Informação Académica">
        <meta name="author" content="Hamilton Jhonas">
        <meta name="keywords" content="SEGIA" />

        <!-- Favicon -->
        <%
            String ip = "localhost";

            if (session.getAttribute("ip") != null) {
                ip = session.getAttribute("ip").toString();
            } else {
                response.sendRedirect("startup");
            }
        %>
        <link rel="shortcut icon" href="http://<%=ip%>:8081/suc/images/favicons/governo/apple-touch-icon.png">

        <!-- Global stylesheets -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,300,100,500,700,900" rel="stylesheet" type="text/css">
        <link href="assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
        <link href="assets/css/minified/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/minified/core.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/minified/components.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/minified/colors.min.css" rel="stylesheet" type="text/css">
        <!-- /global stylesheets -->

        <!-- Core JS files -->
        <script type="text/javascript" src="assets/js/plugins/loaders/pace.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/loaders/blockui.min.js"></script>
        <!-- /core JS files -->


        <!-- Theme JS files -->
        <script type="text/javascript" src="assets/js/plugins/forms/selects/select2.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/datatables.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/extensions/responsive.min.js"></script>

        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/datepicker.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery_ui/effects.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/ui/moment/moment.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/daterangepicker.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/pickadate/picker.js"></script>

        <script type="text/javascript" src="assets/js/core/app.js"></script>
        <script type="text/javascript" src="assets/js/pages/form_layouts.js"></script>
        <script type="text/javascript" src="assets/js/pages/datatables_responsive.js"></script>

        <!-- /theme JS files -->
        <%

            Usuario usuario = (Usuario) session.getAttribute("usuario");

            String nome = "";
            String fotoPerfil = "";
            String cargo = "";
            int idUsuario = 0;

            String msgErro = "";
            String alerta = "";
            if (session.getAttribute("msgErro") != null) {
                msgErro = session.getAttribute("msgErro").toString();
                alerta = session.getAttribute("alerta").toString();
            }
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
            List<Nacionalidade> nacionalidades = null;

            EncryptUtils encryptUtils = new EncryptUtils();
            if (usuario != null) {

                nacionalidades = (List<Nacionalidade>) session.getAttribute("nacionalidades");
                nome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) + " " + encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                fotoPerfil = usuario.getUsuaFotoperfil();
                cargo = usuario.getTipoUsuariotipu().getTipuDescricao();
                idUsuario = usuario.getUsuaId();

            }
        %>

        <!-- START NOTIFICATION -->


        <!-- /Notification JS files -->
        <script type="text/javascript" src="assets/js/plugins/notifications/jgrowl.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/notifications/sweet_alert.min.js"></script>
        <!-- /Notification JS files -->
        <script>

            jQuery(function () {

                // Defaults override - hide "close all" button
                $.jGrowl.defaults.closer = false;

                var erro = '<%=msgErro%>';
                var bg = '<%=alerta%>';
                var hd = "Notificação do Sistema";
                var cl = "#66BB6A";
                var tp = "success";

                if (bg !== '')
                {
                    /*$.jGrowl(erro, {
                     position: 'center',
                     header: hd,
                     theme: bg
                     });*/

                    if (bg === 'bg-error')
                    {
                        cl = "#EF5350";
                        tp = "error";
                    }

                    if (bg === 'bg-warning')
                    {
                        cl = "#FF7043";
                        tp = "warning";
                    }


                    swal({
                        title: hd,
                        text: erro,
                        confirmButtonColor: cl,
                        type: tp,
                        timer: 5000
                    });
                }


            });
        </script>	
        <!-- END NOTIFICATION -->
        <script type="text/javascript" src="assets/js/plugins/pickers/pickadate/picker.date.js"></script>

    </head>

    <body oncontextmenu="return false"  class="navbar-top">

        <!-- Main navbar -->
        <div class="navbar navbar-inverse">
            <div class="navbar-header">
                <h6 class="text-semibold class text-uppercase" style="margin-left: 2em;"> Sistema Electrónico de Gestão de Informação Académica </h6>

                <ul class="nav navbar-nav pull-right visible-xs-block">
                    <li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
                    <li><a class="sidebar-mobile-main-toggle"><i class="icon-paragraph-justify3"></i></a></li>
                </ul>
            </div>


            <div class="navbar-collapse collapse" id="navbar-mobile">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#">
                            <i class="icon-display4"></i> <span class="visible-xs-inline-block position-right"></span>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <i class="icon-user-tie"></i> <span class="visible-xs-inline-block position-right"> </span>
                        </a>
                    </li>

                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-cog3"></i>
                            <span class="visible-xs-inline-block position-right"> </span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /main navbar -->


        <!-- Page container -->
        <div class="page-container">

            <!-- Page content -->
            <div class="page-content col-md-10 col-md-offset-1">



                <!-- Main content -->
                <div class="content-wrapper">


                    <!-- START SCROLLBAR -->
                    <div class="panel panel-default">
                        <div class="panel-body scroll">                                
                            <p>
                                Bem vindo, <br>

                                Esta é uma mensagem gerada automaticamente pelo sistema, o usuário foi reencaminhado para esta pagina para tornar a sua conta mais segura. É importante que o usuário altere a palavra-chave padrão gerada pelo sistema para uma outra que você sinta-se à-vontade em utilizá-la e defina uma pergunta de segurança que irá lhe dará a possibilidade de terminar múltiplas sessões no sistema.
                                <br>


                            </p>
                        </div>                                   
                    </div>
                    <!-- END SCROLLBAR -->

                    <% if (usuario != null) {

                            String primeiroNome = encryptUtils.decodeString(usuario.getPessoapess().getPessNome());
                            String apelido = encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
                            String email = encryptUtils.decodeString(usuario.getPessoapess().getPessEmail());
                            String contacto = encryptUtils.decodeString(usuario.getPessoapess().getPessContacto());
                            String endereco = encryptUtils.decodeString(usuario.getPessoapess().getPessBairro());
                            String dataNascimento = "";
                            String dis = "";

                            if (usuario.getTipoUsuariotipu().getTipuDescricao().equals("Aluno")) {
                                dis = "readonly";
                            }

                            if (usuario.getPessoapess().getPessDataNascimento() != null) {
                                dataNascimento = sdf.format(usuario.getPessoapess().getPessDataNascimento().toGregorianCalendar().getTime());
                            }
                            String nacionalidade = "";

                            if (usuario.getPessoapess().getNacionalidadenaci() != null) {
                                nacionalidade = encryptUtils.decodeString(usuario.getPessoapess().getNacionalidadenaci().getNaciDescricao());
                            }
                            String naturalidade = encryptUtils.decodeString(usuario.getPessoapess().getPessProvincia());
                            String sexo = encryptUtils.decodeString(usuario.getPessoapess().getPessSexo());
                            String cidade = encryptUtils.decodeString(usuario.getPessoapess().getPessBairro());
                            String cPostal = encryptUtils.decodeString(usuario.getPessoapess().getPessRua()) + " / " + encryptUtils.decodeString(usuario.getPessoapess().getPessNumeroCasa());
                            String cargoUser = encryptUtils.decodeString(usuario.getPessoapess().getPessActividade());

                            String tipoUsuario = usuario.getTipoUsuariotipu().getTipuDescricao();
                            String dataCriacao = sdf.format(usuario.getPessoapess().getPessDataCadastro().toGregorianCalendar().getTime());
                            String ultimoLogin = "Não definido";

                            if (usuario.getUsuDataUltimaVisita() != null) {
                                ultimoLogin = sdf.format(usuario.getUsuDataUltimaVisita().toGregorianCalendar().getTime());
                            }

                            String lblEstado = "bg-success";

                            String estado = usuario.getUsuaEstado();

                            if (estado.equals("Inactivo")) {
                                lblEstado = "bg-danger";
                            }

                            int nrAcessos = usuario.getUsuaTentativasLogin();
                            String perguntaSeguranca = "";
                            String respostaSeguranca = "";
                            if (usuario.getUsuaPerguntaSeguranca() != null) {
                                perguntaSeguranca = usuario.getUsuaPerguntaSeguranca();
                            }

                            if (usuario.getUsuaRespostaSeguranca() != null) {
                                respostaSeguranca = encryptUtils.decodeString(usuario.getUsuaRespostaSeguranca());
                            }

                    %>        

                    <!-- Toolbar -->
                    <div class="navbar navbar-default navbar-component navbar-xs">
                        <ul class="nav navbar-nav visible-xs-block">
                            <li class="full-width text-center"><a data-toggle="collapse" data-target="#navbar-filter"><i class="icon-menu7"></i></a></li>
                        </ul>

                        <div class="navbar-collapse collapse" id="navbar-filter">
                            <ul class="nav navbar-nav element-active-slate-400">
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-cog3 position-left"></i> Definições</a></li>
                            </ul>

                            <div class="navbar-right">
                                <ul class="nav navbar-nav">
                                    <li><a href="#"><i class="icon-stack-text position-left"></i> Notas</a></li>
                                    <li><a href="#"><i class="icon-collaboration position-left"></i> Colegas</a></li>
                                    <li><a href="#"><i class="icon-images3 position-left"></i> Fotos</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /toolbar -->


                    <!-- User profile -->
                    <div class="row">


                        <div class="col-lg-3">



                            <!-- Login -->
                            <div class="panel panel-flat">
                                <form  method="post" action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jbG9nb3V0" accept-charset="ISO-8859-1">

                                    <div class="text-center" >
                                        <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase btn-lg bg-danger-600" style="width:100%">Voltar ao login <i class="icon-arrow-left13 position-left"></i></button>
                                    </div>
                                </form>

                            </div>
                            <!-- /login -->

                            <!-- User thumbnail -->
                            <div class="thumbnail">
                                <div class="thumb thumb-rounded thumb-slide">
                                    <img src="http://<%=ip%>:8081/suc/images/profile-pictures/<%=fotoPerfil%>" alt="">
                                    <div class="caption">
                                        <span>
                                            <a href="#" class="btn text-bold text-uppercase bg-success-400 btn-icon btn-xs" data-popup="lightbox"><i class="icon-plus2"></i></a>
                                            <a href="#" class="btn text-bold text-uppercase bg-success-400 btn-icon btn-xs"><i class="icon-link"></i></a>
                                        </span>
                                    </div>
                                </div>

                                <div class="caption text-center">
                                    <h6 class="text-semibold no-margin"><%=nome%> <small class="display-block"><%=cargo%></small></h6>
                                    <ul class="icons-list mt-15">
                                        <li><a href="#" data-popup="tooltip" title="Google Drive"><i class="icon-google-drive"></i></a></li>
                                        <li><a href="#" data-popup="tooltip" title="Twitter"><i class="icon-twitter"></i></a></li>
                                        <li><a href="#" data-popup="tooltip" title="Github"><i class="icon-github"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- /user thumbnail -->


                            <!-- Navigation -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-uppercase text-bold">Actvidade do Usuário</h6>
                                </div>

                                <div class="list-group list-group-borderless no-padding-top">
                                    <a href="#" class="list-group-item"><i class="icon-users4"></i> <strong>Grupo</strong> <span class="badge bg-gray pull-right"><%=tipoUsuario%></span></a>
                                    <a href="#" class="list-group-item"><i class="icon-calendar22"></i> <strong>Data de criação</strong>  <span class="badge bg-brown pull-right"><%=dataCriacao%></span></a>
                                    <a href="#" class="list-group-item"><i class="icon-sort-time-asc"></i>  <strong>Último login</strong>  <span class="badge bg-success pull-right"><%=ultimoLogin%></span></a>
                                    <a href="#" class="list-group-item"><i class="icon-exclamation"></i> <strong>Estado</strong> <span class="badge <%=lblEstado%> pull-right"><%=estado%></span></a>
                                    <a href="#" class="list-group-item"><i class="icon-stats-growth2"></i>  <strong>Nº Acessos</strong>  <span class="badge bg-teal gray pull-right"><%=nrAcessos%></span></a>

                                </div>
                            </div>
                            <!-- /navigation -->




                            <!-- Share your thoughts -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-uppercase text-bold">Alterar a sua foto de perfil</h6>
                                </div>

                                <div class="panel-body">
                                    <%
                                        String act = encryptUtils.encodeString("accao#reload-photo&user=" + encryptUtils.decodeString(usuario.getUsuaUsuario()) + "&rd=1");
                                    %>
                                    <form method="post" action="VXN1YXJpb1NlcnZsZXQjRENJ?<%=act%>">
                                        <div class="form-group">
                                            Tamanho preferêncial da foto <b>350 x 350 px </b><br><br>
                                            <center>

                                                Use a seguinte regra de nomeclatura : <strong><i>nome-apelido_aaaa-mm-dd</i></strong>
                                                <iframe src="http://<%=ip%>:8081/suc/index-inefp.php?id=<%=usuario.getUsuaId()%>" style=" width: 90%; height: 25em; background: transparent;" frameBorder="0" scrolling="no"> </iframe>
                                            </center>
                                        </div>

                                        <div class="row">

                                            <div class="col-sm-6 text-center">
                                                <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800 btn-labeled btn-labeled-right">Confirmar a actualização <b><i class="icon-circle-right2"></i></b></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- /share your thoughts -->


                        </div>

                        <div class="col-lg-9">
                            <div class="tabbable">
                                <div class="tab-content">


                                    <div class="tab-pane fade active in" id="settings">

                                        <!-- Profile info -->
                                        <div class="panel panel-flat">
                                            <div class="panel-heading">
                                                <h6 class="panel-title text-uppercase text-bold">Informações pessoais</h6>
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li><a data-action="collapse"></a></li>
                                                        <li><a data-action="reload"></a></li>
                                                        
                                                    </ul>
                                                </div>
                                            </div>

                                            <div class="panel-body">
                                                <form method="post" action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jYWx0ZXJhckluZm9ybWFjb2VzJnJkPTE=" accept-charset="ISO-8859-1">
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label>Nome</label>
                                                                <input type="text" class="form-control" placeholder="Introduza o nome ..." required name="nome" value="<%=primeiroNome%>" <%=dis%>>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label>Apelido</label>
                                                                <input type="text" class="form-control" placeholder="Introduza o apelido ..." required name="apelido"  value="<%=apelido%>" <%=dis%>> 
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label>Data de nascimento</label>
                                                                <input type="text" class="form-control  daterange-single" name="dataNascimento" placeholder="Data de Nascimento..." required=""  value="<%=dataNascimento%>"  <%=dis%>>   
                                                            </div>
                                                            <div class="col-md-6">

                                                                <%

                                                                    String checkM = "checked";
                                                                    String checkF = "";
                                                                    if (sexo.equals("Masculino")) {
                                                                        checkM = "checked";
                                                                    } else {
                                                                        checkF = "checked";
                                                                    }
                                                                %>
                                                                <label>Sexo</label>
                                                                <div class="row col-md-offset-0">

                                                                    <label class="radio-inline">
                                                                        <input type="radio" name="radio-inline-left" class="styled"  name="sexo" <%=checkM%> value="Masculino">
                                                                        Masculino
                                                                    </label>

                                                                    <label class="radio-inline">
                                                                        <input type="radio" name="radio-inline-left" class="styled"  name="sexo" <%=checkF%> value="Feminino">
                                                                        Feminino
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <label>Bairro</label>
                                                                <input type="text" class="form-control" placeholder="Bairro" name="cidade" value="<%=cidade%>"  <%=dis%>>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Estado/Provincia</label>
                                                                <input type="text" class="form-control" placeholder="Estado ou Pronvincia" name ="naturalidade"  value="<%=naturalidade%>" required=""  <%=dis%>>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Quarteirão & Casa</label>
                                                                <input type="text"  class="form-control" placeholder="Quarteirão & Casa" name="cPostal" value="<%=cPostal%>"  <%=dis%>>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label>Email</label>
                                                                <input type="text" readonly="readonly" name ="email" value="<%=email%>" class="form-control"  <%=dis%>>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label>País</label>
                                                                <select class="select" name="nacionalidade" required=""  <%=dis%>>
                                                                    <%
                                                                        if (nacionalidades != null) {
                                                                            for (Nacionalidade n : nacionalidades) {
                                                                                String sel = "";
                                                                                if (n.getNaciDescricao().equals(encryptUtils.encodeString(nacionalidade))) {

                                                                                    sel = "selected='selected'";
                                                                                }


                                                                    %>
                                                                    <option value="<%=n.getNaciDescricao()%>" <%=sel%>><%=encryptUtils.decodeString(n.getNaciDescricao())%></option> 
                                                                    <%

                                                                            }
                                                                        }
                                                                    %>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label>Contacto #</label>
                                                                <input type="text"  class="form-control" placeholder="+999-99-999-9999" value="<%=contacto%>" name="contacto" required=""  <%=dis%>>
                                                                <span class="help-block">+999-99-999-9999</span>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label>Endereço</label>
                                                                <input type="text"  class="form-control" placeholder="Introduza o endereço" name="endereco" required="" value="<%=endereco%>"  <%=dis%>>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label>Cargo</label>
                                                                <input type="text"  class="form-control" placeholder="Introduza o cargo" name="cargo" required="" value="<%=cargoUser%>"  <%=dis%>>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="text-right">
                                                        <%
                                                            if (dis.isEmpty()) {
                                                        %>
                                                        <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800">Gravar alterações <i class="icon-arrow-right14 position-right"></i></button>

                                                        <%
                                                            }
                                                        %>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- /profile info -->


                                        <!-- Account settings -->
                                        <div class="panel panel-flat">
                                            <div class="panel-heading">
                                                <h6 class="panel-title text-uppercase text-bold">Definições da conta</h6>
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li><a data-action="collapse"></a></li>
                                                        <li><a data-action="reload"></a></li>
                                                        
                                                    </ul>
                                                </div>
                                            </div>

                                            <div class="panel-body">
                                                <form  method="post" action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jYWx0ZXJhclNlZ3VyYW5jYSZyZD0x" accept-charset="ISO-8859-1">
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label>Username</label>
                                                                <input type="text" value="<%=encryptUtils.decodeString(usuario.getUsuaUsuario())%>" readonly="readonly" class="form-control">
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label>Password actual</label>
                                                                <input type="password" class="form-control" placeholder="Sua password actual..." name="passAntiga" value=""/>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label>Nova password</label>
                                                                <input type="password" class="form-control" placeholder="Nova password..." name="passNova" value=""/>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label>Repetir password</label>
                                                                <input type="password" class="form-control" placeholder="Confirme a nova password..." name="rePassNova" value=""/>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label>Pergunta de segurança</label>                                        
                                                                <select class="select" name="perguntaSeguranca" required="" placeholder="Selecione uma pergunta">

                                                                    <%
                                                                        perguntaSeguranca = encryptUtils.decodeString(perguntaSeguranca);
                                                                    %>
                                                                    <option value="<%=perguntaSeguranca%>"><%=perguntaSeguranca%></option>
                                                                    <option value="Qual era o nome do seu melhor amigo na adolescência?">Qual era o nome do seu melhor amigo na adolescência?</option>
                                                                    <option value="Qual era o nome do seu primeiro animal de estimação?">Qual era o nome do seu primeiro animal de estimação?</option>
                                                                    <option value="Qual foi o primeiro prato que você aprendeu a cozinhar?">Qual foi o primeiro prato que você aprendeu a cozinhar?</option>
                                                                    <option value="Qual foi o primeiro filme que você viu no cimema?">Qual foi o primeiro filme que você viu no cimema?</option>
                                                                    <option value="Qual foi o destino da sua primeira viagem de avião?">Qual foi o destino da sua primeira viagem de avião?</option>
                                                                    <option value="Qual era o nome do seu professor favorito da escola primária?">Qual era o nome do seu professor favorito da escola primária?</option>
                                                                    <option value="Qual é o emprego dos seus sonhos?">Qual é o emprego dos seus sonhos?</option>
                                                                    <option value="Qual era o seu apelido de infância?">Qual era o seu apelido de infância?</option>
                                                                    <option value="Qual é o seu cantor favorito?">Qual é o seu cantor favorito?</option>
                                                                    <option value="Qual foi o seu livro infantil favorito?">Qual foi o seu livro infantil favorito?</option>
                                                                </select>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label>Resposta de segurança</label>
                                                                <input type="password" class="form-control" placeholder="Resposta de Segurança ..." required name="respostaSeguranca" value="<%=respostaSeguranca%>"/>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label>Visibilidade do Perfil</label>

                                                                <div class="radio">
                                                                    <label>
                                                                        <input type="radio" name="visibility" class="styled" checked="checked">
                                                                        Visivel para todos
                                                                    </label>
                                                                </div>

                                                                <div class="radio">
                                                                    <label>
                                                                        <input type="radio" name="visibility" class="styled">
                                                                        Visivel para colegas apenas
                                                                    </label>
                                                                </div>

                                                                <div class="radio">
                                                                    <label>
                                                                        <input type="radio" name="visibility" class="styled">
                                                                        Visivel para minhas conexões apenas
                                                                    </label>
                                                                </div>

                                                                <div class="radio">
                                                                    <label>
                                                                        <input type="radio" name="visibility" class="styled">
                                                                        Visivel para os administradores apenas
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label>Notificações</label>

                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" class="styled" checked="checked">
                                                                        Notificação da validade da password
                                                                    </label>
                                                                </div>

                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" class="styled" checked="checked">
                                                                        Notificaçãdo de nova mensagem
                                                                    </label>
                                                                </div>

                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" class="styled" checked="checked">
                                                                        Notificação de nova tarefa
                                                                    </label>
                                                                </div>

                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" class="styled">
                                                                        Notificação de novo ticket
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="text-right">
                                                        <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800">Gravar alterações <i class="icon-arrow-right14 position-right"></i></button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- /account settings -->

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /user profile -->


                    <%
                        }
                    %>
                </div>
                <!-- /main content -->

            </div>
            <!-- /page content -->


            <!-- Footer -->
            <div class="footer text-bold">
                <%
                    String ano = session.getAttribute("ano").toString();
                %>
                 &copy; <%=ano%>. <a href="#" class="text-bold">MINEDH. SEGIA</a>. Todos os direitos reservados
            </div>
            <!-- /footer -->

        </div>
        <!-- /page container -->

    </body>
</html>
