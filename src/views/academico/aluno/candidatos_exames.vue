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
                                      <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-sort-alpha-asc position-left"></i> Listagem dos Candidatos á Exame</a></li>
                                  </ul>
      
                              </div>
                          </div>
                          <!-- /toolbar -->
      
      
                          <div class = "row">
      
      
      
                              <!-- Vertical form options -->
                              <div class="col-md-6"> 
                                  <!-- Basic layout-->
      
                                  <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?YWNjYW8jbGlzdGEtZXhhbWVz">
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
                                  <!--                                String act3 = encryptUtils.encodeString("accao#filtrar-turma&to=exam-list");
                                  -->
      
      
                                  <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?YWNjYW8jbGlzdGEtZXhhbWVz">
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
      
                                  <!--                                String act4 = encryptUtils.encodeString("accao#filtrar-salaExame&to=exam-list");
                                  -->
      
                                  <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?<!--=act4-->">
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
      
      
                          <!-- User profile -->
                          <div class="row">
      
      
      
                              <!--
                                  String dd = "";
                                  String cur = "";
                                  String di = "";
      
                                  String an = "";
      
                                  if (salaExame != null) {
      
                                      dd = encryptUtils.decodeString(salaExame.getSala().getSalaDescricao());
                                      cur = encryptUtils.decodeString(salaExame.getCurso().getCursDescricao());
                                      di = encryptUtils.decodeString(salaExame.getDisciplina().getDiscDescricao());
      
                                  }
      
                                  if (anoLectivo != null) {
                                      an = encryptUtils.decodeString(anoLectivo.getAnolDescricao());
                                  }
                              -->
      
      
      
                              <div class="col-md-12">
      
                                  <!-- Basic responsive configuration -->
                                  <div class="panel panel-flat">
                                      <div class="panel-heading">
                                          <h6 class="panel-title text-bold text-uppercase">LISTA DE CANDIDATOS A EXAME  <span class="text-danger-600">[<!--=cur + "| Turma:" + dd-->]</span> <span class="text-primary-600"> - [<!--=di-->]</span></h6>
                                          <div class="heading-elements">
                                              <ul class="icons-list">
                                                  <li><a data-action="collapse"></a></li>
                                                  <li><a data-action="reload"></a></li>
                                              </ul>
                                          </div>
                                      </div>
      
      
      
                                      <div class="panel-body">
      
                                          <div class="col-md-3">
                                              <div class="form-group">
                                                  <button id="btnExport" onclick="fnExcelReport('id18', 'LISTA DE CANDIDATOS A EXAME', '<!--=an-->', '<!--=cur--> | DISCIPLINA: <!--=di-->');" class="btn bg-success-600 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                      <b><i class="icon-file-excel"></i></b>
                                                      Exportar registos
                                                  </button>
                                              </div>
                                          </div>
      
                                      </div>
      
      
                                      <table class="table datatable-responsive">
                                          <thead>
                                              <tr>
                                                  <th class="text-bold text-uppercase">#</th>
                                                  <th class="text-bold text-uppercase">Província</th>
                                                  <th class="text-bold text-uppercase">Escola</th>
                                                  <th class="text-bold text-uppercase">Código</th>
                                                  <th class="text-bold text-uppercase">Candidato ID</th>
                                                  <th class="text-bold text-uppercase">Nome Completo</th>
                                                  <th class="text-bold text-uppercase">Género</th>
                                                  <th class="text-bold text-uppercase">Tipo de Doc.</th>
                                                  <th class="text-bold text-uppercase">Nº Do Documento</th>
                                                  <th class="text-bold text-uppercase">Grupo Científico</th>
                                                  <th class="text-bold text-uppercase">Disciplina</th>
                                              </tr>
                                          </thead>
                                          <tbody>
      
      
                                              <!--
                                                  int i = 0;
                                                  if (exames != null) {
      
                                                      for (Exame e : exames) {
      
                                                          int id = e.getExamId();
      
                                                          String s1 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(e.getAluno().getPessoa().getPessApelido());
                                                          String s2 = encryptUtils.decodeString(e.getAluno().getAlunBadgnumber());
                                                          String s3 = encryptUtils.decodeString(e.getEntidade().getEntiProvincia());
                                                          String s4 = encryptUtils.decodeString(e.getEntidade().getEntiLicenca());
                                                          String s5 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessSexo()).charAt(0) + "";
                                                          String s6 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessDocumento());
                                                          String s7 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessBi());
                                                          String s8 = "---";
                                                          String s9 = encryptUtils.decodeString(e.getDisciplina().getDiscDescricao());
                                                          String s10 = encryptUtils.decodeString(e.getEntidade().getEntiNome());
      
                                                          i++;
      
                                              -->
                                              <tr>
                                                  <td class="text-bold text-primary-600"><!--=i--></td>
                                                  <td class="text-uppercase"><!--=s3--></td>
                                                  <td class="text-uppercase"><!--=s10--></td>
                                                  <td class="text-uppercase"><!--=s4--></td>
                                                  <td class="text-bold"><!--=s2--></td>
                                                  <td class="text-uppercase"><!--=s1--></td>
                                                  <td class="text-uppercase"><!--=s5--></td>
                                                  <td class="text-uppercase"><!--=s6--></td>
                                                  <td class="text-uppercase"><!--=s7--></td>
                                                  <td class="text-uppercase"><!--=s8--></td>
                                                  <td class="text-uppercase"><!--=s9--></td>
                                              </tr>
      
                                              <!--
      
                                                      }
                                                  }
                                              -->
      
                                          </tbody>
                                      </table>
      
      
      
      
                                      <table class="table" hidden="" id="id18">
                                          <thead>
                                              <tr>
                                                  <th class="text-bold text-uppercase">#</th>
                                                  <th class="text-bold text-uppercase">Província</th>
                                                  <th class="text-bold text-uppercase">Escola</th>
                                                  <th class="text-bold text-uppercase">Código</th>
                                                  <th class="text-bold text-uppercase">Candidato ID</th>
                                                  <th class="text-bold text-uppercase">Nome Completo</th>
                                                  <th class="text-bold text-uppercase">Género</th>
                                                  <th class="text-bold text-uppercase">Tipo de Doc.</th>
                                                  <th class="text-bold text-uppercase">Nº Do Documento</th>
                                                  <th class="text-bold text-uppercase">Grupo Científico</th>
                                                  <th class="text-bold text-uppercase">Disciplina</th>
                                              </tr>
                                          </thead>
                                          <tbody>
      
      
                                              <!--
                                                  i = 0;
                                                  if (exames != null) {
      
                                                      for (Exame e : exames) {
      
                                                          int id = e.getExamId();
      
                                                          String s1 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(e.getAluno().getPessoa().getPessApelido());
                                                          String s2 = encryptUtils.decodeString(e.getAluno().getAlunBadgnumber());
                                                          String s3 = encryptUtils.decodeString(e.getEntidade().getEntiProvincia());
                                                          String s4 = encryptUtils.decodeString(e.getEntidade().getEntiLicenca());
                                                          String s5 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessSexo()).charAt(0) + "";
                                                          String s6 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessDocumento());
                                                          String s7 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessBi());
                                                          String s8 = "---";
                                                          String s9 = encryptUtils.decodeString(e.getDisciplina().getDiscDescricao());
                                                          String s10 = encryptUtils.decodeString(e.getEntidade().getEntiNome());
      
                                                          i++;
      
                                              -->
                                              <tr>
                                                  <td class="text-bold text-primary-600"><!--=i--></td>
                                                  <td class="text-uppercase"><!--=s3--></td>
                                                  <td class="text-uppercase"><!--=s10--></td>
                                                  <td class="text-uppercase"><!--=s4--></td>
                                                  <td class="text-bold"><!--=s2--></td>
                                                  <td class="text-uppercase"><!--=s1--></td>
                                                  <td class="text-uppercase"><!--=s5--></td>
                                                  <td class="text-uppercase"><!--=s6--></td>
                                                  <td class="text-uppercase"><!--=s7--></td>
                                                  <td class="text-uppercase"><!--=s8--></td>
                                                  <td class="text-uppercase"><!--=s9--></td>
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
  name: 'AddStudent',
  components: { NavBar },
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
