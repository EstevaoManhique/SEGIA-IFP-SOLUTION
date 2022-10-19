<template>
  <v-container fluid>
    <div class="section-header">
      <span>{{ $t('title.our_posts') }} </span>
      <h2>{{ $t('title.our_posts') }}</h2>
    </div>

    <v-row dense>
      <v-col
        v-for="(card, index) in posts"
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
  name: 'AllPost',
  components: { QPost },
  methods: {
    ...mapActions([
      'fetchPosts',
      'removePost',
      'setPostDialog',
      'setPost',
      'resetPost',
    ]),
    editPost(id) {
      this.resetPost();
      this.setPost(id);
      this.setPostDialog(true);
    },
  },
  created() {
    this.fetchPosts();
  },
  computed: mapGetters(['posts', 'user', 'post']),
};
</script>

<style></style>
