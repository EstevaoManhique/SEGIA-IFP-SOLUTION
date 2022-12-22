<template>
  <v-container>
    <v-row>
      <v-col cols="12" md="4">
        <v-card>
          <v-tabs v-model="tabs" fixed-tabs>
            <v-tabs-slider></v-tabs-slider>
            <v-tab href="#mobile-tabs-5-1" class="primary--text">
              Ficha Completa
            </v-tab>

            <v-tab href="#mobile-tabs-5-2" class="primary--text">
              Ficha Simplificada
            </v-tab>
          </v-tabs>

          <v-tabs-items v-model="tabs">
            <v-tab-item :key="1" :value="'mobile-tabs-5-1'">
              <v-card flat>
                <div class="panel panel-flat">
                  <div class="panel-body">
                    <a
                      :href="link_modelo"
                      target="_blank"
                      class="btn bg-success-600 btn-labeled btn-labeled-left text-bold text-uppercase"
                    >
                      <b><i class="icon-file-excel"></i></b>
                      Descarregar modelo de Importação
                    </a>
                  </div>
                </div>
                <!-- Basic layout-->
                <div class="form-horizontal">
                  <div class="panel panel-flat">
                    <div class="panel-body">
                      <div class="row">
                        <div class="col-md-12">
                          <fieldset>
                            <legend class="text-bold text-uppercase">
                              <i class="icon-download10 position-left"></i
                              >Carregamento da Ficha Completa
                            </legend>

                            <div class="form-group">
                              <label class="text-bold text-uppercase"
                                >Localizar ficheiro:</label
                              >
                              <input
                                type="file"
                                class="file-styled"
                                name="file"
                                placeholder="Clique aqui para selecionar o ficheiro"
                              />

                              <span class="help-block"
                                >Formatos aceites: xls, xlxs. Tamanho máximo
                                2Mb</span
                              >
                            </div>
                          </fieldset>
                        </div>
                      </div>

                      <div class="text-right">
                        <v-btn
                          color="primary"
                          @click="import_modelo_completo"
                          class="text-bold text-uppercase btn bg-danger-600 text-bold text-uppercase"
                        >
                          Carregar Ficheiro
                          <i class="icon-download4 position-right"></i>
                        </v-btn>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /basic layout -->
              </v-card>
            </v-tab-item>
            <v-tab-item :key="2" :value="'mobile-tabs-5-2'">
              <v-card flat>
                <div class="panel panel-flat">
                  <div class="panel-body">
                    <a
                      :href="link_modelo_simp"
                      target="_blank"
                      class="btn bg-success-600 btn-labeled btn-labeled-left text-bold text-uppercase"
                    >
                      <b><i class="icon-file-excel"></i></b>
                      Descarregar modelo de Importação (Simplificado)
                    </a>
                  </div>
                </div>
                <!-- Basic layout-->
                <div class="form-horizontal">
                  <div class="panel panel-flat">
                    <div class="panel-body">
                      <div class="row">
                        <div class="col-md-12">
                          <fieldset>
                            <legend class="text-bold text-uppercase">
                              <i class="icon-download10 position-left"></i
                              >Carregamento da Ficha Simplificada
                            </legend>

                            <div class="form-group">
                              <label class="text-bold text-uppercase"
                                >Localizar ficheiro:</label
                              >
                              <input
                                type="file"
                                class="file-styled"
                                accept=".xls, .xlsx"
                                name="file"
                                id="fileSimples"
                                placeholder="Clique aqui para selecionar o ficheiro"
                              />

                              <span class="help-block"
                                >Formatos aceites: xls, xlxs. Tamanho máximo
                                2Mb</span
                              >
                            </div>
                          </fieldset>
                        </div>
                      </div>

                      <div class="text-right">
                        <v-btn
                          @click="import_modelo_simples"
                          color="primary"
                          class="text-bold text-uppercase btn bg-danger-600 text-bold text-uppercase"
                        >
                          Carregar Ficheiro
                          <i class="icon-download4 position-right"></i>
                        </v-btn>
                      </div>
                    </div>
                  </div>
                </div>
              </v-card>
            </v-tab-item>
          </v-tabs-items>
        </v-card>
      </v-col>
      <v-col cols="12" md="8">
        <v-card>
          <v-row>
            <h6 class="panel-title text-bold text-uppercase">
              Listagem de dados à importar
            </h6>
            <div class="heading-elements">
              <ul class="icons-list">
                <li><a data-action="collapse"></a></li>
                <li><a data-action="reload"></a></li>
              </ul>
            </div>
          </v-row>

          <v-row>
            <v-col cols="12" sm="6" md="4">
              <v-select label="Provincia" dense filled mandatory></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select label="Distrito" dense filled mandatory></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select label="Escola" dense filled mandatory></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select label="Curso/Classe" dense filled mandatory></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select label="Turma" dense filled mandatory></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <button
                type="submit"
                onclick="this.disabled = 'disabled'; this.form.submit();"
                class="text-bold text-uppercase btn bg-primary-600 text-bold text-uppercase pull-right"
              >
                Confirmar importação de dados
                <i class="icon-check position-right"></i>
              </button>
            </v-col>
          </v-row>
          <v-row>
            <v-col cols="12">
              <div class="panel-heading">
                <h6 class="panel-title text-bold text-uppercase">
                  RESUMO DOS ALUNOS IMPORTADOS
                </h6>
                <div class="heading-elements">
                  <ul class="icons-list">
                    <li><a data-action="collapse"></a></li>
                    <li><a data-action="reload"></a></li>
                  </ul>
                </div>
              </div>
            </v-col>
            <v-col cols="12">
              <v-data-table
                :headers="headers"
                :items="import_students"
                class="elevation-1"
              ></v-data-table>
            </v-col>
          </v-row>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import readXlsxFile from 'read-excel-file';
