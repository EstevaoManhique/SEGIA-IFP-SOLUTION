<template>
  <v-container fluid>
    <div class="section-header">
      <span>{{ $t('title.our_service') }} </span>
      <h2>{{ $t('title.our_service') }}</h2>
    </div>
    <v-row dense v-for="(service, index) in services" :key="index">
      <q-service :card="service" :index="index" />
    </v-row>
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import QService from '@/components/service/Service.vue';
export default {
  name: 'AllServices',

  components: { QService },
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
