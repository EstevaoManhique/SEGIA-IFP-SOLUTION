<template>
  <v-data-table
    :headers="headers"
    :items="candidates"
    class="elevation-1"
    :search="search"
  >
    <template v-slot:item.state="{ item }">
      <v-chip :color="getColor(item.state)" dark>
        {{ item.state }}
      </v-chip>
    </template>
    <template v-slot:top>
      <v-toolbar flat>
        <v-toolbar-title>
          <div class="d-flex mt-4">
            <v-select
              v-model="search"
              :items="opcoes"
              label="Filtrar pelo Estado"
              outlined
              dense
              class="mt-2"
            >
            </v-select>
            <v-select
              v-model="search"
              :items="opcoescurso"
              label="Filtrar pelo Curso"
              outlined
              dense
              class="ms-4 mt-2"
            >
            </v-select>
          </div>
        </v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-spacer></v-spacer>
        <v-dialog v-model="dialog" max-width="1000px">
          <template v-slot:activator="{ on, attrs }">
              <v-btn color="primary" dark class="ma-2" @click="import_modelo_simples">
                Exportar Candidatos
              </v-btn>
              <v-btn color="primary" dark class="ma-2" v-bind="attrs" v-on="on">
                Novo Candidato
              </v-btn>
          </template>

          <v-card>
            <v-form>
              <div>
                <div class="row">
                  <div class="col-md-12">
                    <fieldset class="ms-15 me-16 ps-15 pe-15">
                      <legend class="text-semibold">
                        <div class="mt-10">
                          <i class="icon-user-plus position-left"></i>
                          Dados do candidato
                        </div>
                      </legend>

                      <div class="form-group">
                        <div class="row">
                          <div class="col-md-6">
                            <label
                              class="
                                control-label
                                text-bold text-uppercase text-bold
                              "
                              >Nome:</label
                            >
                            <input
                              type="text"
                              placeholder="Primeiro Nome"
                              class="form-control"
                              v-model="editedItem.nome"
                              required=""
                            />
                          </div>
                          <div class="col-md-6">
                            <label
                              class="
                                control-label
                                text-bold text-uppercase text-bold
                              "
                              >Outros Nomes:</label
                            >
                            <input
                              type="text"
                              placeholder="Outros Nomes"
                              class="form-control"
                              name="apelido"
                              required=""
                              v-model="editedItem.outrosNomes"
                            />
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="row">
                          <div class="col-md-6">
                            <label
                              class="
                                control-label
                                text-bold text-uppercase text-bold
                              "
                              >Contacto:</label
                            >
                            <input
                              type="text"
                              placeholder="(+258) 8X.XXXXXXX"
                              class="form-control"
                              required=""
                              v-model="editedItem.contacts[0].contact"
                            />
                          </div>
                          <div class="col-md-6">
                            <label
                              class="control-label text-bold text text-bold"
                              >MEDIA 12.a CLASSE:</label
                            >
                            <input
                              min="12"
                              type="number"
                              placeholder="Introduza a media"
                              class="form-control"
                              name="contact"
                              v-model="editedItem.media_12a"
                            />
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="row">
                          <div class="col-md-6">
                            <label
                              class="
                                control-label
                                text-bold text-uppercase text-bold
                              "
                              >Data de Nascimento:</label
                            >
                            <input
                              type="date"
                              placeholder="Data de nascimento"
                              class="form-control"
                              name="data_nascimento"
                              v-model="editedItem.birth_date"
                            />
                          </div>
                          <div class="col-md-6">
                            <label
                              class="
                                control-label
                                text-bold text-uppercase text-bold
                              "
                              >Identificação:</label
                            >
                            <input
                              required
                              type="text"
                              placeholder="BI/DIRE/Passaporte N.º"
                              class="form-control"
                              name="documento"
                              v-model="editedItem.identificacao"
                            />
                          </div>
                          <v-radio-group
                            class="ms-3"
                            v-model="candidate.gender_id"
                            row
                          >
                            <v-radio label="Masculino" value="1"></v-radio>
                            <v-radio label="Femenino" value="2"></v-radio>
                          </v-radio-group>
                          <v-switch
                            v-model="editedItem.isValidated"
                            label="Validar"
                            color="success"
                            value="1"
                            hide-details
                          ></v-switch>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="row">
                          <div class="col-md-6">
                            <v-select
                              :items="filterProvinces()"
                              labreturn
                              @change="filterDistricts($event)"
                              dense
                              class=""
                            >
                            </v-select>
                          </div>

                          <div class="col-md-6">
                            <v-select
                              labreturn
                              :items="districtsname"
                              @change="filterSchools($event)"
                              dense
                              class="ms-5"
                            >
                            </v-select>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-6">
                            <v-select
                              labreturn
                              :items="schoolsname"
                              @change="filterCourses($event)"
                              dense
                              class=""
                            >
                            </v-select>
                          </div>

                          <div class="col-md-6">
                            <v-select
                              labreturn
                              :items="coursesname"
                              @change="setCourse($event)"
                              dense
                              class="ms-5"
                            >
                            </v-select>
                          </div>
                        </div>
                      </div>
                    </fieldset>
                  </div>
                </div>
                <div>
                  <div class="d-flex justify-end mb-10 mr-10">
                    <v-btn
                      class="btn bg-slate-800 text-bold text-uppercase"
                      @click="save"
                    >
                      Gravar
                      <i class="icon-arrow-right14 position-right"></i>
                    </v-btn>
                  </div>
                  <div>.</div>
                  <div>.</div>
                </div>
              </div>
            </v-form>
          </v-card>
        </v-dialog>
        <v-dialog v-model="dialogDelete" max-width="500px">
          <v-card>
            <v-card-title class="text-h5"
              >Voce tem certeza que quer deletar este dado?</v-card-title
            >
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="closeDelete"
                >Cacelar</v-btn
              >
              <v-btn color="blue darken-1" text @click="deleteItemConfirm"
                >OK</v-btn
              >
              <v-spacer></v-spacer>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
    </template>
    <template v-slot:item.actions="{ item }">
      <v-icon small class="mr-2" @click="editItem(item)"> mdi-pencil </v-icon>
      <v-icon small @click="deleteItem(item)"> mdi-delete </v-icon>
    </template>
    <template v-slot:no-data>
      <v-btn color="primary" @click="initialize"> Redefinir </v-btn>
    </template>
  </v-data-table>
