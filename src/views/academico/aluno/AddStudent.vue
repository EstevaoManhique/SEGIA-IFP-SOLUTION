<template>
  <v-container>
    <nav-bar :menu_types="1" />

    <v-container>
      <v-row class="navbar navbar-default navbar-component navbar-xs">
        <ul class="nav navbar-nav visible-xs-block">
          <li class="full-width text-center">
            <a data-toggle="collapse" data-target="#navbar-filter"
              ><i class="icon-menu7"></i
            ></a>
          </li>
        </ul>

        <div class="navbar-collapse collapse" id="navbar-filter">
          <ul class="nav navbar-nav element-active-slate-400">
            <li class="active">
              <a
                href="#settings"
                data-toggle="tab"
                class="text-bold text-uppercase"
                ><i class="icon-profile position-left"></i> Gestão de
                estudantes</a
              >
            </li>
          </ul>
        </div>
      </v-row>

      <v-form v-model="valid">
        <v-container>
          <v-row>
            <v-col cols="12" md="4">
              <v-text-field
                v-model="firstname"
                :rules="nameRules"
                :counter="10"
                label="First name"
                required
              ></v-text-field>
            </v-col>
          </v-row>
        </v-container>
      </v-form>
      <v-row class="mt-4">
        <form
          class="form-horizontal"
          method="post"
          accept-charset="ISO-8859-1"
          action="QWx1bm9TZXJ2bGV0I0RDSQ==?<%=act%>"
        >
          <div class="panel panel-flat">
            <div class="panel-heading">
              <h6
                class="panel-title text-uppercase text-bold text-bold text-uppercase"
              >
                Informe os dados do aluno
              </h6>
              <div class="heading-elements">
                <ul class="icons-list">
                  <li><a data-action="collapse"></a></li>
                  <li><a data-action="reload"></a></li>
                </ul>
              </div>
            </div>

            <div class="panel-body">
              <div class="row">
                <div class="col-md-6">
                  <fieldset>
                    <legend class="text-semibold">
                      <i class="icon-reading position-left"></i> Dados do aluno
                    </legend>

                    <div class="form-group">
                      <label
                        class="col-lg-3 control-label text-bold text-uppercase"
                        >Nome Completo:</label
                      >
                      <div class="col-lg-9">
                        <div class="row">
                          <div class="col-md-12">
                            <div
                              class="form-group has-feedback has-feedback-right"
                            >
                              <input
                                type="text"
                                placeholder="Nome Completo"
                                class="form-control"
                                name="nomeCompleto"
                                value="<%=nomeC%>"
                                required=""
                              />
                              <div class="form-control-feedback">
                                <i class="icon-regexp2 text-danger"></i>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <label
                        class="col-lg-3 control-label text-bold text-uppercase"
                        >Identificação:</label
                      >
                      <div class="col-lg-9">
                        <div class="row">
                          <div class="col-md-5">
                            <select
                              data-placeholder="Selecione o tipo"
                              class="select"
                              required=""
                              name="documento"
                            >
                              <option></option>
                              <option value=""></option>
                            </select>
                          </div>

                          <div class="col-md-7">
                            <div
                              class="form-group has-feedback has-feedback-right"
                            >
                              <input
                                type="text"
                                placeholder="BI/DIRE/Passaporte N.º"
                                class="form-control"
                                name="bi"
                                value="<%=bi%>"
                                required=""
                                maxlength="13"
                              />
                              <div class="form-control-feedback">
                                <i class="icon-regexp2 text-danger"></i>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <label
                        class="col-lg-3 control-label text-bold text-uppercase"
                        >Validade Doc.:</label
                      >
                      <div class="col-lg-9">
                        <div class="row">
                          <div class="col-md-6">
                            <input
                              type="text"
                              placeholder="Data de Validade"
                              class="form-control mb-15 daterange-single"
                              name="dataValidade"
                            />
                          </div>

                          <div class="col-md-6">
                            <input
                              type="number"
                              oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                              maxlength="9"
                              placeholder="NUIT"
                              class="form-control"
                              name="nuit"
                              value="<%=nuit%>"
                            />
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <label
                        class="col-lg-3 control-label text-bold text-uppercase"
                        >Data Nascimento:</label
                      >
                      <div class="col-lg-9">
                        <div class="row">
                          <div class="col-md-6">
                            <div
                              class="form-group has-feedback has-feedback-right"
                            >
                              <input
                                type="text"
                                placeholder="Data de Nascimento"
                                class="form-control mb-15 daterange-single"
                                name="dataNascimento"
                                value="<%=dNas%>"
                                required=""
                              />
                              <div class="form-control-feedback">
                                <i class="icon-regexp2 text-danger"></i>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <label
                        class="col-lg-3 control-label text-bold text-uppercase"
                        >Sexo:</label
                      >
                      <div class="col-lg-9">
                        <div class="row">
                          <label class="radio-inline">
                            <input type="radio" name="sexo" class="styled" />
                          </label>

                          <label class="radio-inline">
                            <input type="radio" name="sexo" class="styled" />
                            value="Feminino"> Feminino
                          </label>
                        </div>
                      </div>
                    </div>
                  </fieldset>

                  <fieldset>
                    <legend class="text-semibold">
                      <i class="icon-user position-left"></i> Encarregado
                      Educação
                    </legend>

                    <div class="form-group">
                      <label
                        class="col-lg-3 control-label text-bold text-uppercase"
                        >Nome do Encarregado:</label
                      >
                      <div class="col-lg-9">
                        <div class="row">
                          <div class="col-md-7">
                            <div
                              class="form-group has-feedback has-feedback-right"
                            >
                              <input
                                type="text"
                                placeholder="Nome do Encarregado Educação"
                                class="form-control"
                                name="responsavel"
                                value="<%=resp%>"
                                required=""
                              />
                              <div class="form-control-feedback">
                                <i class="icon-regexp2 text-danger"></i>
                              </div>
                            </div>
                          </div>

                          <div class="col-md-5">
                            <input
                              type="text"
                              placeholder="Contacto "
                              class="form-control"
                              name="contactoResponsavel"
                              value="<%=cntResp%>"
                              required=""
                            />
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <label
                        class="col-lg-3 control-label text-bold text-uppercase"
                        >Contacto:</label
                      >
                      <div class="col-lg-9">
                        <div class="row">
                          <div class="col-md-7">
                            <input
                              type="email"
                              placeholder="E-mail"
                              class="form-control"
                              name="email"
                              value="<%=mail%>"
                            />
                          </div>

                          <div class="col-md-5">
                            <input
                              type="text"
                              placeholder="Telefone/telemóvel:"
                              class="form-control"
                              name="contacto"
                              value="<%=cnt%>"
                              required=""
                            />
                          </div>
                        </div>
                      </div>
                    </div>
                  </fieldset>

                  <fieldset>
                    <legend class="text-semibold">
                      <i class="icon-man-woman position-left"></i> Filiação
                    </legend>
                    <div class="form-group">
                      <label
                        class="col-lg-3 control-label text-bold text-uppercase"
                        >Pai:</label
                      >
                      <div class="col-lg-9">
                        <div class="row">
                          <div class="col-md-7">
                            <input
                              type="text"
                              placeholder="Nome do Pai"
                              class="form-control"
                              name="nomePai"
                            />
                          </div>

                          <div class="col-md-5">
                            <input
                              type="text"
                              placeholder="Contacto do Pai"
                              class="form-control"
                              name="contactoPai"
                            />
                          </div>
                        </div>
                        <br />
                        <div class="row">
                          <div class="col-md-7">
                            <input
                              type="text"
                              placeholder="Local Trabalho do Pai"
                              class="form-control"
                              name="localPai"
                            />
                          </div>

                          <div class="col-md-5">
                            <input
                              type="text"
                              placeholder="Profissão do Pai"
                              class="form-control"
                              name="profissaoPai"
                            />
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label
                        class="col-lg-3 control-label text-bold text-uppercase"
                        >Mãe:</label
                      >
                      <div class="col-lg-9">
                        <div class="row">
                          <div class="col-md-7">
                            <input
                              type="text"
                              placeholder="Nome do Mãe"
                              class="form-control"
                              name="nomeMae"
                            />
                          </div>

                          <div class="col-md-5">
                            <input
                              type="text"
                              placeholder="Contacto da Mãe"
                              class="form-control"
                              name="contactoMae"
                            />
                          </div>
                        </div>
                        <br />
                        <div class="row">
                          <div class="col-md-7">
                            <input
                              type="text"
                              placeholder="Local Trabalho da Mãe"
                              class="form-control"
                              name="localPai"
                            />
                          </div>

                          <div class="col-md-5">
                            <input
                              type="text"
                              placeholder="Profissão da Mãe"
                              class="form-control"
                              name="profissaoPai"
                            />
                          </div>
                        </div>
                      </div>
                    </div>
                  </fieldset>
                </div>

                <div class="col-md-6">
                  <fieldset>
                    <legend class="text-semibold">
                      <i class="icon-home5 position-left"></i> ENDEREÇO
                    </legend>

                    <div class="form-group">
                      <label
                        class="col-lg-3 control-label text-bold text-uppercase"
                        >Localização:</label
                      >
                      <div class="col-lg-9">
                        <div class="row">
                          <div class="col-md-6">
                            <select
                              id="make"
                              data-placeholder="Selecione a provincia"
                              class="select"
                              name="provincia"
                              required=""
                            >
                              <option></option>
                              <option value=""></option>
                            </select>
                          </div>

                          <div class="col-md-6">
                            <select
                              id="models"
                              data-placeholder="Selecione o distrito"
                              class="select"
                              name="distrito"
                              required=""
                            >
                              <option></option>
                              <option></option>
                            </select>
                          </div>
                        </div>
                        <br />
                        <div class="row">
                          <div class="col-md-12">
                            <div
                              class="form-group has-feedback has-feedback-right"
                            >
                              <input
                                type="text"
                                placeholder="Bairro"
                                class="form-control"
                                name="endereco"
                                value="<%=end%>"
                                required=""
                              />
                              <div class="form-control-feedback">
                                <i class="icon-regexp2 text-danger"></i>
                              </div>
                            </div>
                          </div>
                        </div>
                        <br />
                        <div class="row">
                          <div class="col-md-6">
                            <input
                              type="text"
                              placeholder="Quarteirão/Talhão"
                              class="form-control mb-15"
                              name="quarteirao"
                              value="<%=quar%>"
                            />
                          </div>
                          <div class="col-md-6">
                            <input
                              type="text"
                              placeholder="Nº da Casa"
                              class="form-control"
                              name="casa"
                              value="<%=casa%>"
                            />
                          </div>
                        </div>
                      </div>
                    </div>
                  </fieldset>

                  <fieldset>
                    <legend class="text-semibold">
                      <i class="icon-accessibility position-left"></i>
                      Informação adicional
                    </legend>

                    <div class="form-group">
                      <label class="col-lg-7 control-label text-bold"
                        >Órfão/Vulnerável/Portador de Doença:</label
                      >
                      <div class="col-lg-4">
                        <div class="row">
                          <label class="radio-inline">
                            <input
                              type="radio"
                              name="deficiencia"
                              class="styled"
                            />
                          </label>

                          <label class="radio-inline">
                            <input
                              type="radio"
                              name="deficiencia"
                              class="styled"
                            />
                          </label>
                        </div>
                      </div>
                    </div>
                  </fieldset>

                  <fieldset>
                    <legend class="text-semibold">
                      <i class="icon-book position-left"></i> Habilitações
                    </legend>

                    <div class="form-group">
                      <label
                        class="col-lg-3 control-label text-bold text-uppercase"
                        >Formação:</label
                      >
                      <div class="col-lg-9">
                        <div class="row">
                          <div class="col-md-8">
                            <div class="mb-15">
                              <select
                                data-placeholder="Selecione a formação"
                                class="select"
                                required=""
                                name="nivel"
                              >
                                <option></option>
                              </select>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <label
                        class="col-lg-3 control-label text-bold text-uppercase"
                        >Ocupação:</label
                      >
                      <div class="col-lg-9">
                        <div class="row">
                          <div class="col-md-8">
                            <div class="mb-15">
                              <select
                                data-placeholder="Selecione a ocupação"
                                class="select"
                                required=""
                                name="ocupacao"
                              >
                                <option></option>
                              </select>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </fieldset>

                  <div class="form-group">
                    <label
                      class="col-lg-3 control-label text-bold text-uppercase"
                      >Documentos:</label
                    >
                    <div class="col-lg-9">
                      <div class="row">
                        <label class="radio-inline">
                          <input
                            type="checkbox"
                            name="certificado"
                            class="styled"
                          />
                        </label>

                        <label class="radio-inline">
                          <input
                            type="checkbox"
                            name="copiaBI"
                            class="styled"
                          />
                        </label>

                        <label class="radio-inline">
                          <input type="checkbox" name="fotos" class="styled" />
                        </label>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="text-left">
                <i class="icon-regexp2 text-danger"></i> -
                <span class="text-semibold text-muted"
                  >Campos de preenchimento obrigatório</span
                >
              </div>

              <div class="text-right">
                <a
                  href="QWx1bm9TZXJ2bGV0I0RDSQ==?<%=actC%>"
                  class="btn text-bold text-uppercase bg-danger-400 btn-labeled-left ml-10"
                  ><i class="icon-cross2"></i> Cancelar edição</a
                >
                <button
                  type="submit"
                  onclick="this.disabled = 'disabled'; this.form.submit();"
                  class="btn text-bold text-uppercase bg-slate-800"
                >
                  <i class="icon-arrow-right14 position-right"></i>
                </button>
              </div>
            </div>
          </div>
        </form>
      </v-row>

      <add-student-form />
    </v-container>
  </v-container>
</template>

<script>
import NavBar from '@/components/layout/NavBar.vue';
import AddStudentForm from '@/components/academico/AddStudentForm.vue';
import { mapGetters } from 'vuex';
export default {
  name: 'AddStudent',
  components: { NavBar, AddStudentForm },
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
