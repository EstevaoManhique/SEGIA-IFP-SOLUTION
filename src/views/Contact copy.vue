<template>
  <v-container>
    <q-header :item="item" />
    <v-row>
      <v-col sm="4">
        <google-maps :link="google_link" />
      </v-col>

      <!-- End Google Maps -->
      <v-col sm="4">
        <main-contact :links="links" />
      </v-col>
      <v-col sm="4">
        <form-contact />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import MainContact from '@/components/contact/MainContact.vue';
import FormContact from '@/components/contact/FormContact.vue';
import GoogleMaps from '@/components/layout/GoogleMaps.vue';
import QHeader from '@/components/layout/Header.vue';
export default {
  name: 'ContactView',
  components: { MainContact, FormContact, GoogleMaps, QHeader },
  data: () => ({
    google_link:
      'https://www.google.com/maps/d/embed?mid=1E1g5XvnXQpYZFJeBuWMYOPcRvnBOMEQ&ehbc=2E312F',
    links: [
      {
        title: 'title.address',
        icon: 'mdi-map-marker-outline',
        value: 'Av. Agostinho Neto, 1157 Av. Moçambique Maputo',
      },
      {
        title: 'title.email',
        icon: 'mdi-email-outline',
        value: 'info@example.com',
      },
      {
        title: 'title.phone',
        icon: 'mdi-phone',
        value: '+258 85 024 0174',
      },
    ],
    item: {
      img: 'http://localhost:8001/assets/img/header/contact.jpg',
    },
  }),
};
</script>
