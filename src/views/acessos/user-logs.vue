<template>
  <v-container>
    <nav-bar :menu_types="2" />
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
              <li class="active">
                <a
                  href="#settings"
                  data-toggle="tab"
                  class="text-bold text-uppercase"
                  ><i class="icon-spinner10 spinner position-left"></i>
                  Actividades dos Utilizadores</a
                >
              </li>
            </ul>
          </div>
        </div>
        <!-- /toolbar -->

        <div class="row">
          <div class="col-md-3">
            <!-- Basic layout-->
            <form
              class="form-horizontal"
              method="post"
              accept-charset="ISO-8859-1"
              action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jbG9ncw=="
            >
              <div class="panel panel-flat">
                <div class="panel-heading">
                  <h6 class="panel-title text-bold text-uppercase">
                    Selecione o Periodo
                  </h6>
                  <div class="heading-elements">
                    <ul class="icons-list">
                      <li><a data-action="collapse"></a></li>
                      <li><a data-action="reload"></a></li>
                    </ul>
                  </div>
                </div>

                <div class="panel-body">
                  <div class="form-group">
                    <label class="text-bold text-uppercase"
                      >Periodo (Data):
                    </label>

                    <div class="input-group">
                      <span class="input-group-addon"
                        ><i class="icon-calendar22"></i
                      ></span>
                      <input
                        type="text"
                        class="form-control daterange-weeknumbers"
                        name="dataMonitoramento"
                        required=""
                        <%="periodo%"
                      />>
                    </div>
                  </div>

                  <div class="text-right">
                    <button
                      type="submit"
                      onclick="this.disabled='disabled'; this.form.submit();"
                      class="btn text-bold text-uppercase text-uppercase text-bold bg-orange-800"
                    >
                      Filtrar resultados
                      <i class="icon-filter3 position-right"></i>
                    </button>
                  </div>
                </div>
              </div>
            </form>
            <!-- /basic layout -->
          </div>

          <div class="col-md-9">
            <!-- Basic responsive configuration -->
            <div class="panel panel-flat">
              <div class="panel-heading">
                <h6 class="panel-title text-bold text-uppercase">
                  Actividades do usuário
                  <span class="text-danger">(<%=dataSelecionada%>)</span>
                </h6>
                <div class="heading-elements">
                  <ul class="icons-list">
                    <li><a data-action="collapse"></a></li>
                    <li><a data-action="reload"></a></li>
                  </ul>
                </div>
              </div>

              <div class="panel-body">
                A lista de registos abaixo é composta pelas actividades
                realizadas pelos usuários dentro do sistema
                <code><b>SEGIA - </b></code>, nesta lista podem ser encontrados
                registos de <code>login</code>, <code>insersões</code>,
                <code>pesquisas</code>, etc.
              </div>

              <table class="table datatable-responsive">
                <thead>
                  <tr>
                    <th class="text-bold text-uppercase">#</th>
                    <th class="text-bold text-uppercase">Data e Hora</th>
                    <th class="text-bold text-uppercase">Usuário</th>
                    <th class="text-bold text-uppercase">Descrição</th>
                  </tr>
                </thead>
                <tbody>
                  <% if (logs != null) { for (Log l : logs) { String desc =
                  l.getLogDescricao(); String hor =
                  sdf.format(l.getLogData().toGregorianCalendar().getTime());
                  String nm =
                  encryptUtils.decodeString(l.getUsuario().getPessoapess().getPessNome())
                  + " " +
                  encryptUtils.decodeString(l.getUsuario().getPessoapess().getPessApelido());
                  int id = l.getLogId(); %>
                  <tr>
                    <td><a href="#"><%=id%></a></td>
                    <td><%=hor%></td>
                    <td><%=nm%></td>
                    <td><%=desc%></td>
                  </tr>
                  <% } } %>
                </tbody>
              </table>
            </div>
            <!-- /basic responsive configuration -->
          </div>
        </div>
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
