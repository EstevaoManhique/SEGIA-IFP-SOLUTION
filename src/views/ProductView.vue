<template>
  <v-container>
    <q-header :item="item" />
    <product-create />
    <v-row>
      <all-product />
    </v-row>
    <q-steeper />
  </v-container>
</template>

<script>
import ProductCreate from '@/components/product/ProductCreate.vue';
import AllProduct from '@/components/product/AllProduct.vue';
import QHeader from '@/components/layout/Header.vue';
import QSteeper from '@/components/vuetify/Steeper01.vue';
export default {
  name: 'ProductView',
  data: () => ({
    dialog: false,
    item: {
      img: 'http://localhost:8001/assets/img/header/moz-top-03.jpeg',
    },
  }),

  components: {
    ProductCreate,
    AllProduct,
    QHeader,
    QSteeper,
  },
  methods: {},
};
</script>
