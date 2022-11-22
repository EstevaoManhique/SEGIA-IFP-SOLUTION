<template>
  <v-list nav dense v-show="menus">
    <v-list-item v-for="(menu, index) in menus" :key="index">
      <v-list-item v-if="!menu.sub_menus.length" :to="{ name: menu.to }">
        <v-list-item-icon>
          <v-icon v-text="menu.icon"></v-icon>
        </v-list-item-icon>
        <v-list-content v-if="!menu.sub_menus.length">
          <v-list-item-title>
            {{ $t(menu.name) | upper }}
          </v-list-item-title>
        </v-list-content>
      </v-list-item>

      <v-list-group v-else>
        <template v-slot:activator>
          <v-list-item>
            <v-list-item-icon>
              <v-icon v-text="menu.icon"></v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title>{{ $t(menu.name) | upper }}</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>
        <v-list-item
          v-for="(sub_menu, index) in menu.sub_menus"
          :to="{ name: sub_menu.to }"
          :key="'sub' + index"
        >
          <v-list-item-icon>
            <v-icon v-text="sub_menu.icon"></v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>{{
              $t(sub_menu.name) | upper
            }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list-group>
    </v-list-item>
  </v-list>
</template>

<script>
import menus from '@/store/modules/menu/menu_12classe.json';
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
