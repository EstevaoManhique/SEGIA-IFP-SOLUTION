<template>
  <v-container>
    <nav-bar :menu_types="5" />
    <v-container>
      <v-card>
        <v-toolbar flat>
          <v-app-bar-nav-icon></v-app-bar-nav-icon>

          <v-spacer></v-spacer>

          <v-btn icon>
            <v-icon>mdi-magnify</v-icon>
          </v-btn>

          <v-btn icon>
            <v-icon>mdi-dots-vertical</v-icon>
          </v-btn>

          <template v-slot:extension>
            <v-tabs v-model="tabs" fixed-tabs icons-and-text>
              <v-tabs-slider></v-tabs-slider>
              <v-tab href="#tab-01" class="primary--text">
                Novo Registo
                <v-icon>mdi-phone</v-icon>
              </v-tab>

              <v-tab href="#tab-02" class="primary--text">
                Listagem das Classes
                <v-icon>mdi-account-box</v-icon>
              </v-tab>
            </v-tabs>
          </template>
        </v-toolbar>

        <v-tabs-items v-model="tabs">
          <v-tab-item value="tab-01">
            <v-card flat class="mt-4">
              <v-form>
                <v-row>
                  <v-col cols="12" sm="6" md="4">
                    <v-select
                      label="Categoria Ensino"
                      dense
                      :items="optionsCategories"
                      filled
                      v-model="classe.category"
                    ></v-select>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      label="Cod"
                      placeholder="Cod"
                      filled
                      append-icon="mdi-asterisk red"
                      dense
                      v-model="classe.cod"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
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
                <v-row>
                  <v-btn @click="addClasses"> Adicionar Classe </v-btn>
                </v-row>
              </v-form>
            </v-card>
          </v-tab-item>
          <v-tab-item value="tab-02">
            <v-card flat class="mt-4">
              <v-data-table
                :headers="headers"
                :items="classes"
                class="elevation-1"
                calculate-widths="false"
              >
                <template v-slot:item.actions="{ item }">
                  <div class="btn-group">
                    <button
                      type="button"
                      class="btn bg-grey-600 btn-icon dropdown-toggle"
                      data-toggle="dropdown"
                    >
                      <i class="icon-menu7"></i> &nbsp;<span
                        class="caret"
                      ></span>
                    </button>

                    <ul
                      class="dropdown-menu dropdown-menu-right"
                      style="
                        width: 12em;
                        height: 3em;
                        line-height: 2em;
                        border: 1px solid #ccc;
                        padding: 0;
                        margin: 0;
                        overflow: scroll;
                        overflow-x: hidden;
                      "
                    >
                      <li>
                        <a
                          ><i class="icon-reload-alt text-blue-800"></i>
                          Redefinir senha</a
                        >
                      </li>
                      <li>
                        <a
                          ><i class="icon-reload-alt text-blue-800"></i>
                          Editar</a
                        >
                      </li>

                      <li v-if="item.status">
                        <a @click="changeStatus(item)"
                          ><i class="icon-user-block text-danger"></i>
                          Desactivar</a
                        >
                      </li>

                      <li v-else>
                        <a @click="changeStatus(item)"
                          ><i class="icon-user-check text-success"></i>
                          Activar</a
                        >
                      </li>

                      <li class="divider"></li>
                      <li>
                        <a
                          href="#"
                          data-toggle="modal"
                          @click="deleteUser(item)"
                          ><i class="icon-cancel-circle2 text-danger-800"></i
                          >Remover registo</a
                        >
                      </li>
                    </ul>
                  </div>
                </template>
                <template v-slot:item.category="{ item }">
                  {{
                    '(' + item.category.cod + ') ' + item.category.description
                  }}
                </template>
              </v-data-table>
            </v-card>
          </v-tab-item>
        </v-tabs-items>
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
      this.getId();
      console.log(this.classe);
      this.addClasse(this.classe);
    },
    getId() {
      let xx = this.optionsCategories.findIndex(
        (n) => n == this.classe.category
      );
      this.classe.category_id = this.classCategories[xx].id;
      console.log(this.classe.category_id);
    },
  },
  data: () => ({
    tabs: null,

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
