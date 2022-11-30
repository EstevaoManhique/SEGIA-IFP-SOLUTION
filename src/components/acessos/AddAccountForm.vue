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
                      <v-select
                        :items="user_groups"
                        label="CARGO:"
                        dense
                        v-model="user.cargo"
                      ></v-select>
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
                      <v-select
                        :items="user_groups"
                        label="Province"
                        dense
                        v-model="user.province"
                      ></v-select>
                    </div>

                    <div class="col-md-6">
                      <v-select
                        :items="user_groups"
                        label="distrito"
                        dense
                        v-model="user.distrit"
                      ></v-select>
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
                      <v-select
                        :items="user_groups"
                        label="Escola"
                        dense
                        v-model="user.escola"
                      ></v-select>
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
        cargo: '',
        province: '',
        distrit: '',
      },
      user_groups: [
        'Administrador',
        'Chefe Secretaria',
        'Chefe Turma',
        'Coordenador Cultura',
        'Coordenador Desportivo',
        'Coordenador Saude',
        'Director Adjunto Administrativo 2 Ciclo',
        'Director Adjunto Geral',
        'Director Classe',
        'Director Disciplina',
        'Director Escola',
        'Director Pedagogico',
        'Director Turma',
        'Docente',
        'Funcionario',
        'Gestor',
        'Tecnico Informativo',
        'Tecnico Informativo (Distrital)',
      ],
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
