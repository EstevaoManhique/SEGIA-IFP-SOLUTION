<template>
  <v-form class="form-horizontal">
    <div class="panel panel-flat">
      <div class="panel-heading">
        <h6 class="panel-title text-bold text-uppercase">
          Informe os dados do utilizador
        </h6>
        <div class="heading-elements">
          <ul class="icons-list">
            <li><a data-action="collapse"></a></li>
            <li><a data-action="reload"></a></li>
          </ul>
        </div>
      </div>

      <div class="panel-body">
        <div class="row">
          <div class="col-md-12">
            <fieldset>
              <legend class="text-semibold">
                <i class="icon-user-plus position-left"></i>
                Dados do utilizador
              </legend>

              <div class="form-group">
                <label
                  class="col-lg-3 control-label text-bold text-uppercase text-bold"
                  >Nome:</label
                >
                <div class="col-lg-9">
                  <div class="row">
                    <div class="col-md-6">
                      <input
                        type="text"
                        placeholder="Nome"
                        class="form-control"
                        v-model="user.name"
                        required=""
                      />
                    </div>
                    <div class="col-md-6">
                      <input
                        type="text"
                        placeholder="Apelido"
                        class="form-control"
                        name="apelido"
                        required=""
                        v-model="user.surname"
                      />
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label
                  class="col-lg-3 control-label text-bold text-uppercase text-bold"
                  >Contacto:</label
                >
                <div class="col-lg-9">
                  <div class="row">
                    <div class="col-md-6">
                      <input
                        type="text"
                        placeholder="+999-99-999-9999"
                        class="form-control"
                        required=""
                        v-model="user.contact"
                      />
                    </div>
                    <div class="col-md-6">
                      <input
                        type="email"
                        placeholder="Introduza o e-mail"
                        class="form-control"
                        name="email"
                        v-model="user.email"
                      />
                    </div>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <label
                  class="col-lg-3 control-label text-bold text-uppercase text-bold"
                  >Cargo:</label
                >
                <div class="col-lg-9">
                  <div class="row">
                    <div class="col-md-6">
                      <select class="select" name="idTipoUsuario" required="">
                        <optgroup label="Selecione um tipo">
                          <% if (tiposUsuario != null) { for (TipoUsuario tu :
                          tiposUsuario) { if
                          (!tu.getTipuDescricao().equals("Super Administrador")
                          && !tu.getTipuDescricao().equals("Cliente") &&
                          !tu.getTipuDescricao().equals("Operador") &&
                          !tu.getTipuDescricao().equals("Agente")) { %>
                          <option value="<%=tu.getTipuId()%>">
                            <%=tu.getTipuDescricao()%>
                          </option>

                          <% } } } %> <% if (cargo.equals("Tecnico Informatica")
                          || cargo.equals("Tecnico Informatica (Distrital)")) {
                          %>
                          <option value="20">Director Pedagogico</option>
                          <% } %>
                        </optgroup>
                      </select>
                    </div>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <label class="col-lg-3 control-label text-bold text-uppercase"
                  >Localização:</label
                >
                <div class="col-lg-9">
                  <div class="row">
                    <div class="col-md-6">
                      <select
                        id="make"
                        data-placeholder="Selecione a provincia"
                        class="select"
                        name="provincia"
                        v-model="user.province"
                      >
                        <option></option>
                        <% for (EdstProvince s : provincias) { String sel = "";
                        String desc = s.getName(); %>
                        <option value="<%=desc%>" <%="sel%">><%=desc%></option>
                        <% } %>
                      </select>
                    </div>

                    <div class="col-md-6">
                      <select
                        id="models"
                        data-placeholder="Selecione o distrito"
                        class="select"
                        name="distrito"
                        v-model="user.distrit"
                      >
                        <option></option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <label
                  class="col-lg-3 control-label text-bold text-uppercase text-bold"
                  >Escola:</label
                >

                <div class="col-lg-9">
                  <div class="row">
                    <div class="col-md-12">
                      <select
                        data-placeholder="Selecione a escola"
                        class="select"
                        name="nome"
                        required=""
                        v-model="user.school"
                      >
                        <option></option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </fieldset>

            <div class="text-right">
              <v-btn
                class="btn bg-slate-800 text-bold text-uppercase"
                @click="submit"
              >
                Gravar registo
                <i class="icon-arrow-right14 position-right"></i>
              </v-btn>

              <br />
            </div>
          </div>
        </div>
      </div>
    </div>
  </v-form>
</template>

<script>
import { mapActions } from 'vuex';
export default {
  name: 'AddAccount',

  data() {
    return {
      user: {
        name: '',
        surname: '',
        email: '',
        contact: '',
        school: '',
        province: '',
        distrit: '',
      },
    };
  },
  methods: {
    ...mapActions(['addUser']),
    submit() {
      this.addUser(this.user);
    },
  },
};
</script>

<style></style>
