<template>
  <v-list three-line>
    <v-list-item v-for="(item, index) in links" :key="index">
      <v-btn class="mx-2" fab dark color="#c2202f">
        <v-icon>{{ item.icon }}</v-icon>
      </v-btn>
      <v-list-item-content>
        <v-list-item-title v-text="$t(item.title)"></v-list-item-title>
        <v-list-item-subtitle v-text="item.value"></v-list-item-subtitle>
      </v-list-item-content>
    </v-list-item>
  </v-list>
</template>

<script>
export default {
  name: 'MainContact',
  props: ['links'],
};
</script>

<style></style>
