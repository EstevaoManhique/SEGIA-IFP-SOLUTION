<template>
  <v-container fluid>
    <v-row class="mt-4"> {{ $t('title.recent_posts') }} </v-row>
    <v-row dense>
      <v-col
        v-for="(card, index) in cards"
        :key="index"
        class="col-sm-6 col-md-4"
      >
        <q-post :card="card" />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import QPost from '@/components/post/Post.vue';
export default {
  name: 'OnlinePost',
  components: { QPost },
  data: () => ({
    cards: [],
  }),
  async mounted() {
    const data = await this.$api.get('posts');
    this.cards = data.data.slice(0, 3);
  },
};
</script>

<style></style>
