<template>
  <v-container>
    <nav-bar :menu_types="6" />
    <v-row>
      <div class="content-wrapper">
        <toolbar-vue :descricao = "descricao"/>
        <wrap-time-inscription/>
        <data-table/>
      </div>
      <p></p>
    </v-row>
  </v-container>
</template>

<script>
import NavBar from "@/components/layout/NavBar.vue";
import { mapGetters } from "vuex";
import toolbarVue from "@/views/ifp/components/ToolBar.vue";
import WrapTimeInscription from "@/views/ifp/components/WrapTimeInscriptionIfpCalendar.vue";
import DataTable from "@/views/ifp/components/DataTableIfpCalendar.vue";

export default {
  name: "HomeView",
  components: { NavBar,toolbarVue, WrapTimeInscription, DataTable },
  data: () => ({
     descricao : null
  }),

  computed: {
    ...mapGetters(["calendar"]),
  },
  mounted(){
    this.descricao = "Periodos de Inscrição"
  }
};
</script>