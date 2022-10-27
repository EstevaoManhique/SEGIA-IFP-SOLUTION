<template>
  <v-container>
    <v-row> HomeView </v-row>
    <online-post />
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
