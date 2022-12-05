<template>
  <v-container>
    <nav-bar :menu_types="5" />
    <v-container>
      <v-card>
        <v-data-table :headers="headers" :items="classes" class="elevation-1">
          <template v-slot:top>
            <v-toolbar flat>
              <v-toolbar-title>Classe</v-toolbar-title>
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
                    Registar Classe
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
    headers: [
      { text: '#', value: 'id' },
      { text: 'Cod', value: 'cod' },
      { text: 'Descricao', value: 'description' },
      { text: 'Categoria Ensino', value: 'category' },
      { text: 'Opcoes', value: 'actions', sortable: false },
    ],
    desserts: [],
    editedIndex: -1,
    editedItem: {
      id: null,
      cod: null,
      description: null,
      category_id: null,
      category: null,
    },
    classe: {
      id: null,
      cod: null,
      description: null,
      category_id: null,
      category: null,
    },
    defaultItem: {
      id: null,
      cod: null,
      description: null,
      category_id: null,
      category: null,
    },
    classCategories: [],
    optionsCategories: [],
  }),

  computed: {
    ...mapGetters(['classes']),

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
    this.initialize();
  },

  methods: {
    ...mapActions(['classes', 'addClasse', 'getClasses', 'updateClasse']),
    editItem(item) {
      this.editedIndex = this.classes.indexOf(item);
      this.classe = Object.assign({}, item);
      this.classe.category =
        '(' + item.category.cod + ') ' + item.category.description;
      this.dialog = true;
    },

    deleteItem(item) {
      this.editedIndex = this.desserts.indexOf(item);
      this.classe = Object.assign({}, item);
      this.dialogDelete = true;
    },

    deleteItemConfirm() {
      this.desserts.splice(this.editedIndex, 1);
      this.closeDelete();
    },

    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.classe = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.classe = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    save() {
      let xx = this.optionsCategories.findIndex(
        (n) => n == this.classe.category
      );
      this.classe.category_id = this.classCategories[xx].id;
      if (this.classe.id == null) {
        this.addClasse(this.classe);
      } else {
        this.updateClasse(this.classe);
      }
      this.close();
    },
  },

  mounted() {
    this.getClasses();
    this.$api.get('category').then((data) => {
      this.classCategories = data.data.sort((a, b) =>
        a.description.localeCompare(b.description)
      );
      this.optionsCategories = this.classCategories.map((n) => {
        return '(' + n.cod + ') ' + n.description;
      });
    });
  },
};
</script>
