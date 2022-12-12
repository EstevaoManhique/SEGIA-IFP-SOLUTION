<template>
  <v-container>
    <nav-bar :menu_types="5" />
    <v-container>
      <v-card>
        <v-data-table :headers="headers" :items="schools" class="elevation-1">
          <template v-slot:top>
            <v-toolbar flat>
              <v-toolbar-title>Escola</v-toolbar-title>
              <v-divider class="mx-4" inset vertical></v-divider>
              <v-spacer></v-spacer>
              <v-row>
                <v-col cols="12" sm="6" md="6">
                  <v-select
                    label="Provincia"
                    dense
                    :items="prov"
                    @change="changeProv"
                    mandatory
                    v-model="filter_prov"
                  ></v-select>
                </v-col>
                <v-col cols="12" sm="6" md="6">
                  <v-select
                    label="Distrito"
                    dense
                    :items="dist"
                    @change="changeDist"
                    mandatory
                    v-model="filter_dist"
                  ></v-select>
                </v-col>
              </v-row>
              <v-spacer></v-spacer>
              <v-dialog v-model="dialog" max-width="500px">
                <template v-slot:activator="{ on, attrs }">
                  <v-btn
                    color="primary"
                    dark
                    class="mb-2"
                    v-bind="attrs"
                    v-on="on"
                  >
                    Registar Escola
                  </v-btn>
                </template>
                <v-card>
                  <v-card-title>
                    <span class="text-h5">{{ formTitle }}</span>
                  </v-card-title>

                  <v-card-text>
                    <v-container>
                      <v-row>
                        <v-col cols="12">
                          <v-select
                            label="Provincia"
                            dense
                            :items="prov"
                            @change="changeProv"
                            filled
                            append-icon="mdi-asterisk red"
                            mandatory
                            v-model="school.province"
                          ></v-select>
                        </v-col>
                        <v-col cols="12">
                          <v-select
                            label="Distrito"
                            dense
                            :items="dist"
                            @change="changeDist"
                            filled
                            append-icon="mdi-asterisk red"
                            mandatory
                            v-model="school.district"
                          ></v-select>
                        </v-col>
                        <v-col cols="12">
                          <v-select
                            label="Tipo Ensino"
                            dense
                            :items="school_types"
                            filled
                            v-model="school.type"
                          ></v-select>
                        </v-col>
                        <v-col cols="12">
                          <v-select
                            label="Categoria Ensino"
                            dense
                            :items="optionsCategories"
                            filled
                            multiple
                            v-model="school.category"
                          ></v-select>
                        </v-col>
                        <v-col cols="12">
                          <v-text-field
                            label="Nome"
                            placeholder="Nome"
                            filled
                            append-icon="mdi-asterisk red"
                            dense
                            v-model="school.name"
                          ></v-text-field>
                        </v-col>
                        <v-col cols="12">
                          <v-text-field
                            label="Abreviatura"
                            placeholder="Abreviatura"
                            filled
                            append-icon="mdi-asterisk red"
                            dense
                            v-model="school.abbreviation"
                          ></v-text-field>
                        </v-col>
                      </v-row>
                    </v-container>
                  </v-card-text>

                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="blue darken-1" text @click="close">
                      Cancel
                    </v-btn>
                    <v-btn color="blue darken-1" text @click="save">
                      Save
                    </v-btn>
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
            <v-tooltip bottom>
              <template v-slot:activator="{ on, attrs }">
                <v-icon
                  class="mr-2"
                  color="blue darken-2"
                  v-bind="attrs"
                  v-on="on"
                  @click="editItem(item)"
                >
                  mdi-pencil
                </v-icon>
              </template>
              <span>Editar Classe</span>
            </v-tooltip>

            <v-tooltip bottom>
              <template v-slot:activator="{ on, attrs }">
                <v-icon
                  class="mr-2"
                  color="warning"
                  v-bind="attrs"
                  v-on="on"
                  @click="deleteItem(item)"
                >
                  mdi-delete
                </v-icon>
              </template>
              <span>Remover Classe</span>
            </v-tooltip>
          </template>
          <template v-slot:no-data>
            <v-btn color="primary" @click="initialize"> Reset </v-btn>
          </template>
        </v-data-table>
      </v-card>
    </v-container>
  </v-container>
</template>

