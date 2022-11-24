<template>
  <v-container>
    <nav-bar :menu_types="1" />
    <v-container>
      <school-dashboard></school-dashboard>
    </v-container>
  </v-container>
</template>

<script>
import NavBar from '@/components/layout/NavBar.vue';
import SchoolDashboard from './root/school-dashboard.vue';
import { mapGetters } from 'vuex';
export default {
  name: 'HomeView',
  components: { NavBar, SchoolDashboard },
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
