<template>
  <v-container fluid>
    <v-row class="mt-4"> {{ $t('title.our_service') }} </v-row>
    <v-row dense>
      <v-col v-for="(service, index) in services" :key="index" sm="6" md="6">
        <a>
          <v-card>
            <v-img
              :src="service.img"
              class="white--text align-end"
              gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
              height="200px"
            >
              <v-card-title v-text="service.name"></v-card-title>
            </v-img>
            <v-card-text class="text--primary" v-text="service.description">
            </v-card-text>

            <v-card-actions>
              <v-card-text class="text--secondary">{{
                service.created_at | date_with_week
              }}</v-card-text>
              <v-spacer></v-spacer>
              <v-btn icon>
                <v-icon>mdi-heart</v-icon>
              </v-btn>
              <v-btn icon>
                <v-icon>mdi-bookmark</v-icon>
              </v-btn>
              <v-btn icon>
                <v-icon>mdi-share-variant</v-icon>
              </v-btn>
            </v-card-actions>
          </v-card>
        </a>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: 'AllServices',
  data: () => ({
    services: [],
  }),
  async mounted() {
    const data = await this.$api.get('services');
    this.services = data.data;
  },
};
</script>

<style></style>
