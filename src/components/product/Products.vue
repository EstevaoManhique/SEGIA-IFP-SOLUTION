<template>
  <v-container>
    <v-card v-if="is_par(index)" justify="space-around">
      <v-row>
        <v-col sm="6">
          <router-link :to="{ name: 'service-item', params: { id: index } }">
            <v-card width="1500px">
              <v-img
                :src="card.img"
                class="white--text align-end"
                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                height="300px"
              >
                <v-card-title>
                  {{
                    $i18n.locale.toLowerCase() == 'en' ? card.name : card.nome
                  }}</v-card-title
                >
              </v-img>
            </v-card>
          </router-link>
        </v-col>
        <v-col sm="6">
          <v-card-title>
            {{
              $i18n.locale.toLowerCase() == 'en' ? card.name : card.nome
            }}</v-card-title
          >
          <v-card-text
            class="text--primary"
            v-text="
              $i18n.locale.toLowerCase() == 'en'
                ? card.description
                : card.descricao
            "
          >
          </v-card-text>
        </v-col>
      </v-row>
    </v-card>
    <v-card v-else justify="space-around">
      <v-row>
        <v-col sm="6">
          <v-card-title>
            {{
              $i18n.locale.toLowerCase() == 'en' ? card.name : card.nome
            }}</v-card-title
          >
          <v-card-text
            class="text--primary text-justify"
            v-text="
              $i18n.locale.toLowerCase() == 'en'
                ? card.description
                : card.descricao
            "
          >
          </v-card-text>
        </v-col>

        <v-col sm="6">
          <router-link :to="{ name: 'service-item', params: { id: index } }">
            <v-card width="1500px">
              <v-img
                :src="card.img"
                class="white--text align-end"
                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                height="300px"
              >
                <v-card-title>
                  {{
                    $i18n.locale.toLowerCase() == 'en' ? card.name : card.nome
                  }}</v-card-title
                >
              </v-img>
            </v-card>
          </router-link>
        </v-col>
      </v-row>
    </v-card>
  </v-container>
</template>

<script>
export default {
  name: 'QService',
  props: ['card', 'index'],
  methods: {
    is_par(i) {
      return i % 2 == 0;
    },
  },
};
</script>

<style></style>
