<template>
  <v-data-table
    :headers="headers"
    :items="centers"
    sort-by="calories"
    class="elevation-1"
    :search="search"
    style="width: 57vw"
  >
    <template v-slot:top>
      <v-toolbar flat>
        <v-toolbar-title>Centros De Exame</v-toolbar-title>
        <v-toolbar-title>
          <div class="d-flex mt-8">
            <v-select
              @change="changeProv"
              v-model="provinceselected"
              :items="provincesName"
              label="Selecione a Provincia"
              outlined
              dense
              class="ms-5"
            >
            </v-select>
            <v-select
              v-model="search"
              @change="changeDist"
              :items="districtsName"
              label="Selecione o Distrito"
              outlined
              dense
              class="ms-5"
            ></v-select>
          </div>
        </v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-spacer></v-spacer>
        <v-dialog v-model="dialog" max-width="500px">
          <v-card>
            <v-card-title>
              <span class="text-h5">{{ formTitle }}</span>
            </v-card-title>
            <v-card-text>
              <v-container>
                <v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.name"
                      label="Dessert name"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.calories"
                      label="Calories"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.fat"
                      label="Fat (g)"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.carbs"
                      label="Carbs (g)"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.protein"
                      label="Protein (g)"
                    ></v-text-field>
                  </v-col>
                </v-col>
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
      <v-icon small @click="deleteItem(item)"> mdi-delete </v-icon>
    </template>
    <template v-slot:no-data>
      <v-btn colo r="primary" @click="initialize"> Listar Centros </v-btn>
    </template>
  </v-data-table>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
export default {
  props: ['schools'],
  data: () => ({
    provinceselected: null,
    search: '',
    districtsname: [],
    centers: null,
    dialog: false,
    dialogDelete: false,
    schoolsTable: [],
    headers: [
      {
        text: '#',
        align: 'start',
        sortable: false,
        value: 'id',
      },
      { text: 'Descricao', value: 'name' },
      { text: 'Abreviatura', value: 'abbreviation' },
      { text: 'Tipo', value: 'type' },
      { text: 'Distrito', value: 'district.name' },
      { text: 'Actions', value: 'actions', sortable: false },
    ],
    editedIndex: -1,
    editedItem: {
      abbreviation: null,
      cod: null,
      created_at: null,
      district: {},
      district_id: null,
      id: null,
      isCentro: null,
      name: null,
      type: null,
      updated_at: null,
    },
    defaultItem: {
      abbreviation: null,
      cod: null,
      created_at: null,
      district: {},
      district_id: null,
      id: null,
      isCentro: null,
      name: null,
      type: null,
      updated_at: null,
    },
  }),
  mounted() {
    this.getSchools();
    this.getDistricSchools();
    this.getProvinces();
  },
  computed: {
    ...mapGetters(['schools', 'provincesname', 'provinces', 'districtsname']),
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

  created() {
    this.initProvDist();
    this.initialize();
  },

  methods: {
    ...mapActions(['getSchools', 'updateSchool', 'getProvinces']),
    filterDistricts() {
      let province = this.provinces.filter(
        (province) => province.name == this.provinceselected
      )[0];
      this.districtsname = province.districts.map((d) => {
        return { value: d.id, text: d.name };
      });
    },
    filterSchools() {
      this.centers = this.schools.filter((school) => {
        school.isCentro == true;
      });
    },
    initialize() {
      this.centers = this.schools.filter((school) => {
        if (school.isCentro) return school;
      });
      console.log('Initialize');
      console.log(this.centers);
    },

    editItem(item) {
      this.editedIndex = this.schools.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    deleteItem(item) {
      this.editedIndex = this.centers.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },

    deleteItemConfirm() {
      this.centers.splice(this.editedIndex, 1);
      this.editedItem.isCentro = false;
      this.updateSchool(this.editedItem);
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
      if (this.editedIndex > -1) {
        Object.assign(this.schools[this.editedIndex], this.editedItem);
      } else {
        this.centers.push(this.editedItem);
      }
      this.close();
    },
  },
};
</script>
