<!-- Main navbar -->
<div class="navbar navbar-inverse">
    <div class="navbar-header">
        <h6 class="text-semibold class text-uppercase" style="margin-left: 2em;"> Sistema Electrónico de Gestão de Informação Académica </h6>

        <ul class="nav navbar-nav visible-xs-block">
            <li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
            <li><a class="sidebar-mobile-main-toggle"><i class="icon-paragraph-justify3"></i></a></li>
        </ul>
    </div>

    <div class="navbar-collapse collapse" id="navbar-mobile">


        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown language-switch">
                <a class="dropdown-toggle" data-toggle="dropdown">
                    <img src="assets/images/flags/mz.png" class="position-left" alt=""> Português
                    <span class="caret"></span>
                </a>

                <ul class="dropdown-menu">
                    <li>
                        <a class="english"><img src="assets/images/flags/gb.png" alt=""> English</a>
                    </li>


                </ul>
            </li>

            <li class="dropdown dropdown-user">
                <a class="dropdown-toggle" data-toggle="dropdown">
                    <img src="http://<%=ip%>:8081/suc/images/profile-pictures/<%=fotoPerfil%>" alt="<%=nome%>">
                    <span class="text-bold text-uppercase"><%=nome%></span>
                    <i class="caret"></i>
                </a>

                <ul class="dropdown-menu dropdown-menu-right">
                    <li><a href="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jdmVyLXBlcmZpbA=="><i class="icon-user-plus"></i> Definições da Conta</a></li>
                    <li class="divider"></li>
                    <li><a href="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jbG9nb3V0I0RDSQ=="><i class="icon-switch2"></i> Terminar Sessão</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- /main navbar -->