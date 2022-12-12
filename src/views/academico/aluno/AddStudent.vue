<template>
  <v-container>
    <nav-bar :menu_types="1" />
    <v-row class="navbar navbar-default navbar-component navbar-xs">
      <ul class="nav navbar-nav visible-xs-block">
        <li class="full-width text-center">
          <a data-toggle="collapse" data-target="#navbar-filter"
            ><i class="icon-menu7"></i
          ></a>
        </li>
      </ul>

      <div class="navbar-collapse collapse" id="navbar-filter">
        <ul class="nav navbar-nav element-active-slate-400">
          <li class="active">
            <a
              href="#settings"
              data-toggle="tab"
              class="text-bold text-uppercase"
              ><i class="icon-profile position-left"></i> Gestão de
              estudantes</a
            >
          </li>
        </ul>
      </div>
    </v-row>
    <v-card>
      <v-tabs v-model="tab" centered icons-and-text>
        <v-tabs-slider></v-tabs-slider>

        <v-tab href="#tab-1"> Registar Aluno </v-tab>

        <v-tab href="#tab-2"> Listagem de Alunos </v-tab>

        <v-tab href="#tab-3"> Importar Alunos </v-tab>
      </v-tabs>

      <v-tabs-items v-model="tab">
        <v-tab-item :key="1" :value="'tab-1'">
          <v-card flat>
            <add-student-form />
          </v-card>
        </v-tab-item>
        <v-tab-item :key="2" :value="'tab-2'">
          <v-card flat>
            <list-student />
          </v-card>
        </v-tab-item>
        <v-tab-item :key="3" :value="'tab-3'">
          <v-card flat> </v-card>
        </v-tab-item>
      </v-tabs-items>
    </v-card>
  </v-container>
</template>

<script>
import NavBar from '@/components/layout/NavBar.vue';
import AddStudentForm from '@/components/academico/AddStudentForm.vue';
import ListStudent from '@/components/academico/ListStudent.vue';
import { mapGetters } from 'vuex';
export default {
  name: 'AddStudent',
  components: { NavBar, AddStudentForm, ListStudent },
  data() {
    return {
      tab: null,
    };
  },

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
