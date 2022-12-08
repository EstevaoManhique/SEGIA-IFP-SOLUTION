<template>
  <v-form class="form-horizontal m-auto">
      <div class="panel-heading">
        <h6 class="panel-title text-bold text-uppercase"> 
          Informe os dados do candidato
        </h6>
      </div>

      <div class="panel-body m-auto">
        <div class="row">
          <div class="col-md-12">
            <fieldset>
              <legend class="text-semibold">
                <i class="icon-user-plus position-left"></i>
                Dados do candidato
              </legend>

              <div class="form-group">
                <div class="col-lg-9">
                  <div class="row">
                    <div class="col-md-6">
                      <label
                        class="control-label text-bold text-uppercase text-bold"
                        >Nome:</label
                      >
                      <input
                        type="text"
                        placeholder="Primeiro Nome"
                        class="form-control"
                        v-model="user.name"
                        required=""
                      />
                    </div>
                    <div class="col-md-6">
                      <label
                        class="control-label text-bold text-uppercase text-bold"
                        >Outros Nomes:</label
                      >
                      <input
                        type="text"
                        placeholder="Outros Nomes"
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
                <div class="col-lg-9">
                  <div class="row">
                    <div class="col-md-6">
                      <label
                        class="control-label text-bold text-uppercase text-bold"
                        >Contacto:</label
                      >
                      <input
                        type="text"
                        placeholder="(+258) 8X.XXXXXXX"
                        class="form-control"
                        required=""
                        v-model="user.contact"
                      />
                    </div>
                    <div class="col-md-6">
                      <label
                        class="control-label text-bold text-uppercase text-bold"
                        >Email:</label
                      >
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
                <div class="col-lg-9">
                  <div class="row">
                    <div class="col-md-6">
                      <label
                        class="control-label text-bold text-uppercase text-bold"
                        >Data de Nascimento:</label
                      >
                      <input
                        type="date"
                        placeholder="Data de nascimento"
                        class="form-control"
                        name="data_nascimento"
                        v-model="user.email"
                      />
                    </div>
                    <div class="col-md-6">
                      <label
                        class="control-label text-bold text-uppercase text-bold"
                        >Identificação:</label
                      >
                      <input
                        type="text"
                        placeholder="BI/DIRE/Passaporte N.º"
                        class="form-control"
                        name="email"
                        v-model="user.email"
                      />
                    </div>
                    <v-radio-group class="ms-3" v-model="row" row>
                      <v-radio label="Masculino" value="radio-1"></v-radio>
                      <v-radio label="Femenino" value="radio-2"></v-radio>
                    </v-radio-group>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="col-lg-9">
                  <div class="row">
                    <div class="col-md-6">
                      <v-select
                        :items="user_groups"
                        label="Para qual provincia concorre"
                        dense
                        v-model="user.province"
                      ></v-select>
                    </div>

                    <div class="col-md-6">
                      <v-select
                        :items="user_groups"
                        label="Selecione o distrito"
                        dense
                        v-model="user.distrit"
                      ></v-select>
                    </div>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="col-lg-9">
                  <div class="row">
                    <div class="col-md-6">
                      <v-select
                        :items="user_groups"
                        label="Escolha a Instituicao de formacao"
                        dense
                        v-model="user.escola"
                      ></v-select>
                    </div>
                    <div class="col-md-6">
                      <v-select
                        :items="user_groups"
                        label="Escolha o curso que pretente frequentar"
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
 
  </v-form>
</template>

<script>
import { mapActions } from "vuex";
export default {
  name: "AddAccount",

  data() {
    return {
      user: {
        name: "",
        surname: "",
        email: "",
        contact: "",
        school: "",
        cargo: "",
        province: "",
        distrit: "",
      },
      user_groups: [
        "Administrador",
        "Chefe Secretaria",
        "Chefe Turma",
        "Coordenador Cultura",
        "Coordenador Desportivo",
        "Coordenador Saude",
        "Director Adjunto Administrativo 2 Ciclo",
        "Director Adjunto Geral",
        "Director Classe",
        "Director Disciplina",
        "Director Escola",
        "Director Pedagogico",
        "Director Turma",
        "Docente",
        "Funcionario",
        "Gestor",
        "Tecnico Informativo",
        "Tecnico Informativo (Distrital)",
      ],
    };
  },
  methods: {
    ...mapActions(["addUser"]),
    submit() {
      this.addUser(this.user);
    },
  },
};
</script>

<style></style>
