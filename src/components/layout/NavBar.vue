<template>
  <v-navigation-drawer
    app
    v-model="drawer"
    dark
    class="darken-4"
    color="#c2202f"
  >
    <v-layout column align-center>
      <v-flex class="mt-5">
        <v-img
          alt="MozTop Logo"
          class="shrink mr-2"
          contain
          src="assets/img/logo.png"
          transition="scale-transition"
          width="140"
        />
      </v-flex>
    </v-layout>
    <v-divider></v-divider>
    <online-product />
    <q-menu />
    <!-- -->
  </v-navigation-drawer>
</template>

<script>
import { mapGetters } from 'vuex';
import QMenu from '@/components/layout/Menu.vue';
import OnlineProduct from '@/components/product/OnlineProduct.vue';

export default {
  name: 'NavBar',
  components: { QMenu, OnlineProduct },
  methods: {},
  computed: {
    ...mapGetters(['drawer']),
  },
};
</script>

<style></style>
