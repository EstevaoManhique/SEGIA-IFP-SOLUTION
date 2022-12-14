<template>
  <v-data-table
    :headers="headers"
    :items="candidates"
    sort-by="calories"
    class="elevation-1"
    :search="search"
  >
  <template v-slot:item.state="{ item }">
    <v-chip
      :color="getColor(item.state)"
      dark
    >
      {{ item.state }}
    </v-chip>
  </template>
    <template v-slot:top>
      <v-toolbar flat>
        <v-toolbar-title>
          <v-select
          v-model="search"
          :items="opcoes"
          label="Filtre os Candidatos"
          outlined
          dense
          class="mt-5 ps-0"
        >
        </v-select>
        </v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-spacer></v-spacer>
        <v-dialog v-model="dialog" max-width="700px">
          <template v-slot:activator="{ on, attrs }">
            <v-btn color="primary" dark class="mb-2" v-bind="attrs" v-on="on">
              New Item
            </v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="text-h5">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.id"
                      disabled
                      label="ID"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.nome"
                      label="Primeiro Nome"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.outrosNomes"
                      label="Outros Nomes"
                    ></v-text-field>
                  </v-col>

                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.birth_date"
                      label="Data de Nascimento"
                      type="date"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      label="Genero"
                      v-model="editedItem.gender.descricao"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.identificacao"
                      label="Identificacao (BI/NUIT)"
                    ></v-text-field>
                  </v-col>
                  <v-row sm="6" md="4">
                    <v-select 
                      :items="filterProvinces()"
                      labreturn
                      @change="filterDistricts($event)"
                      v-model="selectedProvinceId"
                      dense
                      class=""
                    >
                    </v-select>
                    <v-select
                      labreturn
                      :items="districtsname"
                      @change="filterSchools($event)"
                      dense
                      class="ms-5"
                    >
                    </v-select>
                    <v-select
                      labreturn
                      :items="schoolsname"
                      @change="filterCourses($event)"
                      outline
                      dense
                      class="ms-5"
                    >
                    </v-select>
                    <v-select
                      labreturn
                      :items="coursesname"
                      @change="setCourse($event)"
                      outline
                      dense
                      class="ms-5"
                    >
                    </v-select>
                  </v-row>

                    <v-text-field
                      v-model="editedItem.media_12a"
                      label="Media da 12.a"
                    ></v-text-field>
                    <v-text-field
                    v-model="editedItem.contact.contact"
                    label="Contacto"
                  ></v-text-field>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="close"> Cancel </v-btn>
              <v-btn color="blue darken-1" text @click="save"> Save </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
        <v-dialog v-model="dialogDelete" max-width="500px">
          <v-card>
            <v-card-title class="text-h5"
              >Are you sure you want to delete this item?</v-card-title
            >
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="closeDelete"
                >Cancel</v-btn
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
      <v-btn color="primary" @click="initialize"> Reset </v-btn>
    </template>
  </v-data-table>
</template>
<script>
import { mapGetters, mapActions } from "vuex";
export default {
  data: () => ({
    opcoes:[
      {text:"Todos",value:-1},
      {text:"Validados",value:"VALIDADO"},
      {text:"Nao Validados",value:"PENDENTE"},
    ],
    search:"",
    selectedProvinceId: null,
    selectedDistrictId: null,
    selectedSchoolId: null,
    districtsname: null,
    provincesname: null,
    schoolsname:null,
    coursesname:null,
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
      { text: "Estado", value: "state"  },
      { text: "Opções", value: "actions", sortable: false },
    ],
    editedIndex: -1,
    editedItem: {
      nome: null,
      outrosNomes: null,
      contact: {},
      birth_date: null,
      identificacao: null,
      gender: {},
      district: {},
      school: {},
      course: {},
      province: {},
      media_12a: null,
    },
    defaultItem: {
      nome: null,
      outrosNomes: null,
      contact: null,
      birth_date: null,
      identificacao: null,
      gender_id: null,
      district_id: null,
      school_id: null,
      course_id: null,
      province_id: null,
    },
  }),

  computed: {
    ...mapGetters([
      "candidate",
      "candidates",
      "provinces",
      "schools",
      "district",
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
      "editCandidate"
    ]),
    initialize() {},
    filterProvinces() {
      return this.provinces.map((province) => {
        return { text: province.name, value: province.id };
      });
    },
    filterDistricts(idProvince) {
      this.editedItem.province.id = idProvince
      let index = this.provinces.findIndex((p) => {
        return (idProvince == p.id);
      });
      this.districtsname = this.provinces[index].districts.map((district) => {
        return { text: district.name, value: district.id };
      });
    },
    filterSchools(idDistrict) {
      let index = this.district.findIndex((d) => {
        return (idDistrict == d.id);
      });
      this.schoolsname = this.district[index].schools.map((s) => {
        return { text: s.name, value: s.id };
      });
    },
    filterCourses(idSchool) {
      this.editedItem.school.id = idSchool
      let index = this.schools.findIndex((d) => {
        return (idSchool == d.id);
      });
      this.coursesname = this.schools[index].courses.map((s) => {
        return { text: s.description, value: s.id };
      });
    },
    setCourse(idCourse){
      this.editedItem.course.id = idCourse
    },
    editItem(item) {
      this.editedIndex = this.candidates.indexOf(item);
      this.editedItem = Object.assign({}, item);
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
        ////this.editedItem = Object.assign({}, this.defaultItem);
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
      if (this.editedIndex > -1) {
        //Object.assign(this.candidates[this.editedIndex], this.editedItem);
        this.editedItem.isValidated = 1;
        let contacto = this.editedItem.contact.contact
        delete this.editedItem.contact
        this.editedItem.contact = contacto
        this.editCandidate(this.editedItem)
        //console.log(this.editedItem)
      } else {
        this.candidates.push(this.editedItem);
      }
      this.close();
    },
    getColor (state) {
     let x= state.includes('VALIDADO') ? 'green':'red';
     return x;
    },
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