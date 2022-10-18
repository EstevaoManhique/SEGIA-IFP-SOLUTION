<template>
  <v-container>
    <q-header :item="item" />
    <product-create />
    <v-row>
      <all-product />
    </v-row>
  </v-container>
</template>

<script>
import ProductCreate from '@/components/product/ProductCreate.vue';
import AllProduct from '@/components/product/AllProduct.vue';
import QHeader from '@/components/layout/Header.vue';
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
  },
  methods: {},
};
</script>
