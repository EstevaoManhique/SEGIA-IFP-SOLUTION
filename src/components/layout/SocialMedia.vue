<template>
  <v-btn-toggle v-model="toggle_exclusive" group>
    <v-btn v-for="(icon, index) in icons" :key="index" class="mx-4" dark icon>
      <v-icon size="24px">
        {{ icon }}
      </v-icon>
    </v-btn>
  </v-btn-toggle>
</template>

<script>
export default {
  name: 'SocialMedia',
  data() {
    return {
      toggle_exclusive: 2,
      icons: ['mdi-facebook', 'mdi-twitter', 'mdi-linkedin', 'mdi-instagram'],
    };
  },
};
</script>

<style></style>
