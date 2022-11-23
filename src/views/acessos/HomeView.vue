<template>
  <v-container>
    <v-row>
      <!-- Page content -->
      <div class="page-content">
        <!-- Main sidebar -->
        <div class="sidebar sidebar-main">
          <div class="sidebar-content">
            <!-- REQUISIÇÕES -->
            <div class="sidebar-category">
              <div class="category-title">
                <span><B>GESTÃO DE UTILIZADORES</B></span>
                <ul class="icons-list">
                  <li>
                    <a href="#" data-action="collapse"></a>
                  </li>
                </ul>
              </div>

              <div class="category-content">
                <div class="row">
                  <div class="col-xs-12">
                    <form
                      action="TW9kdWxvU2VydmxldCNEQ0k=?YWNjYW8jY29udHJvbG8tYWNlc3Nv"
                      method="post"
                    >
                      <button
                        class="btn bg-orange-600 btn-block btn-float btn-float-lg"
                        type="submit"
                      >
                        <i class="icon-meter-fast"></i>
                        <span class="text-bold text-uppercase"
                          >Painel Principal</span
                        >
                      </button>
                    </form>
                  </div>
                </div>
                <div class="row">
                  <div class="col-xs-12">
                    <br />
                    <form
                      action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jdXN1YXJpb3M="
                      method="post"
                    >
                      <button
                        class="btn bg-slate-800 btn-block btn-float btn-float-lg"
                        type="submit"
                      >
                        <i class="icon-user-plus"></i>
                        <span class="text-bold text-uppercase"
                          >Utilizadores</span
                        >
                      </button>
                    </form>
                  </div>
                </div>

                <div class="row">
                  <div class="col-xs-12">
                    <br />

                    <form
                      action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jcGVybWlzc29lcw=="
                      method="post"
                    >
                      <button
                        class="btn bg-slate-800 btn-block btn-float btn-float-lg"
                        type="submit"
                      >
                        <i class="icon-user-lock"></i>
                        <span class="text-bold text-uppercase">Permissões</span>
                      </button>
                    </form>
                  </div>
                </div>
                <div class="row">
                  <div class="col-xs-12">
                    <br />

                    <form
                      action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jbG9ncw=="
                      method="post"
                    >
                      <button
                        class="btn bg-slate-800 btn-block btn-float btn-float-lg"
                        type="submit"
                      >
                        <i class="icon-spinner10 spinner"></i>
                        <span class="text-bold text-uppercase">Logs</span>
                      </button>
                    </form>
                  </div>
                  <div class="col-xs-12">
                    <br />

                    <form
                      action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jY29uZXhvZXM="
                      method="post"
                    >
                      <button
                        class="btn bg-slate-800 btn-block btn-float btn-float-lg"
                        type="submit"
                      >
                        <i class="icon-collaboration"></i>
                        <span class="text-bold text-uppercase">Conectados</span>
                      </button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
            <!-- /requisições -->
          </div>
        </div>
        <!-- /main sidebar -->

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
              <ul class="nav navbar-nav element-active-orange-400">
                <li class="active">
                  <a
                    href="#settings"
                    data-toggle="tab"
                    class="text-bold text-uppercase"
                    ><i class="icon-users2 position-left"></i>
                    Gestão de Utilizadores
                    <span class="text-danger-400"> (Painel Principal)</span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <!-- /toolbar -->

          <!-- Content area -->
          <div class="content">
            <!-- Main charts -->
            <div class="row">
              <div class="col-lg-6">
                <!-- Traffic sources -->
                <div class="panel panel-flat">
                  <div class="panel-heading">
                    <h6 class="panel-title text-bold text-uppercase">
                      Resumo do tráfego
                    </h6>
                    <div class="heading-elements">
                      <form class="heading-form" action="#">
                        <div class="form-group">
                          <label
                            class="checkbox-inline checkbox-switchery checkbox-right switchery-xs text-bold text-uppercase"
                          >
                            <input
                              type="checkbox"
                              class="switch"
                              checked="checked"
                            />
                            Em tempo real:
                          </label>
                        </div>
                      </form>
                    </div>
                  </div>

                  <div class="container-fluid">
                    <div class="row">
                      <div class="col-lg-4">
                        <ul class="list-inline text-center">
                          <li>
                            <a
                              href="#"
                              class="btn border-teal text-teal btn-flat btn-rounded btn-icon btn-xs valign-text-bottom"
                              ><i class="icon-plus3"></i
                            ></a>
                          </li>
                          <li class="text-left">
                            <div class="text-bold text-uppercase">
                              Novas visitas
                            </div>
                            <div class="text-muted">2,349 avg</div>
                          </li>
                        </ul>

                        <div class="col-lg-10 col-lg-offset-1">
                          <div class="content-group" id="new-visitors"></div>
                        </div>
                      </div>

                      <div class="col-lg-4">
                        <ul class="list-inline text-center">
                          <li>
                            <a
                              href="#"
                              class="btn border-warning-400 text-warning-400 btn-flat btn-rounded btn-icon btn-xs valign-text-bottom"
                              ><i class="icon-watch2"></i
                            ></a>
                          </li>
                          <li class="text-left">
                            <div class="text-bold text-uppercase">
                              Tempo em sessão
                            </div>
                            <div class="text-muted">01:20 avg</div>
                          </li>
                        </ul>

                        <div class="col-lg-10 col-lg-offset-1">
                          <div class="content-group" id="new-sessions"></div>
                        </div>
                      </div>

                      <div class="col-lg-4">
                        <ul class="list-inline text-center">
                          <li>
                            <a
                              href="#"
                              class="btn border-indigo-400 text-indigo-400 btn-flat btn-rounded btn-icon btn-xs valign-text-bottom"
                              ><i class="icon-people"></i
                            ></a>
                          </li>
                          <li class="text-left">
                            <div class="text-bold text-uppercase">
                              Total online
                            </div>
                            <div class="text-muted">
                              <span
                                class="status-mark border-success position-left"
                              ></span>
                              5,378 avg
                            </div>
                          </li>
                        </ul>

                        <div class="col-lg-10 col-lg-offset-1">
                          <div class="content-group" id="total-online"></div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="position-relative" id="traffic-sources"></div>
                </div>
                <!-- /traffic sources -->
              </div>

              <div class="col-lg-6">
                <!-- Progress counters -->
                <div class="row">
                  <div class="col-md-4">
                    <!-- Available hours -->
                    <div class="panel text-center">
                      <div class="panel-body">
                        <div class="heading-elements">
                          <ul class="icons-list">
                            <li class="dropdown text-muted">
                              <a
                                href="#"
                                class="dropdown-toggle"
                                data-toggle="dropdown"
                                ><i class="icon-cog3"></i>
                                <span class="caret"></span
                              ></a>
                              <ul class="dropdown-menu dropdown-menu-right">
                                <li>
                                  <a href="#"
                                    ><i class="icon-sync"></i> Update data</a
                                  >
                                </li>
                                <li>
                                  <a href="#"
                                    ><i class="icon-list-unordered"></i>
                                    Detailed log</a
                                  >
                                </li>
                                <li>
                                  <a href="#"
                                    ><i class="icon-pie5"></i> Statistics</a
                                  >
                                </li>
                                <li>
                                  <a href="#"
                                    ><i class="icon-cross3"></i> Clear list</a
                                  >
                                </li>
                              </ul>
                            </li>
                          </ul>
                        </div>

                        <!-- Progress counter -->
                        <div
                          class="content-group-sm svg-center position-relative"
                          id="hours-available-progress"
                        ></div>
                        <!-- /progress counter -->

                        <!-- Bars -->
                        <div id="hours-available-bars"></div>
                        <!-- /bars -->
                      </div>
                    </div>
                    <!-- /available hours -->
                  </div>

                  <div class="col-md-4">
                    <!-- Productivity goal -->
                    <div class="panel text-center">
                      <div class="panel-body">
                        <div class="heading-elements">
                          <ul class="icons-list">
                            <li class="dropdown text-muted">
                              <a
                                href="#"
                                class="dropdown-toggle"
                                data-toggle="dropdown"
                                ><i class="icon-cog3"></i>
                                <span class="caret"></span
                              ></a>
                              <ul class="dropdown-menu dropdown-menu-right">
                                <li>
                                  <a href="#"
                                    ><i class="icon-sync"></i> Update data</a
                                  >
                                </li>
                                <li>
                                  <a href="#"
                                    ><i class="icon-list-unordered"></i>
                                    Detailed log</a
                                  >
                                </li>
                                <li>
                                  <a href="#"
                                    ><i class="icon-pie5"></i> Statistics</a
                                  >
                                </li>
                                <li>
                                  <a href="#"
                                    ><i class="icon-cross3"></i> Clear list</a
                                  >
                                </li>
                              </ul>
                            </li>
                          </ul>
                        </div>

                        <!-- Progress counter -->
                        <div
                          class="content-group-sm svg-center position-relative"
                          id="goal-progress"
                        ></div>
                        <!-- /progress counter -->

                        <!-- Bars -->
                        <div id="goal-bars"></div>
                        <!-- /bars -->
                      </div>
                    </div>
                    <!-- /productivity goal -->
                  </div>

                  <div class="col-md-4">
                    <!-- Productivity goal -->
                    <div class="panel text-center">
                      <div class="panel-body">
                        <div class="heading-elements">
                          <ul class="icons-list">
                            <li class="dropdown text-muted">
                              <a
                                href="#"
                                class="dropdown-toggle"
                                data-toggle="dropdown"
                                ><i class="icon-cog3"></i>
                                <span class="caret"></span
                              ></a>
                              <ul class="dropdown-menu dropdown-menu-right">
                                <li>
                                  <a href="#"
                                    ><i class="icon-sync"></i> Update data</a
                                  >
                                </li>
                                <li>
                                  <a href="#"
                                    ><i class="icon-list-unordered"></i>
                                    Detailed log</a
                                  >
                                </li>
                                <li>
                                  <a href="#"
                                    ><i class="icon-pie5"></i> Statistics</a
                                  >
                                </li>
                                <li>
                                  <a href="#"
                                    ><i class="icon-cross3"></i> Clear list</a
                                  >
                                </li>
                              </ul>
                            </li>
                          </ul>
                        </div>

                        <!-- Progress counter -->
                        <div
                          class="content-group-sm svg-center position-relative"
                          id="goal-progress_2"
                        ></div>
                        <!-- /progress counter -->

                        <!-- Bars -->
                        <div id="goal-bars_2"></div>
                        <!-- /bars -->
                      </div>
                    </div>
                    <!-- /productivity goal -->
                  </div>
                </div>
                <!-- /progress counters -->

                <!-- Quick stats boxes -->
                <div class="row">
                  <br />
                  <br />
                  <br />
                  <div class="col-lg-4">
                    <!-- Members online -->
                    <div class="panel bg-teal-400">
                      <div class="panel-body">
                        <div class="heading-elements">
                          <span class="heading-text badge bg-teal-800"
                            >+53,6%</span
                          >
                        </div>

                        <h3 class="no-margin">4</h3>
                        Utilizadores online
                        <div class="text-muted text-size-small">1 avg</div>
                      </div>

                      <div class="container-fluid">
                        <div id="members-online"></div>
                      </div>
                    </div>
                    <!-- /members online -->
                  </div>

                  <div class="col-lg-4">
                    <!-- Current server load -->
                    <div class="panel bg-pink-400">
                      <div class="panel-body">
                        <div class="heading-elements">
                          <ul class="icons-list">
                            <li class="dropdown">
                              <a
                                href="#"
                                class="dropdown-toggle"
                                data-toggle="dropdown"
                                ><i class="icon-cog3"></i>
                                <span class="caret"></span
                              ></a>
                              <ul class="dropdown-menu dropdown-menu-right">
                                <li>
                                  <a href="#"
                                    ><i class="icon-sync"></i> Update data</a
                                  >
                                </li>
                                <li>
                                  <a href="#"
                                    ><i class="icon-list-unordered"></i>
                                    Detailed log</a
                                  >
                                </li>
                                <li>
                                  <a href="#"
                                    ><i class="icon-pie5"></i> Statistics</a
                                  >
                                </li>
                                <li>
                                  <a href="#"
                                    ><i class="icon-cross3"></i> Clear list</a
                                  >
                                </li>
                              </ul>
                            </li>
                          </ul>
                        </div>

                        <h3 class="no-margin">55.4%</h3>
                        Carga acutal do CPU
                        <div class="text-muted text-size-small">34.6% avg</div>
                      </div>

                      <div id="server-load"></div>
                    </div>
                    <!-- /current server load -->
                  </div>

                  <div class="col-lg-4">
                    <!-- Today's revenue -->
                    <div class="panel bg-blue-400">
                      <div class="panel-body">
                        <div class="heading-elements">
                          <ul class="icons-list">
                            <li>
                              <a data-action="reload"></a>
                            </li>
                          </ul>
                        </div>

                        <h3 class="no-margin">18,390</h3>
                        Logs por semana
                        <div class="text-muted text-size-small">1,578 avg</div>
                      </div>

                      <div id="today-revenue"></div>
                    </div>
                    <!-- /today's revenue -->
                  </div>
                </div>
                <!-- /quick stats boxes -->
              </div>
            </div>
            <!-- /main charts -->

            <% String ano=session.getAttribute("ano").toString(); %>
          </div>
        </div>
        <!-- /main content -->
      </div>
      <!-- /page content -->
    </v-row>
  </v-container>
</template>

<script>
import { mapGetters } from 'vuex';
export default {
  name: 'HomeView',
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
