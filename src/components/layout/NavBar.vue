<template>
  <v-navigation-drawer
    app
    v-model="drawerDialog"
    dark
    class="darken-4"
    color="#c2202f"
  >
    <v-layout column align-center>
      <v-flex class="mt-5">
        <router-link :to="{ name: 'home' }">
          <v-img
            alt="MozTop Logo"
            class="shrink mr-2"
            src="http://localhost:8001/assets/img/logo/logo.png"
            transition="scale-transition"
            width="140"
          />
        </router-link>
      </v-flex>
    </v-layout>
    <v-divider></v-divider>
    <online-product />
    <q-menu />
    <!-- -->
  </v-navigation-drawer>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import QMenu from '@/components/layout/Menu.vue';
import OnlineProduct from '@/components/product/OnlineProduct.vue';

export default {
  name: 'NavBar',
  components: { QMenu, OnlineProduct },
  methods: {
    ...mapActions(['createDrawerDialog', 'setDrawerDialog']),
  },
  created() {
    this.createDrawerDialog();
  },
  computed: {
    ...mapGetters(['drawerDialog']),
  },
};
</script>

<style></style>