</template>
<script>
import readXlsxFile from 'read-excel-file';
import { mapGetters, mapActions } from "vuex";
import AddCandidate from "./AddCandidate.vue";
export default {
  components: { AddCandidate },
  data: () => ({
    try: { text: "Maputo", value: 3 },
    opcoes: [
      { text: "Todos", value: -1 },
      { text: "Validados", value: "VALIDADO" },
      { text: "Nao Validados", value: "PENDENTE" },
    ],
    opcoescurso: [
      { text: "12.a + 1", value: "12.a + 1" },
      { text: "12.a + 3", value: "12.a + 3" },
    ],
    contact: null,
    search: "",
    districtsname: null,
    provincesname: null,
    schoolsname: null,
    coursesname: null,
    dialog: false,
    dialogDelete: false,
    headers: [
      { text: "#", value: "id" },
      {
        text: "Nome",
        align: "start",
        sortable: false,
        value: "nome",
      },
      {
        text: "Outros Nomes",
        value: "outrosNomes",
      },
      { text: "Data de Nascimento", value: "birth_date" },
      { text: "Genero", value: "gender.descricao" },
      { text: "Identificacao", value: "identificacao" },
      { text: "Provincia", value: "province.name" },
      { text: "Distrito", value: "district.name" },
      { text: "Media 12.a", value: "media_12a" },
      { text: "Instituto de Formacao", value: "school.name" },
      { text: "Curso", value: "course.description" },
      { text: "Estado", value: "state" },
      { text: "Opções", value: "actions", sortable: false },
    ],
    editedIndex: -1,
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
  }),

  computed: {
    ...mapGetters([
      "candidate",
      "candidates",
      "provinces",
      "schools",
      "district",
      "jurys"
    ]),
    formTitle() {
      return this.editedIndex === -1 ? "Novo Candidato" : "";
    },
  },

  watch: {
    dialog(val) {
      val || this.close();
    },
    dialogDelete(val) {
      val || this.closeDelete();
    },
  },

  created() {
    this.initialize();
  },
  methods: {
    ...mapActions([
      "getCandidates",
      "getSchools",
      "getProvinces",
      "getDistricToSchools",
      "editCandidate",
      "addCandidate",
      "addCandidates",
    ]),
    initialize() {},
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
    editItem(item) {
      this.editedIndex = this.candidates.indexOf(item);
      this.editedItem = Object.assign({}, item);
      console.log("EditedItem");
      console.log(this.editedItem);
      this.contact = this.editedItem.contacts[0].contact;
      this.dialog = true;
    },

    deleteItem(item) {
      this.editedIndex = this.candidates.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },

    deleteItemConfirm() {
      this.candidates.splice(this.editedIndex, 1);
      this.closeDelete();
    },

    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    save() {
      console.log("Save EditedItem");
      console.log(this.editedItem);
      let phoneno = /^\d{9}$/;
      let nrValid = false;
      if (
        this.editedItem.nome &&
        this.editedItem.outrosNomes &&
        this.editedItem.contacts[0].contact &&
        this.editedItem.media_12a &&
        this.editedItem.birth_date &&
        this.editedItem.identificacao &&
        this.candidate.gender_id &&
        this.editedItem.province_id &&
        this.editedItem.district_id &&
        this.editedItem.school_id &&
        this.editedItem.course_id
      ) {
        if (this.editedItem.contacts[0].contact.match(phoneno)) {
          nrValid = true;
        } else {
          nrValid = false;
        }
        this.editedItem.newcontact = this.editedItem.contacts[0].contact;
        this.editedItem.gender_id = this.candidate.gender_id;

        if (this.editedIndex > -1) {
          if (this.contact != this.editedItem.contacts[0].contact) {
            this.editedItem.contact_id = this.editedItem.contacts[0].id;
            console.log("Edited Contact " + this.editedItem.contact_id);
            delete this.editedItem.contacts[0].id;
            this.editCandidate(this.editedItem);
          } else {
            this.editedItem.contact_id = this.editedItem.contacts[0].id;
            console.log("Edited Contact " + this.editedItem.contact_id);
            this.editCandidate(this.editedItem);
          }
        } else {
          this.editedItem.gender_id = this.candidate.gender_id;
          this.addCandidate(this.editedItem);
        }
        this.close();
      } else {
        alert("Preencha todos campos");
      }
    },
    getColor(state) {
      let x = state.includes("VALIDADO") ? "green" : "red";
      return x;
    },
    import_modelo_simples() {
      /*console.log('modelo Simples');
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
        console.log("Import Simple Students")
        console.log(this.import_students)
      });*/

    }
  },
  mounted() {
    this.getCandidates();
    this.getSchools();
    this.getProvinces();
    this.getDistricToSchools();
    this.filterProvinces();
  },
};
</script>
<style>
</style>