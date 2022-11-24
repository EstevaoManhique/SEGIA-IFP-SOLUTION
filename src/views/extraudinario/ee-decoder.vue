<template>
  <v-container>
      <nav-bar :menu_types = "4"/>
      <v-row>
          <div class="content-wrapper">
                 <!-- Main content -->
                 <div class="content-wrapper">


                  <!-- Toolbar -->
                  <div class="navbar navbar-default navbar-component navbar-xs">
                      <ul class="nav navbar-nav visible-xs-block">
                          <li class="full-width text-center"><a data-toggle="collapse" data-target="#navbar-filter"><i class="icon-menu7"></i></a></li>
                      </ul>

                      <div class="navbar-collapse collapse" id="navbar-filter">
                          <ul class="nav navbar-nav element-active-orange-400">
                              <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-design position-left"></i> Notas de Desenho</a></li>
                          </ul>

                      </div>
                  </div>
                  <!-- /toolbar -->





                  <!--
                      String proUs = "";
                      String disUs = "";
                      String escUs = "";

                      String disablePro = "";
                      String disableDis = "";
                      String disableEsc = "";

                      String loc = "GERAL";

                      if (usuario.getUsuaProvincia() != null) {
                          proUs = usuario.getUsuaProvincia();
                          disablePro = "disabled";
                      }

                      if (usuario.getUsuaDistrito() != null) {
                          disUs = usuario.getUsuaDistrito();
                          disableDis = "disabled";
                          disablePro = "disabled";
                      }

                      if (usuario.getEscola() != null) {
                          escUs = encryptUtils.decodeString(usuario.getEscola().getCodEscola()) + "-" + encryptUtils.decodeString(usuario.getEscola().getEscDescricao());

                          disableEsc = "disabled";
                          disableDis = "disabled";
                          disablePro = "disabled";
                      }

                      if (provinciaSel != null) {
                          proUs = provinciaSel;
                          loc = proUs;
                      }

                      if (escolaSel != null) {
                          escUs = escolaSel;
                          loc += " | " + escUs;
                      }
                  -->


                  <div class = "row">
                      <!-- Vertical form options -->
                      <div class="col-md-12"> 
                          <!-- Basic layout-->

                          <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?YWNjYW8jbm90YXMtZGVzZW5obw==">
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
                                              <select class="select" name="escola" data-placeholder="Selecione a escola" id="schools" >
                                                  <optgroup label="Selecione a escola">
                                                      <!--
                                                          if (!escUs.isEmpty()) {
                                                      -->
                                                      <option value="<!--=escUs-->" selected><!--=escUs--></option>
                                                      <!--
                                                          }
                                                      -->
                                                  </optgroup>
                                              </select>

                                          </div>

                                          <div class="col-md-3">

                                              <label class="control-label text-bold text-uppercase">Disciplina:</label>
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
                                                  </optgroup>
                                              </select>

                                          </div>

                                      </div> <!-- /row.1.1-->

                                      <div class="row">
                                          <br>
                                          <div class="col-md-12">
                                              <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                  <b><i class="icon-search4 position-right"></i></b> 
                                                  Filtrar Registos
                                              </button>

                                              <br><br>

                                              <h4 class="text-bold">
                                                  <span class="text-danger-600"><!--=cur--></span> <span class="text-primary-600"> - [<!--=di-->]</span>  <span> - [<!--=provinciaSel + " : " + escolaSel-->]</span>
                                              </h4>
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

                      <div class="col-md-6">




                          <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?<!--=act-->">

                              <!-- Basic responsive configuration -->
                              <div class="panel panel-flat">
                                  <div class="panel-heading">
                                      <h6 class="panel-title text-bold text-uppercase"><!--=desc--></h6>
                                      <div class="heading-elements">
                                          <ul class="icons-list">
                                              <li><a data-action="collapse"></a></li>

                                          </ul>
                                      </div>
                                  </div>



                                  <div class="panel-body">

                                      <div class="col-md-3">
                                          <div class="form-group">
                                              <button id="btnExport" onclick="fnExcelReport('id<!--=x-->', 'LISTAGEM DE CANDIDATOS (<!--=desc-->) - <!--=di-->', '<!--=an-->', '<!--=cur-->', '<!--=loc-->');" class="btn bg-success-800 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                  <b><i class="icon-file-excel"></i></b>
                                                  Exportar Resultados
                                              </button>
                                          </div>

                                      </div>

                                      <div class="col-md-2"></div>

                                      <div class="col-md-3">
                                          <div class="form-group">
                                              <button class="btn bg-orange-600 btn-labeled btn-labeled-left text-bold text-uppercase" type="submit">
                                                  <b><i class="icon-checkmark-circle"></i></b>
                                                  Actualizar Notas
                                              </button>
                                          </div>
                                      </div>

                                  </div>


                                  <table class="table datatable-responsive">
                                      <thead>
                                          <tr>
                                              <th class="text-bold text-uppercase"><input type="checkbox" class="styled"></th>
                                              <th class="text-bold text-uppercase">#</th>
                                              <th class="text-bold text-uppercase">Cód.</th>
                                              <th class="text-bold text-uppercase">Nome Candidato</th>
                                              <th class="text-bold text-uppercase">Género</th>
                                              <th class="text-bold text-uppercase">Nota</th>
                                              <th class="text-bold text-uppercase">Sináletica</th>
                                          </tr>
                                      </thead>
                                      <tbody>


                                   
                                          <tr>
                                              <td><input type="checkbox" name="ids_list" value="<!--=id-->" class="styled"></td>
                                              <td><a  href="#" class="text-bold"><!--=i--></a></td>
                                              <td><small class="text-bold text-danger"><!--=cod--></small></td>
                                              <td><small><!--=nomeCompleto--></small></td>
                                              <td><small><!--=gen--></small></td>
                                              <td>
                                                  <select class="select" name="noty_list">
                                                      <optgroup label="Selecione a nota">

                                                 <option value=""></option>
                                                       
                                                      </optgroup>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select class="select" name="sin_list">
                                                      <optgroup label="Selecione a sináletica">

                                         
                                                        <option value=""></option>
                                                          <!--
                                                              }
                                                          -->         
                                                      </optgroup>
                                                  </select>
                                              </td>
                                          </tr>
                                          <!--                                                }
                                              }
                                          -->

                                      </tbody>
                                  </table>


                                  <table  class="table" hidden="" id="id<!--=x-->">
                                      <thead>
                                          <tr>
                                              <th class="text-bold text-uppercase">Cód. Candidato</th>
                                              <th class="text-bold text-uppercase">Nº</th>
                                              <th class="text-bold text-uppercase">Nome Candidato</th>
                                              <th class="text-bold text-uppercase">Género</th>
                                              <th class="text-bold text-uppercase">Nota</th>
                                              <th class="text-bold text-uppercase">Sináletica</th>
                                          </tr>
                                      </thead>
                                      <tbody>
                                          <tr>
                                              <td style="width: 200px;"><small><!--=cod--></small></td>
                                              <td><small><!--=i--></small></td>
                                              <td style="width: 600px;"><small><!--=nomeCompleto--></small></td>
                                              <td><small><!--=gen--></small></td>
                                              <td><small><!--=nota--></small></td>
                                              <td><small><!--=c--></small></td>
                                          </tr>
                                          <!--                                                }
                                              }
                                          -->

                                      </tbody>
                                  </table>

                              </div>
                              <!-- /basic responsive configuration -->
                          </form>
                      </div>

                      <!--
                              }
                          }
                      -->


                  </div>
                  <!-- /vertical form options -->

              </div>
              <!-- /main content -->
          </div>
      </v-row>
  </v-container>
</template>

<script>
import NavBar from '@/components/layout/NavBar.vue';
export default {
  components:{NavBar}
};
</script>

<style>
</style>