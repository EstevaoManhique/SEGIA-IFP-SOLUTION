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
                              <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-library2 position-left"></i> Alunos Matriculados</a></li>
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

                      if (escola != null) {
                          if (proUs.isEmpty()) {
                              proUs = encryptUtils.decodeString(escola.getEscProvincia());
                          }

                          if (disUs.isEmpty()) {
                              disUs = encryptUtils.decodeString(escola.getEscDistrito());
                          }

                          if (escUs.isEmpty()) {
                              escUs = encryptUtils.decodeString(escola.getCodEscola()) + "-" + encryptUtils.decodeString(escola.getEscDescricao());
                          }
                      } else {

                          if (provinciaSel != null) {
                              proUs = provinciaSel;
                          }

                          if (escolaSel != null) {
                              escUs = escolaSel;
                          }
                      }


                  -->

                  <div class="panel panel-flat">

                      <div class="panel-body">


                          <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="QWx1bm9TZXJ2bGV0I0RDSQ==?YWNjYW8jYWx1bm9z">


                              <div class="row">


                                  <div class="col-md-3">

                                      <label class="control-label text-bold text-uppercase">provincia:</label>

                                      <select class="select" name="idProvincia"  placeholder="Selecione a provincia" id="make" >
                                          <optgroup label="Selecione a provincia">
                                              <option></option>

                                              <!--
                                                  if (provincias != null) {
                                                      for (EdstProvince ep : provincias) {

                                                          int id = ep.getId();
                                                          String desc = ep.getName();

                                                          String sel = "";

                                                          if (desc.equals(proUs)) {
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


                                  <div class="col-md-3">
                                      <label class="control-label text-bold text-uppercase">Distrito:</label>

                                      <select id="models"  data-placeholder="Selecione o distrito" class="select" name="distrito" required="" >
                                          <optgroup label="Selecione o distrito">
                                              <!--
                                                  if (!disUs.isEmpty()) {
                                              -->
                                              <option value="<!--=disUs-->" selected><!--=disUs--></option>
                                              <!--
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

                                  <div class="col-md-2">
                                      <label class="control-label text-bold text-uppercase">Classe:</label>
                                      <select class="select" name="idCurso" data-placeholder="Selecione a classe">
                                          <optgroup label="Selecione a classe">
                                              <!--
                                                  if (cursos != null) {

                                                      for (Curso c : cursos) {
                                                          int id = c.getCursId();
                                                          String desc = encryptUtils.decodeString(c.getCursCod()) + " - " + encryptUtils.decodeString(c.getCursDescricao());

                                                          String sel = "";

                                                          if (curso != null) {
                                                              if (curso.getCursId() == id) {
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


                              </div> <!-- /row.1.1-->

                              <div class="row">

                                  <div class="col-md-6">
                                      <br>
                                      <button type="submit" onclick="this.disabled = 'disabled';
                                              this.form.submit();" class="text-bold text-uppercase btn bg-primary-600 text-bold text-uppercase"> Filtrar Alunos <i class="icon-search4 position-right"></i></button>
                                  </div>

                              </div> <!-- /row.1.2-->


                          </form>
                      </div>
                  </div>

                  <div class="row">



                      <!--
                          String dd = "";
                          String cur = "";

                          String an = "";

                          if (curso != null) {
                              cur = encryptUtils.decodeString(curso.getCursCod()) + "-" + encryptUtils.decodeString(curso.getCursDescricao());

                          }

                          if (anoLectivo != null) {
                              an = encryptUtils.decodeString(anoLectivo.getAnolDescricao());
                          }
                      -->



                      <div class="col-md-12">

                          <!-- Basic responsive configuration -->
                          <div class="panel panel-flat">
                              <div class="panel-heading">
                                  <h6 class="panel-title text-bold text-uppercase">LISTAGEM DE ALUNOS  <i class=" icon-arrow-right7"></i>  <span class="text-danger-600"><!--=cur--></span> <span> - [<!--=proUs + " : " + escUs-->]</span></h6>
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
                                          <button id="btnExport" onclick="fnExcelReport('id18', 'LISTA DE ALUNOS', '<!--=an-->', '<!--=cur-->');" class="btn bg-success-600 btn-labeled btn-labeled-left text-bold text-uppercase">
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
                                          <th class="text-bold text-uppercase">Turma</th>
                                          <th class="text-bold text-uppercase">Nome Completo</th>
                                          <th class="text-bold text-uppercase">Género</th>
                                          <th class="text-bold text-uppercase">Tipo de Doc.</th>
                                          <th class="text-bold text-uppercase">Nº Do Documento</th>
                                          <th class="text-bold text-uppercase">Grupo Científico</th>
                                          <th class="text-bold text-uppercase">Disciplina</th>
                                          <th class="text-bold text-uppercase text-center">---</th>
                                      </tr>
                                  </thead>
                                  <tbody>


                                      <!--
                                          int i = 0;
                                          if (inscricoes != null) {

                                              for (Inscricao e : inscricoes) {

                                                  if (e.getAluno() != null) {

                                                      if (e.getAluno().getPessoa() != null) {
                                                          int id = e.getInscId();

                                                          String s2 = "---";

                                                          if (e.getAluno().getAlunUnico() != null) {
                                                              s2 = encryptUtils.decodeString(e.getAluno().getAlunUnico());
                                                          }

                                                          String s1 = "---";

                                                          if (e.getAluno().getPessoa().getPessNome() != null) {
                                                              s1 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessNome());
                                                          }

                                                          if (e.getAluno().getPessoa().getPessApelido() != null) {
                                                              s1 += " " + encryptUtils.decodeString(e.getAluno().getPessoa().getPessApelido());
                                                          }

                                                          String s5 = "---";
                                                          if (e.getAluno().getPessoa().getPessSexo() != null) {

                                                              s5 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessSexo());

                                                              if (!s5.isEmpty()) {
                                                                  s5 = s5.charAt(0) + "";
                                                              }
                                                          }
                                                          String s6 = "---";

                                                          if (e.getAluno().getPessoa().getPessDocumento() != null) {
                                                              s6 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessDocumento());
                                                          }

                                                          String s7 = "---";
                                                          if (e.getAluno().getPessoa().getPessBi() != null) {
                                                              s7 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessBi());
                                                          }

                                                          String s8 = "---";
                                                          String s9 = "";
                                                          String s10 = "---";
                                                          String s4 = "---";
                                                          String s3 = "---";
                                                          String tur = "---";

                                                          if (e.getCurso() != null) {
                                                              s8 = encryptUtils.decodeString(e.getCurso().getCursCod());
                                                          }

                                                          if (e.getAluno().getEscola() != null) {
                                                              s10 = encryptUtils.decodeString(e.getAluno().getEscola().getEscDescricao());
                                                              s4 = encryptUtils.decodeString(e.getAluno().getEscola().getCodEscola());
                                                              s3 = encryptUtils.decodeString(e.getAluno().getEscola().getEscProvincia());

                                                          } else {
                                                              if (e.getInscEscola() != null) {
                                                                  s10 = encryptUtils.decodeString(e.getInscEscola());
                                                              }
                                                              //s4 = encryptUtils.decodeString(e.getAluno().getEscola().getCodEscola());

                                                              if (e.getInscProvincia() != null) {
                                                                  s3 = encryptUtils.decodeString(e.getInscProvincia());
                                                              }

                                                          }

                                                          String str = "";

                                                          if (e.getInscDisciplinas() != null) {
                                                              str = encryptUtils.decodeString(e.getInscDisciplinas());
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

                                                          String actE = "#";
                                                          String colorE = "text-gray";
                                                          String actR = "#";
                                                          String colorR = "text-gray";

                                                          if (cargo.equals("Super Administrador") || cargo.equals("Administrador") || cargo.equals("Director Pedagogico")) {
                                                              actE = "RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?" + encryptUtils.encodeString("accao#editar-inscricao&ei=" + id);

                                                              actR = "RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?" + encryptUtils.encodeString("accao#remover-inscricao&ei=" + id + "&to=ee-list-2");
                                                              colorE = "text-primary-600";
                                                              colorR = "text-danger-600";
                                                          }

                                                          if (e.getTurma() != null) {
                                                              tur = encryptUtils.decodeString(e.getTurma().getTurmDescricao());
                                                          }
                                      -->
                                      <tr>
                                          <td class="text-bold text-primary-600"><!--=i--></td>
                                          <td class="text-uppercase"><!--=s3--></td>
                                          <td class="text-uppercase"><!--=s10--></td>
                                          <td class="text-uppercase"><!--=s4--></td>
                                          <td class="text-bold"><!--=s2--></td>
                                          <td class="text-uppercase"><!--=tur--></td>
                                          <td class="text-uppercase"><!--=s1--></td>
                                          <td class="text-uppercase"><!--=s5--></td>
                                          <td class="text-uppercase"><!--=s6--></td>
                                          <td class="text-uppercase"><!--=s7--></td>
                                          <td class="text-uppercase"><!--=s8--></td>
                                          <td class="text-uppercase"><!--=s9--></td>
                                          <td class="text-center">
                                              <a href='<!--=actE-->' data-popup="tooltip" title="Editar"><i class="icon-pencil4 <!--=colorE-->"></i></a>
                                              <a href='<!--=actR-->' data-popup="tooltip" title="Remover"><i class="icon-cross <!--=colorR-->"></i></a>
                                          </td>
                                      </tr>

                                      <!--
                                                      }
                                                  }
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
                                          <th class="text-bold text-uppercase">Turma</th>
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

                                                  if (e.getAluno() != null) {

                                                      if (e.getAluno().getPessoa() != null) {

                                                          int id = e.getInscId();

                                                          String s1 = "---";

                                                          if (e.getAluno().getPessoa().getPessNome() != null) {
                                                              s1 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessNome());
                                                          }

                                                          if (e.getAluno().getPessoa().getPessApelido() != null) {
                                                              s1 += " " + encryptUtils.decodeString(e.getAluno().getPessoa().getPessApelido());
                                                          }

                                                          String s5 = "---";

                                                          if (e.getAluno().getPessoa().getPessSexo() != null) {

                                                              s5 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessSexo());

                                                              if (!s5.isEmpty()) {
                                                                  s5 = s5.charAt(0) + "";
                                                              }
                                                          }
                                                          String s6 = "---";

                                                          if (e.getAluno().getPessoa().getPessDocumento() != null) {
                                                              s6 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessDocumento());
                                                          }

                                                          String s7 = "---";
                                                          if (e.getAluno().getPessoa().getPessBi() != null) {
                                                              s7 = encryptUtils.decodeString(e.getAluno().getPessoa().getPessBi());
                                                          }
                                                          String s8 = "---";
                                                          String s9 = "";
                                                          String s10 = "---";
                                                          String s4 = "---";
                                                          String s3 = "---";
                                                          String tur = "---";


                                                          if (e.getCurso() != null) {
                                                              s8 = encryptUtils.decodeString(e.getCurso().getCursCod());
                                                          }

                                                          if (e.getAluno().getEscola() != null) {
                                                              s10 = encryptUtils.decodeString(e.getAluno().getEscola().getEscDescricao());
                                                              s4 = encryptUtils.decodeString(e.getAluno().getEscola().getCodEscola());
                                                              s3 = encryptUtils.decodeString(e.getAluno().getEscola().getEscProvincia());

                                                          } else {
                                                              if (e.getInscEscola() != null) {
                                                                  s10 = encryptUtils.decodeString(e.getInscEscola());
                                                              }
                                                              //s4 = encryptUtils.decodeString(e.getAluno().getEscola().getCodEscola());

                                                              if (e.getInscProvincia() != null) {
                                                                  s3 = encryptUtils.decodeString(e.getInscProvincia());
                                                              }

                                                          }

                                                          String str = "";

                                                          if (e.getInscDisciplinas() != null) {
                                                              str = encryptUtils.decodeString(e.getInscDisciplinas());
                                                          }

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

                                                          if (e.getTurma() != null) {
                                                              tur = encryptUtils.decodeString(e.getTurma().getTurmDescricao());
                                                          }

                                      -->
                                      <tr>
                                          <td class="text-bold text-primary-600"><!--=i--></td>
                                          <td class="text-uppercase"><!--=s3--></td>
                                          <td class="text-uppercase"><!--=s10--></td>
                                          <td class="text-uppercase"><!--=s4--></td>
                                          <td class="text-bold"><!--=s2--></td>
                                          <td class="text-uppercase"><!--=tur--></td>
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
