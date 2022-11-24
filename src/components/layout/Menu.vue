<template>
  <v-list nav dense v-show="menus">
    <v-list-item v-for="(menu, index) in menus" :key="index" class="text-light">
      <v-list-item v-if="!menu.sub_menus.length" :to="{ name: menu.to }">
        <v-list-item-icon>
          <v-icon v-text="menu.icon"></v-icon>
        </v-list-item-icon>
        <v-list-content v-if="!menu.sub_menus.length">
          <v-list-item-title class="light--text">
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
              <v-list-item-title class="light--text">
                  {{$t(menu.name) | upper}}
              </v-list-item-title>
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
            <v-list-item-title class="light--text">
              {{$t(sub_menu.name) | upper}}
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list-group>
    </v-list-item>
  </v-list>
</template>

<script>
import menu_academico from '@/store/modules/menu/menu_academico.json';
import menu_12classe from '@/store/modules/menu/menu_12classe.json';
import menu_acesso from '@/store/modules/menu/menu_acesso.json';
import menu_extraordinario from '@/store/modules/menu/menu_extraudinario.json';

export default {
  name: 'QMenu',
  props: ['menu_type'],
  data() {
    return {
      menus: [],
      menu_academico,
      menu_12classe,
      menu_acesso,
      menu_extraordinario
    };
  },
  mounted() {
    if (this.menu_type)
      switch (this.menu_type) {
        case 1:
          this.menus = this.menu_academico;
          break;
        case 2:
          this.menus = this.menu_12classe;
          break;
        case 3:
          this.menus = this.menu_acesso;
          break;
        case 4:
          this.menus = this.menu_extraordinario;
          break;
        case 5:
          this.menus = this.menu_academico;
          break;
        default:
          this.menus = this.menu_academico;
          break;
      }
  },
};
</script>

<style></style>
