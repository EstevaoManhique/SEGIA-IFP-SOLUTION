<template>
  <v-container>
    <!-- Main content -->
    <div class="content-wrapper">
      <!-- Cover area -->
      <div class="profile-cover">
        <div
          class="profile-cover-img"
          style="background-image: url(assets/img/background/cover.jpg)"
        ></div>
        <div class="media">
          <div class="media-left">
            <a href="#" class="profile-thumb">
              <img
                src="http://<%=ip%>:8081/suc/images/profile-pictures/<%=fotoPerfil%>"
                class="img-circle"
                alt="<%=nome%>"
              />
            </a>
          </div>

          <div class="media-body">
            <h1>
              {{ user.name }}
              <small class="display-block"
                ><i class="icon-briefcase3 position-left"> </i>
                {{ user.name }}
              </small>
            </h1>
          </div>

          <div class="media-right media-middle">
            <ul
              class="list-inline list-inline-condensed no-margin-bottom text-nowrap"
            >
              <li>
                <a
                  href="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jZ28tYmFjaw=="
                  class="btn text-bold text-uppercase btn-default"
                  ><i class="icon-home2 position-left"></i> Voltar a página
                  inicial {{ user.name }}</a
                >
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!-- /cover area -->

      <!-- Toolbar -->
      <div class="navbar navbar-default navbar-component navbar-xs">
        <ul class="nav navbar-nav visible-xs-block">
          <li class="full-width text-center">
            <a data-toggle="collapse" data-target="#navbar-filter"
              ><i class="icon-menu7"></i
            ></a>
          </li>
        </ul>

        <div class="navbar-collapse collapse" id="navbar-filter">
          <ul class="nav navbar-nav element-active-slate-400">
            <li class="active">
              <a
                href="#settings"
                data-toggle="tab"
                class="text-bold text-uppercase"
                ><i class="icon-cog3 position-left"></i> Definições</a
              >
            </li>
          </ul>

          <div class="navbar-right">
            <ul class="nav navbar-nav">
              <li>
                <a href="#"
                  ><i class="icon-stack-text position-left"></i> Notas</a
                >
              </li>
              <li>
                <a href="#"
                  ><i class="icon-collaboration position-left"></i> Colegas</a
                >
              </li>
              <li>
                <a href="#"><i class="icon-images3 position-left"></i> Fotos</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!-- /toolbar -->

      <!-- User profile -->
      <div class="row">
        <div class="col-lg-9">
          <div class="tabbable">
            <div class="tab-content">
              <div class="tab-pane fade active in" id="settings">
                <person-form :person="user.person" />
                <account-form :user="user" />
              </div>
            </div>
          </div>
        </div>

        <div class="col-lg-3">
          <!-- Navigation -->
          <div class="panel panel-flat">
            <div class="panel-heading">
              <h6 class="panel-title text-uppercase text-bold">
                Actvidade do Usuário
              </h6>
            </div>

            <div class="list-group list-group-borderless no-padding-top">
              <a href="#" class="list-group-item"
                ><i class="icon-users4"></i> <strong>Grupo</strong>
                <span class="badge bg-gray pull-right">
                  <%=tipoUsuario%>
                </span></a
              >
              <a href="#" class="list-group-item"
                ><i class="icon-calendar22"></i>
                <strong>Data de criação</strong>
                <span class="badge bg-brown pull-right">
                  <%=dataCriacao%>
                </span></a
              >
              <a href="#" class="list-group-item"
                ><i class="icon-sort-time-asc"></i>
                <strong>Último login</strong>
                <span class="badge bg-success pull-right">
                  <%=ultimoLogin%>
                </span></a
              >
              <a href="#" class="list-group-item"
                ><i class="icon-exclamation"></i> <strong>Estado</strong>
                <span class="badge <%=lblEstado%> pull-right">
                  <%=estado%>
                </span></a
              >
              <a href="#" class="list-group-item"
                ><i class="icon-stats-growth2"></i> <strong>Nº Acessos</strong>
                <span class="badge bg-teal gray pull-right">
                  <%=nrAcessos%>
                </span></a
              >
            </div>
          </div>
          <!-- /navigation -->

          <!-- Share your thoughts -->
          <div class="panel panel-flat">
            <div class="panel-heading">
              <h6 class="panel-title text-uppercase text-bold">
                Alterar a sua foto de perfil
              </h6>
            </div>

            <div class="panel-body">
              <% String act=encryptUtils.encodeString("accao#reload-photo&user="
              + encryptUtils.decodeString(usuario.getUsuaUsuario())+" &rd=0");
              %>
              <form method="post" action="VXN1YXJpb1NlcnZsZXQjRENJ?<%=act%>">
                <div class="form-group">
                  Tamanho preferêncial da foto <b>350 x 350 px </b><br /><br />
                  <center>
                    Use a seguinte regra de nomeclatura :
                    <strong><i>nome-apelido_aaaa-mm-dd</i></strong>
                    <iframe
                      src="http://<%=ip%>:8081/suc/index-inefp.php?id=<%=usuario.getUsuaId()%>"
                      style="width: 90%; height: 25em; background: transparent"
                      frameBorder="0"
                      scrolling="no"
                    >
                    </iframe>
                  </center>
                </div>

                <div class="row">
                  <div class="col-sm-6 text-center">
                    <button
                      type="submit"
                      onclick="this.disabled='disabled'; this.form.submit();"
                      class="btn text-bold text-uppercase bg-slate-800 btn-labeled btn-labeled-right"
                    >
                      Confirmar a actualização
                      <b><i class="icon-circle-right2"></i></b>
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <!-- /share your thoughts -->
        </div>
      </div>
      <!-- /user profile -->
    </div>
    <!-- /main content -->
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import PersonForm from '@/components/acessos/PersonForm.vue';
import AccountForm from '@/components/acessos/AccountForm.vue';
export default {
  name: 'UserPerfil',
  components: { PersonForm, AccountForm },
  methods: {
    ...mapActions(['getUser']),
  },
  mounted() {
    this.getUser();
  },
  computed: {
    ...mapGetters(['user']),
  },
};
</script>

<style></style>
