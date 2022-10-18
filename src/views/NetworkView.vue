<template>
  <v-container>
    <q-header :item="item" />
    <network-create />
    <all-network />
  </v-container>
</template>

<script>
import AllNetwork from '@/components/network/AllNetwork.vue';
import NetworkCreate from '@/components/network/NetworkCreate.vue';
import QHeader from '@/components/layout/Header.vue';
export default {
  name: 'NetworkView',
  data: () => ({
    dialog: false,
    item: {
      img: 'http://localhost:8001/assets/img/header/moz-top-01.jpeg',
    },
  }),

  components: { AllNetwork, NetworkCreate, QHeader },
};
</script>
