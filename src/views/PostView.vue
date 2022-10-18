<template>
  <v-container>
    <q-header :item="item" />
    <post-create />
    <v-row>
      <all-post />
    </v-row>
  </v-container>
</template>

<script>
import PostCreate from '@/components/post/PostCreate.vue';
import AllPost from '@/components/post/AllPost.vue';
import QHeader from '@/components/layout/Header.vue';
export default {
  name: 'PostView',
  data: () => ({
    dialog: false,
    item: {
      img: 'http://localhost:8001/assets/img/header/moz-top-01.jpeg',
    },
  }),

  components: {
    PostCreate,
    AllPost,
    QHeader,
  },
  methods: {},
};
</script>
