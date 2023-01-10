<template>
  <v-navigation-drawer app v-model="drawerDialog" dark color="primary">
    <v-layout column align-center>
      <v-flex class="mt-5">
        <router-link :to="{ name: 'home' }">
          <v-img
            alt="MozTop Logo"
            class="shrink mr-2"
            src="http://localhost:8002/assets/img/logo/logo.png"
            transition="scale-transition"
            width="140"
          />
        </router-link>
      </v-flex>
    </v-layout>
    <v-divider></v-divider>

    <q-menu :menu_type="menu_types" :user="user"/>
    <!-- -->
  </v-navigation-drawer>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import QMenu from '@/components/layout/Menu.vue';

export default {
  name: 'NavBar',
  components: { QMenu },
  props: ['menu_types'],
  methods: {
    ...mapActions(['createDrawerDialog', 'setDrawerDialog']),
  },
  created() {
    this.createDrawerDialog();
    console.log("User NavBar")
    console.log(JSON.parse(localStorage.getItem("user")));
    this.initialize();
  },
  computed: {
    ...mapGetters(['drawerDialog']),
  },
};
</script>

<style></style>