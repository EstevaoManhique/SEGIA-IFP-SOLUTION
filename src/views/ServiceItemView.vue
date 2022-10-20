<template>
  <v-container>
    <q-header :item="item" />
    <service-create />
    <all-services />
  </v-container>
</template>

<script>
import AllServices from '@/components/service/AllServices.vue';
import ServiceCreate from '@/components/service/ServiceCreate.vue';
import QHeader from '@/components/layout/Header.vue';
export default {
  name: 'ServiceItemView',
  data() {
    return {
      item: {
        img: 'http://localhost:8001/assets/img/header/moz-top-02.jpeg',
      },
    };
  },

  components: { AllServices, ServiceCreate, QHeader },
};
</script>
