<template>
    <v-container>
        <nav-bar :menu_types = "5"/>
        <v-row>
                <!-- Main content -->
                <div class="content-wrapper">


                  <!-- Toolbar -->
                  <div class="navbar navbar-default navbar-component navbar-xs">
                      <ul class="nav navbar-nav visible-xs-block">
                          <li class="full-width text-center"><a data-toggle="collapse" data-target="#navbar-filter"><i
                                      class="icon-menu7"></i></a>
                          </li>
                      </ul>

                      <div class="navbar-collapse collapse" id="navbar-filter">
                          <ul class="nav navbar-nav element-active-slate-400">
                              <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i
                                          class="icon-target position-left"></i>
                                      Definição de Plano Temático
                                  </a></li>
                          </ul>

                      </div>
                  </div>
                  <!-- /toolbar -->



                  <div class="row">

                      <!-- Vertical form options -->
                      <div class="col-md-6">
                          <!-- Basic layout-->

                          <form method="post" accept-charset="ISO-8859-1" action="UGxhbm9zU2VydmxldCNEQ0k=?YWNjYW8jdGVtYXM=">
                              <div class="panel panel-flat">
                                  <div class="panel-body">

                                      <div class="form-group">
                                          <div class="col-lg-12">
                                              <div class="row">

                                                  <div class="col-md-7">

                                                      <select class="select" name="idCurso">
                                                          <optgroup
                                                              label="Selecione a classe">

                                                              <!-- if
                                                                  (cursos
                                                                  !=null)
                                                                  {
                                                                  for
                                                                  (Curso
                                                                  c
                                                                  :
                                                                  cursos)
                                                                  {
                                                                  int
                                                                  id=c.getCursId();
                                                                  String
                                                                  desc=encryptUtils.decodeString(c.getCursCod())
                                                                  + " - "
                                                                  +
                                                                  encryptUtils.decodeString(c.getCursDescricao());
                                                                  String
                                                                  sel=""
                                                                  ;
                                                                  if
                                                                  (curso
                                                                  !=null)
                                                                  {
                                                                  if
                                                                  (id==curso.getCursId())
                                                                  {
                                                                  sel="selected"
                                                                  ;
                                                                  }
                                                                  }
                                                                  -->
                                                                  <option></option>
                                                                  <!-- } }
                                                                      -->

                                                          </optgroup>
                                                      </select>
                                                  </div>

                                                  <div class="col-md-3">
                                                      <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-slate-800 btn-labeled text-bold text-uppercase">
                                                          <b><i
                                                                  class="icon-search4 position-right"></i></b>
                                                          Filtrar
                                                          Classe
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


                          <form method="post" accept-charset="ISO-8859-1" action="UGxhbm9zU2VydmxldCNEQ0k=?YWNjYW8jdGVtYXM=">
                              <div class="panel panel-flat">
                                  <div class="panel-body">

                                      <div class="form-group">
                                          <div class="col-lg-12">
                                              <div class="row">

                                                  <div class="col-md-7">


                                                      <select class="select" name="idDisciplina">
                                                          <optgroup
                                                              label="Selecione disciplina">

                                                              <!-- if
                                                                  (disciplinas
                                                                  !=null)
                                                                  {
                                                                  for
                                                                  (Disciplina
                                                                  d
                                                                  :
                                                                  disciplinas)
                                                                  {
                                                                  int
                                                                  id=d.getDiscId();
                                                                  String
                                                                  desc=encryptUtils.decodeString(d.getDiscDescricao());
                                                                  String
                                                                  sel=""
                                                                  ;
                                                                  if
                                                                  (disciplina
                                                                  !=null)
                                                                  {
                                                                  if
                                                                  (id==disciplina.getDiscId())
                                                                  {
                                                                  sel="selected"
                                                                  ;
                                                                  }
                                                                  }
                                                                  -->
                                                                  <option value=""></option>
                                                                  <!-- } }
                                                                      -->
                                                          </optgroup>
                                                      </select>
                                                  </div>

                                                  <div class="col-md-3">
                                                      <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                          <b><i
                                                                  class="icon-search4 position-right"></i></b>
                                                          Filtrar
                                                          Disciplina
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




                  <div class="row">




                      <!-- String cur="" ; String dis="" ; if (curso
                          !=null) {
                          cur=encryptUtils.decodeString(curso.getCursDescricao());
                          } if (disciplina !=null) {
                          dis=encryptUtils.decodeString(disciplina.getDiscDescricao());
                          } String
                          act=encryptUtils.encodeString("accao#registar-tema");
                          -->

                          <!-- Vertical form options -->
                          <div class="col-md-8 col-md-offset-2">


                              <!-- Basic layout-->
                              <form method="post" accept-charset="ISO-8859-1" action="UGxhbm9zU2VydmxldCNEQ0k=?<!--=act-->" class="form-horizontal">

                                  <div class="panel panel-flat">
                                      <div class="panel-heading">
                                          <h6 class="panel-title text-bold text-uppercase">
                                              Definição de Sumários <span class="text-danger-600">[
                                                  <!--=cur--> |
                                                      <!--=dis-->
                                                          ]</span>
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


                                          <div class="form-group">
                                              <label class="col-lg-3 control-label text-bold text-uppercase">Descrição:
                                              </label>

                                              <div class="col-lg-9">
                                                  <div class="row">

                                                      <div class="input-group col-md-8">
                                                          <span class="input-group-addon"><i
                                                                  class="icon-file-text"></i></span>
                                                          <input type="text" class="form-control" placeholder="Descrição do tema ... " name="descricao" required="">
                                                      </div>

                                                  </div>
                                              </div>

                                          </div>



                                          <div class="form-group">
                                              <label class="col-lg-3 control-label text-bold text-uppercase">Nº
                                                  Aulas Teoricas:
                                              </label>

                                              <div class="col-lg-9">
                                                  <div class="row">

                                                      <div class="input-group col-md-6">
                                                          <span class="input-group-addon"><i
                                                                  class="icon-file-text"></i></span>
                                                          <input type="number" class="form-control" placeholder="Nº de Aulas Teoricas ... " name="teorica" required="" min="1" value="1">
                                                      </div>

                                                  </div>
                                              </div>

                                          </div>

                                          <div class="form-group">
                                              <label class="col-lg-3 control-label text-bold text-uppercase">Nº
                                                  Aulas Práticas:
                                              </label>

                                              <div class="col-lg-9">
                                                  <div class="row">

                                                      <div class="input-group col-md-6">
                                                          <span class="input-group-addon"><i
                                                                  class="icon-sort-time-desc"></i></span>
                                                          <input type="number" class="form-control" placeholder="Nº de Aulas Práticas ... " name="pratica" required="" min="1" value="1">
                                                      </div>

                                                  </div>
                                              </div>

                                          </div>

                                          <div class="text-right">
                                              <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800">Gravar
                                                  Registo <i
                                                      class="icon-arrow-right14 position-right"></i></button>
                                          </div>
                                      </div>
                                  </div>
                              </form>
                              <!-- /basic layout -->

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
