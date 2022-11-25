<template>
    <v-container>
        <nav-bar :menu_types = "5"/>
        <v-row>
                                <!-- Main content -->
                                <div class="content-wrapper">




                                  <div class = "row">
              
                                      <div class = "col-md-12 col-md-offset-0">
              
              
                                          <!--
                                              String lst = "";
                                              String act = encryptUtils.encodeString("accao#registar-aluno-online");
                                              String vlBtn = "Registar Pré-Inscrição";
                                              String lblReg = "Novo Registo";
                                              String icnReg = "icon-file-plus";
                                              String nm = session.getAttribute("nome").toString();
                                              String apl = session.getAttribute("apelido").toString();
                                              String bi = session.getAttribute("bi").toString();
                                              String nuit = session.getAttribute("nuit").toString();
                                              String sex = session.getAttribute("sexo").toString();
                                              String sM = "checked";
                                              String sF = "";
                                              String mail = session.getAttribute("email").toString();
                                              String cnt = session.getAttribute("contacto").toString();
                                              String prov = session.getAttribute("provincia").toString();
                                              String quar = session.getAttribute("quarteirao").toString();
                                              String casa = session.getAttribute("casa").toString();
                                              String end = session.getAttribute("endereco").toString();
                                              String doc = session.getAttribute("documento").toString();
                                              String distr = session.getAttribute("distrito").toString();
                                              String dNas = "";
              
                                              String resp = session.getAttribute("responsavel").toString();
                                              String cntResp = session.getAttribute("contactoResponsavel").toString();
              
                                              String bS = "checked";
                                              String bN = "";
                                              String bI = "";
              
                                              String dS = "";
                                              String dN = "checked";
              
                                              String niv = session.getAttribute("nivel").toString();
                                              String ocup = session.getAttribute("ocupacao").toString();
                                              String cat = session.getAttribute("categoria").toString();
              
                                              String bos = "NORMAL";
              
                                              String tB = "checked";
                                              String tD = "";
                                              String cH = "";
              
                                              String con = "";
              
                                              String cD = "";
                                              String cB = "";
                                              String fT = "";
              
                                              if (aluno != null) {
                                                  lst = "hide";
                                                  act = encryptUtils.encodeString("accao#actualizar-aluno&fi=" + aluno.getAlunId());
                                                  vlBtn = "Actualizar Registo";
                                                  lblReg = "Actualizar Registo";
                                                  icnReg = "icon-pencil4";
              
                                                  niv = encryptUtils.decodeString(aluno.getAlunNivel());
                                                  ocup = encryptUtils.decodeString(aluno.getPessoa().getPessActividade());
                                                  cat = encryptUtils.decodeString(aluno.getAlunCategoria());
              
                                                  Pessoa pessoa = aluno.getPessoa();
              
                                                  nm = encryptUtils.decodeString(pessoa.getPessNome());
                                                  apl = encryptUtils.decodeString(pessoa.getPessApelido());
                                                  bi = encryptUtils.decodeString(pessoa.getPessBi());
                                                  sex = encryptUtils.decodeString(pessoa.getPessSexo());
                                                  mail = encryptUtils.decodeString(pessoa.getPessEmail());
                                                  cnt = encryptUtils.decodeString(pessoa.getPessContacto());
                                                  nuit = encryptUtils.decodeString(pessoa.getPessNuit());
                                                  doc = encryptUtils.decodeString(pessoa.getPessDocumento());
                                                  distr = encryptUtils.decodeString(pessoa.getPessDistrito());
              
                                                  resp = encryptUtils.decodeString(pessoa.getPessNomePai());
                                                  cntResp = encryptUtils.decodeString(pessoa.getPessNomeMae());
              
                                                  prov = encryptUtils.decodeString(pessoa.getPessProvincia());
                                                  quar = encryptUtils.decodeString(pessoa.getPessRua());
                                                  casa = encryptUtils.decodeString(pessoa.getPessNumeroCasa());
                                                  end = encryptUtils.decodeString(pessoa.getPessBairro());
              
                                                  if (sex.equals("Feminino")) {
                                                      sM = "";
                                                      sF = "checked";
                                                  }
              
                                                  if (!aluno.isAlunDeficiente()) {
              
                                                      dN = "checked";
                                                      dS = "";
                                                  }
              
                                                  if (aluno.isAlunDeficiente()) {
              
                                                      dN = "";
                                                      dS = "checked";
                                                  }
              
                                                  bos = encryptUtils.decodeString(aluno.getAlunBolseiro());
              
                                                  if (bos.equals("Bolseiro Parcial")) {
                                                      bS = "";
                                                      bI = "";
                                                      bN = "checked";
                                                  }
              
                                                  if (bos.equals("Bolseiro Integral")) {
                                                      bS = "";
                                                      bI = "checked";
                                                      bN = "";
                                                  }
              
                                                  if (mail.equals("N/D")) {
                                                      mail = "";
                                                  }
              
                                              }
              
                                          -->
              
              
              
              
              
                                          <!-- 2 columns form -->
                                          <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="QWx1bm9TZXJ2bGV0I0RDSQ==?<!--=act-->">
                                              <div class="panel panel-flat">
                                                  <div class="panel-heading">
                                                      <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Informe os dados do aluno</h6>
                                                      <div class="heading-elements">
                                                          <ul class="icons-list">
                                                              <li><a data-action="collapse"></a></li>
                                                              <li><a data-action="reload"></a></li>
                                                          </ul>
                                                      </div>
                                                  </div>
              
                                                  <div class="panel-body">
              
              
                                                      <div class="row">
              
                                                          <div class="text-center">
                                                              <center>	<img src="http://localhost:8081/suc/images/app-icons/governo.png" alt="" class="img-responsive" style="width:50%; max-width: 120px;"></center>
                                                              <h5 class="content-group-lg text-bold text-uppercase">Formulário de Pré-Inscrição <small class="display-block">Todos os campos são obrigatórios</small></h5>
                                                          </div>
              
              
              
              
                                                          <div class="col-md-6">
                                                              <fieldset>
                                                                  <legend class="text-semibold"><i class="icon-reading position-left"></i> Dados do aluno</legend>
              
                                                                  <div class="form-group">
                                                                      <label class="col-lg-3 control-label text-bold text-uppercase">Nome:</label>
                                                                      <div class="col-lg-9">
                                                                          <div class="row">
                                                                              <div class="col-md-12">
                                                                                  <div class="form-group has-feedback has-feedback-right">
              
                                                                                      <input type="text" placeholder="Nome" class="form-control" name="nomeCompleto" >
                                                                                      <div class="form-control-feedback">
                                                                                          <i class="icon-regexp2 text-danger"></i>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>
                                                                          </div>
                                                                      </div>
                                                                  </div>
              
                                                                  <div class="form-group">
                                                                      <label class="col-lg-3 control-label text-bold text-uppercase">Identificação:</label>
                                                                      <div class="col-lg-9">
              
                                                                          <div class="row">
                                                                              <div class="col-md-5">
                                                                                  <select data-placeholder="Selecione o tipo" class="select" required="" name="documento">
                                                                                      <option></option>
                                                                                      <!--
                                                                                          String documentos[] = {"BI", "Passaporte", "DIRE", "Cédula pessoal", "Cartão de eleitor", "Carta de condução", "Outro"};
              
                                                                                          for (String s : documentos) {
              
                                                                                              String sel = "";
              
                                                                                              if (s.equals(doc)) {
                                                                                                  sel = "selected";
                                                                                              }
                                                                                      -->
                                                                                      <option value=""></option>
                                                                                      <!--
                                                                                          }
                                                                                      -->
                                                                                  </select>
                                                                              </div>
              
                                                                              <div class="col-md-7">
                                                                                  <div class="form-group has-feedback has-feedback-right">
              
                                                                                      <input type="text" placeholder="BI/DIRE/Passaporte N.º" class="form-control" name="bi" value="<!--=bi-->" required="">
                                                                                      <div class="form-control-feedback">
                                                                                          <i class="icon-regexp2 text-danger"></i>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>
                                                                          </div>
                                                                      </div>
                                                                  </div>
              
              
                                                                  <div class="form-group">
                                                                      <label class="col-lg-3 control-label text-bold text-uppercase">Validade Doc.:</label>
                                                                      <div class="col-lg-9">
              
                                                                          <div class="row">
                                                                              <div class="col-md-6">
                                                                                  <input type="text" placeholder="Data de Validade" class="form-control mb-15  daterange-single" name="dataValidade">
                                                                              </div>
              
                                                                              <div class="col-md-6">
                                                                                  <input type="text" placeholder="NUIT" class="form-control" name="nuit" value="<!--=nuit-->">
                                                                              </div>
                                                                          </div>
              
                                                                      </div>
                                                                  </div>
              
                                                                  <div class="form-group">
                                                                      <label class="col-lg-3 control-label text-bold text-uppercase">Data Nascimento:</label>
                                                                      <div class="col-lg-9">
                                                                          <div class="row">
                                                                              <div class="col-md-6">
                                                                                  <div class="form-group has-feedback has-feedback-right">
              
                                                                                      <input type="text" placeholder="Data de Nascimento" class="form-control mb-15  daterange-single" name="dataNascimento" value="<!--=dNas-->" required="">
                                                                                      <div class="form-control-feedback">
                                                                                          <i class="icon-regexp2 text-danger"></i>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>
                                                                          </div>
                                                                      </div>
                                                                  </div>
              
                                                                  <div class="form-group">
                                                                      <label class="col-lg-3 control-label text-bold text-uppercase">Sexo:</label>
                                                                      <div class="col-lg-9">
                                                                          <div class="row">
              
                                                                              <label class="radio-inline">
                                                                                  <input type="radio" name="sexo" class="styled" >
                                                                                  Masculino
                                                                              </label>
              
                                                                              <label class="radio-inline">
                                                                                  <input type="radio" name="sexo" class="styled">
                                                                                  Feminino
                                                                              </label>
                                                                          </div>
                                                                      </div>
                                                                  </div>
              
              
                                                                  <div class="form-group">
                                                                      <label class="col-lg-3 control-label text-bold text-uppercase">Contacto:</label>
                                                                      <div class="col-lg-9">
              
                                                                          <div class="row">
                                                                              <div class="col-md-7">
                                                                                  <input type="email" placeholder="E-mail" class="form-control" name="email" value="<!--=mail-->">
                                                                              </div>
              
                                                                              <div class="col-md-5">
                                                                                  <div class="form-group has-feedback has-feedback-right">
              
                                                                                      <input type="text" placeholder="Telefone/telemóvel:" class="form-control" name="contacto" value="<!--=cnt-->" required="">
                                                                                      <div class="form-control-feedback">
                                                                                          <i class="icon-regexp2 text-danger"></i>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>
                                                                          </div>
              
                                                                      </div>
                                                                  </div>
                                                                  <div class="form-group">
                                                                      <label class="col-lg-3 control-label text-bold text-uppercase">Pai:</label>
                                                                      <div class="col-lg-9">
              
                                                                          <div class="row">
                                                                              <div class="col-md-7">
                                                                                  <div class="form-group has-feedback has-feedback-right">
                                                                                      <input type="text" placeholder="Nome do Pai" class="form-control" name="nomePai" required="">
                                                                                      <div class="form-control-feedback">
                                                                                          <i class="icon-regexp2 text-danger"></i>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>
              
                                                                              <div class="col-md-5">
                                                                                  <div class="form-group has-feedback has-feedback-right">
                                                                                      <input type="text" placeholder="Contacto do Pai" class="form-control" name="contactoPai" required="">
                                                                                      <div class="form-control-feedback">
                                                                                          <i class="icon-regexp2 text-danger"></i>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>
                                                                          </div>
                                                                          <br>
                                                                          <div class="row">
                                                                              <div class="col-md-7">
                                                                                  <input type="text" placeholder="Local Trabalho do Pai" class="form-control" name="localPai" required="">
              
                                                                              </div>
              
                                                                              <div class="col-md-5">
                                                                                  <input type="text" placeholder="Profissão do Pai" class="form-control" name="profissaoPai" required="">
                                                                              </div>
                                                                          </div>
              
              
                                                                      </div>
                                                                  </div>
                                                                  <div class="form-group">
                                                                      <label class="col-lg-3 control-label text-bold text-uppercase">Mãe:</label>
                                                                      <div class="col-lg-9">
              
                                                                          <div class="row">
                                                                              <div class="col-md-7">
                                                                                  <div class="form-group has-feedback has-feedback-right">
                                                                                      <input type="text" placeholder="Nome do Mãe" class="form-control" name="nomeMae" required="">
                                                                                      <div class="form-control-feedback">
                                                                                          <i class="icon-regexp2 text-danger"></i>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>
              
                                                                              <div class="col-md-5">
                                                                                  <div class="form-group has-feedback has-feedback-right">
                                                                                      <input type="text" placeholder="Contacto da Mãe" class="form-control" name="contactoMae" required="">
                                                                                      <div class="form-control-feedback">
                                                                                          <i class="icon-regexp2 text-danger"></i>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>
                                                                          </div>
                                                                          <br>
                                                                          <div class="row">
                                                                              <div class="col-md-7">
                                                                                  <input type="text" placeholder="Local Trabalho da Mãe" class="form-control" name="localPai" required="">
              
                                                                              </div>
              
                                                                              <div class="col-md-5">
                                                                                  <input type="text" placeholder="Profissão da Mãe" class="form-control" name="profissaoPai" required="">
                                                                              </div>
                                                                          </div>
              
                                                                      </div>
                                                                  </div>
                                                                  <div class="form-group">
                                                                      <label class="col-lg-3 control-label text-bold text-uppercase">Encarregado Educação:</label>
                                                                      <div class="col-lg-9">
              
                                                                          <div class="row">
                                                                              <div class="col-md-7">
                                                                                  <div class="form-group has-feedback has-feedback-right">
                                                                                      <input type="text" placeholder="Nome do Encarregado Educação" class="form-control" name="responsavel" value="<!--=resp-->" required="">
                                                                                      <div class="form-control-feedback">
                                                                                          <i class="icon-regexp2 text-danger"></i>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>
              
                                                                              <div class="col-md-5">
                                                                                  <div class="form-group has-feedback has-feedback-right">
                                                                                      <input type="text" placeholder="Contacto " class="form-control" name="contactoResponsavel" value="<!--=cntResp-->" required="">
                                                                                      <div class="form-control-feedback">
                                                                                          <i class="icon-regexp2 text-danger"></i>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>
                                                                          </div>
              
                                                                      </div>
                                                                  </div>
              
                                                              </fieldset>
              
              
                                                          </div>
              
              
              
                                                          <div class="col-md-6">
              
              
              
              
                                                              <fieldset>
                                                                  <legend class="text-semibold"><i class="icon-home5 position-left"></i> ENDEREÇO</legend>
              
              
                                                                  <div class="form-group">
                                                                      <label class="col-lg-3 control-label text-bold text-uppercase">Localização:</label>
                                                                      <div class="col-lg-9">
                                                                          <div class="row">
                                                                              <div class="col-md-6">
                                                                                  <select id="make" data-placeholder="Selecione a provincia" class="select" name="provincia" required="">
                                                                                      <option></option>
                                                                                      <!--
                                                                                          String provincias[] = {"Cidade de Maputo", "Maputo", "Gaza", "Inhambane", "Manica", "Niassa",
                                                                                              "Nampula", "Sofala", "Tete", "Zambézia", "Cabo Delgado"};
              
                                                                                          for (String s : provincias) {
                                                                                              String sel = "";
              
                                                                                              if (prov.equals(s)) {
                                                                                                  sel = "selected";
                                                                                              }
                                                                                      -->
                                                                                      <option value=""></option>
                                                                                      <!--
                                                                                          }
                                                                                      -->
                                                                                  </select>
              
                                                                              </div>
              
                                                                              <div class="col-md-6">
                                                                                  <select id="models"  data-placeholder="Selecione o distrito" class="select" name="distrito" required="">
                                                                                      <option></option>
              
                                                                                      <!--
                                                                                          String distritos[] = {"KaMpfumo", "Nlhamankulu", "KaMaxaquene", "KaMavota", "KaMubukwana", "KaTembe", "KaNyaka"};
              
                                                                                          for (String s : distritos) {
                                                                                              String sel = "";
              
                                                                                              if (distr.equals(s)) {
                                                                                                  sel = "selected";
                                                                                              }
                                                                                      -->
                                                                                      <option value=""></option>
                                                                                      <!--
                                                                                          }
                                                                                      -->
                                                                                  </select>       
                                                                              </div>
                                                                          </div>
                                                                          <br>
                                                                          <div class="row">
                                                                              <div class="col-md-12">
                                                                                  <div class="form-group has-feedback has-feedback-right">
              
                                                                                      <input type="text" placeholder="Bairro" class="form-control" name="endereco" value="<!--=end-->" required="">
                                                                                      <div class="form-control-feedback">
                                                                                          <i class="icon-regexp2 text-danger"></i>
                                                                                      </div>
                                                                                  </div>
                                                                              </div>
                                                                          </div>
                                                                          <br>
                                                                          <div class="row">
                                                                              <div class="col-md-6">
                                                                                  <input type="text" placeholder="Quarteirão/Talhão" class="form-control mb-15"  name="quarteirao" value="<!--=quar-->">
                                                                              </div>
                                                                              <div class="col-md-6">
                                                                                  <input type="text" placeholder="Nº da Casa" class="form-control"  name="casa" value="<!--=casa-->">
                                                                              </div>
                                                                          </div>
                                                                      </div>
                                                                  </div>
                                                              </fieldset>
              
                                                              <fieldset>
                                                                  <legend class="text-semibold"><i class="icon-accessibility position-left"></i> Informação adicional</legend>
              
              
                                                                  <div class="form-group">
                                                                      <label class="col-lg-7 control-label text-bold">Órfão/Vulnerável/Portador de Doença:</label>
                                                                      <div class="col-lg-4">
                                                                          <div class="row">
              
                                                                              <label class="radio-inline">
                                                                                  <input type="radio" name="deficiencia" class="styled" >
                                                                                  Sim
                                                                              </label>
              
                                                                              <label class="radio-inline">
                                                                                  <input type="radio" name="deficiencia" class="styled">
                                                                                  Não
                                                                              </label>
                                                                          </div>
                                                                      </div>
                                                                  </div>
              
                                                              </fieldset>
              
                                                              <fieldset>
                                                                  <legend class="text-semibold"><i class="icon-book position-left"></i> Habilitações</legend>
              
              
                                                                  <div class="form-group">
                                                                      <label class="col-lg-3 control-label text-bold text-uppercase">Formação:</label>
                                                                      <div class="col-lg-9">
                                                                          <div class="row">
                                                                              <div class="col-md-8">
                                                                                  <div class="mb-15">
                                                                                      <select data-placeholder="Selecione a formação" class="select" required="" name="nivel">
                                                                                          <option></option>
                                                                                          <!--
                                                                                              String niveis[] = {"Ensino básico", "Ensino médio", "Ensino técnico", "Ensino técnico superior", "Ensino superior"};
              
                                                                                              for (String s : niveis) {
              
                                                                                                  String sel = "";
              
                                                                                                  if (s.equals(niv)) {
                                                                                                      sel = "selected";
                                                                                                  }
                                                                                          -->
                                                                                          <option value=""></option>
                                                                                          <!--
                                                                                              }
                                                                                          -->
                                                                                      </select>
                                                                                  </div>
                                                                              </div>
                                                                          </div>
                                                                      </div>
                                                                  </div>
              
              
                                                                  <div class="form-group">
                                                                      <label class="col-lg-3 control-label text-bold text-uppercase">Ocupação:</label>
                                                                      <div class="col-lg-9">
                                                                          <div class="row">
                                                                              <div class="col-md-8">
                                                                                  <div class="mb-15">
                                                                                      <select data-placeholder="Selecione a ocupação" class="select" required="" name="ocupacao">
                                                                                          <option></option>
                                                                                          <!--
                                                                                              String ocupacoes[] = {"Estudante", "Funcionário Público", "Funcionário Privado", "Conta Própria", "Desempregado"};
              
                                                                                              for (String s : ocupacoes) {
              
                                                                                                  String sel = "";
              
                                                                                                  if (s.equals(ocup)) {
                                                                                                      sel = "selected";
                                                                                                  }
                                                                                          -->
                                                                                            <option value=""></option>
                                                                                          <!--
                                                                                              }
                                                                                          -->
                                                                                      </select>
                                                                                  </div>
                                                                              </div>
                                                                          </div>
                                                                      </div>
                                                                  </div>
              
              
                                                              </fieldset>
              
              
              
                                                              <fieldset>
                                                                  <legend class="text-semibold"><i class="icon-clipboard2 position-left"></i> Inscrição</legend>
              
                                                                  <div class="form-group">
                                                                      <label class="col-lg-3 control-label text-bold text-uppercase"> <i class="icon-regexp2 text-danger"></i> Turma & Horário:</label>
                                                                      <div class="col-lg-9">
                                                                          <div class="row">
                                                                              <div class="col-md-12">
                                                                                  <select data-placeholder="Selecione a turma" class="select" name="idTurma" required="">
                                                                                      <option></option>
                                                                                      <!--
                                                                                          if (turmas != null) {
                                                                                              for (Turma t : turmas) {
              
                                                                                                  int id = t.getTurmId();
              
                                                                                                  String desc = encryptUtils.decodeString(t.getTurmDescricao()) + "|" + encryptUtils.decodeString(t.getCurso().getCursDescricao()) + "|" + encryptUtils.decodeString(t.getTurmHorario());
              
                                                                                                  String sel = "";
                                                                                                  if (aluno != null) {
                                                                                                      if (t.getTurmId() == aluno.getAlunTurno()) {
                                                                                                          sel = "selected";
                                                                                                      }
                                                                                                  }
                                                                                      -->
                                                                                      <option value=""></option>
                                                                                      <!--
                                                                                              }
                                                                                          }
                                                                                      -->
                                                                                  </select>
                                                                              </div>
                                                                          </div>
                                                                      </div>
                                                                  </div>
              
                                                                  <div class="form-group">
                                                                      <label class="col-lg-3 control-label text-bold text-uppercase">Categoria:</label>
                                                                      <div class="col-lg-9">
                                                                          <div class="row">
                                                                              <div class="col-md-10">
                                                                                  <div class="mb-15">
                                                                                      <select data-placeholder="Selecione a categoria" class="select" required="" name="categoria">
                                                                                          <option></option>
                                                                                          <!--
                                                                                              String categorias[] = {"NOVO INGRESSO", "CONTINUANTE", "REPETENTE", "ASSISTENTE", "TRANSFERIDO"};
              
                                                                                              for (String s : categorias) {
              
                                                                                                  String sel = "";
              
                                                                                                  if (s.equals(cat)) {
                                                                                                      sel = "selected";
                                                                                                  }
                                                                                          -->
                                                                                          <option value=""></option>
                                                                                          <!--
                                                                                              }
                                                                                          -->
                                                                                      </select>
                                                                                  </div>
                                                                              </div>
                                                                          </div>
                                                                      </div>
                                                                  </div>
              
                                                                  <div class="form-group">
                                                                      <label class="col-lg-3 control-label text-bold text-uppercase">Condição Matrícula:</label>
                                                                      <div class="col-lg-9">
                                                                          <div class="row">
                                                                              <div class="col-md-10">
                                                                                  <div class="mb-15">
                                                                                      <select data-placeholder="Selecione a condição da matrícula" class="select" required="" name="condicao">
                                                                                          <option></option>
                                                                                          <!--
                                                                                              String condicoes[] = {"GLOBAL", "LETRAS", "CIÊNCIAS", "TÉCNICO"};
              
                                                                                              for (String s : condicoes) {
              
                                                                                                  String sel = "";
              
                                                                                                  if (s.equals(con)) {
                                                                                                      sel = "selected";
                                                                                                  }
                                                                                          -->
                                                                                          <option value=""></option>
                                                                                          <!--
                                                                                              }
                                                                                          -->
                                                                                      </select>
                                                                                  </div>
                                                                              </div>
                                                                          </div>
                                                                      </div>
                                                                  </div>
              
              
              
                                                              </fieldset>
              
                                                          </div>
              
                                                      </div>
              
              
                                                      <div class="text-left">
                                                          <i class="icon-regexp2 text-danger"></i> -  <span class="text-semibold text-muted">Campos de preenchimento obrigatório</span>
                                                      </div>
              
                                                      <div class="text-right">
                                                          <!--
                                                              if (aluno != null) {
                                                                  String actC = encryptUtils.encodeString("accao#cancelar-edicao");
                                                          -->
                                                          <a href="QWx1bm9TZXJ2bGV0I0RDSQ==?<!--=actC-->" class="btn text-bold text-uppercase bg-danger-400 btn-labeled-left ml-10"><i class="icon-cross2"></i> Cancelar edição</a>
                                                          <!--
                                                              }
                                                          -->
                                                          <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800"><!--=vlBtn--> <i class="icon-arrow-right14 position-right"></i></button>
                                                      </div>
                                                  </div>
                                              </div>
                                          </form>
                                          <!-- /2 columns form -->
                                      </div>
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
  name: 'AddStudent',
  components: { NavBar },
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
