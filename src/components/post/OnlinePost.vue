<template>
  <v-container fluid>
    <div class="section-header">
      <span>{{ $t('title.recent_posts') }} </span>
      <h2>{{ $t('title.recent_posts') }}</h2>
    </div>
    <v-row dense>
      <v-col
        v-for="(card, index) in posts.slice(0, 4)"
        :key="index"
        class="col-12 col-sm-6 col-md-3"
      >
        <q-post :card="card" />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import QPost from '@/components/post/Post.vue';
export default {
  name: 'OnlinePost',
  components: { QPost },
  data: () => ({
    cards: [],
  }),
  methods: {
    ...mapActions(['fetchPosts']),
  },
  async mounted() {
    const data = await this.$api.get('posts');
    this.cards = data.data.slice(0, 3);
  },
  created() {
    this.fetchPosts();
  },
  computed: mapGetters(['posts']),
};
</script>

<style></style>
