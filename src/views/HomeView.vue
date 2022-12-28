<template>
  <v-container>
    {{ user }}
    <q-dashboard-main />
  </v-container>
</template>

<script>
import { mapGetters } from 'vuex';
import QDashboardMain from '@/components/dashboard/Main.vue';
export default {
  name: 'HomeView',
  components: { QDashboardMain },
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },

};
</script>
