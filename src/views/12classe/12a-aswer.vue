<template>
  <v-container>
    <nav-bar :menu_types="2" />
    <v-row>
      <!-- Main content -->
      <div class="content-wrapper">
        <!-- Toolbar -->
        <div class="navbar navbar-default navbar-component navbar-xs">
          <ul class="nav navbar-nav visible-xs-block">
            <li class="full-width text-center">
              <a data-toggle="collapse" data-target="#navbar-filter"
                ><i class="icon-menu7"></i
              ></a>
            </li>
          </ul>

          <div class="navbar-collapse collapse" id="navbar-filter">
            <ul class="nav navbar-nav element-active-orange-400">
              <li class="active">
                <a
                  href="#settings"
                  data-toggle="tab"
                  class="text-bold text-uppercase"
                  ><i class="icon-stack-check position-left"></i> Folhas de
                  Resposta (12ª Classe)</a
                >
              </li>
            </ul>
          </div>
        </div>
        <!-- /toolbar -->

        <div class="row">
          <!-- Vertical form options -->
          <div class="col-md-6">
            <!-- Basic layout-->

            <form
              method="post"
              accept-charset="ISO-8859-1"
              action="MTJDbGFzc2VTZXJ2bGV0I0RDSQ==?YWNjYW8jZm9saGE="
            >
              <div class="panel panel-flat">
                <div class="panel-body">
                  <div class="form-group">
                    <div class="col-lg-12">
                      <div class="row">
                        <div class="col-md-7">
                          <select class="select" name="idCurso" readonly>
                            <optgroup label="Selecione a classe">
                              <!-- if (cursos !=null) { for (Curso c : cursos) {
                              int id=c.getCursId(); String
                              desc=encryptUtils.decodeString(c.getCursCod()) + "
                              - " +
                              encryptUtils.decodeString(c.getCursDescricao());
                              String sel="" ; if (curso !=null) { if
                              (id==curso.getCursId()) { sel="selected" ; } } -->
                              <option value=""></option>
                              <!-- } } -->
                            </optgroup>
                          </select>
                        </div>

                        <div class="col-md-3">
                          <button
                            type="submit"
                            onclick="this.disabled = 'disabled'; this.form.submit();"
                            class="btn bg-slate-800 btn-labeled text-bold text-uppercase"
                          >
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

            <form
              method="post"
              accept-charset="ISO-8859-1"
              action="MTJDbGFzc2VTZXJ2bGV0I0RDSQ==?YWNjYW8jZm9saGE="
            >
              <div class="panel panel-flat">
                <div class="panel-body">
                  <div class="form-group">
                    <div class="col-lg-12">
                      <div class="row">
                        <div class="col-md-7">
                          <select class="select" name="idDisciplina">
                            <optgroup label="Selecione disciplina">
                              <!-- if (disciplinas !=null) { for (Disciplina d :
                              disciplinas) { int id=d.getDiscId(); String
                              desc=encryptUtils.decodeString(d.getDiscDescricao());
                              String sel="" ; if (disciplina !=null) { if
                              (id==disciplina.getDiscId()) { sel="selected" ; }
                              } -->
                              <option value=""></option>
                              <!-- } } -->
                            </optgroup>
                          </select>
                        </div>

                        <div class="col-md-3">
                          <button
                            type="submit"
                            onclick="this.disabled = 'disabled'; this.form.submit();"
                            class="btn bg-orange-600 btn-labeled text-bold text-uppercase"
                          >
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
          <!-- String cur="" ; String dis="" ; if (curso !=null) {
          cur=encryptUtils.decodeString(curso.getCursDescricao()); } if
          (disciplina !=null) {
          dis=encryptUtils.decodeString(disciplina.getDiscDescricao()); } String
          act=encryptUtils.encodeString("accao#registar-respostas"); -->

          <div class="col-md-5">
            <!-- Basic layout-->
            <form
              class="form-horizontal"
              method="post"
              accept-charset="ISO-8859-1"
              action="MTJDbGFzc2VTZXJ2bGV0I0RDSQ==?<!--=act-->"
            >
              <div class="panel panel-flat">
                <div class="panel-heading">
                  <h6 class="panel-title text-bold text-uppercase">
                    Defina as questões para a folha de resposta
                  </h6>
                  <div class="heading-elements">
                    <ul class="icons-list">
                      <li>
                        <a data-action="collapse"></a>
                      </li>
                      <li>
                        <a data-action="reload"></a>
                      </li>
                    </ul>
                  </div>
                </div>

                <div class="panel-body">
                  <div class="form-group">
                    <label class="text-bold text-uppercase">Chamada:</label>
                    <select class="select" name="categoria">
                      <optgroup label="Selecione a época">
                        <option value="1ª Chamada">1ª Chamada</option>
                        <option value="2ª Chamada">2ª Chamada</option>
                      </optgroup>
                    </select>
                  </div>

                  <div class="form-group">
                    <label class="text-bold text-uppercase">Questão:</label>
                    <textarea
                      rows="5"
                      cols="5"
                      class="form-control"
                      placeholder="Digite a descrição da questão..."
                      name="pergunta"
                      required=""
                    ></textarea>
                  </div>

                  <div class="form-group">
                    <label class="text-bold text-uppercase"><b>a)</b>:</label>
                    <input
                      type="text"
                      class="form-control"
                      placeholder="Opção nº 1 ..."
                      name="opcao1"
                      required=""
                    />
                  </div>

                  <div class="form-group">
                    <label class="text-bold text-uppercase"><b>b)</b>:</label>
                    <input
                      type="text"
                      class="form-control"
                      placeholder="Opção nº 2 ..."
                      name="opcao2"
                      required=""
                    />
                  </div>

                  <div class="form-group">
                    <label class="text-bold text-uppercase"><b>c)</b>:</label>
                    <input
                      type="text"
                      class="form-control"
                      placeholder="Opção nº 3 ..."
                      name="opcao3"
                      required=""
                    />
                  </div>

                  <div class="form-group">
                    <label class="text-bold text-uppercase"><b>d)</b>:</label>
                    <input
                      type="text"
                      class="form-control"
                      placeholder="Opção nº 4 ..."
                      name="opcao4"
                      required=""
                    />
                  </div>

                  <div class="form-group">
                    <label class="display-block text-bold"
                      >Selecione a alternativa correcta:</label
                    >

                    <label class="radio-inline">
                      <input
                        type="radio"
                        class="styled"
                        name="op"
                        checked="checked"
                        value="1"
                      />
                      <b>a)</b>
                    </label>

                    <label class="radio-inline">
                      <input type="radio" class="styled" name="op" value="2" />
                      <b>b)</b>
                    </label>

                    <label class="radio-inline">
                      <input type="radio" class="styled" name="op" value="3" />
                      <b>c)</b>
                    </label>

                    <label class="radio-inline">
                      <input type="radio" class="styled" name="op" value="4" />
                      <b>d)</b>
                    </label>
                  </div>

                  <div class="form-group">
                    <label class="text-bold text-uppercase"
                      ><b>Pontuação</b>:</label
                    >
                    <input
                      type="number"
                      step="any"
                      class="form-control"
                      placeholder="Pontuação ..."
                      name="pontuacao"
                      required=""
                    />
                  </div>

                  <div class="text-right">
                    <button
                      type="submit"
                      onclick="this.disabled = 'disabled'; this.form.submit();"
                      class="btn bg-slate-800 text-bold text-uppercase"
                    >
                      Definir Pergunta<i
                        class="icon-file-check2 position-right"
                      ></i>
                    </button>
                  </div>
                </div>
              </div>
            </form>
            <!-- /basic layout -->
          </div>

          <div class="col-md-7">
            <div class="panel panel-flat">
              <div class="panel-heading">
                <h6 class="panel-title text-bold text-uppercase">
                  Listagem da Folha de Respota
                  <span class="text-danger-600">[ <!--=cur--> | <!--=dis--> ]</span>
                </h6>
                <div class="heading-elements">
                  <ul class="icons-list">
                    <li>
                      <a data-action="collapse"></a>
                    </li>
                    <li>
                      <a data-action="reload"></a>
                    </li>
                  </ul>
                </div>
              </div>

              <div class="panel-body">
                <div class="tabbable">
                  <ul class="nav nav-tabs nav-tabs-solid nav-justified">
                    <li class="active text-bold text-uppercase">
                      <a href="#solid-justified-tab1" data-toggle="tab"
                        >1ª Chamada</a
                      >
                    </li>
                    <li class="text-bold text-uppercase">
                      <a href="#solid-justified-tab2" data-toggle="tab"
                        >2ª Chamada</a
                      >
                    </li>
                  </ul>

                  <div class="tab-content">
                    <div class="tab-pane active" id="solid-justified-tab1">
                      <table class="table table-bordered table-striped">
                        <thead>
                          <tr>
                            <th class="text-bold text-uppercase">#</th>
                            <th class="text-bold text-uppercase">Pergunta</th>
                            <th class="text-bold text-uppercase text-right">
                              Pontuação
                            </th>
                            <th class="text-bold text-uppercase text-danger">
                              ---
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <!-- if (respostas !=null) { int i=0; for (Resposta r :
                          respostas) { int id=r.getRespId(); i++; String
                          desc=encryptUtils.decodeString(r.getRespPergunta());
                          String
                          op1=encryptUtils.decodeString(r.getRespOpcao1());
                          String
                          op2=encryptUtils.decodeString(r.getRespOpcao2());
                          String
                          op3=encryptUtils.decodeString(r.getRespOpcao3());
                          String
                          op4=encryptUtils.decodeString(r.getRespOpcao4());
                          String
                          categoria=encryptUtils.decodeString(r.getRespCategoria());
                          String
                          resposta=encryptUtils.decodeString(r.getRespResposta());
                          String pontuacao=df.format(r.getRespPontuacao());
                          String r1="<span class="bg-grey-600"
                            ><i class="icon-minus2"></i></span
                          >" ; String r2="<span class="bg-grey-600"
                            ><i class="icon-minus2"></i></span
                          >" ; String r3="<span class="bg-grey-600"
                            ><i class="icon-minus2"></i></span
                          >" ; String r4="<span class="bg-grey-600"
                            ><i class="icon-minus2"></i></span
                          >" ; if (resposta.equals(op1)) { r1="<span
                            class="bg-success-600"
                            ><i class="icon-check"></i></span
                          >" ; } else if (resposta.equals(op2)) { r2="<span
                            class="bg-success-600"
                            ><i class="icon-check"></i></span
                          >" ; } else if (resposta.equals(op3)) { r3="<span
                            class="bg-success-600"
                            ><i class="icon-check"></i></span
                          >" ; } else if (resposta.equals(op4)) { r4="<span
                            class="bg-success-600"
                            ><i class="icon-check"></i></span
                          >" ; } String
                          actR=encryptUtils.encodeString("accao#remover-resposta&ei="
                          + id); if (categoria.equals(" 1ª Chamada")) { -->
                          <tr>
                            <td>
                              <a href="#"> <!--=i--> </a>
                            </td>
                            <td class="text-bold"><!--=desc--></td>
                            <td class="text-bold text-right text-warning">
                              <!--=pontuacao-->
                            </td>
                            <td>
                              <a
                                href="#"
                                data-toggle="modal"
                                data-target="#modal_resp_<!--=id-->"
                                data-popup="tooltip"
                                title="Visualizar as alternativas"
                                ><i class="icon-info22 text-primary-600"></i
                              ></a>
                              <a
                                href="#"
                                data-toggle="modal"
                                data-target="#modal_rem_<!--=id-->"
                                data-popup="tooltip"
                                title="Remover o registo"
                                ><i
                                  class="icon-cancel-circle2 text-danger-800"
                                ></i
                              ></a>

                              <!-- Danger modal -->
                              <div id="modal_rem_<!--=id-->" class="modal fade">
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <button
                                        type="button"
                                        class="close"
                                        data-dismiss="modal"
                                      >
                                        &times;
                                      </button>
                                      <h6 class="modal-title text-semibold">
                                        Confirma a remoção da resposta com a
                                        referência # <!--=id--> ?
                                      </h6>
                                    </div>
                                    <div class="modal-body text-center">
                                      <h6 class="text-bold text-danger">
                                        <i
                                          class="icon-question6 text-danger"
                                          style="font-size: 100px"
                                        ></i>
                                      </h6>
                                    </div>

                                    <div class="modal-footer">
                                      <button
                                        type="button"
                                        class="btn text-bold text-uppercase btn-link"
                                        data-dismiss="modal"
                                      >
                                        Cancelar
                                      </button>

                                      <a
                                        href="QXZhbGlhY2FvU2VydmxldCNEQ0k=?<!--=actR-->"
                                        class="btn text-bold text-uppercase btn-danger"
                                        >Sim, confirmo !</a
                                      >
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!-- /danger modal -->

                              <!-- Table modal -->
                              <div id="modal_resp_<!--=id-->" class="modal fade">
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <button
                                        type="button"
                                        class="close"
                                        data-dismiss="modal"
                                      >
                                        &times;
                                      </button>
                                      <h6
                                        class="modal-title text-bold text-uppercase"
                                      >
                                        Respostas da Pergunta
                                      </h6>
                                    </div>
                                    <div class="modal-body">
                                      <table class="table">
                                        <thead>
                                          <tr>
                                            <th
                                              class="text-bold text-uppercase"
                                            ></th>
                                            <th
                                              class="text-bold text-uppercase"
                                            >
                                              Alternativas
                                            </th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td><!--=r1--></td>
                                            <td><b>a)</b> : <!--=op1--></td>
                                          </tr>
                                          <tr>
                                            <td><!--=r2--></td>
                                            <td><b>b)</b> : <!--=op2--></td>
                                          </tr>
                                          <tr>
                                            <td><!--=r3--></td>
                                            <td><b>c)</b> : <!--=op3--></td>
                                          </tr>
                                          <tr>
                                            <td><!--=r4--></td>
                                            <td><b>d)</b> : <!--=op4--></td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>

                                    <div class="modal-footer">
                                      <button
                                        type="button"
                                        class="btn text-bold text-uppercase btn-link"
                                        data-dismiss="modal"
                                      >
                                        Fechar
                                      </button>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!-- /table modal -->
                            </td>
                          </tr>
                          <!-- } } } -->
                        </tbody>
                      </table>
                    </div>

                    <div class="tab-pane" id="solid-justified-tab2">
                      <table class="table table-bordered table-striped">
                        <thead>
                          <tr>
                            <th class="text-bold text-uppercase">#</th>
                            <th class="text-bold text-uppercase">Pergunta</th>
                            <th class="text-bold text-uppercase text-right">
                              Pontuação
                            </th>
                            <th class="text-bold text-uppercase text-danger">
                              ---
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <!-- if (respostas !=null) { int i=0; for (Resposta r :
                          respostas) { int id=r.getRespId(); i++; String
                          desc=encryptUtils.decodeString(r.getRespPergunta());
                          String
                          op1=encryptUtils.decodeString(r.getRespOpcao1());
                          String
                          op2=encryptUtils.decodeString(r.getRespOpcao2());
                          String
                          op3=encryptUtils.decodeString(r.getRespOpcao3());
                          String
                          op4=encryptUtils.decodeString(r.getRespOpcao4());
                          String
                          categoria=encryptUtils.decodeString(r.getRespCategoria());
                          String
                          resposta=encryptUtils.decodeString(r.getRespResposta());
                          String pontuacao=df.format(r.getRespPontuacao());
                          String r1="<span class="bg-grey-600"
                            ><i class="icon-minus2"></i></span
                          >" ; String r2="<span class="bg-grey-600"
                            ><i class="icon-minus2"></i></span
                          >" ; String r3="<span class="bg-grey-600"
                            ><i class="icon-minus2"></i></span
                          >" ; String r4="<span class="bg-grey-600"
                            ><i class="icon-minus2"></i></span
                          >" ; if (resposta.equals(op1)) { r1="<span
                            class="bg-success-600"
                            ><i class="icon-check"></i></span
                          >" ; } else if (resposta.equals(op2)) { r2="<span
                            class="bg-success-600"
                            ><i class="icon-check"></i></span
                          >" ; } else if (resposta.equals(op3)) { r3="<span
                            class="bg-success-600"
                            ><i class="icon-check"></i></span
                          >" ; } else if (resposta.equals(op4)) { r4="<span
                            class="bg-success-600"
                            ><i class="icon-check"></i></span
                          >" ; } String
                          actR=encryptUtils.encodeString("accao#remover-resposta&ei="
                          + id); if (categoria.equals(" 2ª Chamada")) { -->
                          <tr>
                            <td>
                              <a href="#"> <!--=i--> </a>
                            </td>
                            <td class="text-bold"><!--=desc--></td>
                            <td class="text-bold text-right text-warning">
                              <!--=pontuacao-->
                            </td>
                            <td>
                              <a
                                href="#"
                                data-toggle="modal"
                                data-target="#modal_resp_<!--=id-->"
                                ><i class="icon-info22 text-primary-600"></i
                              ></a>
                              <a
                                href="#"
                                data-toggle="modal"
                                data-target="#modal_rem_<!--=id-->"
                                ><i
                                  class="icon-cancel-circle2 text-danger-800"
                                ></i
                              ></a>

                              <!-- Danger modal -->
                              <div id="modal_rem_<!--=id-->" class="modal fade">
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <button
                                        type="button"
                                        class="close"
                                        data-dismiss="modal"
                                      >
                                        &times;
                                      </button>
                                      <h6 class="modal-title text-semibold">
                                        Confirma a remoção da resposta com a
                                        referência # <!--=id--> ?
                                      </h6>
                                    </div>
                                    <div class="modal-body text-center">
                                      <h6 class="text-bold text-danger">
                                        <i
                                          class="icon-question6 text-danger"
                                          style="font-size: 100px"
                                        ></i>
                                      </h6>
                                    </div>

                                    <div class="modal-footer">
                                      <button
                                        type="button"
                                        class="btn text-bold text-uppercase btn-link"
                                        data-dismiss="modal"
                                      >
                                        Cancelar
                                      </button>

                                      <a
                                        href="QXZhbGlhY2FvU2VydmxldCNEQ0k=?<!--=actR-->"
                                        class="btn text-bold text-uppercase btn-danger"
                                        >Sim, confirmo !</a
                                      >
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!-- /danger modal -->

                              <!-- Table modal -->
                              <div id="modal_resp_<!--=id-->" class="modal fade">
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <button
                                        type="button"
                                        class="close"
                                        data-dismiss="modal"
                                      >
                                        &times;
                                      </button>
                                      <h6 class="modal-title text-semibold">
                                        Respostas da Pergunta com a referência #
                                        <!--=id--> ?
                                      </h6>
                                    </div>
                                    <div class="modal-body">
                                      <table class="table">
                                        <thead>
                                          <tr>
                                            <th
                                              class="text-bold text-uppercase"
                                            ></th>
                                            <th
                                              class="text-bold text-uppercase"
                                            >
                                              Alternativas
                                            </th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td><!--=r1--></td>
                                            <td><b>a)</b> : <!--=op1--></td>
                                          </tr>
                                          <tr>
                                            <td><!--=r2--></td>
                                            <td><b>b)</b> : <!--=op2--></td>
                                          </tr>
                                          <tr>
                                            <td><!--=r3--></td>
                                            <td><b>c)</b> : <!--=op3--></td>
                                          </tr>
                                          <tr>
                                            <td><!--=r4--></td>
                                            <td><b>d)</b> : <!--=op4--></td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>

                                    <div class="modal-footer">
                                      <button
                                        type="button"
                                        class="btn text-bold text-uppercase btn-link"
                                        data-dismiss="modal"
                                      >
                                        Fechar
                                      </button>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!-- /table modal -->
                            </td>
                          </tr>
                          <!-- } } } -->
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
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
  components: { NavBar },
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
