<template>
  <v-list nav dense flat>
    <v-list-item v-for="(menu, index) in menus" :key="index" link>
      <router-link :to="{ name: menu.to }" v-if="!menu.sub_menus.length">
        {{ $t(menu.name) | upper }}
      </router-link>

      <v-list-group v-else>
        <template v-slot:activator>
          <v-list-item-content>
            <v-list-item-title>{{ $t(menu.name) | upper }}</v-list-item-title>
          </v-list-item-content>
        </template>

        <router-link
          v-for="(sub_menu, index) in menu.sub_menus"
          :to="{ name: sub_menu.to }"
          :key="'sub' + index"
        >
          {{ $t(sub_menu.name) | upper }}
        </router-link>
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
