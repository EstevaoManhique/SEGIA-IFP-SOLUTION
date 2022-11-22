<template>
  <v-container>
    <v-row> HomeView ACESSOS </v-row>
  </v-container>
</template>

<script>
import { mapGetters } from 'vuex';
export default {
  name: 'HomeView',
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
