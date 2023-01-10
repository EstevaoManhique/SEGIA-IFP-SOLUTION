<template>
  <v-container>
    <nav-bar :menu_types="6" />
    <v-card>
      <v-toolbar dense elevation="0" height="10px">
        <v-spacer></v-spacer>
        <template v-slot:extension>
          <v-tabs v-model="tab" align-with-title>
            <v-tabs-slider color="black"></v-tabs-slider>

            <v-tab v-if="user.role=='superuser'">
              {{ "Guia de correcao" }}
            </v-tab>
            <v-tab>
              {{ "Carregar Respostas" }}
            </v-tab>
            <v-tab>
              {{ "Avaliacoes Corrigidas(pauta 1)" }}
            </v-tab>
            <v-tab>
              {{ "Pauta Final" }}
            </v-tab>
          </v-tabs>
        </template>
      </v-toolbar>

      <v-tabs-items v-model="tab">
        <v-tab-item v-if="user.role=='superuser'">
          <v-card flat >
            <folha-resposta />
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card flat>
            <import-answers />
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card flat>
            <list-Avaliacoes />
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card flat>
            <pauta-final />
          </v-card>
        </v-tab-item>
      </v-tabs-items>
    </v-card>
  </v-container>
</template>
    
    <script>
import ImportAnswers from "@/views/ifp/components/ImportAnswers.vue";
import NavBar from "@/components/layout/NavBar.vue";
import FolhaResposta from "@/views/ifp/ifp-inscription-validate.vue";
import ListAvaliacoes from "@/views/ifp/components/Ifp-listavaliacoes.vue";
import PautaFinal from "@/views/ifp/components/pauta-final.vue";
import JuryDistribution from "@/views/ifp/ifp-jury-distribution.vue";
import MenuUp from "@/views/ifp/components/MenuUp.vue";
import { mapGetters, mapActions } from "vuex";
export default {
  name: "HomeView",
  components: {
    ImportAnswers,
    NavBar,
    FolhaResposta,
    MenuUp,
    ListAvaliacoes,
    JuryDistribution,
    PautaFinal,
  },
  data() {
    return {
      tab: null,
      user:null,
      items: ["web", "ifp-center", "videos", "images", "news"],
      text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    };
  },
  created() {
    this.user = JSON.parse(localStorage.getItem("user"));
    console.log("IFP LIST 2")
    console.log(this.user)
    this.initialize();
  },
  methods: {
    ...mapActions(["addCandidate", "getCandidates"]),
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
    ...mapGetters(["candidate", "candidates"]),
  },
};
</script>