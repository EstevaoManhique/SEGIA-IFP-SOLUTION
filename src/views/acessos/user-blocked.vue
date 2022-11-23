<template>
  <v-container>
    <nav-bar :menu_types="2" />
    <v-row>
      <!-- Main content -->
      <div class="content-wrapper">
        <!-- Password recovery -->
        <form
          method="post"
          accept-charset="ISO-8859-1"
          action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jY2hlY2tCcm93c2VyJm5hdmVnYWRvcj1hbnk="
        >
          <div class="panel panel-body login-form">
            <div class="text-center">
              <div class="icon-object border-warning text-danger">
                <i class="icon-user-block"></i>
              </div>
              <h6 class="content-group">Usuário Bloqueado</h6>
            </div>

            <div class="form-group has-feedback">
              <% EncryptUtils encryptUtils = new EncryptUtils(); String nome =
              encryptUtils.decodeString(usuario.getPessoapess().getPessNome()) +
              " " +
              encryptUtils.decodeString(usuario.getPessoapess().getPessApelido());
              %>
              <p>
                <strong><%=nome%></strong>, a sua conta encontra-se
                temporariamente bloqueada. Contacte o seu administrador para que
                tenha mais informações.<br />Obrigado!
              </p>
            </div>

            <button
              type="submit"
              onclick="this.disabled='disabled'; this.form.submit();"
              class="btn text-bold text-uppercase bg-blue btn-block"
            >
              <i class="icon-arrow-left13 position-right"></i> Voltar ao login
            </button>
          </div>
        </form>
        <!-- /password recovery -->
      </div>
      <!-- /main content -->
    </v-row>
  </v-container>
</template>

<script>
import NavBar from '@/components/layout/NavBar.vue';
import { mapGetters } from 'vuex';
export default {
  name: 'HomeView',
  components: { NavBar },
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
