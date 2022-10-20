<template>
  <v-container fluid>
    <v-card-title>{{ $t('title.our_service') }}</v-card-title>
    <v-list shaped>
      <v-list-item
        v-for="(service, index) in services"
        :key="index"
        color="red"
      >
        <v-list-item-icon>
          <v-avatar title>
            <v-img :src="service.img"></v-img>
          </v-avatar>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title
            v-text="
              $i18n.locale.toLowerCase() == 'en' ? service.name : service.nome
            "
          ></v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-list>
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
export default {
  neme: 'QOurNetwork',
  methods: {
    ...mapActions([
      'fetchServices',
      'removeService',
      'setService',
      'resetService',
    ]),
    editService(id) {
      this.resetService();
      this.setService(id);
    },
  },
  created() {
    this.fetchServices();
  },
  computed: mapGetters(['services', 'user']),
};
</script>

<style></style>
