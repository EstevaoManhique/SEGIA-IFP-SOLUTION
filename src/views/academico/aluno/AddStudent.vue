<template>
  <v-container>
    <nav-bar :menu_types="1" />

    <v-container>
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
      <v-row>
        <add-student-form />
      </v-row>
    </v-container>
  </v-container>
</template>

<script>
import NavBar from '@/components/layout/NavBar.vue';
import AddStudentForm from '@/components/academico/AddStudentForm.vue';
import { mapGetters } from 'vuex';
export default {
  name: 'AddStudent',
  components: { NavBar, AddStudentForm },
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
