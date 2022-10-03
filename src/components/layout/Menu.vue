<template>
  <v-list nav dense flat>
    <v-list-item v-for="(menu, index) in menus" :key="index" link>
      <v-list-item-content v-if="!menu.sub_menus">
        <v-list-item-title>{{ $t(menu.name) | upper }}</v-list-item-title>
      </v-list-item-content>
      <v-list-group v-else>
        <template v-slot:activator>
          <v-list-item-content>
            <v-list-item-title>{{ $t(menu.name) | upper }}</v-list-item-title>
          </v-list-item-content>
        </template>

        <v-list-item
          v-for="(sub_menu, index) in menu.sub_menus"
          :key="'sub' + index"
          link
        >
          <v-list-item-title>{{ $t(sub_menu.name) | upper }}</v-list-item-title>
        </v-list-item>
      </v-list-group>
    </v-list-item>
  </v-list>
</template>

<script>
import menus from '@/store/modules/menu.json';
export default {
  name: 'QMenu',
  data() {
    return {
      menus,
    };
  },
};
</script>

<style></style>
