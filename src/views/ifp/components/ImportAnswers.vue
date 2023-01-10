<template>
  <v-container>
    <v-row>
      <v-col cols="12" md="4">
        <v-card>
          <v-tabs v-model="tabs" fixed-tabs>
            <v-tabs-slider></v-tabs-slider>
            <v-tab href="#mobile-tabs-5-2" class="primary--text">
              Ficha de Importação das Respostas
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
                      class="
                        btn
                        bg-success-600
                        btn-labeled btn-labeled-left
                        text-bold text-uppercase
                      "
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
                          class="
                            text-bold text-uppercase
                            btn
                            bg-danger-600
                            text-bold text-uppercase
                          "
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
                      class="
                        btn
                        bg-success-600
                        btn-labeled btn-labeled-left
                        text-bold text-uppercase
                      "
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
                          class="
                            text-bold text-uppercase
                            btn
                            bg-danger-600
                            text-bold text-uppercase
                          "
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
            <div class="heading-elements">
              <ul class="icons-list">
                <li><a data-action="collapse"></a></li>
                <li><a data-action="reload"></a></li>
              </ul>
            </div>
          </v-row>
          <v-row>
            <v-col cols="12">
              <div class="panel-heading">
                <h6 class="panel-title text-bold text-uppercase">
                  Listagem de respostas à Corrigir
                </h6>
                <v-btn color="blue" @click="corrigirExames()"
                  >Comecar a corrigir <v-icon>mdi-check</v-icon>
                </v-btn>
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
                :headers="headersImport"
                :items="import_candidates"
                class="elevation-1 v-data-table"
              ></v-data-table>
            </v-col>
          </v-row>
        </v-card>
      </v-col>
    </v-row>

    <!--lISTAGEM DE DADOS IMPORTADOS-->
    <v-card>
      <v-row>
        <div class="heading-elements">
          <ul class="icons-list">
            <li><a data-action="collapse"></a></li>
            <li><a data-action="reload"></a></li>
          </ul>
        </div>
      </v-row>

      <v-row>
        <v-col cols="12">
          <div class="panel-heading">
            <h6 class="panel-title text-bold text-uppercase">
              Listagem de dados importados
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
            :items="avalImported"
            class="elevation-1 v-data-table"
          ></v-data-table>
        </v-col>
      </v-row>
      <!--lISTAGEM DE DADOS IMPORTADOS-->
      <v-dialog v-model="dialogDelete" width="500px">
        <v-card>
          <div class="d-flex justify-center">
            <v-icon style="font-size: 7rem" color="success">mdi-check</v-icon>
          </div>
          <div class="d-flex justify-center">
            <v-card-title class="text-h5">Notificação do Sistema</v-card-title>
          </div>
          <div class="d-flex justify-center">
            <div
              class="d-flex justify-space-between"
              style="width: 50%"
              v-if="data"
            >
              <p>Importados: {{ data.importados }}</p>
              <p>Registrados: {{ data.registrados }}</p>
              <p>Repetidos: {{ data.repetidos }}</p>
            </div>
          </div>
          <div class="d-flex justify-center">
            <v-btn class="mb-3" color="success">Ok</v-btn>
          </div>
        </v-card>
      </v-dialog>
    </v-card>
  </v-container>
</template>

