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
            <v-col cols="14" sm="6" md="4">
              <v-select
                label="Provincia"
                dense
                filled
                mandatory
                :items="filterProvinces()"
                @change="filterDistricts($event)"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                label="Distrito"
                dense
                filled
                mandatory
                :items="districtsname"
                @change="filterSchools($event)"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select label="Instituicao" dense filled mandatory :items="schoolsname"
              @change="filterCourses($event)"></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select label="Curso" dense filled mandatory :items="coursesname"
              @change="setCourse($event)"></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4" class="ms-2">
              <v-btn color="blue" @click="gravar"
                >Confirmar importação de dados <v-icon>mdi-check</v-icon>
              </v-btn>
            </v-col>
          </v-row>
          <v-row>
            <v-col cols="12">
              <div class="panel-heading">
                <h6 class="panel-title text-bold text-uppercase">
                  Listagem de dados à importar
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
            :items="imported"
            class="elevation-1 v-data-table"
          ></v-data-table>
        </v-col>
      </v-row>
    </v-card>
    <!--lISTAGEM DE DADOS IMPORTADOS-->
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
      tabs: null,
      link_modelo_simp:
        "http://localhost:8002/assets/modelos_excel/imp_segia_candidatos_modelo.xlsx",
      link_modelo:
        "http://localhost:8002/assets/modelos_excel/imp_segia_alunos_modelo.xlsx",

      headers: [
        { text: "#", value: "id", width: "auto" },
        {
          text: "Nome",
          align: "start",
          sortable: false,
          value: "nome",
          width: "120px",
        },
        {
          text: "Outros Nomes",
          value: "outrosNomes",
          width: "150px",
        },
        { text: "Data de Nascimento", value: "birth_date", width: "150px" },
        { text: "Genero", value: "gender.descricao", width: "120px" },
        { text: "Identificacao", value: "identificacao", width: "120px" },
        { text: "Provincia", value: "province.name", width: "120px" },
        { text: "Distrito", value: "district.name", width: "120px" },
        { text: "Media 12.a", value: "media_12a", width: "120px" },
        { text: "Instituto de Formacao", value: "school.name", width: "150px" },
        { text: "Curso", value: "course.description", width: "120px" },
        { text: "Estado", value: "state", width: "120px" },
      ],
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
      },
    };
  },
  computed: {
    ...mapGetters(["provinces", "district", "schools", "imported"]),
  },
  methods: {
    ...mapActions([
      "getProvinces",
      "getDistricToSchools",
      "getSchools",
      "addCandidates",
    ]),
    mounted() {
      this.getProvinces();
      this.getDistricToSchools();
      this.getSchools();
    },
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
    gravar() {
      let candidates = [];
      
      this.import_candidates.map((candidate) => {
        this.editedItem.birth_date = candidate.birth_date;
        if(candidate["gender.descricao"]=="Femenino"){
          this.editedItem.gender_id = 2;
        }else{
          this.editedItem.gender_id = 1;
        }
        this.editedItem.identificacao = candidate.identificacao;
        this.editedItem.media_12a = candidate.media_12a;
        this.editedItem.nome = candidate.nome;
        this.editedItem.outrosNomes = candidate.outrosNomes;
        this.editedItem.newcontact = "876734776";
        candidates.push(this.editedItem);
      });

      this.import_candidates = [];
      console.log(candidates);
      this.addCandidates(candidates);
    },
    filterProvinces() {
      return this.provinces.map((province) => {
        return { text: province.name, value: province.id };
      });
    },
    filterDistricts(idProvince) {
      this.editedItem.province_id = idProvince;
      let index = this.provinces.findIndex((p) => {
        return idProvince == p.id;
      });
      this.districtsname = this.provinces[index].districts.map((district) => {
        return { text: district.name, value: district.id };
      });
    },
    filterSchools(idDistrict) {
      this.editedItem.district_id = idDistrict;
      let index = this.district.findIndex((d) => {
        return idDistrict == d.id;
      });
      this.schoolsname = this.district[index].schools.map((s) => {
        return { text: s.name, value: s.id };
      });
    },
    filterCourses(idSchool) {
      this.editedItem.school_id = idSchool;
      let index = this.schools.findIndex((d) => {
        return idSchool == d.id;
      });
      this.coursesname = this.schools[index].courses.map((s) => {
        return { text: s.description, value: s.id };
      });
    },
    setCourse(idCourse) {
      this.editedItem.course_id = idCourse;
    },
  },
};
</script>

<style>
</style>