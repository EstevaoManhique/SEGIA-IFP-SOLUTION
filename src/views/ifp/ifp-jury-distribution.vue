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
                  <div class="panel-body d-flex">
                    <v-btn
                      v-if="jurys[0] || jurysByCourse[0]"
                      @click="imprimirJurys()"
                      color="#3F51B5"
                      class="white--text mt-6"
                    >
                      <v-icon>mdi-file-download</v-icon>
                      Imprimir todos juris
                    </v-btn>
                    <v-btn
                      v-else-if="bycourse[0]"
                      @click="createJurys()"
                      color="success"
                      class="mt-6"
                      :disabled="disabled"
                    >
                      <v-icon>mdi-format-list-bulleted</v-icon>
                      Fazer a criação de júris
                    </v-btn>
                    <!--<v-btn v-else-if="false" disabled @click="createJurys" color="success" class="mt-6">
                        <v-icon>mdi-format-list-bulleted</v-icon>
                        Fazer a criação de júris
                    </v-btn>-->
                  </div>
                </div>
                <!-- Basic layout-->
                <div class="form-horizontal">
                  <div class="panel panel-flat">
                    <div class="panel-body">
                      <div class="row">
                        <div class="col-md-12">
                          <v-card>
                            <v-row>
                              <v-col cols="12">
                                <div class="panel-heading">
                                  <h6
                                    class="panel-title text-bold text-uppercase"
                                  >
                                    Lista de juris
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
                                  :headers="headersJury"
                                  :items="jurys"
                                  :items-per-page="5"
                                  class="elevation-1 v-data-table"
                                ></v-data-table>
                              </v-col>
                            </v-row>
                          </v-card>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /basic layout -->
              </v-card>
            </v-tab-item>
          </v-tabs-items>
        </v-card>
      </v-col>
      <v-col cols="12" md="8">
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
                <h6 v-if="search" class="panel-title text-bold text-uppercase">
                  Listagem dos candidatos do Juri {{ search }}
                </h6>
                <div class="heading-elements">
                  <ul class="icons-list">
                    <li><a data-action="collapse"></a></li>
                    <li><a data-action="reload"></a></li>
                  </ul>
                </div>
              </div>
              <div>
                <v-row class="d-flex mx-15">
                  <v-col>
                    <v-select
                      :items="opcoescurso"
                      @change="setCourse($event)"
                      label="Selecione o curso"
                      class="ml-5"
                    ></v-select>
                  </v-col>
                  <v-col>
                    <v-select
                      :items="opcoesjurs"
                      label="Selecione Juri"
                      v-model="search"
                      @change="filterByJury($event)"
                      class="mr-5"
                    ></v-select>
                  </v-col>
                </v-row>
              </div>
            </v-col>
            <v-col cols="12">
              <div v-if="jurys[0] || jurysByCourse[0]">
                <v-data-table
                  :headers="headers"
                  :items="cbyjury"
                  :search="search"
                  class="elevation-1 v-data-table"
                ></v-data-table>
              </div>
              <div v-else class="d-flex justify-center">
                <!--<h3 class="red--text">
                  Os juris ainda nao foram criados, eles poderao ser criados
                  apos o termino das inscricoes
                </h3>-->
                <h3 class="red--text">
                  Os juris ainda nao foram criados, clique em "Fazer a criação
                  de júris".
                </h3>
              </div>
            </v-col>
          </v-row>
        </v-card>
      </v-col>
    </v-row>
    <v-dialog v-model="dialogDelete" width="500px">
      <v-card>
        <div class="d-flex justify-center">
          <v-icon style="font-size: 7rem" color="success">mdi-check</v-icon>
        </div>
        <div class="d-flex justify-center">
          <v-card-title class="text-h5">Notificação do Sistema</v-card-title>
        </div>
        <div class="d-flex justify-center">
          <h4>Os juris foram anteriormente criados.</h4>
        </div>
        <div class="d-flex justify-center">
          <v-btn class="mb-3" color="success" @click="setOf">Ok</v-btn>
        </div>
      </v-card>
    </v-dialog>
  </v-container>
</template>
  
  <script>
