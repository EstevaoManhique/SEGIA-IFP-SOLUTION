<template>
  <v-container fluid>
    <v-card class="mt-4">
      <v-toolbar flat color="primary" dark>
        <v-toolbar-title>{{ $t('title.our_network') }}</v-toolbar-title>
      </v-toolbar>
      <v-tabs vertical>
        <v-tab v-for="(card, index) in cards" :key="index">
          {{ card.name }}
        </v-tab>

        <v-tab-item v-for="(card, index) in cards" :key="index">
          <v-card flat class="mt-4">
            <v-row>
              <v-col sm="4">
                <v-img
                  :src="card.img"
                  class="white--text align-end"
                  gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                  height="200px"
                >
                  <v-card-title v-text="card.name"></v-card-title>
                </v-img>
              </v-col>
              <v-col sm="4">
                <main-contact :links="links" />
              </v-col>
              <v-col sm="4">
                <v-card-text>
                  <iframe
                    :src="
                      'https://www.google.com/maps/embed?pb=' +
                      card.geo_location
                    "
                    width="100%"
                    height="300"
                    style="border: 0"
                    allowfullscreen="true"
                    loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"
                  ></iframe>
                </v-card-text>
              </v-col>
            </v-row>
          </v-card>
        </v-tab-item>
      </v-tabs>
    </v-card>
  </v-container>
</template>

<script>
import MainContact from '@/components/contact/MainContact.vue';
export default {
  name: 'AllNetwork',
  data: () => ({
    cards: [],
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
  }),
  components: { MainContact },
  async mounted() {
    const data = await this.$api.get('shops');
    this.cards = data.data;
  },
};
</script>

<style></style>
