<template>
    <v-container>
        <nav-bar :menu_types = "5"/>
        <v-row>
                                   <!-- Main content -->
                <div class="content-wrapper">



                  <!-- Toolbar -->
                  <div class="navbar navbar-default navbar-component navbar-xs">
                      <ul class="nav navbar-nav visible-xs-block">
                          <li class="full-width text-center"><a data-toggle="collapse" data-target="#navbar-filter"><i class="icon-menu7"></i></a></li>
                      </ul>

                      <div class="navbar-collapse collapse" id="navbar-filter">
                          <ul class="nav navbar-nav element-active-slate-400">
                              <li class="active"><a href="#settings" data-toggle="tab"  class="text-bold text-uppercase"><i class="icon-list3 position-left"></i> Inscrições do Aluno</a></li>
                          </ul>

                      </div>
                  </div>
                  <!-- /toolbar -->

                  <div class="row">

                      <div class="col-md-9 col-md-offset-1">
                          <!-- Basic responsive configuration -->
                          <div class="panel panel-flat">
                              <div class="panel-heading">
                                  <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Inscrições do aluno</h6>
                                  <div class="heading-elements">
                                      <ul class="icons-list">
                                          <li><a data-action="collapse"></a></li>
                                          <li><a data-action="reload"></a></li>

                                      </ul>
                                  </div>
                              </div>

                              <table class="table datatable-responsive">
                                  <thead>
                                      <tr>
                                          <th class="text-bold text-uppercase">#</th>
                                          <th class="text-bold text-uppercase">Ano</th>
                                          <th class="text-bold text-uppercase">Classe</th>
                                          <th class="text-bold text-uppercase">Horário</th>
                                          <th class="text-bold text-uppercase">Estado</th>
                                      </tr>
                                  </thead>
                                  <tbody>

                                      <!--
                                          if (inscricoes != null) {

                                              int x = 0;

                                              for (Inscricao i : inscricoes) {
                                                  String lbl = "label-default";
                                                  String txt = "---";

                                                  x++;

                                                  if (x == 1) {
                                                      lbl = "label-success";
                                                      txt = "Corrente";
                                                  }

                                                  String ref = encryptUtils.decodeString(i.getInscReferencia());
                                                  String ano = encryptUtils.decodeString(i.getInscAnoLectivo());
                                                  String curs = encryptUtils.decodeString(i.getCurso().getCursDescricao());
                                                  String hor = encryptUtils.decodeString(i.getTurma().getTurmHorario());

                                      -->
                                      <tr>
                                          <td><a href="#"><!--=ref--></a></td>
                                          <td><a href="#"><!--=ano--></a></td>
                                          <td><!--=curs--></td>
                                          <td><!--=hor--></td>
                                          <td><span class="label <!--=lbl-->"><!--=txt--></span></td>
                                      </tr>
                                      <!--
                                              }
                                          }
                                      -->
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
  name: 'AddStudent',
  components: { NavBar },
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
