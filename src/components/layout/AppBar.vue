<template>
  <v-app-bar app color="#c2202f">
    <v-app-bar-nav-icon @click="setDrawer"></v-app-bar-nav-icon>
    <div class="d-flex align-center">
      <v-img
        alt="Vuetify Logo"
        class="shrink mr-2"
        contain
        src="https://cdn.vuetifyjs.com/images/logos/vuetify-logo-dark.png"
        transition="scale-transition"
        width="40"
      />

      <v-img
        alt="Vuetify Name"
        class="shrink mt-1 hidden-sm-and-down"
        contain
        min-width="100"
        src="https://cdn.vuetifyjs.com/images/logos/vuetify-name-dark.png"
        width="100"
      />
    </div>

    <v-spacer></v-spacer>
    <social-media />
    <language-switcher />
  </v-app-bar>
</template>

<script>
import { mapActions } from 'vuex';
import LanguageSwitcher from '@/components/layout/LanguageSwitcher.vue';
import SocialMedia from '@/components/layout/SocialMedia.vue';
export default {
  name: 'AppBar',
  components: { LanguageSwitcher, SocialMedia },
  methods: {
    ...mapActions(['setDrawer']),
  },
};
</script>

<style></style>
