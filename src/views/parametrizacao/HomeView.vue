<template>
  <v-container>
    <v-row> HomeView parametrizacao</v-row>
  </v-container>
</template>

<script>
import { mapGetters } from 'vuex';
export default {
  name: 'HomeView',
  components: {},
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
