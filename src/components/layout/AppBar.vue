<template>
  <v-app-bar app class="navbar navbar-inverse navbar-fixed-top" color="primary">
    <v-app-bar-nav-icon
      @click="setDrawerDialog(!drawerDialog)"
    ></v-app-bar-nav-icon>
    <div class="navbar-header">
      <h6 class="text-semibold class text-uppercase" style="margin-left: 2em">
        Sistema Electrónico de Gestão de Informação Académica
      </h6>
    </div>

    <v-spacer></v-spacer>

    <language-switcher />
    <q-account />
  </v-app-bar>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import LanguageSwitcher from './LanguageSwitcher.vue';
import QAccount from './Account.vue';

export default {
  name: 'AppBar',
  components: { LanguageSwitcher, QAccount },
  methods: {
    ...mapActions(['setDrawerDialog', 'createDrawerDialog']),
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
