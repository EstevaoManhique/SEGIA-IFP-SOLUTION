<template>
  <v-row>
    <v-carousel height="200" cycle :interval="5000">
      <v-carousel-item v-for="(item, i) in items" :key="i">
        <v-card class="text-center">
          <v-img
            :src="item.img"
            class="white--text justify-center text-center"
            gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
            height="200"
          >
            <v-card-title v-text="item.name" class="text-center"></v-card-title>
          </v-img>
        </v-card>
      </v-carousel-item>
    </v-carousel>
  </v-row>
</template>

<script>
export default {
  name: 'QSlider',
  data() {
    return {
      items: [],
    };
  },
  async mounted() {
    const data = await this.$api.get('products');
    this.items = data.data
      .filter((product) => product.online === 1)
      .sort((product1, product2) => product1.name.localeCompare(product2.name));
  },
};
</script>

<style></style>
