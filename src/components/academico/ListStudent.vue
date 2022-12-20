<template>
  <v-data-table :headers="headers" :items="students" class="elevation-1">
    <template v-slot:item.actions="{ item }">
      <v-icon small class="mr-2" @click="editItem(item)"> mdi-pencil </v-icon>
      <v-icon small @click="deleteItem(item)"> mdi-delete </v-icon>
    </template>
    <templete v-slot:item.name="{ item }">
      <p color="primary">{{ item.person.name }}</p>
    </templete>
    <template v-slot:no-data>
      <v-btn color="primary" @click="initialize"> Reset </v-btn>
    </template>
  </v-data-table>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
export default {
  data: () => ({
    dialog: false,
    dialogDelete: false,
    headers: [
      {
        text: 'Nome',
        value: 'name',
      },
      { text: 'Provincia', value: 'person.province' },
      { text: 'Escola', value: 'school.name' },
      { text: 'Codigo', value: 'carbs' },
      { text: 'Condidato ID', value: 'cod' },
      { text: 'Turma', value: 'protein' },
      { text: 'Nome Completo', value: 'full_name' },
      { text: 'Genero', value: 'person.genre' },
      { text: 'Tipo de Documento', value: 'person.doc_type' },
      { text: 'Nr do Documento', value: 'person.BI_number' },
      { text: 'Grupo Científico', value: 'person.genre' },
      { text: 'Disciplina', value: 'person.genre' },
      { text: 'Actions', value: 'actions', sortable: false },
    ],
    desserts: [],
    editedIndex: -1,
    editedItem: {
      name: '',
      calories: 0,
      fat: 0,
      carbs: 0,
      protein: 0,
    },
    defaultItem: {
      name: '',
      calories: 0,
      fat: 0,
      carbs: 0,
      protein: 0,
    },
  }),

  computed: {
    ...mapGetters(['students']),
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
  mounted() {
    this.getStudents();
  },

  created() {
    this.initialize();
  },

  methods: {
    ...mapActions(['student', 'getStudents', 'updateStudent', 'removeStudent']),
    initialize() {
      this.desserts = [];
    },

    editItem(item) {
      this.editedIndex = this.desserts.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    deleteItem(item) {
      this.editedIndex = this.desserts.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },

    deleteItemConfirm() {
      this.desserts.splice(this.editedIndex, 1);
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
        Object.assign(this.desserts[this.editedIndex], this.editedItem);
      } else {
        this.desserts.push(this.editedItem);
      }
      this.close();
    },
  },
};
</script>

<style></style>