import readXlsxFile, { Integer } from "read-excel-file";
import simpleFile from "@/store/modules/schemes/importStudentSimple.js";
import { mapGetters, mapActions } from "vuex";
export default {
  name: "ImportStudent",
  data() {
    return {
      disabled: false,
      tabs: null,
      link_modelo_simp:
        "http://localhost:8002/assets/modelos_excel/imp_segia_candidatos_modelo.xlsx",
      link_modelo:
        "http://localhost:8002/assets/modelos_excel/imp_segia_alunos_modelo.xlsx",

      headers: [
        { text: "Nr Candidato", value: "id", width: "auto" },
        {
          text: "Nome",
          align: "start",
          sortable: false,
          value: "nome",
          width: "auto",
        },
        {
          text: "Outros Nomes",
          value: "outrosNomes",
          width: "auto",
        },
        { text: "Data de Nascimento", value: "birth_date", width: "auto" },
        { text: "Genero", value: "gender.descricao", width: "auto" },
        { text: "Identificacao", value: "identificacao", width: "auto" },
        { text: "Juri", value: "jury_id", width: "auto" },
      ],

      headersJury: [
        { text: "Juri", value: "id", width: "auto" },
        { text: "Curso", value: "course", width: "auto" },
      ],
      dialogDelete: false,
      districtsname: null,
      provincesname: null,
      schoolsname: null,
      coursesname: null,
      import_candidates: [],
      simpleFile,
      editedItem: {
        id: null,
        nome: null,
        outrosNomes: null,
        contacts: [{ contact: null, id: null }],
        birth_date: null,
        identificacao: null,
        gender: {},
        district: {},
        school: {},
        course: {},
        province: {},
        media_12a: null,
        gender_id: null,
        isValidated: null,
        contact_id: null,
        ifpcode: null,
      },
      defaultItem: {
        id: null,
        nome: null,
        outrosNomes: null,
        contacts: [{ contact: null, id: null }],
        birth_date: null,
        identificacao: null,
        gender: {},
        district: {},
        school: {},
        course: {},
        province: {},
        media_12a: null,
        gender_id: null,
        isValidated: null,
        contact_id: null,
        ifpcode: null,
      },
      province_id: null,
      school_id: null,
      district_id: null,
      course_id: null,
      search: null,
      ifpcode: null,
      opcoesjurs: null,
      opcoescurso: [
        { text: "Selecione", value: "Selecione" }, 
        { text: "12.a + 1", value: "12.a + 1" },
        { text: "12.a + 3", value: "12.a + 3" },
      ],
    };
  },
  computed: {
    ...mapGetters([
      "jurys",
      "provinces",
      "district",
      "schools",
      "candidates",
      "bycourse",
      "jurysByCourse",
      "cbyjury",
    ]),
  },
  updated(){
    this.getJurys();
  },
  mounted() {
    this.getProvinces();
    this.getDistricToSchools();
    this.getSchools();
    this.getCandidates();
    this.getJurys();
    this.getCandidatesByCourse()
  },
  methods: {
    ...mapActions([
      "getJurys",
      "getProvinces",
      "getDistricToSchools",
      "getSchools",
      "generateJurys",
      "getCandidates",
      "getCandidatesByJury",
      "getCandidatesByCourse"
    ]),
    import_modelo_simples() {
      console.log("modelo Simples");
      const input = document.getElementById("fileSimples");
      const file = input.files[0];
      const schema = {
        Codigo: {
          prop: "id",
          type: String,
          required: true,
        },
        Nome: {
          prop: "nome",
          type: String,
          required: true,
        },
        "Outros Nomes": {
          prop: "outrosNomes",
          type: String,
          required: true,
        },
        "Data de Nascimento": {
          prop: "birth_date",
          type: Date,
          required: true,
        },
        Genero: {
          prop: "gender.descricao",
          type: String,
          required: true,
        },
        Identificacao: {
          prop: "identificacao",
          type: String,
          required: true,
        },
        PROVÍNCIA: {
          prop: "province.name",
          type: String,
          required: true,
        },
        Distrito: {
          prop: "district.name",
          type: String,
          required: true,
        },
        "Media 12.a": {
          prop: "media_12a",
          type: Number,
          required: true,
        },
        "Instituto de Formacao": {
          prop: "school.name",
          type: String,
          required: true,
        },
        Curso: {
          prop: "course.description",
          type: String,
          required: true,
        },
        Estado: {
          prop: "state",
          type: String,
          required: true,
        },
      };

      readXlsxFile(file, { schema }).then(({ rows, errors }) => {
        // `errors` list items have shape: `{ row, column, error, reason?, value?, type? }`.
        errors.length === 0;

        this.import_candidates = rows;
        console.log("Import Candidates");
        console.log(this.import_candidates);
      });
    },
    import_modelo_completo() {
      console.log("modelo Simples");
      const input = document.getElementById("fileSimples");
      const file = input.files[0];
      const schema = {
        Nome: {
          prop: "nome",
          type: String,
          required: true,
        },
        "Outros Nomes": {
          prop: "outrosNomes",
          type: String,
          required: true,
        },
        "Data de Nascimento": {
          prop: "birth_date",
          type: Date,
          required: true,
        },
        Genero: {
          prop: "gender.descricao",
          type: String,
          required: true,
        },
        Identificacao: {
          prop: "identificacao",
          type: String,
          required: true,
        },
        PROVÍNCIA: {
          prop: "province.name",
          type: String,
          required: true,
        },
        Distrito: {
          prop: "district.name",
          type: String,
          required: true,
        },
        "Media 12.a": {
          prop: "media_12a",
          type: Number,
          required: true,
        },
        "Instituto de Formacao": {
          prop: "school.name",
          type: String,
          required: true,
        },
        Curso: {
          prop: "course.description",
          type: String,
          required: true,
        },
        Estado: {
          prop: "state",
          type: String,
          required: true,
        },
      };

      readXlsxFile(file, { schema }).then(({ rows, errors }) => {
        // `errors` list items have shape: `{ row, column, error, reason?, value?, type? }`.
        errors.length === 0;

        this.import_candidates = rows;
        console.log("Import Candidates");
        console.log(this.import_candidates);
      });
    },
    gravar() {
      var candidates = [];
      this.import_candidates.forEach((candidate) => {
        this.editedItem = this.defaultItem;
        this.editedItem.birth_date = candidate.birth_date;
        this.editedItem.identificacao = candidate.identificacao;
        this.editedItem.media_12a = candidate.media_12a;
        this.editedItem.nome = candidate.nome;
        this.editedItem.outrosNomes = candidate.outrosNomes;
        this.editedItem.newcontact = "000000000";
        this.editedItem = Object.assign({}, candidate);
        this.editedItem.province_id = this.province_id;
        this.editedItem.district_id = this.district_id;
        this.editedItem.school_id = this.school_id;
        this.editedItem.course_id = this.course_id;
        this.editedItem.ifpcode = this.ifpcode;
        if (this.editedItem["gender.descricao"] == "Masculino") {
          this.editedItem.gender_id = 1;
        } else {
          this.editedItem.gender_id = 2;
        }
        candidates.push(this.editedItem);
      });

      this.import_candidates = [];
      console.log("candidates");
      console.log(candidates);
      this.addCandidates(candidates);
      this.dialogDelete = true;
    },
    filterProvinces() {
      return this.provinces.map((province) => {
        return { text: province.name, value: province.id };
      });
    },
    filterDistricts(idProvince) {
      this.province_id = idProvince;
      let index = this.provinces.findIndex((p) => {
        return idProvince == p.id;
      });
      this.districtsname = this.provinces[index].districts.map((district) => {
        return { text: district.name, value: district.id };
      });
    },
    filterSchools(idDistrict) {
      this.district_id = idDistrict;
      let index = this.district.findIndex((d) => {
        return idDistrict == d.id;
      });
      this.schoolsname = this.district[index].schools.map((s) => {
        return { text: s.name, value: s.id };
      });
    },
    filterCourses(idSchool) {
      this.school_id = idSchool;

      let index = this.schools.findIndex((d) => {
        return idSchool == d.id;
      });
      this.ifpcode = this.schools[index].cod;
      this.coursesname = this.schools[index].courses.map((s) => {
        return { text: s.description, value: s.id };
      });
    },
    setCourse(idCourse) {
      this.course_id = idCourse;

      this.opcoesjurs = this.jurys
        .filter((j) => {
          if (j.course == idCourse) {
            return { text: j.id, value: j.id };
          }
        })
        .map((a) => {
          if (a.course == idCourse) {
            return { text: a.id, value: a.id };
          }
        });
    },
    setOf() {
      this.dialogDelete = false;
    },
    createJurys() {
      this.disabled = true;
      if (!this.jurys[0]) {
        let coursesjury = [];

        for (let i = 0; i < this.bycourse.length; i++) {
          let inicio = 0,
            fim = 30;

          let candidates = this.bycourse[i];
          let limit = Math.floor(candidates.length / 30);
          let jurs = [];
          for (let index = 0; index < limit + 1; index++) {
            jurs.push(candidates.slice(inicio, fim));
            inicio = fim;
            fim = fim + 30;
          }

          
          coursesjury.push(jurs);
        }
        
        this.generateJurys(coursesjury);
      } else {
        this.dialogDelete = true;
      }
    },
    filterByJury(id) {
      this.getCandidatesByJury(id);
    },
    imprimirJurys() {},
  },
};
</script>
  
  <style>
</style>