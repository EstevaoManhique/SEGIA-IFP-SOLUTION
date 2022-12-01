<template>
  <v-container>
    <nav-bar :menu_types="5" />
    <v-container> Homme </v-container>
  </v-container>
</template>

<script>
import NavBar from '@/components/layout/NavBar.vue';
import { mapGetters } from 'vuex';
export default {
  name: 'HomeView',
  components: { NavBar },
  data: () => ({
    classCategories: [],
    optionsCategories: [],
  }),
  mounted() {
    this.$api.get('class-category').then((data) => {
      this.classCategories = data.data;
    });
    this.optionsCategories = this.classCategoriess.map((n) => {
      return { label: n.description, id: n.id };
    });
  },

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
