<template>
  <v-container>
    <nav-bar :menu_types="5" />
    <v-container>
      <v-card>
        <v-data-table :headers="headers" :items="classes" class="elevation-1">
          <template v-slot:top>
            <v-toolbar flat>
              <v-toolbar-title>Classes</v-toolbar-title>
              <v-divider class="mx-4" inset vertical></v-divider>
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
                    Registar Nova Classe
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
                            label="Categoria Ensino"
                            dense
                            :items="optionsCategories"
                            filled
                            v-model="classe.category"
                          ></v-select>
                        </v-col>
                        <v-col cols="12">
                          <v-text-field
                            label="Cod"
                            placeholder="Cod"
                            filled
                            append-icon="mdi-asterisk red"
                            dense
                            v-model="classe.cod"
                          ></v-text-field>
                        </v-col>
                        <v-col cols="12">
                          <v-text-field
                            label="Descricao"
                            placeholder="Descricao"
                            filled
                            append-icon="mdi-asterisk red"
                            dense
                            v-model="classe.description"
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
          <template v-slot:item.category="{ item }">
            {{ '(' + item.category.cod + ') ' + item.category.description }}
          </template>
          <template v-slot:item.actions="{ item }">
            <v-icon small class="mr-2" @click="editItem(item)">
              mdi-pencil
            </v-icon>
            <v-icon small @click="deleteItem(item)"> mdi-delete </v-icon>
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
  name: 'HomeView',
  components: { NavBar },
  methods: {
    ...mapActions(['classes', 'addClasse', 'getClasses']),
    addClasses() {
      let xx = this.optionsCategories.findIndex(
        (n) => n == this.classe.category
      );
      this.classe.category_id = this.classCategories[xx].id;

      this.addClasse(this.classe);
    },
  },
  data: () => ({
    tabs: null,
    dialog: false,
    dialogDelete: false,

    headers: [
      { text: '#', value: 'id' },
      { text: 'Cod', value: 'cod' },
      { text: 'Descricao', value: 'description' },
      { text: 'Categoria Ensino', value: 'category' },
      { text: 'Opcoes', value: 'actions' },
    ],
    classCategories: [],
    optionsCategories: [],
    classe: {
      id: null,
      cod: null,
      description: null,
      category_id: null,
      category: null,
    },
  }),
  watch: {
    dialog(val) {
      val || this.close();
    },
    dialogDelete(val) {
      val || this.closeDelete();
    },
  },
  mounted() {
    this.getClasses();
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
    ...mapGetters(['classes']),
  },
};
</script>
