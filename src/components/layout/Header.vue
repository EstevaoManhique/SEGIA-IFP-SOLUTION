<template>
  <v-card class="text-center mb-4" v-if="item">
    <v-img
      :src="item.img"
      class="white--text justify-center text-center align-center"
      gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
      height="200"
    >
      <h3 class="text-center">{{ $t($route.meta.display) }}</h3>
    </v-img>
  </v-card>
</template>

<script>
export default {
  name: 'QHeader',
  props: ['item'],
};
</script>

<style></style>