<script>
import readXlsxFile, { Integer } from "read-excel-file";
import simpleFile from "@/store/modules/schemes/importStudentSimple.js";
import { mapGetters, mapActions } from "vuex";
export default {
  name: "ImportAnswers",
  data() {
    return {
      tabs: null,
      link_modelo_simp:
        "http://localhost:8002/assets/modelos_excel/imp_segia_candidatos_modelo.xlsx",
      link_modelo:
        "http://localhost:8002/assets/modelos_excel/imp_segia_alunos_modelo.xlsx",

      headersImport: [
        {
          text: "Candidato",
          align: "start",
          sortable: false,
          value: "numero",
          width: "auto",
        },
        {
          text: "Disciplina",
          value: "disciplina",
          width: "auto",
          sortable: false,
        },
        {
          text: "Sinaletica",
          value: "sinaletica",
          width: "auto",
          sortable: false,
        },
        { text: "P1", value: "p1", width: "auto", sortable: false },
        { text: "P2", value: "p2", width: "auto", sortable: false },
        { text: "P3", value: "p3", width: "auto", sortable: false },
        { text: "P4", value: "p4", width: "auto", sortable: false },
        { text: "P5", value: "p5", width: "auto", sortable: false },
        { text: "P6", value: "p6", width: "auto", sortable: false },
        { text: "P7", value: "p7", width: "auto", sortable: false },
        { text: "P8", value: "p8", width: "auto", sortable: false },
        { text: "P9", value: "p9", width: "auto", sortable: false },
        { text: "P10", value: "p10", width: "auto", sortable: false },
        { text: "P11", value: "p11", width: "auto", sortable: false },
        { text: "P12", value: "p12", width: "auto", sortable: false },
        { text: "P13", value: "p13", width: "auto", sortable: false },
        { text: "P14", value: "p14", width: "auto", sortable: false },
        { text: "P15", value: "p15", width: "auto", sortable: false },
        { text: "P16", value: "p16", width: "auto", sortable: false },
        { text: "P17", value: "p17", width: "auto", sortable: false },
        { text: "P18", value: "p18", width: "auto", sortable: false },
        { text: "P19", value: "p19", width: "auto", sortable: false },
        { text: "P20", value: "p20", width: "auto", sortable: false },
        { text: "P21", value: "p21", width: "auto", sortable: false },
        { text: "P22", value: "p22", width: "auto", sortable: false },
        { text: "P23", value: "p23", width: "auto", sortable: false },
        { text: "P24", value: "p24", width: "auto", sortable: false },
        { text: "P25", value: "p25", width: "auto", sortable: false },
        { text: "P26", value: "p26", width: "auto", sortable: false },
        { text: "P27", value: "p27", width: "auto", sortable: false },
        { text: "P28", value: "p28", width: "auto", sortable: false },
        { text: "P29", value: "p29", width: "auto", sortable: false },
        { text: "P30", value: "p30", width: "auto", sortable: false },
        { text: "P21", value: "p31", width: "auto", sortable: false },
        { text: "P32", value: "p32", width: "auto", sortable: false },
        { text: "P33", value: "p33", width: "auto", sortable: false },
        { text: "P34", value: "p34", width: "auto", sortable: false },
        { text: "P35", value: "p35", width: "auto", sortable: false },
        { text: "P36", value: "p36", width: "auto", sortable: false },
        { text: "P37", value: "p37", width: "auto", sortable: false },
        { text: "P38", value: "p38", width: "auto", sortable: false },
        { text: "P39", value: "p39", width: "auto", sortable: false },
        { text: "P40", value: "p40", width: "auto", sortable: false },
      ],
      headers: [
        { text: "Codigo", value: "candidate_id", width: "auto", sortable: false },
        {
          text: "Nome",
          sortable: false,
          value: "candidate.nome",
          width: "auto",
        },
        {
          text: "Portugues",
          value: "portugues",
          width: "auto",
          sortable: false,
        },
        {
          text: "Matematica",
          value: "matematica",
          width: "auto",
          sortable: false,
        },
        {
          text: "Entrevista",
          value: "entrevista",
          width: "auto",
          sortable: false,
        },
      ],
      import_candidates: [],
      editedItem: {
        portugues: null,
        matematica: null,
        entrevista: null,
        candidate_id: null,
      },
      defaultItem: {
        portugues: null,
        matematica: null,
        entrevista: null,
        candidate_id: null,
      },
    };
  },
  computed: {
    ...mapGetters(["questionsByExam", "avaliacoes", "avaliacao", "avalImported"]),
  },
  mounted() {
    this.getAvaliacoes();
  },
  created() {
    this.user = JSON.parse(localStorage.getItem("user"));
    console.log(this.user);
  },
  methods: {
    ...mapActions(["getQuestionsByExam", "getAvaliacoes", "addAvaliacao", "addAvaliacoes"]),
    import_modelo_simples() {
      console.log("Modelo Usado");
      const input = document.getElementById("fileSimples");
      const file = input.files[0];
      const schema = {
        Número: {
          prop: "numero",
          type: Number,
        },
        Disciplina: {
          prop: "disciplina",
          type: Number,
        },
        Sinalética: {
          prop: "sinaletica",
          type: String,
        },
        P1: {
          prop: "p1",
          type: String,
        },
        P2: {
          prop: "p2",
          type: String,
        },
        P3: {
          prop: "p3",
          type: String,
        },
        P4: {
          prop: "p4",
          type: String,
        },
        P5: {
          prop: "p5",
          type: String,
        },
        P6: {
          prop: "p6",
          type: String,
        },
        P7: {
          prop: "p7",
          type: String,
        },
        P8: {
          prop: "p8",
          type: String,
        },
        P9: {
          prop: "p9",
          type: String,
        },
        P10: {
          prop: "p10",
          type: String,
        },
        P11: {
          prop: "p11",
          type: String,
        },
        P12: {
          prop: "p12",
          type: String,
        },
        P13: {
          prop: "p13",
          type: String,
        },
        P14: {
          prop: "p14",
          type: String,
        },
        P15: {
          prop: "p15",
          type: String,
        },
        P16: {
          prop: "p16",
          type: String,
        },
        P17: {
          prop: "p17",
          type: String,
        },
        P18: {
          prop: "p18",
          type: String,
        },
        P19: {
          prop: "p19",
          type: String,
        },
        P20: {
          prop: "p20",
          type: String,
        },
        P21: {
          prop: "p21",
          type: String,
        },
        P22: {
          prop: "p22",
          type: String,
        },
        P23: {
          prop: "p23",
          type: String,
        },
        P24: {
          prop: "p24",
          type: String,
        },
        P25: {
          prop: "p25",
          type: String,
        },
        P26: {
          prop: "p26",
          type: String,
        },
        P27: {
          prop: "p27",
          type: String,
        },
        P28: {
          prop: "p28",
          type: String,
        },
        P29: {
          prop: "p29",
          type: String,
        },
        P30: {
          prop: "p30",
          type: String,
        },
        P31: {
          prop: "p31",
          type: String,
        },
        P32: {
          prop: "p32",
          type: String,
        },
        P33: {
          prop: "p33",
          type: String,
        },
        P34: {
          prop: "p34",
          type: String,
        },
        P35: {
          prop: "p35",
          type: String,
        },
        P36: {
          prop: "p36",
          type: String,
        },
        P37: {
          prop: "p37",
          type: String,
        },
        P38: {
          prop: "p38",
          type: String,
        },
        P39: {
          prop: "p39",
          type: String,
        },
        P40: {
          prop: "p40",
          type: String,
        },
      };

      readXlsxFile(file, { schema }).then(({ rows, errors }) => {
        // `errors` list items have shape: `{ row, column, error, reason?, value?, type? }`.
        errors.length === 0;

        this.import_candidates = rows;
        console.log("Import Candidates Used");
        console.log(this.import_candidates);
        let examId = this.import_candidates[0].disciplina;
        this.getQuestionsByExam(examId);
      });
    },
    corrigirExames() {
      let avaliacoes = [];
      let nota = 0;
      let aval = {
        portugues: null,
        matematica: null,
        entrevista: null,
        candidate_id: null,
      };

      this.import_candidates.map((candidate) => {
        let idCandidato = candidate.numero;
        let idDisciplina = candidate.disciplina;
        delete candidate.disciplina;
        delete candidate.numero;
        delete candidate.sinaletica;

        var props = Object.keys(candidate);
        
        for (var i = 0; i < props.length; i++) {
          if (candidate[props[i]] == this.questionsByExam[i].resposta) {
            nota = nota + this.questionsByExam[i].cotacao;
          } else {
          }
        }
        //console.log("candidato");
        //console.log(candidate);
        if(idDisciplina==2){
          aval.portugues = nota;
        }else if(idDisciplina==1){
          aval.matematica = nota;
        }
        aval.candidate_id = idCandidato;
        
        
        //aval.entrevista = nota;
        
        this.editedItem = this.defaultItem;
        this.editedItem = Object.assign({}, aval);

        if(this.editedItem.candidate_id){
          avaliacoes.push(this.editedItem);
        }
      
        nota = 0;
        aval.candidate_id = null;
        aval.portugues = null;
        aval.matematica = null;
        aval.entrevista = null;
      });

      console.log("Avaliacoes");
      console.log(avaliacoes);

      this.addAvaliacoes(avaliacoes)
    },
  },
};
</script>

<style>
</style>