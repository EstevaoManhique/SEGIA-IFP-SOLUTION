<template>
  <v-container>
    <nav-bar :menu_types="6" />
    <v-row>
      <div class="content-wrapper">
        <toolbar-vue/>
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
import WrapTimeInscription from "@/views/ifp/components/WrapTimeInscription.vue";
import DataTable from "@/views/ifp/components/DataTable.vue";

export default {
  name: "HomeView",
  components: { NavBar,toolbarVue, WrapTimeInscription, DataTable },
  data: () => ({
     
  }),

  computed: {
    ...mapGetters(["calendar"]),
  },
};
</script>