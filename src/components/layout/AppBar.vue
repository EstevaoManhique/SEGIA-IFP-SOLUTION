<template>
  <v-app-bar app color="#c2202f">
    <v-app-bar-nav-icon @click="setDrawer"></v-app-bar-nav-icon>

    <v-spacer></v-spacer>
    <social-media />
    <language-switcher />
    <q-account />
  </v-app-bar>
</template>

<script>
import { mapActions } from 'vuex';
import LanguageSwitcher from '@/components/layout/LanguageSwitcher.vue';
import SocialMedia from '@/components/layout/SocialMedia.vue';
import QAccount from '@/components/Account.vue';

export default {
  name: 'AppBar',
  components: { LanguageSwitcher, SocialMedia, QAccount },
  methods: {
    ...mapActions(['setDrawer']),
  },
};
</script>

<style></style>