<script>
import NavBar from '@/components/layout/NavBar.vue';
import { mapGetters, mapActions } from 'vuex';
export default {
  name: 'ClasseView',
  components: { NavBar },
  data: () => ({
    dialog: false,
    dialogDelete: false,

    filter_dist: '',
    filter_prov: '',
    filter_district_name: '',
    provinces: [],
    districts: [],
    prov: [],
    dist: [],
    filter_id: '',

    editedIndex: -1,
    editedItem: {
      id: null,
      cod: null,
      province: null,
      district: null,
      district_id: null,
      description: null,
      category_id: null,
      category: null,
      type: null,
    },
    school: {
      id: null,
      cod: null,
      province: null,
      district: null,
      district_id: null,
      description: null,
      category_id: null,
      category: null,
      type: null,
    },
    defaultItem: {
      id: null,
      cod: null,
      province: null,
      district: null,
      district_id: null,
      description: null,
      category_id: null,
      category: null,
      type: null,
    },
    school_types: ['Publica', 'Privada', 'Comunitaria'],
    classCategories: [],
    optionsCategories: [],
    schoolsTable: [],
  }),

  computed: {
    ...mapGetters(['schools']),

    formTitle() {
      return this.editedIndex === -1 ? 'New Item' : 'Edit Item';
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

  methods: {
    ...mapActions([
      'schools',
      'addSchool',
      'getSchools',
      'updateSchool',
      'removeSchool',
      'setSchools',
    ]),
    editItem(item) {
      this.editedIndex = this.schools.indexOf(item);
      let xx = this.provinces.findIndex(
        (n) => n.id == item.district.province_id
      );
      let prov = this.provinces[xx];
      this.districts = prov.districts;
      this.dist = this.districts.map((d) => {
        return d.name;
      });
      this.school = Object.assign({}, item);
      this.school.province = prov.name;
      this.school.district = item.district.name;
      this.dialog = true;
    },
    changeProv() {
      let prov = this.provinces.filter((n) => n.id === this.filter_prov);
      if (prov) {
        this.dist = prov[0].districts.map((d) => {
          return { text: d.name, value: d.id };
        });
      }
    },
    changeDist() {
      this.filter_district_name = this.dist.filter(
        (n) => n.id === this.filter_district
      )[0].text;
    },
    filterSchoolByDistrict(value) {
      if (!this.filter_district_name) {
        return true;
      }

      // Check if the current loop value (The calories value)
      // equals to the selected value at the <v-select>.
      return value.toLowerCase() == this.filter_district_name.toLowerCase();
    },

    deleteItem(item) {
      this.editedIndex = this.schools.indexOf(item);
      this.school = Object.assign({}, item);
      this.dialogDelete = true;
    },

    deleteItemConfirm() {
      this.removeSchool(this.school);
      this.schoolsTable = this.schoolsTable.filter(
        (school) => school.id != this.school.id
      );
      this.closeDelete();
    },

    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.school = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.school = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    save() {
      if (this.school.id == null) {
        this.addSchool(this.school);
      } else {
        this.updateSchool(this.school);

        let index = this.schoolsTable.findIndex((n) => n.id == this.school.id);
        //console.log(this.school);
        //  let schoolxx = this.schools.filter((n) => n.id == this.school.id)[0];

        ///this.schoolsTable[index] = this.school;
        Object.assign(
          this.schoolsTable[index],
          this.schools.filter((n) => n.id == this.school.id)[0]
        );
        //console.log(this.schoolsTable[index]);
        //     console.log(schoolxx);
        // let school = state.schools.filter((school) => school.id == payload.id)[0];
        //if (index > 0) Object.assign(this.schoolsTable[index], this.school);
      }
      this.close();
    },
  },

  mounted() {
    this.getSchools();
    this.$api.get('config/provinces').then((data) => {
      this.provinces = data.data.sort((a, b) => a.name.localeCompare(b.name));
      this.prov = this.provinces.map((prov) => {
        return { text: prov.name, value: prov.id };
      });
    });
    this.$api.get('class-category').then((data) => {
      this.classCategories = data.data.sort((a, b) =>
        a.description.localeCompare(b.description)
      );
      this.optionsCategories = this.classCategories.map((n) => {
        return '(' + n.cod + ') ' + n.description;
      });
    });
  },
  computed: {
    headers() {
      return [
        { text: '#', value: 'id' },
        { text: 'Escola', value: 'name' },
        { text: 'Abreviatura', value: 'abbreviation' },
        { text: 'Tipo Ensino', value: ' type' },
        {
          text: 'Distrito',
          value: 'district.name',
        },

        { text: 'Opcoes', value: 'actions', sortable: false },
      ];
    },
  },
};
</script>
