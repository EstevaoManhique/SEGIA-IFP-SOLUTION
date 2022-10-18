<template>
  <v-list nav dense>
    <v-list-item v-for="(menu, index) in menus" :key="index">
      <v-list-item :to="{ name: menu.to }" v-if="!menu.sub_menus.length">
        {{ $t(menu.name) | upper }}
      </v-list-item>

      <v-list-group v-else>
        <template v-slot:activator>
          <v-list-item>
            {{ $t(menu.name) | upper }}
          </v-list-item>
        </template>
        <v-list-item
          v-for="(sub_menu, index) in menu.sub_menus"
          :to="{ name: sub_menu.to }"
          :key="'sub' + index"
        >
          {{ $t(sub_menu.name) | upper }}
        </v-list-item>
      </v-list-group>
    </v-list-item>
  </v-list>
  <!--   <v-list>
      <v-list-item>
        <v-list-item-icon>
          <v-icon>mdi-home</v-icon>
        </v-list-item-icon>

        <v-list-item-title>Home</v-list-item-title>
      </v-list-item>

      <v-list-group
        :value="true"
        prepend-icon="mdi-account-circle"
      >
        <template v-slot:activator>
          <v-list-item-title>Users</v-list-item-title>
        </template>

        <v-list-group
          :value="true"
          no-action
          sub-group
        >
          <template v-slot:activator>
            <v-list-item-content>
              <v-list-item-title>Admin</v-list-item-title>
            </v-list-item-content>
          </template>

          <v-list-item
            v-for="([title, icon], i) in admins"
            :key="i"
            link
          >
            <v-list-item-title v-text="title"></v-list-item-title>

            <v-list-item-icon>
              <v-icon v-text="icon"></v-icon>
            </v-list-item-icon>
          </v-list-item>
        </v-list-group>

        <v-list-group
          no-action
          sub-group
        >
          <template v-slot:activator>
            <v-list-item-content>
              <v-list-item-title>Actions</v-list-item-title>
            </v-list-item-content>
          </template>

          <v-list-item
            v-for="([title, icon], i) in cruds"
            :key="i"
            link
          >
            <v-list-item-title v-text="title"></v-list-item-title>

            <v-list-item-icon>
              <v-icon v-text="icon"></v-icon>
            </v-list-item-icon>
          </v-list-item>
        </v-list-group>
      </v-list-group>
    </v-list> -->
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
