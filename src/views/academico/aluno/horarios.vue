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
                          <ul class="nav navbar-nav element-active-orange-400">
                              <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-calendar position-left"></i> Gestão de Horários</a></li>
                          </ul>

                      </div>
                  </div>
                  <!-- /toolbar -->




                  <div class = "row">



                      <!-- Vertical form options -->
                      <div class="col-md-6"> 
                          <!-- Basic layout-->

                          <form method="post" accept-charset="ISO-8859-1" action="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?YWNjYW8jaG9yYXJpb3M=">
                              <div class="panel panel-flat">
                                  <div class="panel-body">

                                      <div class="form-group">
                                          <div class="col-lg-12">
                                              <div class="row">

                                                  <div class="col-md-8">

                                                      <select class="select" name="idCurso">
                                                          <optgroup label="Selecione a classe">

                                                              <!--
                                                                  if (cursos != null) {
                                                                      for (Curso c : cursos) {

                                                                          int id = c.getCursId();
                                                                          String desc = encryptUtils.decodeString(c.getCursCod()) + " - " + encryptUtils.decodeString(c.getCursDescricao());

                                                                          String sel = "";

                                                                          if (curso != null) {
                                                                              if (id == curso.getCursId()) {
                                                                                  sel = "selected";
                                                                              }
                                                                          }
                                                              -->
                                                              <option value=""></option>
                                                              <!--
                                                                      }
                                                                  }
                                                              -->                                                                

                                                          </optgroup>
                                                      </select>
                                                  </div>

                                                  <div class="col-md-3">
                                                      <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn bg-slate-800 btn-labeled text-bold text-uppercase">
                                                          <b><i class="icon-search4 position-right"></i></b> 
                                                          Filtrar Classe
                                                      </button>

                                                  </div>
                                                  <br> <br> <br>
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


                          <!--
                              String act = encryptUtils.encodeString("accao#filtrar-semestre&to=schedule-class");
                          -->

                          <!-- Basic layout-->
                          <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?<!--=act-->">
                              <div class="panel panel-flat">
                                  <div class="panel-body">

                                      <div class="form-group">
                                          <div class="col-lg-12">
                                              <div class="row">

                                                  <div class="col-md-8">

                                                      <select class="select" name="semestre">
                                                          <optgroup label="Selecione o semestre">

                                                              <!--
                                                                  String semestres[] = {"1º TRIMESTRE", "2º TRIMESTRE", "3º TRIMESTRE"};

                                                                  for (String s : semestres) {

                                                                      String sel = "";

                                                                      if (s.equals(semestre)) {
                                                                          sel = "selected";
                                                                      }

                                                              -->
                                                              <option value=""></option>
                                                              <!--
                                                                  }

                                                              -->                                                                

                                                          </optgroup>
                                                      </select>
                                                  </div>

                                                  <div class="col-md-3">
                                                      <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                          <b><i class="icon-search4 position-right"></i></b> 
                                                          Filtrar Semestre
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




                  <!-- User profile -->
                  <div class="row">

                      <!--                            String ref = "";
                          String dd = "";
                          String tur = "";
                          String cur = "";
                          String hor = "";
                          String dI = "";
                          String dF = "";
                          String min = "";
                          String max = "";

                          String dias[] = {"SEGUNDA-FEIRA", "TERÇA-FEIRA", "QUARTA-FEIRA", "QUINTA-FEIRA", "SEXTA-FEIRA", "SABÁDO"};

                          String horarios[] = {"07:00 - 07:45", "07:50 - 08:35", "08:40 - 09:25", "09:40 - 10:25", "10:30 - 11:15", "11:20 - 12:05",
                              "12:40 - 13:25", "13:30 - 14:15", "14:20 - 15:05", "15:20 - 16:05", "16:10 - 16:55", "17:00 - 17:45", "17:45 - 18:30"};

                          if (turma != null) {

                              ref = encryptUtils.decodeString(turma.getTurmReferencia());
                              dd = encryptUtils.decodeString(turma.getTurmDescricao());
                              tur = encryptUtils.decodeString(turma.getTurmTurno());
                              hor = encryptUtils.decodeString(turma.getTurmHorario());
                              cur = encryptUtils.decodeString(turma.getCurso().getCursCod())
                                      + " - " + encryptUtils.decodeString(turma.getCurso().getCursDescricao());

                              dI = sdf.format(turma.getTurmDataInicio().toGregorianCalendar().getTime());
                              dF = sdf.format(turma.getTurmDataFim().toGregorianCalendar().getTime());

                              min = turma.getTurmMinEstudantes() + "";
                              max = turma.getTurmMaxEstudantes() + "";
                          }
                      -->

                      <div class="col-md-7">

                          <!-- Row -->
                          <div class="row">


                              <!-- Vertical form options -->
                              <div class="col-md-12"> 
                                  <!-- Basic layout-->


                                  <!--
                                      String act3 = encryptUtils.encodeString("accao#filtrar-turma&to=schedule-class");
                                  -->

                                  <!-- Basic layout-->
                                  <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?<!--=act3-->">
                                      <div class="panel panel-flat">
                                          <div class="panel-body">

                                              <div class="form-group">
                                                  <div class="col-lg-12">
                                                      <div class="row">

                                                          <div class="col-md-8">

                                                              <select class="select" name="idTurma">
                                                                  <optgroup label="Selecione a turma">

                                                                      <!--
                                                                          if (turmas != null) {
                                                                              for (Turma t : turmas) {

                                                                                  int id = t.getTurmId();
                                                                                  String desc = encryptUtils.decodeString(t.getTurmReferencia()) + " - " + encryptUtils.decodeString(t.getTurmDescricao());

                                                                                  String sel = "";

                                                                                  if (turma != null) {
                                                                                      if (id == turma.getTurmId()) {
                                                                                          sel = "selected";
                                                                                      }
                                                                                  }
                                                                      -->
                                                                      <option value=""></option>
                                                                      <!--
                                                                              }
                                                                          }
                                                                      -->                                                                

                                                                  </optgroup>
                                                              </select>
                                                          </div>

                                                          <div class="col-md-3">
                                                              <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                                  <b><i class="icon-search4 position-right"></i></b> 
                                                                  Filtrar Turma
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
                          <!--/row -->

                          <!-- row -->
                          <div class="row">

                              <!-- Vertical form options -->
                              <div class="col-md-12"> 
                                  <!-- Bordered striped table -->
                                  <div class="panel panel-flat">

                                      <div class="table-responsive">
                                          <table class="table table-bordered table-striped">
                                              <tbody>
                                                  <tr>
                                                      <td class="text-bold text-uppercase"><i class="icon-markup"></i> Código</td>
                                                      <td class="text-bold text-danger-600"><!--=ref--></td>
                                                  </tr>
                                                  <tr>
                                                      <td class="text-bold text-uppercase"><i class="icon-file-text"></i> Descrição</td>
                                                      <td class="text-bold"><!--=dd--></td>
                                                  </tr>

                                                  <tr>
                                                      <td class="text-bold text-uppercase"><i class="icon-archive"></i> Curso</td>
                                                      <td><!--=cur--></td>
                                                  </tr>

                                                  <tr>
                                                      <td class="text-bold text-uppercase"><i class="icon-popout"></i> Turno</td>
                                                      <td><!--=tur--></td>
                                                  </tr>

                                                  <tr>
                                                      <td class="text-bold text-uppercase"><i class="icon-user-minus"></i> Min. Alunos</td>
                                                      <td class="text-bold text-indigo-600"><!--=min--></td>
                                                  </tr>

                                                  <tr>
                                                      <td class="text-bold text-uppercase"><i class="icon-user-plus"></i> Max. Alunos</td>
                                                      <td class="text-bold text-teal-600"><!--=max--></td>
                                                  </tr>
                                              </tbody>
                                          </table>
                                      </div>
                                  </div>
                                  <!-- /bordered striped table -->


                              </div>
                              <!-- /vertical form options -->
                          </div>
                          <!-- /row -->
                      </div>





                      <div class="col-md-5">

                          <!--
                              String act2 = encryptUtils.encodeString("accao#definir-horario");
                          -->

                          <!-- Basic layout-->
                          <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?<!--=act2-->">
                              <div class="panel panel-flat">
                                  <div class="panel-heading">
                                      <h6 class="panel-title text-bold text-uppercase">Definição de Horário</h6>
                                      <div class="heading-elements">
                                          <ul class="icons-list">
                                              <li><a data-action="collapse"></a></li>
                                              <li><a data-action="reload"></a></li>
                                          </ul>
                                      </div>
                                  </div>

                                  <div class="panel-body">


                                      <div class="form-group">
                                          <label class="text-bold text-uppercase">Dia Semana:</label>


                                          <select class="select" name="diaSemana" required="">
                                              <optgroup label="Selecione o dia">

                                                  <!--

                                                      for (String d : dias) {

                                                          String sel = "";

                                                          if (d.equals(diaSemana)) {
                                                              sel = "selected";
                                                          }
                                                  -->
                                                  <option value=""></option>
                                                  <!--
                                                      }

                                                  -->
                                              </optgroup>
                                          </select>

                                      </div>


                                      <div class="form-group">
                                          <label class="text-bold text-uppercase">Disciplina:</label>


                                          <select class="select" name="idDisciplina" required="">
                                              <optgroup label="Selecione uma disciplina">
                                                  <option value="0">SEM AULA</option>

                                                  <!--                                                        if (disciplinas != null) {

                                                          for (Disciplina d : disciplinas) {

                                                              int id = d.getDiscId();
                                                              String desc = encryptUtils.decodeString(d.getDiscDescricao());

                                                  -->
                                                  <option value="<!--=id-->"><!--=desc--></option>
                                                  <!--
                                                          }
                                                      }
                                                  -->
                                              </optgroup>
                                          </select>

                                      </div>



                                      <div class="form-group">
                                          <label class="text-bold text-uppercase">Horário:</label>


                                          <label class="text-bold text-uppercase">Selecione a(s) Hora(s):</label>
                                          <select multiple="multiple" class="select" name="horas" required="" placeholder="Selecione a(s) Hora(s)">
                                              <optgroup label="Selecione a(s) Hora(s)" >

                                                  <!--
                                                      for (String d : horarios) {
                                                  -->
                                                  <option value="<!--=d-->"><!--=d--></option>
                                                  <!--
                                                      }

                                                  -->
                                              </optgroup>
                                          </select>

                                      </div>



                                      <div class="text-right">
                                          <button type="submit" onclick="this.disabled='disabled'; this.form.submit();" class="btn bg-orange-600 text-uppercase text-bold">Definir aula <i class="icon-circle-right2 position-right"></i></button>
                                      </div>
                                  </div>
                              </div>
                          </form>
                          <!-- /basic layout -->




                      </div>


                  </div>
                  <!-- /row.2 -->


                  <!-- row.3 -->
                  <div class ="row">

                      <div class="col-md-12">
                          <!-- Bordered panel body table -->
                          <div class="panel panel-flat">
                              <div class="panel-heading">
                                  <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Horário Actual <span class="text-danger-600">[<!--=cur + "|" + dd + "|" + semestre-->]</span></h6>
                                  <div class="heading-elements">
                                      <ul class="icons-list">
                                          <li><a data-action="collapse"></a></li>
                                          <li><a data-action="reload"></a></li>

                                      </ul>
                                  </div>
                              </div>

                              <div class="panel-body">

                                  <p>
                                      <a href="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?YWNjYW8jaW1wcmltaXItaG9yYXJpbw==" target="_blank" class="btn  bg-slate-800 btn-labeled btn-lg text-bold text-uppercase">
                                          <b><i class="icon-printer2"></i></b>
                                          Imprimir horário
                                      </a>

                                  </p>

                                  <div class="table-responsive">
                                      <table class="table table-bordered table-framed table-responsive">
                                          <thead>
                                              <tr>
                                                  <th class="text-bold text-uppercase"></th>

                                                  <!--                                                        for (String d : dias) {
                                                  -->
                                                  <th class="text-bold text-uppercase"><!--=d--></th>
                                                      <!--
                                                          }
                                                      -->
                                              </tr>
                                          </thead>
                                          <tbody>

                                              <!--
                                                  if (hCals != null) {
                                                      for (HCal hc : hCals) {

                                                          String h = hc.getHorario();
                                              -->
                                              <tr>
                                                  <td><!--=h--></td>

                                                  <!--
                                                      List<String> aulas = hc.getAulas();

                                                      for (String dis : aulas) {

                                                          if (!dis.equals("")) {
                                                  -->
                                                  <td><!--=dis--></td>
                                                  <!--
                                                  } else {
                                                  -->
                                                  <td class="bg-success-300 text-success-300">--</td>

                                                  <!--
                                                          }
                                                      }
                                                  -->

                                              </tr>
                                              <!--
                                                      }
                                                  }
                                              -->
                                          </tbody>
                                      </table>
                                  </div>
                              </div>
                          </div>
                          <!-- /bordered panel body table -->

                      </div>
                  </div>
                  <!-- /row.3 -->

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
