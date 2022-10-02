<template>
  <!-- App.vue -->

  <v-app>
    <v-navigation-drawer app>
      <!-- -->
    </v-navigation-drawer>

    <v-app-bar app>
      <v-rating
        background-color="grey"
        color="green"
        empty-icon="$mdiStarOutline"
        full-icon="$mdiStar"
        half-icon="$mdiStarHalfFull"
        half-increments
        hover
        length="5"
        size="47"
        value="2.5"
      ></v-rating>
      <div class="text-center">
        <v-pagination v-model="page" :length="4" circle></v-pagination>
      </div>
      <v-img
        lazy-src="https://picsum.photos/id/11/10/6"
        max-height="150"
        max-width="250"
        src="https://picsum.photos/id/11/500/300"
      ></v-img>
      <v-row justify="space-around">
        <v-icon large color="green darken-2"> mdi-domain </v-icon>

        <v-icon large color="blue darken-2"> mdi-message-text </v-icon>

        <v-icon large color="purple darken-2"> mdi-dialpad </v-icon>

        <v-icon large color="teal darken-2"> mdi-email </v-icon>

        <v-icon large color="blue-grey darken-2"> mdi-call-split </v-icon>

        <v-icon large color="orange darken-2">
          mdi-arrow-up-bold-box-outline
        </v-icon>
      </v-row>
      <v-row align="center" justify="center">
        <v-icon>{{ icons.mdiAccount }}</v-icon>
        <div class="mx-2"></div>
        <v-icon>{{ icons.mdiPencil }}</v-icon>
        <div class="mx-2"></div>
        <v-icon>{{ icons.mdiShareVariant }}</v-icon>
        <div class="mx-2"></div>
        <v-btn color="primary" depressed>
          <v-icon left>
            {{ icons.mdiDelete }}
          </v-icon>
          Delete
        </v-btn>
      </v-row>
      <!-- -->
    </v-app-bar>

    <!-- Sizes your content based upon application components -->
    <v-main>
      <!-- Provides the application the proper gutter -->
      <v-container fluid>
        <!-- If using vue-router -->
        <router-view></router-view>
      </v-container>
    </v-main>

    <v-footer app>
      <!-- -->
    </v-footer>
  </v-app>
</template>

<script>
import { mdiAccount, mdiPencil, mdiShareVariant, mdiDelete } from '@mdi/js';

export default {
  data() {
    return {
      page: 1,
      icons: {
        mdiAccount,
        mdiPencil,
        mdiShareVariant,
        mdiDelete,
      },
    };
  },
};
</script>

<style></style>
