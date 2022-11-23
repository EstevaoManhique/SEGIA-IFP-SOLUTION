<template>
  <v-container>
    <nav-bar :menu_types="2" />
    <v-row>
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
                  ><i class="icon-calendar3 position-left"></i> Calendário
                  Exames</a
                >
              </li>
            </ul>
          </div>
        </div>
        <!-- /toolbar -->

        <div class="row">
          <!-- Vertical form options -->
          <div class="col-md-6">
            <!-- Basic layout-->

            <form
              method="post"
              accept-charset="ISO-8859-1"
              action="MTJDbGFzc2VTZXJ2bGV0I0RDSQ==?YWNjYW8jY2FsZW5kYXJpbw=="
            >
              <div class="panel panel-flat">
                <div class="panel-body">
                  <div class="form-group">
                    <div class="col-lg-12">
                      <div class="row">
                        <div class="col-md-7">
                          <select class="select" name="idCurso">
                            <optgroup label="Selecione a classe">
                              <% if (cursos != null) { for (Curso c : cursos) {
                              int id = c.getCursId(); String desc =
                              encryptUtils.decodeString(c.getCursCod()) + " - "
                              + encryptUtils.decodeString(c.getCursDescricao());
                              String sel = ""; if (curso != null) { if (id ==
                              curso.getCursId()) { sel = "selected"; } } %>
                              <option value="<%=id%>" <%="sel%">
                                ><%=desc%>
                              </option>
                              <% } } %>
                            </optgroup>
                          </select>
                        </div>

                        <div class="col-md-3">
                          <button
                            type="submit"
                            onclick="this.disabled = 'disabled';
                                            this.form.submit();"
                            class="btn bg-slate-800 btn-labeled text-bold text-uppercase"
                          >
                            <b><i class="icon-search4 position-right"></i></b>
                            Filtrar Classe
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </form>
            <!-- /basic layout -->
          </div>

          <!-- Vertical form options -->
          <div class="col-md-6">
            <!-- Basic layout-->

            <form
              method="post"
              accept-charset="ISO-8859-1"
              action="MTJDbGFzc2VTZXJ2bGV0I0RDSQ==?YWNjYW8jY2FsZW5kYXJpbw=="
            >
              <div class="panel panel-flat">
                <div class="panel-body">
                  <div class="form-group">
                    <div class="col-lg-12">
                      <div class="row">
                        <div class="col-md-7">
                          <select class="select" name="idDisciplina">
                            <optgroup label="Selecione disciplina">
                              <% if (disciplinas != null) { for (Disciplina d :
                              disciplinas) { int id = d.getDiscId(); String desc
                              = encryptUtils.decodeString(d.getDiscDescricao());
                              String sel = ""; if (disciplina != null) { if (id
                              == disciplina.getDiscId()) { sel = "selected"; } }
                              %>
                              <option value="<%=id%>" <%="sel%">
                                ><%=desc%>
                              </option>
                              <% } } %>
                            </optgroup>
                          </select>
                        </div>

                        <div class="col-md-3">
                          <button
                            type="submit"
                            onclick="this.disabled = 'disabled'; this.form.submit();"
                            class="btn bg-orange-600 btn-labeled text-bold text-uppercase"
                          >
                            <b><i class="icon-search4 position-right"></i></b>
                            Filtrar Disciplina
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </form>
            <!-- /basic layout -->
          </div>
          <!-- /vertical form options -->
        </div>
        <!-- /row.1-->

        <!-- Main charts -->
        <div class="row">
          <div class="col-lg-12">
            <!-- Event colors -->
            <div class="panel panel-flat">
              <div class="panel-body">
                <div class="fullcalendar-event-colors"></div>
              </div>
            </div>
            <!-- /event colors -->
          </div>
        </div>
        <!-- /.main charts -->
      </div>
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
