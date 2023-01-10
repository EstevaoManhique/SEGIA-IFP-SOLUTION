<template>
  <v-card>
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
        <v-select
          label="Instituicao"
          dense
          filled
          mandatory
          :items="schoolsname"
          @change="filterCourses($event)"
        ></v-select>
      </v-col>
      <v-col cols="12" sm="6" md="4">
        <v-select
          label="Curso"
          dense
          filled
          mandatory
          :items="opcoescurso"
          @change="filterByCourse($event)"
        ></v-select>
      </v-col>
      <v-col cols="12" sm="6" md="4">
        <v-select
          label="Pauta"
          dense
          filled
          mandatory
          :items="opcoespauta"
          @change="filterByState($event)"
          :disabled="disabled"
          v-model="idPauta"
        ></v-select>
      </v-col>
      <v-col cols="12" sm="6" md="4" class="ms-2">
        <v-btn color="primary" dark class="ma-2" @click="exportToExcel()">
          Exportar Pauta
        </v-btn>
      </v-col>
    </v-row>
    <v-data-table
      :headers="headers"
      :items="avalcs"
      class="elevation-1"
      :search="search"
    >
      <template v-slot:item.status="{ item }">
        <v-chip :color="getColor(item.status)" dark>
          {{ item.status }}
        </v-chip>
      </template>
      <template v-slot:top>
        <!--<v-toolbar flat>
        <v-toolbar-title>
          <div class="d-flex mt-4">
            <v-select
              label="Selecionar a instituicao"
              outlined
              dense
              class="me-4 mt-2"
            >
            </v-select>
            <v-select
              v-model="search"
              :items="opcoes"
              label="Filtrar pelo Estado"
              outlined
              dense
              class="mt-2"
            >
            </v-select>
          </div>
        </v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-spacer></v-spacer>
      </v-toolbar>-->
      </template>
    </v-data-table>
  </v-card>
</template>
<script>
import readXlsxFile from "read-excel-file";
import { mapGetters, mapActions } from "vuex";
import AddCandidate from "./AddCandidate.vue";
export default {
  components: { AddCandidate },
  data: () => ({
    avalcs: [],
    disabled: true,
    try: { text: "Maputo", value: 3 },
    opcoes: [
      { text: "Todos", value: -1 },
      { text: "Excluido", value: "Excluido" },
      { text: "Reprovado Na 1.a fase", value: "Reprovado Na 1.a fase" },
    ],
    user: null,
    geral: [],
    search: "",
    idPauta: null,
    schoolsname: null,
    opcoespauta: [
      { text: "Geral", value: -1 },
      { text: "Excluidos", value: "Reprovado" },
      { text: "Admitidos", value: "Aprovado" },
    ],
    opcoescurso: [
      { text: "Todos", value: -1 },
      { text: "12.a + 1", value: 1 },
      { text: "12.a + 2", value: 2 },
    ],
    districtsname: null,
    dialog: false,
    dialogDelete: false,
    headers: [
      { text: "Codigo", value: "codigo", width: "auto", sortable: false },
      {
        text: "Nome",
        sortable: false,
        value: "nome",
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
      {
        text: "Media",
        value: "media",
        width: "auto",
        sortable: false,
      },
      {
        text: "Estado",
        value: "status",
        width: "auto",
        sortable: false,
      },
    ],
    editedIndex: -1,
    editedItem: {},
    defaultItem: {},
  }),

  watch: {
    dialog(val) {
      val || this.close();
    },
    dialogDelete(val) {
      val || this.closeDelete();
    },
  },
  computed: {
    ...mapGetters([
      "pauta",
      //Selecionar os getters necessarios para este modulo
      "candidate",
      "candidates",
      "provinces",
      "schools",
      "district",
      "jurys",
    ]),
  },
  methods: {
    ...mapActions([
      "getPauta",
      //Selecionar as actions necessarias para este modulo
      "getSchools",
      "getProvinces",
      "getDistricToSchools",
      "editCandidate",
      "addCandidate",
      "addCandidates",
      "getCandidatesBySchool",
      "getDistricts",
    ]),
    initialize() {},
    getColor(status) {
      let x = status.includes("Aprovado") ? "green" : "red";
      return x;
    },
    filterProvinces() {
      return this.provinces.map((province) => {
        return { text: province.name, value: province.id };
      });
    },
    filterDistricts(idProvince) {
      let index = this.provinces.findIndex((p) => {
        return idProvince == p.id;
      });

      this.districtsname = this.provinces[index].districts.map((district) => {
        return { text: district.name, value: district.id };
      });
    },
    filterSchools(idDistrict) {
      console.log(this.district);
      let index = this.district.findIndex((d) => {
        return idDistrict == d.id;
      });
      this.schoolsname = this.district[index].schools.map((s) => {
        return { text: s.name, value: s.id };
      });
    },
    filterCourses(idSchool) {
      this.getPauta(idSchool);
      console.log("idSchool " + idSchool);
    },
    filterByCourse(courseId) {
      this.disabled = false;
      console.log(courseId);
      if (courseId == -1) {
        this.avalcs = [... this.pauta.masculino, ...this.pauta.femenino]
        console.log(this.avalcs)
      } else {
        let a = [... this.pauta.masculino, ...this.pauta.femenino]
        this.avalcs = a.filter((a) => {
          if (a.course_id == courseId) {
            return a;
          }
        });
      }
      this.geral = [... this.pauta.masculino, ...this.pauta.femenino];
      console.log(this.avalcs);
    },
    filterByState(stateId) {
      if (stateId != -1) {
        console.log(stateId);
        this.avalcs = this.geral.filter((a) => {
          if (a.status == stateId) {
            return a;
          }
        });
      } else {
        this.avalcs = this.geral;
      }
    },
    exportToExcel() {
      import("@/Export2Excel").then((excel) => {
        const Header = [
          "Codigo",
          "Nome",
          "Portugues",
          "Matematica",
          "Entrevista",
          "Media",
          "Estado",
        ];
        const Field = [
          "codigo",
          "nome",
          "portugues",
          "matematica",
          "entrevista",
          "media",
          "status",
        ];

        const Data = this.FormatJSON(Field, this.avalcs);

        console.log("Data");
        console.log(Data);

        let course = null;
        console.log(this.avalcs[0].course_id);
        if (this.avalcs[0].course_id == 1) {
          course = "(12.a + 1)";
        } else if (this.avalcs[0].course_id == 2) {
          course = "(12.a + 3)";
        }

        excel.export_json_to_excel({
          header: Header, //Header Required
          data: Data, //Specific data Required
          filename: this.avalcs[0].school + course, //Optional
          autoWidth: true, //Optional
          bookType: "xlsx", //Optional
        });
      });
    },
    FormatJSON(FilterData, JsonData) {
      return JsonData.map((v) =>
        FilterData.map((j) => {
          return v[j];
        })
      );
    },
  },
  created() {
    this.user = JSON.parse(localStorage.getItem("user"));
    this.initialize();
  },
  mounted() {
    this.getDistricts();
    this.getProvinces();
    if (this.user.role=='escola') {
      this.getPauta(this.user.school_id);
    }
  },
};
</script>
<style>
</style>