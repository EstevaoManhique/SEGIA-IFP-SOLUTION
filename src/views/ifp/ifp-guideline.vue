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
                                          <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-table2 position-left"></i> Pauta de Exame</a></li>
                                      </ul>
          
                                  </div>
                              </div>
                              <!-- /toolbar -->
          
          
          
          
          
                              <div class = "row">
          
          
          
                                  <!-- Vertical form options -->
                                  <div class="col-md-6"> 
                                      <!-- Basic layout-->
          
                                      <form method="post" accept-charset="ISO-8859-1" action="SUZQU2VydmxldCNEQ0k=?YWNjYW8jcGF1dGE=">
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
                                                                  <button type="submit" onclick="this.disabled = 'disabled';
                                                                          this.form.submit();" class="btn bg-slate-800 btn-labeled text-bold text-uppercase">
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
          
                                      <form method="post" accept-charset="ISO-8859-1" action="SUZQU2VydmxldCNEQ0k=?YWNjYW8jcGF1dGE=">
                                          <div class="panel panel-flat">
                                              <div class="panel-body">
          
                                                  <div class="form-group">
                                                      <div class="col-lg-12">
                                                          <div class="row">
          
                                                              <div class="col-md-7">
          
          
                                                                  <select class="select" name="idDisciplina">
                                                                      <optgroup label="Selecione disciplina">
          
                                                                          <!--
                                                                              if (disciplinas != null) {
                                                                                  for (Disciplina d : disciplinas) {
          
                                                                                      int id = d.getDiscId();
                                                                                      String desc = encryptUtils.decodeString(d.getDiscDescricao());
          
                                                                                      String sel = "";
          
                                                                                      if (disciplina != null) {
                                                                                          if (id == disciplina.getDiscId()) {
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
          
          
          
                              <div class = "row">
          
                                  <!-- Vertical form options -->
                                  <div class="col-md-6"> 
                                      <!-- Basic layout-->
          
                                      <!--                                String act4 = encryptUtils.encodeString("accao#filtrar-salaExame&to=ifp-guideline");
                                      -->
          
                                      <form method="post" accept-charset="ISO-8859-1" action="SUZQU2VydmxldCNEQ0k=?<!--=act4-->">
                                          <div class="panel panel-flat">
                                              <div class="panel-body">
          
                                                  <div class="form-group">
                                                      <div class="col-lg-12">
                                                          <div class="row">
          
                                                              <div class="col-md-7">
          
          
                                                                  <select class="select" name="idSala">
                                                                      <optgroup label="Selecione uma Sala">
          
                                                                          <!--
                                                                              if (salasExame != null) {
                                                                                  for (SalaExame s : salasExame) {
          
                                                                                      int id = s.getSalaeId();
                                                                                      String desc = encryptUtils.decodeString(s.getSala().getSalaDescricao()) + " - " + sdf.format(s.getSalaeData().toGregorianCalendar().getTime());
          
                                                                                      String sel = "";
          
                                                                                      if (salaExame != null) {
                                                                                          if (id == salaExame.getSalaeId()) {
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
                                                                  <button type="submit" onclick="this.disabled = 'disabled';
                                                                          this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                                      <b><i class="icon-search4 position-right"></i></b> 
                                                                      Filtrar Sala
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
          
                                  <!--
                                      String decT = "---";
                                      String decD = "---";
                                      String decJ1 = "---";
                                      String decJ2 = "---";
                                      String cap = "";
          
                                      int id = -1;
          
                                      if (salaExame != null) {
          
                                          decT = encryptUtils.decodeString(salaExame.getSala().getSalaDescricao());
                                          decD = sdf.format(salaExame.getSalaeData().toGregorianCalendar().getTime());
          
                                          if (salaExame.getJuri1() != null) {
                                              decJ1 = encryptUtils.decodeString(salaExame.getJuri1().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(salaExame.getJuri1().getPessoa().getPessApelido());
          
                                          } else if (salaExame.getSalaeJuri1() != null) {
                                              decJ1 = encryptUtils.decodeString(salaExame.getSalaeJuri1());
                                          }
          
                                          if (salaExame.getJuri2() != null) {
                                              decJ2 = encryptUtils.decodeString(salaExame.getJuri2().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(salaExame.getJuri2().getPessoa().getPessApelido());
          
                                          } else if (salaExame.getSalaeJuri2() != null) {
                                              decJ2 = encryptUtils.decodeString(salaExame.getSalaeJuri2());
                                          }
          
                                          cap = salaExame.getSalaeMaxAlunos() + "";
                                          id = salaExame.getSalaeId();
                                      }
                                  -->
                                  <div class="col-md-5">
          
                                      <!-- Basic table -->
                                      <div class="panel panel-flat">
                                          <div class="panel-heading">
                                              <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Detalhes da turma</h6>
                                              <div class="heading-elements">
                                                  <ul class="icons-list">
                                                      <li><a data-action="collapse"></a></li>
                                                      <li><a data-action="reload"></a></li>
          
                                                  </ul>
                                              </div>
                                          </div>
                                          <div class="table-responsive">
                                              <table class="table">
                                                  <tbody>
                                                      <tr>
                                                          <td class="text-bold">Sala: </td>
                                                          <td><!--=decT--></td>
                                                      </tr>
                                                      <tr>
                                                          <td class="text-bold">Capacidade: </td>
                                                          <td><!--=cap--></td>
                                                      </tr>
                                                      <tr>
                                                          <td class="text-bold">Data: </td>
                                                          <td><!--=decD--></td>
                                                      </tr>
                                                      <tr>
                                                          <td class="text-bold">Júri 1: </td>
                                                          <td><!--=decJ1--></td>
                                                      </tr>
                                                      <tr>
                                                          <td class="text-bold">Júri 2: </td>
                                                          <td><!--=decJ2--></td>
                                                      </tr>
                                                  </tbody>
                                              </table>
                                          </div>
                                      </div>
                                      <!-- /basic table -->
          
                                  </div>
                              </div>	
          
                              <div class="row">
          
          
          
                                  <div class = "col-md-10">
                                      <!-- Vertical form options -->
          
          
          
                                      <!-- Basic responsive configuration -->
                                      <div class="panel panel-flat">
                                          <div class="panel-heading">
                                              <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">PAUTA DE EXAME  <span class="text-danger">(<!--=decT-->)</span></h6>
                                              <div class="heading-elements">
                                                  <ul class="icons-list">
                                                      <li><a data-action="collapse"></a></li>
                                                      <li><a data-action="reload"></a></li>
                                                  </ul>
                                              </div>
                                          </div>
          
          
                                              <div class="panel-body">
                                                  <p>
          
                                                      <a href="#" target="_blank" class="btn text-bold text-uppercase bg-teal-700 btn-labeled btn-lg text-bold text-uppercase"><b><i class="icon-printer2"></i></b> Imprimir a Pauta</a>
          
          
                                                  </p>
                                              </div>
          
          
                                              <table class="table datatable-responsive">
                                                  <thead>
                                                      <tr>
                                                          <th class="text-bold text-uppercase">#</th>
                                                          <th class="text-bold text-uppercase">COD</th>
                                                          <th class="text-bold text-uppercase">Nome</th>
                                                          <th class="text-bold text-uppercase text-right">Média</th>
                                                          <th class="text-bold text-uppercase text-right">Nota Exame</th>
                                                          <th class="text-bold text-uppercase text-center">Estado</th>
                                                      </tr>
                                                  </thead>
                                                  <tbody>
                                                      <!--
                                                          if (exames != null) {
                                                              int x = 0;
                                                              for (Exame e : exames) {
          
                                                                  x++;
          
                                                                  String ref = encryptUtils.decodeString(e.getAluno().getAlunUnico());
                                                                  String nom = encryptUtils.decodeString(e.getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(e.getAluno().getPessoa().getPessApelido());
                                                                  String med = df.format(e.getExamMedia());
                                                                  String n1 = df.format(e.getExamNota());
                                                                  String n2 = df.format(e.getExamRecorrencia());
                                                                  String medF = df.format(e.getExamNotaFinal());
                                                                  String status = "Aprovado";
          
                                                                  String lbl1 = "text-danger";
                                                                  String lbl2 = "text-danger";
                                                                  String lbl3 = "text-danger";
          
                                                                  if (e.getExamNota() >= 9.5) {
                                                                      lbl1 = "text-success";
                                                                  }
                                                                  if (e.getExamRecorrencia() >= 9.5) {
                                                                      lbl2 = "text-success";
                                                                  }
                                                                  if (e.getExamNotaFinal() >= 9.5) {
                                                                      lbl3 = "text-success";
                                                                  }
          
                                                                  String lblStatus = "bg-success-600";
          
                                                                  if (e.getExamNota() < 9.5 && e.getExamRecorrencia() == 0) {
                                                                      //status = "2ª Chamada";
                                                                      //lblStatus = "bg-orange-700";
                                                                       status = "Reprovado";
                                                                      lblStatus = "bg-danger-400";
                                                                  }
          
                                                                  if (e.getExamNotaFinal() < 9.5 && e.getExamNota() != 0 && e.getExamRecorrencia() != 0) {
                                                                      status = "Reprovado";
                                                                      lblStatus = "bg-danger-400";
                                                                  }
          
                                                                  if (e.getExamNota() >= 9.5) {
                                                                      status = "Aprovado";
                                                                      lblStatus = "bg-success-400";
                                                                  }
          
                                                                  boolean fraude = e.isExamFraude();
          
                                                                  if (fraude) {
                                                                      n1 = "<i class='icon-minus2 text-slate-800'></i>";
                                                                      n2 = "<i class='icon-minus2 text-slate-800'></i>";
                                                                      medF = "<i class='icon-minus2 text-slate-800'></i>";
                                                                      status = "Fraude";
                                                                      lblStatus = "bg-danger-800";
                                                                  }
          
                                                                  int idA = e.getExamId();
                                                      -->
                                                      <tr>
                                                          <td><a href="#"><!--=x--></a></td>
                                                          <td><a href="#"><!--=ref--></a></td>
                                                          <td><!--=nom--></td>
                                                          <td class="text-bold text-right"><i class="icon-minus2"></i></td>
                                                          <td class="text-bold text-right <!--=lbl3-->"><!--=medF--></td>
                                                          <td class="text-center"><span class="label <!--=lblStatus-->"><!--=status--></span></td>
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
                                  <!-- /vertical form options -->
          
          
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
  components: {NavBar},
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
