<template>
  <v-container>
    <nav-bar :menu_types="3" />
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
                  ><i class="icon-users4 position-left"></i> Gestão de
                  Utilizadores</a
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
                    Sistema Electrónico de Gestão de Informação Académica
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
                        LISTA DE REGISTOS
                        <span
                          class="badge bg-danger-800 badge-inline position-right"
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

                  <add-account-form />
                </div>
                <!-- /2 columns form -->

                <div class="tab-pane fade has-padding" id="tab-demo2">
                  <!-- Basic responsive configuration -->
                  <div class="panel panel-flat">
                    <div class="panel-heading">
                      <h6 class="panel-title text-bold text-uppercase">
                        Lista dos utilizadores
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
                          href="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jaW1wcmltaXItdXN1YXJpb3M="
                          target="_blank"
                          class="btn bg-grey-300 btn-labeled btn-lg text-bold text-uppercase"
                        >
                          <b><i class="icon-printer2"></i></b>
                          Imprimir registos
                        </a>

                        <a
                          href="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jZW52aWFyLWxpc3RhLXVzdWFyaW9z"
                          class="btn bg-danger-300 btn-labeled btn-lg text-bold text-uppercase"
                        >
                          <b><i class="icon-envelop5"></i></b>
                          Enviar cópia por e-mail
                        </a>
                      </p>
                    </div>

                    <table class="table datatable-responsive">
                      <thead>
                        <tr>
                          <th class="text-bold text-uppercase">#</th>
                          <th class="text-bold text-uppercase">Denominação</th>
                          <th class="text-bold text-uppercase">Utilizador</th>
                          <th class="text-bold text-uppercase">Grupo</th>
                          <th class="text-bold text-uppercase">Contacto</th>
                          <th class="text-bold text-uppercase">Província</th>
                          <th class="text-bold text-uppercase">Distrito</th>
                          <th class="text-bold text-uppercase">Escola</th>
                          <th class="text-bold text-uppercase">Estado</th>
                          <th class="text-bold text-uppercase text-danger-400">
                            Opções
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr v-for="(user, index) in users" :key="index">
                          <td>
                            <a href="#">{{ user.id }}</a>
                          </td>
                          <td>
                            {{ user.person.name + ' ' + user.person.surname }}
                          </td>
                          <td>
                            <a href="#">{{ user.email }}</a>
                          </td>
                          <td class="text-bold"><%=tp%></td>
                          <td>{{ user.person.contact }}</td>
                          <td>{{ user.province }}</td>
                          <td>{{ user.distrit }}</td>
                          <td><%=esc%></td>
                          <td>
                            <span class="label">{{ user.status }}</span>
                          </td>
                          <td>
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
                                    ><i
                                      class="icon-reload-alt text-blue-800"
                                    ></i>
                                    Redefinir senha</a
                                  >
                                </li>

                                <li v-if="user.status">
                                  <a
                                    ><i class="icon-user-block text-danger"></i>
                                    Desactivar</a
                                  >
                                </li>

                                <li v-else>
                                  <a
                                    ><i
                                      class="icon-user-check text-success"
                                    ></i>
                                    Activar</a
                                  >
                                </li>

                                <li class="divider"></li>
                                <li v-if="user.admin">
                                  <a
                                    href="#"
                                    data-toggle="modal"
                                    data-target="#modal_rem_<%=id%>"
                                    ><i
                                      class="icon-cancel-circle2 text-danger-800"
                                    ></i
                                    >Remover registo</a
                                  >
                                </li>
                              </ul>
                            </div>

                            <!-- Danger modal -->
                            <div
                              id="modal_rem_<%=id%>"
                              class="modal fade text-center"
                            >
                              <div class="modal-dialog">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <button
                                      type="button"
                                      class="close"
                                      data-dismiss="modal"
                                    >
                                      &times;
                                    </button>
                                    <h6 class="modal-title text-semibold">
                                      Confirma a remoção do utilizador com a
                                      referência #<%=id%> ?
                                    </h6>
                                  </div>
                                  <div class="modal-body">
                                    <h6 class="text-bold text-danger">
                                      <i
                                        class="icon-question6 text-danger"
                                        style="font-size: 100px"
                                      ></i>
                                    </h6>
                                  </div>

                                  <div class="modal-footer">
                                    <button
                                      type="button"
                                      class="btn btn-link"
                                      data-dismiss="modal"
                                    >
                                      Cancelar
                                    </button>

                                    <a
                                      href="VXN1YXJpb1NlcnZsZXQjRENJ?<%=actR%>"
                                      class="btn btn-danger text-bold text-uppercase"
                                      >Sim, confirmo !</a
                                    >
                                  </div>
                                </div>
                              </div>
                            </div>
                            <!-- /default modal -->
                          </td>
                        </tr>
                      </tbody>
                    </table>
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
import NavBar from '@/components/layout/NavBar.vue';
import AddAccountForm from '@/components/acessos/AddAccountForm.vue';
import { mapGetters, mapActions } from 'vuex';
export default {
  name: 'HomeView',
  components: { NavBar, AddAccountForm },
  data: () => ({}),
  methods: {
    ...mapActions(['allUser']),
  },
  mounted() {
    this.allUser();
  },

  computed: {
    ...mapGetters(['users']),
  },
};
</script>
