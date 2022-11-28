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
                                          <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-checkmark position-left"></i> LISTAGEM DE INSCRIÇÕES POR VALIDAR</a></li>
                                      </ul>
          
                                  </div>
                              </div>
                              <!-- /toolbar -->
          
          
                              <div class = "row">
          
          
          
                                  <!-- Vertical form options -->
                                  <div class="col-md-6"> 
                                      <!-- Basic layout-->
          
                                      <form method="post" accept-charset="ISO-8859-1" action="SUZQU2VydmxldCNEQ0k=?YWNjYW8jdmFsaWRhci1pbnNjcmljb2Vz">
                                          <div class="panel panel-flat">
                                              <div class="panel-body">
          
                                                  <div class="form-group">
                                                      <div class="col-lg-12">
                                                          <div class="row">
          
                                                              <div class="col-md-7">
          
                                                                  <select class="select" name="idProvincia"  placeholder="Selecione a provincia">
                                                                      <optgroup label="Selecione a provincia">
                                                                          <option><!--=provinciaSel--></option>
                                                                          <option>Selecione a provincia</option>
                                                                          <!--
                                                                              if (provinces != null) {
                                                                                  for (EdstProvince ep : provinces) {
          
                                                                                      int id = ep.getId();
                                                                                      String desc = ep.getName();
          
                                                                                      String sel = "";
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
                                                                      Filtrar Provincia
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
          
                                      <form method="post" accept-charset="ISO-8859-1" action="SUZQU2VydmxldCNEQ0k=?YWNjYW8jdmFsaWRhci1pbnNjcmljb2Vz">
                                          <div class="panel panel-flat">
                                              <div class="panel-body">
          
                                                  <div class="form-group">
                                                      <div class="col-lg-12">
                                                          <div class="row">
          
                                                              <div class="col-md-7">
          
          
                                                                  <select class="select" name="escola" data-placeholder="Selecione a escola" id="selEscolas">
                                                                      <optgroup label="Selecione a escola">
                                                                          <option><!--=escolaSel--></option>
                                                                          <!--
                                                                              if (escolas != null) {
                                                                                  for (String desc : escolas) {
          
                                                                          -->
                                                                          <option value="<!--=desc-->"><!--=desc--></option>
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
                                                                      Filtrar Escola
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
                                      String cur = "12ª Classe";
          
                                      String an = "";
          
                                      if (anoLectivo != null) {
                                          an = " | " + encryptUtils.decodeString(anoLectivo.getAnolDescricao());
                                      }
                                  -->
          
          
          
                                  <div class="col-md-12">
          
                                      <!-- Basic responsive configuration -->
                                      <div class="panel panel-flat">
                                          <div class="panel-heading">
                                              <h6 class="panel-title text-bold text-uppercase">LISTAGEM DE INSCRIÇÕES POR VALIDAR <i class=" icon-arrow-right7"></i> <span class="text-danger-600"><!--=cur--><!--=an--></span> <span class="text-primary-600"> - [<!--=provinciaSel + " : " + escolaSel-->]</span></h6>
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
                                                      <button id="btnExport" onclick="fnExcelReport('id18', 'LISTAGEM DE ALUNOS POR VALIDAR', '<!--=an-->', '<!--=cur-->');" class="btn bg-success-600 btn-labeled btn-labeled-left text-bold text-uppercase">
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
                                                      <th class="text-bold text-uppercase">Nome Completo</th>
                                                      <th class="text-bold text-uppercase">Género</th>
                                                      <th class="text-bold text-uppercase">Tipo de Doc.</th>
                                                      <th class="text-bold text-uppercase">Nº Do Documento</th>
                                                      <th class="text-bold text-uppercase">Disciplina(s)</th>
                                                      <th class="text-bold text-uppercase text-center text-danger-600">---</th>
                                                  </tr>
                                              </thead>
                                              <tbody>
          
          
                                                  <!--
                                                      int i = 0;
                                                      if (inscricoes != null) {
          
                                                          for (Inscricao ii : inscricoes) {
          
                                                              int id = ii.getInscId();
          
                                                              String s1 = encryptUtils.decodeString(ii.getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(ii.getAluno().getPessoa().getPessApelido());
                                                              String s2 = encryptUtils.decodeString(ii.getInscEscola());
                                                              String s3 = encryptUtils.decodeString(ii.getInscProvincia());
                                                              String s5 = encryptUtils.decodeString(ii.getAluno().getPessoa().getPessSexo()).charAt(0) + "";
                                                              String s6 = encryptUtils.decodeString(ii.getAluno().getPessoa().getPessDocumento());
                                                              String s7 = encryptUtils.decodeString(ii.getAluno().getPessoa().getPessBi());
                                                              String s8 = "---";
                                                              String s9 = encryptUtils.decodeString(ii.getInscDisciplinas()).replaceAll(",", "<br><br>");
          
                                                              i++;
          
                                                              String actA = encryptUtils.encodeString("accao#confirmar-inscricao&ei=" + id);
                                                              String actR = encryptUtils.encodeString("accao#remover-inscricao&ei=" + id);
          
                                                  -->
                                                  <tr>
                                                      <td class="text-bold text-primary-600"><!--=i--></td>
                                                      <td class="text-uppercase"><!--=s3--></td>
                                                      <td class="text-uppercase text-bold"><!--=s2--></td>
                                                      <td class="text-uppercase"><!--=s1--></td>
                                                      <td class="text-uppercase"><!--=s5--></td>
                                                      <td class="text-uppercase"><!--=s6--></td>
                                                      <td class="text-uppercase"><!--=s7--></td>
                                                      <td>
          
                                                          <small>
                                                              <a href="#" data-toggle="modal" data-target="#modal_info_<!--=id-->">
                                                                 Ver Disciplinas
                                                              </a>
                                                          </small>
          
                                                          <!-- Vertical form modal -->
                                                          <div id="modal_info_<!--=id-->" class="modal fade">
                                                              <div class="modal-dialog">
                                                                  <div class="modal-content">
                                                                      <div class="modal-header">
                                                                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                          <h6 class="modal-title text-bold text-uppercase">Disciplinas do Candidato: <span class="text-danger-600"><!--=s1--></span></h6>
                                                                      </div>
          
                                                                      <div class="modal-body">
                                                                          <h6><!--=s9--></h6>
                                                                      </div>
          
                                                                      <div class="modal-footer">
                                                                          <button type="button" class="btn bg-danger-600 text-bold text-uppercase" data-dismiss="modal">Fechar <i class="icon-chevron-down"></i> </button>
                                                                      </div>
          
                                                                  </div>
                                                              </div>
                                                          </div>
                                                          <!-- /vertical form modal -->
          
                                                      </td>
          
                                                      <td class="text-center">
                                                          <a href='SUZQU2VydmxldCNEQ0k=?<!--=actA-->' data-popup="tooltip" title="Validar"><i class="icon-check text-success-600"></i></a>
          
                                                          &nbsp;
                                                          <a href='SUZQU2VydmxldCNEQ0k=?<!--=actR-->' data-popup="tooltip" title="Não Validar"><i class="icon-cross text-danger-600"></i></a>
          
                                                      </td>
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
                                                      <th class="text-bold text-uppercase">Nome Completo</th>
                                                      <th class="text-bold text-uppercase">Género</th>
                                                      <th class="text-bold text-uppercase">Tipo de Doc.</th>
                                                      <th class="text-bold text-uppercase">Nº Do Documento</th>
                                                      <th class="text-bold text-uppercase">Grupo Científico</th>
                                                      <th class="text-bold text-uppercase">Disciplina(s)</th>
                                                  </tr>
                                              </thead>
                                              <tbody>
          
          
                                                  <!--
                                                      i = 0;
                                                      if (inscricoes != null) {
          
                                                          for (Inscricao ii : inscricoes) {
          
                                                              int id = ii.getInscId();
          
                                                              String s1 = encryptUtils.decodeString(ii.getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(ii.getAluno().getPessoa().getPessApelido());
                                                              String s2 = encryptUtils.decodeString(ii.getInscEscola());
                                                              String s3 = encryptUtils.decodeString(ii.getInscProvincia());
                                                              String s5 = encryptUtils.decodeString(ii.getAluno().getPessoa().getPessSexo()).charAt(0) + "";
                                                              String s6 = encryptUtils.decodeString(ii.getAluno().getPessoa().getPessDocumento());
                                                              String s7 = encryptUtils.decodeString(ii.getAluno().getPessoa().getPessBi());
                                                              String s8 = "---";
                                                              String s9 = encryptUtils.decodeString(ii.getInscDisciplinas());
          
                                                              i++;
          
                                                  -->
                                                  <tr>
                                                      <td class="text-bold text-primary-600"><!--=i--></td>
                                                      <td class="text-uppercase"><!--=s3--></td>
                                                      <td class="text-uppercase text-bold"><!--=s2--></td>
                                                      <td class="text-uppercase"><!--=s1--></td>
                                                      <td class="text-uppercase"><!--=s5--></td>
                                                      <td class="text-uppercase"><!--=s6--></td>
                                                      <td class="text-uppercase"><!--=s7--></td>
                                                      <td class="text-uppercase"><!--=s8--></td>
                                                      <td class="text-uppercase"><small><!--=s9--></small></td>
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
