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
                                              <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-grid-alt position-left"></i> Lançamentos de Notas</a></li>
                                          </ul>
              
                                      </div>
                                  </div>
                                  <!-- /toolbar -->
              
              
              
              
              
                                  <div class = "row">
                                      <!-- Vertical form options -->
                                      <div class="col-md-6"> 
                                          <!-- Basic layout-->
              
                                          <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?YWNjYW8jbm90YXM=">
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
                                              String act = encryptUtils.encodeString("accao#filtrar-semestre&to=avl-notes");
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
                                          <!--                                String act3 = encryptUtils.encodeString("accao#filtrar-turma&to=avl-notes");
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
              
                                          <!--                                String act4 = encryptUtils.encodeString("accao#filtrar-calendario&to=avl-notes");
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
              
                                  <!-- User profile -->
                                  <div class="row">
              
                                      <div class="col-md-12">
              
              
              
                                          <!--
                                              String dd = "";
                                              String cur = "";
                                              String di = "";
              
                                              boolean haveT3 = false;
                                              boolean haveT4 = false;
                                              boolean haveA2 = false;
              
                                              if (turma != null) {
              
                                                  dd = encryptUtils.decodeString(turma.getTurmDescricao());
                                                  cur = encryptUtils.decodeString(turma.getCurso().getCursCod())
                                                          + " - " + encryptUtils.decodeString(turma.getCurso().getCursDescricao());
              
                                              }
              
                                              if (calendario != null) {
                                                  di = encryptUtils.decodeString(calendario.getDisciplina().getDiscDescricao());
              
                                                  haveT3 = calendario.isCaleHaveTeste3();
                                                  haveT4 = calendario.isCaleHaveTeste4();
                                                  haveA2 = calendario.isCaleHaveAcp();
                                              }
                                          -->
              
              
                                          <!-- Basic responsive configuration -->
                                          <div class="panel panel-flat">
                                              <div class="panel-heading">
              
                                                  <h6 class="panel-title text-bold text-uppercase">Mapa de notas  <span class="text-danger-600">[<!--=cur + " | Turma:" + dd-->]</span> <span class="text-primary-600"> - [<!--=di-->]</span></h6>
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
                                                          <button id="btnExport" onclick="fnExcelReport('id18', 'CLASSE: <!--=cur--> | TURMA: <!--=dd--> | DISCIPLINA: <!--=di-->');" class="btn bg-success-600 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                              <b><i class="icon-file-excel"></i></b>
                                                              Exportar registos
                                                          </button>
                                                      </div>
                                                  </div>
                                                              
                                              </div>
              
                                              <table class="table datatable-fixed-left" width="100%">
                                                  <thead>
                                                      <tr>
                                                          <th class="text-bold text-uppercase">Aluno</th>
                                                          <th class="text-bold text-uppercase">1ª ACS</th>
                                                          <th class="text-bold text-uppercase">2ª ACS</th>
              
                                                          <!--
                                                              if (haveT3) {
                                                          -->
                                                          <th class="text-bold text-uppercase">3ª ACS</th>
                                                              <!--
                                                                  }
                                                              -->
              
                                                          <!--
                                                              if (haveT4) {
                                                          -->
                                                          <th class="text-bold text-uppercase">4ª ACS</th>
                                                              <!--
                                                                  }
                                                              -->
              
                                                          <th class="text-bold text-uppercase">1ª ACP</th>
                                                              <!--
                                                                  if (haveA2) {
                                                              -->
                                                          <th class="text-bold text-uppercase">2ª ACP</th>
                                                              <!--
                                                                  }
                                                              -->
                                                          <th class="text-bold text-uppercase text-danger-600">---</th>
                                                      </tr>
                                                  </thead>
                                                  <tbody>
              
                                                      <!--
                                                          if (notas != null) {
                                                              for (Notas n : notas) {
                                                                  int id = n.getInscricao().getInscId();
                                                                  String s1 = encryptUtils.decodeString(n.getAluno().getAlunBadgnumber()) + " - " + encryptUtils.decodeString(n.getAluno().getPessoa().getPessNome()) + " "
                                                                          + encryptUtils.decodeString(n.getAluno().getPessoa().getPessApelido());
              
                                                                  Calendar c = Calendar.getInstance();
              
                                                                  Date dHoje = new Date();
              
                                                                  c.setTime(dHoje);
                                                                  c.set(Calendar.HOUR, 23);
                                                                  c.set(Calendar.MINUTE, 59);
                                                                  c.set(Calendar.SECOND, 59);
              
                                                                  dHoje = c.getTime();
              
                                                                  String dis1 = "";
                                                                  String dis2 = "";
                                                                  String dis3 = "";
                                                                  String dis4 = "";
                                                                  String dis5 = "";
                                                                  String dis6 = "";
              
                                                                  String n1 = df.format(n.getNotaTeste1());
                                                                  String n2 = df.format(n.getNotaTeste2());
                                                                  String n3 = df.format(n.getNotaTeste3());
                                                                  String n4 = df.format(n.getNotaTeste4());
                                                                  String n5 = df.format(n.getNotaAcp());
                                                                  String n6 = df.format(n.getNotaAcp2());
              
                                                                  if (calendario != null) {
                                                                      if (calendario.getCaleTeste1Limite() != null) {
              
                                                                          Date d = calendario.getCaleTeste1Limite().toGregorianCalendar().getTime();
              
                                                                          if (d.equals(dHoje) || d.after(dHoje)) {
                                                                              dis1 = "";
                                                                          }
                                                                      }
                                                                      if (calendario.getCaleTeste2Limite() != null) {
              
                                                                          Date d = calendario.getCaleTeste2Limite().toGregorianCalendar().getTime();
              
                                                                          if (d.equals(dHoje) || d.after(dHoje)) {
                                                                              dis2 = "";
                                                                          }
                                                                      }
                                                                      if (calendario.getCaleTeste3Limite() != null) {
              
                                                                          Date d = calendario.getCaleTeste3Limite().toGregorianCalendar().getTime();
              
                                                                          if (d.equals(dHoje) || d.after(dHoje)) {
                                                                              dis3 = "";
                                                                          }
                                                                      }
                                                                      if (calendario.getCaleTeste4Limite() != null) {
              
                                                                          Date d = calendario.getCaleTeste4Limite().toGregorianCalendar().getTime();
              
                                                                          if (d.equals(dHoje) || d.after(dHoje)) {
                                                                              dis4 = "";
                                                                          }
                                                                      }
                                                                      if (calendario.getCaleAcpLimite() != null) {
              
                                                                          Date d = calendario.getCaleAcpLimite().toGregorianCalendar().getTime();
              
                                                                          if (d.equals(dHoje) || d.after(dHoje)) {
                                                                              dis5 = "";
                                                                          }
                                                                      }
                                                                      if (calendario.getCaleAcp2Limite() != null) {
              
                                                                          Date d = calendario.getCaleAcp2Limite().toGregorianCalendar().getTime();
              
                                                                          if (d.equals(dHoje) || d.after(dHoje)) {
                                                                              dis6 = "";
                                                                          }
                                                                      }
                                                                  }
              
                                                                  String l1 = "has-error";
                                                                  String l2 = "has-error";
                                                                  String l3 = "has-error";
              
                                                                  if (n.getNotaTeste1() >= 10) {
                                                                      l1 = "has-success";
                                                                  }
              
                                                                  if (n.getNotaTeste2() >= 10) {
                                                                      l2 = "has-success";
                                                                  }
              
                                                                  if (n.getNotaTeste3() >= 10) {
                                                                      l3 = "has-success";
                                                                  }
              
                                                                  String actN = encryptUtils.encodeString("accao#lancar-notas&id=" + id);
              
                                                      -->
                                                      <tr>
                                                          <td><!--=s1--></td>
              
                                                  <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?<!--=actN-->">
              
                                                      <td>
              
                                                          <input type="number" step="any" class="form-control" placeholder="1ª ACS" name="teste1" required="" value="<!--=n1-->">
              
              
                                                      </td>
                                                      <td>
              
                                                          <input type="number" step="any" class="form-control" placeholder="2ª ACS" name="teste2" required="" value="<!--=n2-->">
              
                                                      </td>
              
                                                      <!--
                                                          if (haveT3) {
                                                      -->
                                                      <td>
              
                                                          <input type="number" step="any" class="form-control" placeholder="3ª ACS" name="teste3" required="" value="<!--=n3-->">
              
              
                                                      </td>
                                                      <!--
                                                          }
                                                      -->
              
                                                      <!--
                                                          if (haveT4) {
                                                      -->
                                                      <td>
              
                                                          <input type="number" step="any" class="form-control" placeholder="4ª ACS" name="teste4" required="" value="<!--=n4-->"  >
              
              
                                                      </td>
                                                      <!--
                                                          }
                                                      -->
                                                      <td>
              
                                                          <input type="number" step="any" class="form-control" placeholder="1ª ACP" name="teste5" required="" value="<!--=n5-->" >
              
              
                                                      </td>
              
                                                      <!--
                                                          if (haveA2) {
                                                      -->
                                                      <td>
              
                                                          <input type="number" step="any" class="form-control" placeholder="2ª ACP" name="teste6" required="" value="<!--=n6-->">
              
              
                                                      </td>
                                                      <!--
                                                          }
                                                      -->
              
                                                      <td>
              
                                                          <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-slate-800 text-bold text-uppercase">
                                                              <b><i class="icon-reload-alt position-right"></i> act</b> 
              
                                                          </button>
              
                                                      </td>
                                                  </form>
                                                  </tr>
              
                                                  <!--
                                                          }
                                                      }
                                                  -->
              
                                                  </tbody>
                                              </table>
              
              
              
                                              <table class="table" width="100%" hidden=""   id="id18" >
                                                  <thead>
                                                      <tr>
                                                          <th class="text-bold text-uppercase">#</th>
                                                          <th class="text-bold text-uppercase">Cod. Matricula</th>
                                                          <th class="text-bold text-uppercase">Aluno</th>
                                                          <th class="text-bold text-uppercase">1ª ACS</th>
                                                          <th class="text-bold text-uppercase">2ª ACS</th>
                                                          <th class="text-bold text-uppercase">3ª ACS</th>
                                                          <th class="text-bold text-uppercase">4ª ACS</th>
                                                          <th class="text-bold text-uppercase">1ª ACP</th>
                                                          <th class="text-bold text-uppercase">2ª ACP</th>
                                                      </tr>
                                                  </thead>
                                                  <tbody>
              
                                                      <!--
                                                          if (notas != null) {
                                                              for (Notas n : notas) {
                                                                  int id = n.getNotaId();
                                                                  String s1 = encryptUtils.decodeString(n.getAluno().getAlunBadgnumber()) + " - " + encryptUtils.decodeString(n.getAluno().getPessoa().getPessNome()) + " "
                                                                          + encryptUtils.decodeString(n.getAluno().getPessoa().getPessApelido());
                                                                  String n1 = df.format(n.getNotaTeste1());
                                                                  String n2 = df.format(n.getNotaTeste2());
                                                                  String n3 = df.format(n.getNotaTeste3());
                                                                  String n4 = df.format(n.getNotaTeste4());
                                                                  String n5 = df.format(n.getNotaAcp());
                                                                  String n6 = df.format(n.getNotaAcp2());
                                                                  String insc = encryptUtils.decodeString(n.getInscricao().getInscReferencia());
              
                                                      -->
                                                      <tr>
                                                          <td><!--=id--></td>
                                                          <td><!--=insc--></td>
                                                          <td><!--=s1--></td>
                                                          <td><!--=n1--></td>
                                                          <td><!--=n2--></td>
                                                          <td><!--=n3--></td>
                                                          <td><!--=n4--></td>
                                                          <td><!--=n5--></td>
                                                          <td><!--=n6--></td>
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
