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
                                          <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-pencil6 position-left"></i> Gestão de Formação Professores  <span class="text-danger-400"> (Painel Principal)</span> </a></li>
                                      </ul>
          
                                  </div>
                              </div>
                              <!-- /toolbar -->
          
                              <!-- Main charts -->
                              <div class="row">
                                  <div class="col-lg-10">
          
                                      <!-- Error wrapper -->
                                      <div class="container-fluid text-center">
                                          <h1 class="error-title text-center">
          
                                              <center>
                                                  <img src="http://<!--=ip-->:8081/suc/images/app-icons/governo.png" alt="" class="img-responsive" style="width:50%; max-width: 150px;">
          
                                              </center>
          
                                          </h1>
                                          <h6 class="text-bold content-group text-grey-800">
                                              REPÚBLICA DE MOÇAMBIQUE<br>
                                              MINISTÉRIO DA EDUCAÇÃO E DESENVOLVIMENTO HUMANO
                                          </h6>
          
                                          <div class="row">
                                              <div class="col-lg-4 col-lg-offset-4 col-sm-6 col-sm-offset-3">
                                                  <form  class="main-search">
          
                                                      <div class="row">
                                                          <div class="col-sm-12">
                                                              <button class="btn text-bold text-uppercase bg-slate-600 btn-block content-group"> Formação Professores</button>
                                                          </div>
                                                      </div>
                                                  </form>
                                              </div>
                                          </div>
                                      </div>
                                      <!-- /error wrapper -->
                                  </div>
                              </div>
                              <!-- /main charts -->
          
          
                          </div>
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
