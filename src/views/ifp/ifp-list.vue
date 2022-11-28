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
                                          <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-user-check position-left"></i> Listagem dos Candidatos Inscritos</a></li>
                                      </ul>
          
                                  </div>
                              </div>
                              <!-- /toolbar -->
          
          
          
          
                              <div class = "row">
          
          
          
          
                                  <!-- Vertical form options -->
                                  <div class="col-md-12"> 
                                      <!-- Basic layout-->
          
                                      <form method="post" accept-charset="ISO-8859-1" action="SUZQU2VydmxldCNEQ0k=?YWNjYW8jYXB1cmFkb3M=">
                                          <div class="panel panel-flat">
                                              <div class="panel-body">
          
                                                  <div class="row">
          
                                                      <div class="col-md-2">
          
                                                          <label class="control-label text-bold text-uppercase">Classe:</label>
          
                                                          <select class="select" name="idCurso" disabled="">
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
          
                                                          <label class="control-label text-bold text-uppercase">provincia:</label>
          
                                                          <select class="select" name="idProvincia"  placeholder="Selecione a provincia" id="make">
                                                              <optgroup label="Selecione a provincia">
                                                                  <option></option>
          
                                                                  <!--
                                                                      if (provinces != null) {
                                                                          for (EdstProvince ep : provinces) {
          
                                                                              int id = ep.getId();
                                                                              String desc = ep.getName();
          
                                                                              String sel = "";
          
                                                                              if (desc.equals(provinciaSel)) {
                                                                                  sel = "selected";
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
          
                                                      <div class="col-md-4">
                                                          <label class="control-label text-bold text-uppercase">Escola:</label>
                                                          <select class="select" name="escola" data-placeholder="Selecione a escola" id="schools">
                                                              <optgroup label="Selecione a escola">
          
                                                              </optgroup>
                                                          </select>
          
                                                      </div>
                                                  </div> <!-- /row.1.1-->
          
                                                  <div class="row">
                                                      <br>
                                                      <div class="col-md-4">
                                                          <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                              <b><i class="icon-search4 position-right"></i></b> 
                                                              Filtrar Registos
                                                          </button>
                                                      </div>
                                                  </div> <!-- /row.1.2-->
          
                                              </div>
                                          </div>
                                      </form>
                                      <!-- /basic layout -->
          
                                  </div>
          
          
                              </div>
                              <!-- /row.1-->
          
                              <!-- User profile -->
                              <div class="row">
          
          
          
                                  <!--
                                      String dd = "";
                                      String cur = "";
                                      String di = "";
          
                                      String an = "";
          
                                      if (disciplina != null) {
                                          cur = "12ª Classe";
                                          di = encryptUtils.decodeString(disciplina.getDiscDescricao());
                                      }
          
                                      if (anoLectivo != null) {
                                          an = encryptUtils.decodeString(anoLectivo.getAnolDescricao());
                                      }
                                  -->
          
          
          
                                  <div class="col-md-12">
          
                                      <!-- Basic responsive configuration -->
                                      <div class="panel panel-flat">
                                          <div class="panel-heading">
                                              <h6 class="panel-title text-bold text-uppercase">LISTA DE CANDIDATOS A EXAME  <i class=" icon-arrow-right7"></i>  <span class="text-danger-600"><!--=cur--></span> <span> - [<!--=provinciaSel + " : " + escolaSel-->]</span></h6>
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
                                                      <button id="btnExport" onclick="fnExcelReport('id18', 'LISTA DE CANDIDATOS A EXAME', '<!--=an-->', '<!--=cur-->');" class="btn bg-success-600 btn-labeled btn-labeled-left text-bold text-uppercase">
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
                                                      if (inscricoes != null) {
          
                                                          for (Inscricao e : inscricoes) {
          
                                                              int id = e.getInscId();
          
                                                              String s1 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(e.getAluno().getPessoa().getPessApelido());
                                                              String s2 = "---";
          
                                                              if (e.getAluno().getAlunUnico() != null) {
                                                                  s2 = encryptUtils.decodeString(e.getAluno().getAlunUnico());
                                                              }
          
                                                              String s3 = encryptUtils.decodeString(e.getEntidade().getEntiProvincia());
                                                              String s4 = encryptUtils.decodeString(e.getEntidade().getEntiLicenca());
                                                              String s5 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessSexo()).charAt(0) + "";
                                                              String s6 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessDocumento());
                                                              String s7 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessBi());
                                                              String s8 = "---";
                                                              String s9 = "";
                                                              String s10 = encryptUtils.decodeString(e.getEntidade().getEntiNome());
          
                                                              String str = encryptUtils.decodeString(e.getInscDisciplinas());
          
                                                              if (str != null) {
                                                                  if (!str.isEmpty()) {
                                                                      List<String> items = Arrays.asList(str.split("\\s*,\\s*"));
          
                                                                      for (String s : items) {
                                                                          if (s.length() > 3) {
          
                                                                              s9 += s.substring(0, 3) + ",";
                                                                          } else {
                                                                              s9 += s + ",";
                                                                          }
                                                                      }
                                                                  }
          
                                                              }
          
                                                              if (!s9.isEmpty()) {
                                                                  s9 = s9.substring(0, s9.length() - 1);
                                                              }
          
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
                                                      if (inscricoes != null) {
          
                                                          for (Inscricao e : inscricoes) {
          
                                                              int id = e.getInscId();
          
                                                              String s1 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(e.getAluno().getPessoa().getPessApelido());
          
                                                              String s3 = encryptUtils.decodeString(e.getEntidade().getEntiProvincia());
                                                              String s4 = encryptUtils.decodeString(e.getEntidade().getEntiLicenca());
                                                              String s5 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessSexo()).charAt(0) + "";
                                                              String s6 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessDocumento());
                                                              String s7 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessBi());
                                                              String s8 = "---";
                                                              String s9 = "";
                                                              String s10 = encryptUtils.decodeString(e.getEntidade().getEntiNome());
          
                                                              String str = encryptUtils.decodeString(e.getInscDisciplinas());
          
                                                              String s2 = "---";
          
                                                              if (e.getAluno().getAlunUnico() != null) {
                                                                  s2 = encryptUtils.decodeString(e.getAluno().getAlunUnico());
                                                              }
          
                                                              if (str != null) {
                                                                  if (!str.isEmpty()) {
                                                                      List<String> items = Arrays.asList(str.split("\\s*,\\s*"));
          
                                                                      for (String s : items) {
                                                                          if (s.length() > 3) {
          
                                                                              s9 += s.substring(0, 3) + ",";
                                                                          } else {
                                                                              s9 += s + ",";
                                                                          }
                                                                      }
                                                                  }
          
                                                              }
          
                                                              if (!s9.isEmpty()) {
                                                                  s9 = s9.substring(0, s9.length() - 1);
                                                              }
          
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
  name: 'HomeView',
  components: {NavBar},
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
