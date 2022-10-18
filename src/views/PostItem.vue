<template>
  <v-container>
    <v-row>
      <v-col class="col-12 col-sm-6">
        <q-post :card="post" :is_read="true" />
        <v-row>
          <v-col class="col-12 col-sm-6">
            <q-post :card="navigation.previous"
          /></v-col>
          <v-col class="col-12 col-sm-6">
            <q-post :card="navigation.next" />
          </v-col>
        </v-row>
      </v-col>
      <v-col class="col-12 col-sm-6">
        <v-row>
          <v-col
            class="col-12 col-sm-6"
            v-for="(item, index) in related"
            :key="index"
          >
            <q-post :card="item" />
          </v-col>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import QPost from '@/components/post/Post.vue';
//import QOtherPost from '@/components/post/OtherPost.vue';
export default {
  name: 'PostItem',
  components: { QPost },
  data() {
    return {
      posts: [],
      post: null,
      postR: [],
    };
  },
  watch: {
    /* 'item.Title': function () {
      this.changeTitle();
    }, */
  },
  computed: {
    item: function () {
      return (
        this.posts.find((post) => {
          return post.id === this.$route.params.id;
        }) || {}
      );
    },
    related: function () {
      let items =
        this.posts.filter((post) => {
          return ![
            this.post.id,
            this.navigation.next.id,
            this.navigation.previous.id,
          ].includes(post.id);
        }) || [];

      return items.sort(() => 0.5 - Math.random()).slice(0, 8);
    },
    navigation: function () {
      let prev = this.posts.find((post) => {
        return (
          new Date(post.created_at) < new Date(this.post.created_at) &&
          post.id !== this.post.id
        );
      }) || { id: null };

      let reversed = this.posts.slice();

      let next = reversed.reverse().find((post) => {
        return (
          new Date(post.created_at).getTime() >
            new Date(this.post.created_at).getTime() && post.id !== this.post.id
        );
      }) || { id: null };

      return {
        previous: prev,
        next: next,
      };
    },
  },
  methods: {
    changeTitle() {
      document.title = this.post.title;
      this.$route.meta.display_title = this.$options.filters.excerpt_shorter(
        this.post.title
      );
    },
  },
  async mounted() {
    const data = await this.$api.get('posts');
    this.posts = data.data;
    this.post = this.posts.find((post) => post.id == this.$route.params.id);
    //this.posts = this.posts.find((post) => post.id != this.$route.params.id);
    this.changeTitle();
  },
};
</script>

<style scoped></style>
