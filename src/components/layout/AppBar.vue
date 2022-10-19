<template>
  <v-app-bar app color="#c2202f">
    <v-app-bar-nav-icon
      @click="setDrawerDialog(!drawerDialog)"
    ></v-app-bar-nav-icon>

    <v-spacer></v-spacer>
    <social-media />
    <language-switcher />
    <q-account />
  </v-app-bar>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import LanguageSwitcher from './LanguageSwitcher.vue';
import SocialMedia from './SocialMedia.vue';
import QAccount from './Account.vue';

export default {
  name: 'AppBar',
  components: { LanguageSwitcher, SocialMedia, QAccount },
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
