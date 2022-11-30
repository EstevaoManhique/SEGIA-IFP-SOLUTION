<template>
  <v-container>
    <nav-bar :menu_types="5" />
    <v-container>
      <v-card>
        <v-toolbar flat>
          <v-app-bar-nav-icon></v-app-bar-nav-icon>

          <v-spacer></v-spacer>

          <v-btn icon>
            <v-icon>mdi-magnify</v-icon>
          </v-btn>

          <v-btn icon>
            <v-icon>mdi-dots-vertical</v-icon>
          </v-btn>

          <template v-slot:extension>
            <v-tabs v-model="tabs" fixed-tabs icons-and-text>
              <v-tabs-slider></v-tabs-slider>
              <v-tab href="#tab-01" class="primary--text">
                Novo Registo
                <v-icon>mdi-phone</v-icon>
              </v-tab>

              <v-tab href="#tab-02" class="primary--text">
                Listagem das Classes
                <v-icon>mdi-account-box</v-icon>
              </v-tab>
            </v-tabs>
          </template>
        </v-toolbar>

        <v-tabs-items v-model="tabs">
          <v-tab-item value="tab-01">
            <v-card flat> Novo Registo </v-card>
          </v-tab-item>
          <v-tab-item value="tab-02">
            <v-card flat> Listagem das Classes </v-card>
          </v-tab-item>
        </v-tabs-items>
      </v-card>
    </v-container>
  </v-container>
</template>

<script>
import NavBar from '@/components/layout/NavBar.vue';
import { mapGetters } from 'vuex';
export default {
  name: 'HomeView',
  components: { NavBar },
  data: () => ({
    tabs: null,
  }),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
