<template>
  <v-card class="mt-4 mb-4" v-if="card.id">
    <router-link :to="{ name: 'post-item', params: { id: card.id } }">
      <v-img
        :src="card.img"
        class="white--text align-end"
        gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
        height="200px"
      >
        <h2 v-text="card.title" class="text-center"></h2>
      </v-img>
    </router-link>
  </v-card>
</template>

<script>
export default {
  name: 'QOtherPost',
  props: ['card'],
};
</script>

<style></style>
