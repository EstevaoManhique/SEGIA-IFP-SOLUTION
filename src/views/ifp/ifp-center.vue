<template>
  <v-container>
    <nav-bar :menu_types="6" />
    <v-row>
      <!-- Main content -->
      <div class="content-wrapper">

        <toolbar-vue :descricao="descricao"/>
        <!-- User profile -->
        <div class="row">
            <form-exam-center/>
            <table-center/>
        </div>
        <!-- /row.2 -->
      </div>
      <!-- /main content -->
    </v-row>
  </v-container>
</template>

<script>
import toolbarVue from "@/views/ifp/components/ToolBar.vue";
import NavBar from "@/components/layout/NavBar.vue";
import FormExamCenter from "@/views/ifp/components/FormExamCenter.vue";
import TableCenter from "@/views/ifp/components/TableCenter.vue";

import { mapGetters } from "vuex";
export default {
  name: "HomeView",
  components: { NavBar, toolbarVue, FormExamCenter, TableCenter },
  data: () => ({
    descricao : null
  }),

  computed: {
    ...mapGetters(["user"]),
  },
  mounted(){
    this.descricao = "CENTROS DE EXAME"
  }
};
</script>