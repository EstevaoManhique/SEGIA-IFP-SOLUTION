<template>
  <v-container>
    <nav-bar :menu_types="6" />
    <v-row>
      <!-- Main content -->
      <div class="content-wrapper">
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
              <li class="active text-bold text-uppercase">
                <a
                  href="#settings"
                  data-toggle="tab"
                  class="text-bold text-uppercase"
                  ><i class="icon-users4 position-left"></i> Inscrição do Aluno
                  (Formação Professores)</a
                >
              </li>
            </ul>
          </div>
        </div>
        <!-- /toolbar -->

        <div class="row">
          <div class="col-md-10 col-md-offset-1">
            <!-- Vertical form options -->

            <div class="content-group tab-content-bordered navbar-component">
              <div
                class="navbar navbar-inverse bg-slate-800"
                style="position: relative; z-index: 99"
              >
                <div class="navbar-header">
                  <h6
                    class="text-semibold class text-uppercase"
                    style="margin-left: 2em"
                  >
                    Formulário de Inscrição (Instituto de Formação de Professores)
                  </h6>

                  <ul class="nav navbar-nav pull-right visible-xs-block">
                    <li>
                      <a data-toggle="collapse" data-target="#demo1"
                        ><i class="icon-tree5"></i
                      ></a>
                    </li>
                  </ul>
                </div>

                <div class="navbar-collapse collapse" id="demo1">
                  <ul class="nav navbar-nav">
                    <li class="active">
                      <a
                        href="#tab-demo1"
                        data-toggle="tab"
                        class="text-bold text-uppercase"
                      >
                        <i class="icon-file-plus position-left"></i>
                        NOVO REGISTO
                      </a>
                    </li>

                    <li>
                      <a
                        href="#tab-demo2"
                        data-toggle="tab"
                        class="text-bold text-uppercase"
                        ><i class="icon-files-empty position-left"></i>
                        LISTA DE INSCRICOES
                        <span
                          class="
                            badge
                            bg-danger-800
                            badge-inline
                            position-right
                          "
                          >{{ users.length }}</span
                        >
                      </a>
                    </li>
                  </ul>
                </div>
              </div>

              <div class="tab-content">
                <div class="tab-pane fade active in has-padding" id="tab-demo1">
                  <!-- 2 columns form -->

                  <add-candidate />
                </div>
                <!-- /2 columns form -->

                <div class="tab-pane fade has-padding" id="tab-demo2">
                  <!-- Basic responsive configuration -->
                  <div class="panel panel-flat">
                    <div class="panel-heading">
                      <h6 class="panel-title text-bold text-uppercase">
                        Lista de inscritos
                      </h6>
                      <div class="heading-elements">
                        <ul class="icons-list">
                          <li><a data-action="collapse"></a></li>
                          <li><a data-action="reload"></a></li>
                        </ul>
                      </div>
                    </div>

                    <div class="panel-body">
                      <p>
                        <a
                          href=""
                          target="_blank"
                          class="
                            btn
                            bg-grey-300
                            btn-labeled btn-lg
                            text-bold text-uppercase
                          "
                        >
                          <b><i class="icon-printer2"></i></b>
                          Imprimir registos
                        </a>

                        <a
                          href=""
                          class="
                            btn
                            bg-danger-300
                            btn-labeled btn-lg
                            text-bold text-uppercase
                          "
                        >
                          <b><i class="icon-envelop5"></i></b>
                          Enviar cópia por e-mail
                        </a>
                      </p>
                    </div>
                    <v-row>
                      <v-data-table
                        :headers="headers"
                        :items="users"
                        class="elevation-1"
                        calculate-widths="false"
                      >
                        <template v-slot:item.estado="{ item }">
                          <v-chip v-if="item.status" color="success"
                            >Activo</v-chip
                          >
                          <v-chip v-else color="warning">Inactivo</v-chip>
                        </template>
                        <template v-slot:item.actions="{ item }">
                          <div class="btn-group">
                            <button
                              type="button"
                              class="btn bg-grey-600 btn-icon dropdown-toggle"
                              data-toggle="dropdown"
                            >
                              <i class="icon-menu7"></i> &nbsp;<span
                                class="caret"
                              ></span>
                            </button>

                            <ul
                              class="dropdown-menu dropdown-menu-right"
                              style="
                                width: 12em;
                                height: 3em;
                                line-height: 2em;
                                border: 1px solid #ccc;
                                padding: 0;
                                margin: 0;
                                overflow: scroll;
                                overflow-x: hidden;
                              "
                            >
                              <li>
                                <a
                                  ><i class="icon-reload-alt text-blue-800"></i>
                                  Redefinir senha</a
                                >
                              </li>
                              <li>
                                <a
                                  ><i class="icon-reload-alt text-blue-800"></i>
                                  Editar</a
                                >
                              </li>

                              <li v-if="item.status">
                                <a @click="changeStatus(item)"
                                  ><i class="icon-user-block text-danger"></i>
                                  Desactivar</a
                                >
                              </li>

                              <li v-else>
                                <a @click="changeStatus(item)"
                                  ><i class="icon-user-check text-success"></i>
                                  Activar</a
                                >
                              </li>

                              <li class="divider"></li>
                              <li>
                                <a
                                  href="#"
                                  data-toggle="modal"
                                  @click="deleteUser(item)"
                                  ><i
                                    class="icon-cancel-circle2 text-danger-800"
                                  ></i
                                  >Remover registo</a
                                >
                              </li>
                            </ul>
                          </div>
                        </template>
                      </v-data-table>
                    </v-row>
                  </div>
                  <!-- /basic responsive configuration -->
                </div>
              </div>
            </div>
          </div>
          <!-- /vertical form options -->
        </div>
      </div>
      <!-- /main content -->
    </v-row>
  </v-container>
</template>
  
  <script>
import NavBar from "@/components/layout/NavBar.vue";
import AddCandidate from "@/views/ifp/components/AddCandidate.vue";
import { mapGetters, mapActions } from "vuex";
export default {
  name: "HomeView",
  components: { NavBar, AddCandidate },
  data: () => ({
    headers: [
      { text: "#", value: "id" },
      { text: "Denominação", value: "name" },
      { text: "Utilizador", value: "email" },
      { text: "Grupo", value: "group" },
      { text: "Contacto", value: "person.contact" },
      { text: "Província", value: "province" },
      { text: "Distrito", value: "district" },
      { text: "Escola", value: "escola" },
      { text: "Estado", value: "estado" },
      { text: "Opções", value: "actions" },
    ],
  }),
  methods: {
    ...mapActions(["allUser", "updateUser", "removeUser"]),
    changeStatus(user) {
      user.status = !user.status;
      this.updateUser(user);
    },
    deleteUser(user) {
      this.removeUser(user);
    },
  },
  mounted() {
    this.allUser();
  },

  computed: {
    ...mapGetters(["users"]),
  },
};
</script>