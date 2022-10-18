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
              <v-col class="col-12 col-sm-6 col-md-6" sm="6">
                <v-img
                  :src="card.img"
                  class="white--text align-end"
                  gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                  height="200px"
                >
                  <v-card-title v-text="card.name"></v-card-title>
                </v-img>
              </v-col>
              <v-col class="col-12 col-sm-6 col-md-6" sm="6">
                <v-card-text
                  class="text--primary"
                  v-text="card.description"
                ></v-card-text>
              </v-col>
            </v-row>
          </v-card>
        </v-tab-item>
      </v-tabs>
    </v-card>
  </v-container>
</template>

<script>
export default {
  name: 'OurNetwork',
  data: () => ({
    cards: [],
  }),
  async mounted() {
    const data = await this.$api.get('shops');
    this.cards = data.data;
  },
};
</script>

<style></style>
