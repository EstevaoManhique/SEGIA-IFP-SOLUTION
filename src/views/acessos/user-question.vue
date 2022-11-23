<template>
  <v-container>
    <nav-bar :menu_types="2" />
    <v-row>
      <!-- Main content -->
      <div class="content-wrapper">
        <% if (usuario != null) { %>
        <!-- Registration form -->
        <form
          action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jcmVzcG9uZGVy"
          method="post"
          accept-charset="ISO-8859-1"
        >
          <div class="row">
            <div class="col-lg-6 col-lg-offset-3">
              <div class="panel registration-form">
                <div class="panel-body">
                  <div class="text-center">
                    <div class="icon-object border-success text-gray">
                      <i class="icon-lock"></i>
                    </div>
                    <h6 class="content-group-lg text-uppercase text-bold">
                      Pergunta de Segurança
                    </h6>
                  </div>

                  <div class="form-group has-feedback">
                    Caro Utilizador, queira por favor responder a seguinte
                    pergunta de segurança.
                    <br />
                    <% EncryptUtils encryptUtils = new EncryptUtils(); String
                    pergunta =
                    encryptUtils.decodeString(usuario.getUsuaPerguntaSeguranca());
                    %>
                    <h6><strong><%=pergunta%></strong></h6>
                  </div>

                  <div class="form-group has-feedback">
                    <input
                      type="password"
                      class="form-control"
                      placeholder="Dê a sua resposta"
                      name="resposta"
                      required
                    />
                    <div class="form-control-feedback">
                      <i class="icon-question4 text-muted"></i>
                    </div>
                  </div>

                  <div class="text-right">
                    <button
                      type="submit"
                      onclick="this.disabled='disabled'; this.form.submit();"
                      class="btn text-bold text-uppercase bg-slate-800 btn-labeled btn-labeled-right ml-10"
                    >
                      <b><i class="icon-arrow-right14"></i></b> Enviar resposta
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </form>
        <!-- /registration form -->
        <% } %>
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
