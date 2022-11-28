<template>
  <v-container>
    <nav-bar :menu_types = "6"/>
    <v-row>
                            <!-- Main content -->
                            <div class="content-wrapper">


                              <!-- Toolbar -->
                              <div class="navbar navbar-default navbar-component navbar-xs">
                                  <ul class="nav navbar-nav visible-xs-block">
                                      <li class="full-width text-center"><a data-toggle="collapse" data-target="#navbar-filter"><i class="icon-menu7"></i></a></li>
                                  </ul>
          
                                  <div class="navbar-collapse collapse" id="navbar-filter">
                                      <ul class="nav navbar-nav element-active-orange-400">
                                          <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-calendar2 position-left"></i> Periodos de Inscrição</a></li>
                                      </ul>
          
                                  </div>
                              </div>
                              <!-- /toolbar -->
          
          
          
          
                              <!-- User profile -->
                              <div class="row">
          
          
                                  <div class="col-md-4">
          
                                      <!--
                                          String act2 = encryptUtils.encodeString("accao#actualizar-periodo");
                                      -->
          
                                      <!-- Basic layout-->
                                      <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="SUZQU2VydmxldCNEQ0k=?<!--=act2-->">
                                          <div class="panel panel-flat">
                                              <div class="panel-heading">
                                                  <h6 class="panel-title text-bold text-uppercase">Actualizar Periodo de Inscrição</h6>
                                                  <div class="heading-elements">
                                                      <ul class="icons-list">
                                                          <li><a data-action="collapse"></a></li>
                                                          <li><a data-action="reload"></a></li>
                                                      </ul>
                                                  </div>
                                              </div>
          
                                              <div class="panel-body">
          
          
          
                                                  <div class="form-group">
                                                      <label class="text-bold text-uppercase">DATA DE ABERTURA: </label>
                                                      <div class="input-group col-md-12">
                                                          <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                          <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data1" required="">
                                                      </div>
                                                  </div>
          
          
                                                  <div class="form-group">
                                                      <label class="text-bold text-uppercase">DATA DE TERMINO: </label>
                                                      <div class="input-group col-md-12">
                                                          <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                          <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data2" required="">
                                                      </div>
                                                  </div>
          
          
                                                  <div class="text-right">
                                                      <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 text-uppercase text-bold">Actualizar Datas <i class="icon-circle-right2 position-right"></i></button>
                                                  </div>
                                              </div>
                                          </div>
                                      </form>
                                      <!-- /basic layout -->
                                  </div>
          
          
          
                                  <div class="col-md-8">
          
                                      <!-- Bordered panel body table -->
                                      <div class="panel panel-flat">
                                          <div class="panel-heading">
                                              <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Periodos de Inscrição <span class="text-danger-600">[<!--=ano-->]</span></h6>
                                              <div class="heading-elements">
                                                  <ul class="icons-list">
                                                      <li><a data-action="collapse"></a></li>
                                                      <li><a data-action="reload"></a></li>
          
                                                  </ul>
                                              </div>
                                          </div>
          
                                          <div class="panel-body">
          
                                              <table class="table datatable-responsive" width="100%">
                                                  <thead>
                                                      <tr>
                                                          <th class="text-bold text-uppercase">#</th>
                                                          <th class="text-bold text-uppercase">Descrição</th>
                                                          <th class="text-bold text-uppercase">Data Inicio</th>
                                                          <th class="text-bold text-uppercase">Data Fim</th>
                                                      </tr>
                                                  </thead>
                                                  <tbody>
          
                                                      <!--
                                                          if (schedule != null) {
          
                                                              int id = schedule.getScheId();
                                                              String tip = schedule.getScheTipo();
                                                              String d1 = sdf.format(schedule.getScheDataIncial().toGregorianCalendar().getTime());
                                                              String d2 = sdf.format(schedule.getScheDataFinal().toGregorianCalendar().getTime());
          
                                                      -->
                                                      <tr>
                                                          <td class="text-blue-700 text-bold"><!--=id--></td>
                                                          <td class="text-bold"><!--=tip--></td>
                                                          <td><!--=d1--></td> 
                                                          <td><!--=d2--></td> 
                                                      </tr>
                                                      <!--
                                                              
                                                          }
                                                      -->
                                                  </tbody>
                                              </table>
                                          </div>
                                      </div>
                                      <!-- /bordered panel body table -->
          
                                  </div>
                              </div>
                              <!-- /row.2 -->
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
  components: {NavBar},
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
