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


                              <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-file-upload position-left"></i> Importar Alunos</a></li>
                          </ul>

                      </div>
                  </div>
                  <!-- /toolbar -->


                  <div class = "row">
                      <!-- Vertical form options -->
                      <div class="col-md-6"> 
                          <!-- Basic layout-->

                          <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?YWNjYW8jaW1wb3J0YXItbm90YXM=">
                              <div class="panel panel-flat">
                                  <div class="panel-body">

                                      <div class="form-group">
                                          <div class="col-lg-12">
                                              <div class="row">

                                                  <div class="col-md-7">

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
                                                      <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-slate-800 btn-labeled text-bold text-uppercase">
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


                          <!--
                              String act = encryptUtils.encodeString("accao#filtrar-semestre&to=avl-notes-import");
                          -->

                          <!-- Basic layout-->
                          <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?<!--=act-->">
                              <div class="panel panel-flat">
                                  <div class="panel-body">

                                      <div class="form-group">
                                          <div class="col-lg-12">
                                              <div class="row">

                                                  <div class="col-md-7">

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
                                                      <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-slate-800 btn-labeled text-bold text-uppercase">
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



                  <div class = "row">

                      <!-- Vertical form options -->
                      <div class="col-md-6"> 
                          <!-- Basic layout-->
                          <!--                                String act3 = encryptUtils.encodeString("accao#filtrar-turma&to=avl-notes-import");
                          -->

                          <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?<!--=act3-->">
                              <div class="panel panel-flat">
                                  <div class="panel-body">

                                      <div class="form-group">
                                          <div class="col-lg-12">
                                              <div class="row">

                                                  <div class="col-md-7">


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
                                                      <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
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

                      <!-- Vertical form options -->
                      <div class="col-md-6"> 
                          <!-- Basic layout-->

                          <!--                                String act4 = encryptUtils.encodeString("accao#filtrar-calendario&to=avl-notes-import");
                          -->

                          <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?<!--=act4-->">
                              <div class="panel panel-flat">
                                  <div class="panel-body">

                                      <div class="form-group">
                                          <div class="col-lg-12">
                                              <div class="row">

                                                  <div class="col-md-7">


                                                      <select class="select" name="idCalendario">
                                                          <optgroup label="Selecione disciplina">

                                                              <!--
                                                                  if (calendarios != null) {
                                                                      for (Calendario c : calendarios) {

                                                                          int id = c.getCaleId();
                                                                          String desc = encryptUtils.decodeString(c.getDisciplina().getDiscDescricao());

                                                                          String sel = "";

                                                                          if (calendario != null) {
                                                                              if (id == calendario.getCaleId()) {
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
                                                      <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
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


                  <!-- Vertical form options -->
                  <div class="row">


                      <!--
                          String dd = "";
                          String cur = "";
                          String di = "";

                          if (turma != null) {

                              dd = encryptUtils.decodeString(turma.getTurmDescricao());
                              cur = encryptUtils.decodeString(turma.getCurso().getCursCod())
                                      + " - " + encryptUtils.decodeString(turma.getCurso().getCursDescricao());

                          }

                          if (calendario != null) {
                              di = encryptUtils.decodeString(calendario.getDisciplina().getDiscDescricao());
                          }
                      -->

                      <div class="col-md-4">

                          <!--
                              String actX = encryptUtils.encodeString("accao#carregar-ficheiro");
                          -->
                          <!-- Basic layout-->
                          <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?<!--=actX-->">
                              <div class="panel panel-flat">

                                  <div class="panel-body">
                                      <div class ="row">
                                          <div class="col-md-12">

                                              <fieldset>
                                                  <legend class="text-bold text-uppercase"><i class="icon-download10 position-left"></i>Carregamento de ficheiro</legend>




                                                  <div class="form-group">
                                                      <label class="text-bold text-uppercase">Localizar ficheiro:</label>
                                                      <br>


                                                      Faça aqui o carregamento do documento com as senhas:

                                                      <span class="help-block">Formatos aceites: xls, xlxs. Tamanho máximo 2Mb</span>

                                                      <center>
                                                          <iframe src="http://<!--=ip-->:8081/suc/index-import-segia.php" style=" width: 90%; height: 25em; background: transparent;" frameBorder="0" scrolling="no" id="upload_target" name="upload_target"> </iframe>
                                                      </center>

                                                  </div>


                                              </fieldset>

                                          </div>

                                      </div>

                                      <div class="text-right">
                                          <button type="submit" id='btn3' onclick="this.disabled = 'disabled'; this.form.submit();" class="text-bold text-uppercase btn bg-danger-600 text-bold text-uppercase">Carregar Ficheiro <i class="icon-download4 position-right"></i></button>
                                      </div>
                                  </div>
                              </div>
                          </form>
                          <!-- /basic layout -->


                      </div>


                      <div class="col-md-8">

                          <!-- Basic responsive configuration -->
                          <div class="panel panel-flat">
                              <div class="panel-heading">
                                  <h6 class="panel-title text-bold text-uppercase">Listagem de dados à importar  <span class="text-danger-600">[<!--=cur + " | Turma:" + dd-->]</span> <span class="text-primary-600"> - [<!--=di-->]</span></h6>
                                  <div class="heading-elements">
                                      <ul class="icons-list">
                                          <li><a data-action="collapse"></a></li>
                                          <li><a data-action="reload"></a></li>
                                      </ul>
                                  </div>
                              </div>


                              <div class="panel-body">
                                  <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?YWNjYW8jY29uZmlybWFyLXVwbG9hZA==">

                                      <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="text-bold text-uppercase btn bg-primary-600 text-bold text-uppercase"> Confirmar importação de dados
                                        <i class="icon-check position-right"></i>
                                      </button>
                                  </form>
                                    

                              </div>


                              <table class="table datatable-responsive">
                                  <thead>
                                      <tr>
                                          <th class="text-bold text-uppercase">#</th>
                                          <th class="text-bold text-uppercase">Aluno</th>
                                          <th class="text-bold text-uppercase text-right">1ª ACS</th>
                                          <th class="text-bold text-uppercase text-right">2ª ACS</th>
                                          <th class="text-bold text-uppercase text-right">3ª ACS</th>
                                          <th class="text-bold text-uppercase text-right">4ª ACS</th>
                                          <th class="text-bold text-uppercase text-right">1ª ACP</th>
                                          <th class="text-bold text-uppercase text-right">2ª ACP</th>
                                      </tr>
                                  </thead>
                                  <tbody>

                                      <!--
                                          int i = 0;

                                          if (importacoes != null) {
                                              for (ImpNota imp : importacoes) {

                                                  String id = imp.getId();
                                                  String aluno = imp.getNomeAluno();
                                                  String teste1 = imp.getTeste1();
                                                  String teste2 = imp.getTeste2();
                                                  String teste3 = imp.getTeste3();
                                                  String teste4 = imp.getTeste4();
                                                  String teste5 = imp.getTeste5();
                                                  String teste6 = imp.getTeste6();

                                      -->
                                      <tr>
                                          <td><a  href="#" class="text-bold"><!--=id--></a></td>
                                          <td><small><!--=aluno--></small></td>
                                          <td class="text-right"><!--=teste1--></td>
                                          <td class="text-right"><!--=teste2--></td>
                                          <td class="text-right"><!--=teste3--></td>
                                          <td class="text-right"><!--=teste4--></td>
                                          <td class="text-right"><!--=teste5--></td>
                                          <td class="text-right"><!--=teste6--></td>
                                      </tr>
                                      <!--                                                }
                                          }
                                      -->

                                  </tbody>
                              </table>

                          </div>
                          <!-- /basic responsive configuration -->
                      </div>


                  </div>
                  <!-- /vertical form options -->

                  <div class="row">

                      <div class="col-md-12">
                          <!-- Basic setup -->
                          <div class="panel panel-white">
                              <div class="panel-heading">
                                  <h6 class="panel-title text-bold text-uppercase">RESUMO DOS ALUNOS IMPORTADOS <span class="text-danger-600">[<!--=cur + " | Turma:" + dd-->]</span> <span class="text-primary-600"> - [<!--=di-->]</span></h6>
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
                                          <th class="text-bold text-uppercase">Cod. Aluno</th>
                                          <th class="text-bold text-uppercase text-right">Disciplina</th>
                                          <th class="text-bold text-uppercase text-right">1ª ACS</th>
                                          <th class="text-bold text-uppercase text-right">2ª ACS</th>
                                          <th class="text-bold text-uppercase text-right">3ª ACS</th>
                                          <th class="text-bold text-uppercase text-right">4ª ACS</th>
                                          <th class="text-bold text-uppercase text-right">1ª ACP</th>
                                          <th class="text-bold text-uppercase text-right">2ª ACP</th>
                                      </tr>
                                  </thead>
                                  <tbody>

                                      <!--
                                          if (notas != null) {
                                              for (Notas n : notas) {
                                                  int id = n.getNotaId();
                                                  String s1 = encryptUtils.decodeString(n.getAluno().getAlunBadgnumber()) + " - " + encryptUtils.decodeString(n.getAluno().getPessoa().getPessNome()) + " "
                                                          + encryptUtils.decodeString(n.getAluno().getPessoa().getPessApelido());

                                                  String dis1 = " text-grey-600 text-bold";
                                                  String dis2 = " text-grey-600 text-bold";
                                                  String dis3 = " text-grey-600 text-bold";
                                                  String dis4 = " text-grey-600 text-bold";
                                                  String dis5 = " text-grey-600 text-bold";
                                                  String dis6 = " text-grey-600 text-bold";

                                                  String n1 = df.format(n.getNotaTeste1());
                                                  String n2 = df.format(n.getNotaTeste2());
                                                  String n3 = df.format(n.getNotaTeste3());
                                                  String n4 = df.format(n.getNotaTeste4());
                                                  String n5 = df.format(n.getNotaAcp());
                                                  String n6 = df.format(n.getNotaAcp2());

                                                  if (n.getNotaTeste1() > 14) {
                                                      dis1 = " text-success-600 text-bold";
                                                  } else if (n.getNotaTeste1() < 10) {
                                                      dis1 = " text-danger-600 text-bold";
                                                  }

                                                  if (n.getNotaTeste2() > 14) {
                                                      dis2 = " text-success-600 text-bold";
                                                  } else if (n.getNotaTeste2() < 10) {
                                                      dis2 = " text-danger-600 text-bold";
                                                  }

                                                  if (n.getNotaAcp() > 14) {
                                                      dis5 = " text-success-600 text-bold";
                                                  } else if (n.getNotaAcp() < 10) {
                                                      dis5 = " text-danger-600 text-bold";
                                                  }

                                                  if (calendario != null) {
                                                      if (calendario.isCaleHaveTeste3()) {

                                                          if (n.getNotaTeste3() > 14) {
                                                              dis3 = " text-success-600 text-bold";
                                                          } else if (n.getNotaTeste3() < 10) {
                                                              dis3 = " text-danger-600 text-bold";
                                                          }
                                                      }
                                                      
                                                      if (calendario.isCaleHaveTeste4()) {

                                                          if (n.getNotaTeste4() > 14) {
                                                              dis4 = " text-success-600 text-bold";
                                                          } else if (n.getNotaTeste4() < 10) {
                                                              dis4 = " text-danger-600 text-bold";
                                                          }
                                                      }
                                                      
                                                      if (calendario.isCaleHaveAcp()) {

                                                          if (n.getNotaAcp2() > 14) {
                                                              dis6 = " text-success-600 text-bold";
                                                          } else if (n.getNotaAcp2() < 10) {
                                                              dis6 = " text-danger-600 text-bold";
                                                          }
                                                      }
                                                  }

                                                  String disc = encryptUtils.decodeString(n.getDisciplina().getDiscDescricao());


                                      -->
                                      <tr>
                                          <td><a  href="#" class="text-bold"><!--=id--></a></td>
                                          <td class="text-bold text-danger-600"><!--=disc--></td>
                                          <td><small><!--=s1--></small></td>
                                          <td class="text-right <!--=dis1-->"><!--=n1--></td>
                                          <td class="text-right <!--=dis2-->"><!--=n2--></td>
                                          <td class="text-right <!--=dis3-->"><!--=n3--></td>
                                          <td class="text-right <!--=dis4-->"><!--=n4--></td>
                                          <td class="text-right <!--=dis5-->"><!--=n5--></td>
                                          <td class="text-right <!--=dis6-->"><!--=n6--></td>
                                      </tr>
                                      <!--

                                              }
                                          }

                                      -->


                                  </tbody>
                              </table>


                          </div>
                          <!-- /basic setup -->
                      </div>
                  </div>

              </div>
              <!-- /main content -->
      </v-row>
  </v-container>
</template>

<script>
import NavBar from "@/components/layout/NavBar.vue";
import { mapGetters } from "vuex";
export default {
name: "AddStudent",
components: { NavBar },
data: () => ({}),

computed: {
  ...mapGetters(["user"]),
},
};
</script>
