<template>
  <v-card class="mt-4 mb-4" v-if="card.id">
    <router-link :to="{ name: 'post-item', params: { id: card.id } }">
      <v-img
        :src="card.img"
        class="white--text align-end"
        gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
        height="200px"
      >
        <h2
          v-text="$i18n.locale.toLowerCase() == 'en' ? card.title : card.titulo"
          class="text-center"
        ></h2>
      </v-img>
    </router-link>
    <v-card-text class="text--secondary">{{
      card.created_at | date_with_week
    }}</v-card-text>
    <v-divider></v-divider>
    <v-card-text
      class="text--primary"
      v-text="$i18n.locale.toLowerCase() == 'en' ? card.content : card.conteudo"
    >
    </v-card-text>

    <v-card-actions>
      <v-btn icon>
        <v-icon>mdi-heart</v-icon>
      </v-btn>
      <v-btn icon>
        <v-icon>mdi-bookmark</v-icon>
      </v-btn>
      <v-btn icon>
        <v-icon>mdi-share-variant</v-icon>
      </v-btn>
      <v-btn icon @click="editPost(card.id)" v-if="user && user.admin">
        <v-icon>mdi-pencil</v-icon>
      </v-btn>
      <v-btn
        icon
        color="danger"
        @click="removePost(card.id)"
        v-if="user && user.admin"
      >
        <v-icon>mdi-trash-can</v-icon>
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
export default {
  name: 'QPost',
  props: ['card', 'is_read'],
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

  computed: mapGetters(['user']),
};
</script>

<style></style>