import simpleFile from '@/store/modules/schemes/importStudentSimple.js';
export default {
  name: 'ImportStudent',
  data() {
    return {
      tabs: null,
      link_modelo_simp:
        'http://localhost:8002/assets/modelos_excel/imp_segia_alunos_modelo_simp.xlsx',
      link_modelo:
        'http://localhost:8002/assets/modelos_excel/imp_segia_alunos_modelo.xlsx',

      headers: [
        {
          text: '#',
          value: 'index',
        },
        { text: 'NOME ALUNO', value: 'full_name' },
        { text: 'Tipo DOCUMENTO', value: 'doc_type' },
        { text: 'NR DOCUMENTO', value: 'nr_doc' },
        { text: 'DATA NASC', value: 'birth_date' },
        { text: 'SEXO', value: 'genre' },
        { text: 'PROVÍNCIA', value: 'protein' },
        { text: 'ENCARREGADO', value: 'full_name' },
      ],
      import_students: [],
      simpleFile,
    };
  },
  methods: {
    import_modelo_simples() {
      console.log('modelo Simples');
      const input = document.getElementById('fileSimples');
      const file = input.files[0];
      const schema = {
        'NOME COMPLETO': {
          prop: 'full_name',
          type: String,
          required: true,
        },
        'DOC.': {
          prop: 'doc_type',
          type: String,
          required: true,
        },
        'NR. DOC.': {
          prop: 'nr_doc',
          type: String,
          required: true,
        },
        'VALIDADE DOC.': {
          prop: 'doc_date',
          type: Date,
        },
        'DATA NASC.': {
          prop: 'birth_date',
          type: Date,
        },
      };

      console.log("SCHEMMA");
      console.log(schema)
      readXlsxFile(file, { schema }).then(({ rows, errors }) => {
        // `errors` list items have shape: `{ row, column, error, reason?, value?, type? }`.
        errors.length === 0;

        this.import_students = rows;
        console.log("Imported");
        console.log(this.import_students)
      });
    },
    import_modelo_completo() {
      console.log('modelo Completo');
      const input = document.getElementById('fileSimples');
      const file = input.files[0];
      const schema = {
        'NOME COMPLETO': {
          prop: 'full_name',
          type: String,
          required: true,
        },
        'DOC.': {
          prop: 'doc_type',
          type: String,
          required: true,
        },
        'NR. DOC.': {
          prop: 'nr_doc',
          type: String,
          required: true,
        },
        'VALIDADE DOC.': {
          prop: 'doc_date',
          type: Date,
        },
        'DATA NASC.': {
          prop: 'birth_date',
          type: Date,
        },
      };

      readXlsxFile(file, { schema }).then(({ rows, errors }) => {
        // `errors` list items have shape: `{ row, column, error, reason?, value?, type? }`.
        errors.length === 0;

        this.import_students = rows;
        console.log(this.import_students);
      });
    },
  },
};
</script>

<style></style>
