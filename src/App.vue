<template>
  <v-app>
    <app-bar />
    <nav-bar />
    <v-main>
      <router-view />
    </v-main>
    <q-footer />
  </v-app>
</template>

<script>
import AppBar from './components/layout/AppBar.vue';
import QFooter from './components/layout/Footer.vue';
import NavBar from './components/layout/NavBar.vue';
export default {
  name: 'App',

  components: { AppBar, QFooter, NavBar },

  data: () => ({
    //
  }),
};
</script>
