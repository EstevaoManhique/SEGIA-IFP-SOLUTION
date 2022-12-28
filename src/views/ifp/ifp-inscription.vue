<template>
  <v-container>
    <nav-bar :menu_types = "6"/>
  <v-card>
    <v-toolbar
      dense
      elevation="0"
      height="10px"
    >
      <v-spacer></v-spacer>
      <template v-slot:extension>
        <v-tabs
          v-model="tab"
          align-with-title
        >
          <v-tabs-slider color="black"></v-tabs-slider>

          <v-tab
          >
            {{ 'novo candidato' }}
          </v-tab>
          <v-tab
          >
            {{ 'listar candidatos' }}
          </v-tab>
          <v-tab
          >
            {{ 'importar candidatos' }}
          </v-tab>
          <v-tab
          >
            {{ 'criacao de juris' }}
          </v-tab>
        </v-tabs>
      </template>
    </v-toolbar>

    <v-tabs-items v-model="tab">
      <v-tab-item
      >
        <v-card flat>
          <add-candidate/>
        </v-card>
      </v-tab-item>
      <v-tab-item
      >
        <v-card flat>
          <list-candidates/>
        </v-card>
      </v-tab-item>
      <v-tab-item
      >
        <v-card flat>
          <import-candidates/>
        </v-card>
      </v-tab-item>
      <v-tab-item
      >
        <v-card flat>
          <jury-distribution/>
        </v-card>
      </v-tab-item>
    </v-tabs-items>
  </v-card>
</v-container>
</template>
  
  <script>

import ImportCandidates from "@/views/ifp/components/ImportCandidates.vue";
import NavBar from "@/components/layout/NavBar.vue";
import AddCandidate from "@/views/ifp/components/AddCandidate.vue";
import ListCandidates from "@/views/ifp/components/Ifp-listcandidates.vue";
import JuryDistribution from "@/views/ifp/ifp-jury-distribution.vue";
import MenuUp from "@/views/ifp/components/MenuUp.vue";
import { mapGetters, mapActions } from "vuex";
export default {
  name: "HomeView",
  components: {ImportCandidates, NavBar, AddCandidate, MenuUp, ListCandidates,JuryDistribution},
  data () {
      return {
        tab: null,
        items: [
          'web', 'ifp-center', 'videos', 'images', 'news',
        ],
        text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      }
    },
    created() {
    
  },
  methods: {
    ...mapActions(['addCandidate','getCandidates']),
    changeStatus(user) {
      user.status = !user.status;
      this.updateUser(user);
    },
    deleteUser(user) {
      this.removeUser(user);
    },
  },
  mounted() {
    this.getCandidates();
  },

  computed: {
    ...mapGetters(["candidate","candidates"]),
  },
};
</script>