<template>
  <v-list dense nav color="grey darken-3">
    <v-list-item v-for="(product, index) in products" :key="index" link>
      <v-list-item-content>
        <v-list-item-title class="d-flex justify-space-between"
          >{{
            $i18n.locale.toLowerCase() == 'en' ? product.name : product.nome
          }}

          <span class="green--text">{{ product.price }} </span>
        </v-list-item-title>
      </v-list-item-content>
    </v-list-item>
  </v-list>
</template>

<script>
export default {
  name: 'OnlineProduct',
  data: () => ({
    products: [],
  }),
  async mounted() {
    const data = await this.$api.get('products');
    this.products = data.data
      .filter((product) => product.online === 1)
      .sort((product1, product2) => product1.name.localeCompare(product2.name));
  },
};
</script>

<style></style>
