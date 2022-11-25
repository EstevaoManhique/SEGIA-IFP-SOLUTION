<template>
    <v-container>
        <nav-bar :menu_types = "5"/>
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
                          <ul class="nav navbar-nav element-active-slate-400">


                              <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-file-upload position-left"></i> Importar Alunos</a></li>
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
                      }

                  -->

                  <!-- Vertical form options -->
                  <div class="row">
                      <div class="col-md-4">



                          <div class="tabbable">
                              <ul class="nav nav-tabs nav-tabs-top top-divided nav-justified">
                                  <li class="text-uppercase text-bold active"><a href="#top-justified-divided-tab1" data-toggle="tab">Ficha Completa</a></li>
                                  <li class="text-uppercase text-bold"><a href="#top-justified-divided-tab2" data-toggle="tab">Ficha Simplificada</a></li>
                              </ul>

                              <div class="tab-content">
                                  <div class="tab-pane active" id="top-justified-divided-tab1">



                                      <!--                                            String act = encryptUtils.encodeString("accao#upload&to=student-import&type=Ficha Completa");
                                      -->
                                      <!-- Basic layout-->
                                      <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" enctype="multipart/form-data" action="VXBsb2FkU2VydmxldCNEQ0k=?<!--=act-->">
                                          <div class="panel panel-flat">

                                              <div class="panel-body">
                                                  <div class ="row">
                                                      <div class="col-md-12">

                                                          <fieldset>
                                                              <legend class="text-bold text-uppercase"><i class="icon-download10 position-left"></i>Carregamento da Ficha Completa</legend>

                                                              <div class="form-group">
                                                                  <label class="text-bold text-uppercase">Localizar ficheiro:</label>
                                                                  <input type="file" class="file-styled" name="file" placeholder="Clique aqui para selecionar o ficheiro">

                                                                  <span class="help-block">Formatos aceites: xls, xlxs. Tamanho máximo 2Mb</span>
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

                                  <div class="tab-pane" id="top-justified-divided-tab2">



                                      <!--
                                          String act2 = encryptUtils.encodeString("accao#upload&to=student-import&type=Ficha Simplificada");
                                      -->
                                      <!-- Basic layout-->
                                      <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" enctype="multipart/form-data" action="VXBsb2FkU2VydmxldCNEQ0k=?<!--=act2-->">
                                          <div class="panel panel-flat">

                                              <div class="panel-body">
                                                  <div class ="row">
                                                      <div class="col-md-12">

                                                          <fieldset>
                                                              <legend class="text-bold text-uppercase"><i class="icon-download10 position-left"></i>Carregamento da Ficha Simplificada</legend>

                                                              <div class="form-group">
                                                                  <label class="text-bold text-uppercase">Localizar ficheiro:</label>
                                                                  <input type="file" class="file-styled" name="file" placeholder="Clique aqui para selecionar o ficheiro">

                                                                  <span class="help-block">Formatos aceites: xls, xlxs. Tamanho máximo 2Mb</span>
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
                              </div>
                          </div>

                      </div>


                      <div class="col-md-8">

                          <!-- Basic responsive configuration -->
                          <div class="panel panel-flat">
                              <div class="panel-heading">
                                  <h6 class="panel-title text-bold text-uppercase">Listagem de dados à importar</h6>
                                  <div class="heading-elements">
                                      <ul class="icons-list">
                                          <li><a data-action="collapse"></a></li>
                                          <li><a data-action="reload"></a></li>
                                      </ul>
                                  </div>
                              </div>


                              <div class="panel-body">
                                  <a  href="http://<!--=ip-->:8081/suc/excel/segia/modelos/imp_segia_alunos_modelo.xlsx" target="_blank" class="btn bg-success-600 btn-labeled btn-labeled-left text-bold text-uppercase">
                                      <b><i class="icon-file-excel"></i></b>
                                      Descarregar modelo de Importação
                                  </a>

                                  <a  href="http://<!--=ip-->:8081/suc/excel/segia/modelos/imp_segia_alunos_modelo_simp.xlsx" target="_blank" class="btn bg-success-400 btn-labeled btn-labeled-left text-bold text-uppercase">
                                      <b><i class="icon-file-excel"></i></b>
                                      Descarregar modelo de Importação (Simplificado)
                                  </a>


                                  <!--
                                      if (have) {
                                  -->
                                  <br> <br><hr>
                                  <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="QWx1bm9TZXJ2bGV0I0RDSQ==?YWNjYW8jZmlsdHJhci10dXJtYXMtY3Vyc28=">


                                      <div class="row">


                                          <div class="col-md-3">

                                              <label class="control-label text-bold text-uppercase">provincia:</label>

                                              <select class="select" name="idProvincia"  placeholder="Selecione a provincia" id="make"  >
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
                                                      <option value="<!--=desc-->" ></option>
                                                      <!--
                                                              }
                                                          }
                                                      -->                                                                

                                                  </optgroup>
                                              </select>

                                          </div>


                                          <div class="col-md-3">
                                              <label class="control-label text-bold text-uppercase">Distrito:</label>

                                              <select id="models"  data-placeholder="Selecione o distrito" class="select" name="distrito" required="">
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

                                          <div class="col-md-6">
                                              <label class="control-label text-bold text-uppercase">Escola:</label>
                                              <select class="select" name="escola" data-placeholder="Selecione a escola" id="schools">>
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

                                          <div class="col-md-6">
                                              <label class="control-label text-bold text-uppercase">Classe:</label>
                                              <select class="select" name="idCurso" data-placeholder="Selecione a classe">
                                                  <optgroup label="Selecione a classe">
                                                      <!--
                                                          if (cursos != null) {

                                                              for (Curso c : cursos) {
                                                                  int id = c.getCursId();
                                                                  String desc = encryptUtils.decodeString(c.getCursCod())+" - "+ encryptUtils.decodeString(c.getCursDescricao());

                                                                  String sel = "";

                                                                  if (curso != null) {
                                                                      if (curso.getCursId() == id) {
                                                                          sel = "selected";
                                                                      }
                                                                  }
                                                      -->
                                                      <option value="<!--=id-->" ><!--=desc--></option>
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

                                              <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="text-bold text-uppercase btn bg-primary-600 text-bold text-uppercase"> Carregar Turmas <i class="icon-search4 position-right"></i></button>
                                          </div>
                                      </div>
                                  </form>

                                  <br> <br><hr>
                                  <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="QWx1bm9TZXJ2bGV0I0RDSQ==?YWNjYW8jY29uZmlybWFyLXVwbG9hZA==">


                                      <div class="row">

                                          <div class="col-md-6">
                                              <label class="control-label text-bold text-uppercase">Turma:</label>
                                              <select class="select" name="idTurma" data-placeholder="Selecione a turma">
                                                  <optgroup label="Selecione a turma">
                                                      <!--
                                                          if (turmas != null) {

                                                              for (Turma t : turmas) {
                                                                  int id = t.getTurmId();
                                                                  String desc = encryptUtils.decodeString(t.getTurmDescricao());

                                                                  String sel = "";

                                                                  if (turma != null) {
                                                                      if (turma.getTurmId() == id) {
                                                                          sel = "selected";
                                                                      }
                                                                  }
                                                      -->
                                                      <option value="<!--=id-->" ><!--=desc--></option>
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

                                              <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="text-bold text-uppercase btn bg-primary-600 text-bold text-uppercase"> Confirmar importação de dados <i class="icon-check position-right"></i></button>
                                          </div>
                                      </div>
                                  </form>

                                  <!--
                                      }
                                  -->


                              </div>


                              <table class="table datatable-responsive">
                                  <thead>
                                      <tr>
                                          <th class="text-bold text-uppercase">#</th>
                                          <th class="text-bold text-uppercase">Nome Aluno</th>
                                          <th class="text-bold text-uppercase">Documento</th>
                                          <th class="text-bold text-uppercase">Data Nasc.</th>
                                          <th class="text-bold text-uppercase">Sexo</th>
                                          <th class="text-bold text-uppercase">Província</th>
                                          <th class="text-bold text-uppercase">Encarregado</th>
                                      </tr>
                                  </thead>
                                  <tbody>

                                      <!--
                                          int i = 0;

                                          if (importacoes != null) {
                                              for (ImpAluno imp : importacoes) {

                                                  i++;

                                                  String nomeCompleto = imp.getNomeCompleto();
                                                  String documento = imp.getDocumento();
                                                  String bi = imp.getBi();
                                                  String validadeDocumento = imp.getValidadeDocumento();
                                                  String dataNascimento = imp.getDataNascimento();
                                                  String nuit = imp.getNuit();
                                                  String sexo = imp.getSexo();
                                                  String provincia = imp.getProvincia();
                                                  String endereco = imp.getEndereco();
                                                  String deficiencia = imp.getDeficiencia();
                                                  String responsavel = imp.getResponsavel();
                                                  String contactoResponsavel = imp.getContactoResponsavel();
                                                  String email = imp.getEmail();

                                                  String nomePai = imp.getNomePai();
                                                  String contactoPai = imp.getContactoPai();
                                                  String profissaoPai = imp.getProfissaoPai();
                                                  String trabalhoPai = imp.getTrabalhoPai();

                                                  String nomeMae = imp.getNomeMae();
                                                  String contactoMae = imp.getContactoMae();
                                                  String profissaoMae = imp.getProfissaoMae();
                                                  String trabalhoMae = imp.getTrabalhoMae();

                                                  String nivel = imp.getNivel();
                                                  String ocupacao = imp.getOcupacao();

                                      -->
                                      <tr>
                                          <td>

                                              <a  href="#" data-toggle="modal" data-target="#modal_info_<!--=i-->"  data-popup="tooltip" title="Mais Detalhes" class="text-bold"><!--=i--></a>



                                              <!-- Danger modal -->
                                              <div id="modal_info_<!--=i-->" class="modal fade">
                                                  <div class="modal-dialog">
                                                      <div class="modal-content">
                                                          <div class="modal-header">
                                                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                              <h6 class="modal-title text-bold text-uppercase">Informações do aluno: <span class="text-danger-600"><!--=nomeCompleto--></span></h6>
                                                          </div>
                                                          <div class="modal-body">


                                                              <!-- Bordered striped table -->
                                                              <div class="panel panel-flat">

                                                                  <div class="table-responsive">
                                                                      <table class="table table-bordered table-striped">
                                                                          <tbody>
                                                                              <tr>
                                                                                  <td class="text-bold">Validade Doc. Identificação</td>
                                                                                  <td><!--=validadeDocumento--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Nuit</td>
                                                                                  <td><!--=nuit--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Endereço</td>
                                                                                  <td><!--=endereco--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Contato Responsável</td>
                                                                                  <td><!--=contactoResponsavel--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">E-mail</td>
                                                                                  <td><!--=email--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Órfão/Vulnerável/Portador de Doença</td>
                                                                                  <td><!--=deficiencia--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold text-center text-uppercase text-danger" colspan="2">Filiação</td>
                                                                              </tr>

                                                                              <tr>
                                                                                  <td class="text-bold">Nome Pai</td>
                                                                                  <td><!--=nomePai--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Contacto Pai</td>
                                                                                  <td><!--=contactoPai--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Profissão Pai</td>
                                                                                  <td><!--=profissaoPai--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Local Trabalho Pai</td>
                                                                                  <td><!--=trabalhoPai--></td>
                                                                              </tr>

                                                                              <tr>
                                                                                  <td class="text-bold">Nome Mãe</td>
                                                                                  <td><!--=nomeMae--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Contacto Mãe</td>
                                                                                  <td><!--=contactoMae--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Profissão Mãe</td>
                                                                                  <td><!--=profissaoMae--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Local Trabalho Mãe</td>
                                                                                  <td><!--=trabalhoMae--></td>
                                                                              </tr>

                                                                              <tr>
                                                                                  <td class="text-bold text-center text-uppercase text-danger" colspan="2">Habilitações</td>
                                                                              </tr>

                                                                              <tr>
                                                                                  <td class="text-bold">Formação</td>
                                                                                  <td><!--=nivel--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Ocupação</td>
                                                                                  <td><!--=ocupacao--></td>
                                                                              </tr>
                                                                          </tbody>
                                                                      </table>
                                                                  </div>
                                                              </div>
                                                              <!-- /bordered striped table -->

                                                          </div>

                                                          <div class="modal-footer">
                                                              <button type="button" class="btn bg-danger-600 text-bold text-uppercase" data-dismiss="modal"><i class="icon-chevron-down"></i> Fechar</button>


                                                          </div>
                                                      </div>
                                                  </div>
                                              </div>
                                              <!-- /default modal -->   

                                          </td>
                                          <td> <a  href="#" data-toggle="modal" data-target="#modal_info_<!--=i-->"  data-popup="tooltip" title="Mais Detalhes" class="text-bold"><!--=nomeCompleto--></a></td>
                                          <td><small><!--=documento + " - " + bi--></small></td>
                                          <td><!--=dataNascimento--></td>
                                          <td><!--=sexo--></td>
                                          <td><!--=provincia--></td>
                                          <td><!--=responsavel--></td>
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
                                  <h6 class="panel-title text-bold text-uppercase">RESUMO DOS ALUNOS IMPORTADOS</h6>
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
                                          <th class="text-bold text-uppercase">Cod. Aluno</th>
                                          <th class="text-bold text-uppercase">Categoria</th>
                                          <th class="text-bold text-uppercase">Nome Aluno</th>
                                          <th class="text-bold text-uppercase">Documento</th>
                                          <th class="text-bold text-uppercase">Data Nasc.</th>
                                          <th class="text-bold text-uppercase">Sexo</th>
                                          <th class="text-bold text-uppercase">Província</th>
                                          <th class="text-bold text-uppercase">Encarregado</th>
                                      </tr>
                                  </thead>
                                  <tbody>

                                      <!--
                                          if (alunos != null) {

                                              for (Aluno a : alunos) {

                                                  Pessoa p = a.getPessoa();
                                                  String cod = "---";
                                                  if (a.getAlunUnico() != null) {
                                                      cod = encryptUtils.decodeString(a.getAlunUnico());
                                                  }
                                                  String cat = "---";
                                                  if (a.getAlunCategoria() != null) {
                                                      cat = encryptUtils.decodeString(a.getAlunCategoria());
                                                  }

                                                  String nomeCompleto = "---";
                                                  if (p.getPessNome() != null && p.getPessApelido() != null) {
                                                      nomeCompleto = encryptUtils.decodeString(p.getPessNome()) + " " + encryptUtils.decodeString(p.getPessApelido());
                                                  }
                                                  String documento = "---";
                                                  if (p.getPessDocumento() != null) {
                                                      documento = encryptUtils.decodeString(p.getPessDocumento());
                                                  }
                                                  String bi = "---";
                                                  if (p.getPessBi() != null) {
                                                      bi = encryptUtils.decodeString(p.getPessBi());
                                                  }
                                                  String validadeDocumento = "---";
                                                  if (p.getPessDataValidadeBi() != null) {
                                                      bi = encryptUtils.decodeString(p.getPessDataValidadeBi());
                                                  }
                                                  String dataNascimento = "";

                                                  if (p.getPessDataNascimento() != null) {
                                                      dataNascimento = sdf.format(p.getPessDataNascimento().toGregorianCalendar().getTime());
                                                  }

                                                  String nuit = "---";
                                                  if (p.getPessNuit() != null) {
                                                      nuit = encryptUtils.decodeString(p.getPessNuit());
                                                  }
                                                  String sexo = "---";

                                                  if (p.getPessSexo() != null) {
                                                      sexo = encryptUtils.decodeString(p.getPessSexo());
                                                  }

                                                  String provincia = "---";

                                                  if (p.getPessProvincia() != null) {
                                                      provincia = encryptUtils.decodeString(p.getPessProvincia());
                                                  }
                                                  String endereco = "---";

                                                  if (p.getPessBairro() != null) {
                                                      endereco = encryptUtils.decodeString(p.getPessBairro());
                                                  }

                                                  String deficiencia = "Não";

                                                  /*  if (a.isAlunDeficiente()) {
                                                      deficiencia = "Sim";
                                                  }*/
                                                  String responsavel = "---";

                                                  if (p.getPessResponsavel() != null) {
                                                      responsavel = encryptUtils.decodeString(p.getPessResponsavel());
                                                  }

                                                  String contactoResponsavel = "---";

                                                  if (p.getPessContacto() != null) {
                                                      contactoResponsavel = encryptUtils.decodeString(p.getPessContacto());
                                                  }
                                                  String email =  "---";

                                                  if (p.getPessEmail() != null) {
                                                      email = encryptUtils.decodeString(p.getPessEmail());
                                                  }

                                                  String nomePai =  "---";
                                                  if (p.getPessNomePai() != null) {
                                                      nomePai = encryptUtils.decodeString(p.getPessNomePai());
                                                  }
                                                  
                                                  String contactoPai =  "---";
                                                  if (p.getPessContactoPai() != null) {
                                                      contactoPai = encryptUtils.decodeString(p.getPessContactoPai());
                                                  }
                                                  
                                                  String profissaoPai =  "---";
                                                  if (p.getPessProfissaoPai() != null) {
                                                      profissaoPai = encryptUtils.decodeString(p.getPessProfissaoPai());
                                                  }
                                                  
                                                  String trabalhoPai =  "---";
                                                  if (p.getPessTrabalhoPai() != null) {
                                                      trabalhoPai = encryptUtils.decodeString(p.getPessTrabalhoPai());
                                                  }

                                                  
                                                  String nomeMae =  "---";
                                                  if (p.getPessNomeMae() != null) {
                                                      nomeMae = encryptUtils.decodeString(p.getPessNomeMae());
                                                  }
                                                  String contactoMae =  "---";
                                                  if (p.getPessContactoMae() != null) {
                                                      contactoMae = encryptUtils.decodeString(p.getPessContactoMae());
                                                  }
                                                  
                                                  String profissaoMae =  "---";
                                                  if (p.getPessProfissaoMae() != null) {
                                                      profissaoMae = encryptUtils.decodeString(p.getPessProfissaoMae());
                                                  }
                                                  String trabalhoMae =  "---";
                                                  if (p.getPessTrabalhoMae() != null) {
                                                      trabalhoMae = encryptUtils.decodeString(p.getPessTrabalhoMae());
                                                  }

                                                  String nivel =  "---";
                                                  if (a.getAlunNivel() != null) {
                                                      nivel = encryptUtils.decodeString(a.getAlunNivel());
                                                  }
                                                  
                                                  String ocupacao =  "---";
                                                  if (p.getPessActividade() != null) {
                                                      ocupacao = encryptUtils.decodeString(p.getPessActividade());
                                                  }


                                      -->
                                      <tr>
                                          <td>

                                              <a  href="#" data-toggle="modal" data-target="#modal_info_<!--=cod-->"  data-popup="tooltip" title="Mais Detalhes" class="text-bold"><!--=cod--></a>



                                              <!-- Danger modal -->
                                              <div id="modal_info_<!--=cod-->" class="modal fade">
                                                  <div class="modal-dialog">
                                                      <div class="modal-content">
                                                          <div class="modal-header">
                                                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                              <h6 class="modal-title text-bold text-uppercase">Informações do aluno: <span class="text-danger-600"><!--=nomeCompleto--></span></h6>
                                                          </div>
                                                          <div class="modal-body">


                                                              <!-- Bordered striped table -->
                                                              <div class="panel panel-flat">

                                                                  <div class="table-responsive">
                                                                      <table class="table table-bordered table-striped">
                                                                          <tbody>
                                                                              <tr>
                                                                                  <td class="text-bold">Validade Doc. Identificação</td>
                                                                                  <td><!--=validadeDocumento--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Nuit</td>
                                                                                  <td><!--=nuit--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Endereço</td>
                                                                                  <td><!--=endereco--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Contato Responsável</td>
                                                                                  <td><!--=contactoResponsavel--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">E-mail</td>
                                                                                  <td><!--=email--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Órfão/Vulnerável/Portador de Doença</td>
                                                                                  <td><!--=deficiencia--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold text-center text-uppercase text-danger" colspan="2">Filiação</td>
                                                                              </tr>

                                                                              <tr>
                                                                                  <td class="text-bold">Nome Pai</td>
                                                                                  <td><!--=nomePai--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Contacto Pai</td>
                                                                                  <td><!--=contactoPai--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Profissão Pai</td>
                                                                                  <td><!--=profissaoPai--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Local Trabalho Pai</td>
                                                                                  <td><!--=trabalhoPai--></td>
                                                                              </tr>

                                                                              <tr>
                                                                                  <td class="text-bold">Nome Mãe</td>
                                                                                  <td><!--=nomeMae--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Contacto Mãe</td>
                                                                                  <td><!--=contactoMae--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Profissão Mãe</td>
                                                                                  <td><!--=profissaoMae--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Local Trabalho Mãe</td>
                                                                                  <td><!--=trabalhoMae--></td>
                                                                              </tr>

                                                                              <tr>
                                                                                  <td class="text-bold text-center text-uppercase text-danger" colspan="2">Habilitações</td>
                                                                              </tr>

                                                                              <tr>
                                                                                  <td class="text-bold">Formação</td>
                                                                                  <td><!--=nivel--></td>
                                                                              </tr>
                                                                              <tr>
                                                                                  <td class="text-bold">Ocupação</td>
                                                                                  <td><!--=ocupacao--></td>
                                                                              </tr>
                                                                          </tbody>
                                                                      </table>
                                                                  </div>
                                                              </div>
                                                              <!-- /bordered striped table -->

                                                          </div>

                                                          <div class="modal-footer">
                                                              <button type="button" class="btn bg-danger-600 text-bold text-uppercase" data-dismiss="modal"><i class="icon-chevron-down"></i> Fechar</button>


                                                          </div>
                                                      </div>
                                                  </div>
                                              </div>
                                              <!-- /default modal -->   

                                          </td>
                                          <td class="text-bold text-danger-600"><!--=cat--></td>
                                          <td> <a  href="#" data-toggle="modal" data-target="#modal_info_<!--=i-->"  data-popup="tooltip" title="Mais Detalhes" class="text-bold"><!--=nomeCompleto--></a></td>

                                          <td><small><!--=documento + " - " + bi--></small></td>
                                          <td><!--=dataNascimento--></td>
                                          <td><!--=sexo--></td>
                                          <td><!--=provincia--></td>
                                          <td><!--=responsavel--></td>
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
              </div>
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
