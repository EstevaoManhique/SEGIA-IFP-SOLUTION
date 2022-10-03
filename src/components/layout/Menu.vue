<template>
  <v-list>
    <v-list-item v-for="(menu, index) in menus" :key="index" link>
      <v-list-item-content v-if="!menu.sub_menu">
        <v-list-item-title>{{ menu.title }}</v-list-item-title>
      </v-list-item-content>
      <v-list-group v-else>
        <template v-slot:activator>
          <v-list-item-content>
            <v-list-item-title>{{ menu.title }}</v-list-item-title>
          </v-list-item-content>
        </template>

        <v-list-item
          v-for="(sub_menu, index) in menu.sub_menu"
          :key="'sub' + index"
          link
        >
          <v-list-item-title>{{ sub_menu.title }}</v-list-item-title>
        </v-list-item>
      </v-list-group>
    </v-list-item>
  </v-list>
</template>

<script>
export default {
  name: 'QMenu',
  data() {
    return {
      menus: [
        { title: 'A', sub_menu: [] },
        {
          title: 'B',
          sub_menu: [
            { title: 'B', sub_menu: [] },
            { title: 'C', sub_menu: [] },
          ],
        },
        { title: 'C', sub_menu: [] },
      ],
    };
  },
};
</script>

<style></style>
