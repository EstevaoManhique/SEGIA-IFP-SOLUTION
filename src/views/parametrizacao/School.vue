<template>
  <v-container>
    <nav-bar :menu_types="5" />
    <v-container>
      <v-row>
        <div class="navbar navbar-default navbar-component navbar-xs">
          <ul class="nav navbar-nav visible-xs-block">
            <li class="full-width text-center">
              <a data-toggle="collapse" data-target="#navbar-filter"
                ><i class="icon-menu7"></i
              ></a>
            </li>
          </ul>

          <div class="navbar-collapse collapse" id="navbar-filter">
            <ul class="nav navbar-nav element-active-orange-400">
              <li class="active">
                <a
                  href="#settings"
                  data-toggle="tab"
                  class="text-bold text-uppercase"
                  ><i class="icon-city position-left"></i> Escolas</a
                >
              </li>
            </ul>
          </div>
        </div>
      </v-row>

      <v-row>
        <v-col cols="12" sm="6"> Filtrar Provincia </v-col>
        <v-col cols="12" sm="6"> Filtrar Distrito </v-col>
      </v-row>

      <v-row>
        <h1>Listagem de escolas [Provincia|Distrito]</h1>
      </v-row>
      <v-row>
        <v-data-table
          :headers="headers"
          :items="users"
          class="elevation-1"
          calculate-widths="false"
        >
          <template v-slot:item.actions="{ item }">
            <div class="btn-group">
              <button
                type="button"
                class="btn bg-grey-600 btn-icon dropdown-toggle"
                data-toggle="dropdown"
              >
                <i class="icon-menu7"></i> &nbsp;<span class="caret"></span>
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
                    ><i class="icon-reload-alt text-blue-800"></i> Redefinir
                    senha</a
                  >
                </li>
                <li>
                  <a><i class="icon-reload-alt text-blue-800"></i> Editar</a>
                </li>

                <li v-if="item.status">
                  <a @click="changeStatus(item)"
                    ><i class="icon-user-block text-danger"></i> Desactivar</a
                  >
                </li>

                <li v-else>
                  <a @click="changeStatus(item)"
                    ><i class="icon-user-check text-success"></i> Activar</a
                  >
                </li>

                <li class="divider"></li>
                <li>
                  <a href="#" data-toggle="modal" @click="deleteUser(item)"
                    ><i class="icon-cancel-circle2 text-danger-800"></i>Remover
                    registo</a
                  >
                </li>
              </ul>
            </div>
          </template>
        </v-data-table>
      </v-row>
      <!-- Main content -->
      <div class="content-wrapper">
        <!-- Toolbar -->

        <!-- /toolbar -->

        <!-- User profile -->
        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-flat">
              <div class="panel-heading">
                <h6 class="panel-title text-bold text-uppercase">
                  Listagem das Escolas
                  <span class="text-danger-600">[ <%=prov%> | <%=dist%> ]</span>
                </h6>
                <div class="heading-elements">
                  <ul class="icons-list">
                    <li>
                      <a data-action="collapse"></a>
                    </li>
                    <li>
                      <a data-action="reload"></a>
                    </li>
                  </ul>
                </div>
              </div>

              <div class="panel-body">
                <table
                  class="table datatable-responsive table-bordered table-striped"
                >
                  <thead>
                    <tr>
                      <th class="text-bold text-uppercase">#</th>
                      <th class="text-bold text-uppercase">Escola</th>
                      <th class="text-bold text-uppercase">Abreviatura</th>
                      <th class="text-bold text-uppercase">Tipo Ensino</th>
                      <th class="text-bold text-uppercase">Distrito</th>
                      <th class="text-bold text-uppercase">Zip</th>
                      <th class="text-bold text-uppercase text-danger">---</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="text-bold">
                        <a href="#"> <%=key%> </a>
                      </td>
                      <td class="text-bold"><%=nm%></td>
                      <td class="text-bold text-danger-600"><%=abrev%></td>
                      <td><%=tip%></td>
                      <td><%=dis%></td>
                      <td><%=zi%></td>

                      <td>
                        <a
                          href="#"
                          data-toggle="modal"
                          data-target="#modal_info_<%=id%>"
                          data-popup="tooltip"
                          title="Mais detalhes da Escola"
                          ><i class="icon-info22 text-primary-600"></i
                        ></a>

                        <!-- Table modal -->
                        <div id="modal_info_<%=id%>" class="modal fade">
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
                                <h6
                                  class="modal-title text-bold text-uppercase text-danger"
                                >
                                  <%=nm%>
                                </h6>
                              </div>
                              <div class="modal-body">
                                <table class="table">
                                  <tbody>
                                    <tr>
                                      <td class="text-bold text-uppercase">
                                        Posto Administrativo
                                      </td>
                                      <td><%=posto%></td>
                                    </tr>
                                    <tr>
                                      <td class="text-bold text-uppercase">
                                        Localidade
                                      </td>
                                      <td><%=loc%></td>
                                    </tr>
                                    <tr>
                                      <td class="text-bold text-uppercase">
                                        Nível de Ensino
                                      </td>
                                      <td><%=are%></td>
                                    </tr>
                                    <tr>
                                      <td class="text-bold text-uppercase">
                                        Ano Integração
                                      </td>
                                      <td><%=an%></td>
                                    </tr>
                                    <tr>
                                      <td class="text-bold text-uppercase">
                                        Longitude
                                      </td>
                                      <td><%=coorX%></td>
                                    </tr>
                                    <tr>
                                      <td class="text-bold text-uppercase">
                                        Latitude
                                      </td>
                                      <td><%=coorY%></td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>

                              <div class="modal-footer">
                                <button
                                  type="button"
                                  class="btn text-bold text-uppercase btn-link"
                                  data-dismiss="modal"
                                >
                                  Fechar
                                </button>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- /table modal -->
                      </td>
                    </tr>
                    <% } } %>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <!-- /row.2 -->
      </div>
      <!-- /main content -->
    </v-container>
  </v-container>
</template>

<script>
import NavBar from '@/components/layout/NavBar.vue';
import { mapGetters } from 'vuex';
export default {
  name: 'HomeView',
  components: { NavBar },
  data: () => ({
    headers: [
      { text: '#', value: '' },
      { text: 'Escola', value: '' },
      { text: 'Abreviatura', value: '' },
      { text: 'Tipo Ensino', value: '' },
      { text: 'Distrito', value: '' },
      { text: 'Zip', value: '' },
      { text: 'Opcoes', value: '' },
    ],
  }),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
