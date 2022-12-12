<template>
  <v-container>
    <nav-bar :menu_types="6" />
    <v-row>
      <!-- Main content -->
      <div class="content-wrapper">
        <!-- Toolbar -->
        <div class="navbar navbar-default navbar-component navbar-xs">
        </div>
        <!-- /toolbar -->

        <div class="row">
          <div class="col-md-10 col-md-offset-1">
            <!-- Vertical form options -->
            <div class="content-group tab-content-bordered navbar-component">
              <menu-up/>

              <div class="tab-content">
                <div class="tab-pane fade active in has-padding" id="tab-demo1">
                  <!-- 2 columns form -->
                  <add-candidate />
                </div>
                <!-- /2 columns form -->
              </div>
            </div>
          </div>
          <!-- /vertical form options -->
        </div>
      </div>
      <!-- /main content -->
    </v-row>
  </v-container>
</template>
  
  <script>
import NavBar from "@/components/layout/NavBar.vue";
import AddCandidate from "@/views/ifp/components/AddCandidate.vue";
import MenuUp from "@/views/ifp/components/MenuUp.vue";
import { mapGetters, mapActions } from "vuex";
export default {
  name: "HomeView",
  components: { NavBar, AddCandidate, MenuUp},
  data: () => ({
    headers: [
      { text: "#", value: "id" },
      { text: "Denominação", value: "name" },
      { text: "Utilizador", value: "email" },
      { text: "Grupo", value: "group" },
      { text: "Contacto", value: "person.contact" },
      { text: "Província", value: "province" },
      { text: "Distrito", value: "district" },
      { text: "Escola", value: "escola" },
      { text: "Estado", value: "estado" },
      { text: "Opções", value: "actions" },
    ],
  }),
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