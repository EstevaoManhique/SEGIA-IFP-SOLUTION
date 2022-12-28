<template>
  <v-app>
    <app-bar v-if="access"/>
    <!--  <nav-bar /> -->
    <v-main>
      <router-view />
    </v-main>
    <q-footer v-if="access"/>
  </v-app>
</template>

<script>
import AppBar from './components/layout/AppBar.vue';
import QFooter from './components/layout/Footer.vue'; /*
import NavBar from './components/layout/NavBar.vue'; */
import { mapGetters, mapActions } from 'vuex';
import { METHODS } from 'http';
export default {
  name: 'App',

  components: { AppBar, QFooter },

  data: () => ({}),
  created() {
    if (localStorage.getItem("authtoken") != null) {
      this.$router.push({ name: "login" }).catch(() => {});
    } else {
      this.$router.push({ name: "home" }).catch(() => {});
    }
  },

  computed: {
    ...mapGetters(["access"]),
  },
  mounted(){
    this.getAccess()
  },

  methods:{
    ...mapActions(['getAccess'])
  }
};
</script>