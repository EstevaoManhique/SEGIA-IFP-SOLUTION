<template>
  <ul class="navbar-nav me-auto nav flex-column">
    <li class="nav-item">
      <span>Menu Principal</span>
      <i class="icon-menu" title="Menu Principal"></i>
    </li>
    <li
      class="nav-item"
      v-for="(menu, index) in menus"
      :key="index"
      :to="{ name: menu.to }"
    >
      <a class="nav-link">
        <i :class="menu.icon"></i>
        <span class="text-bold text-uppercase">
          {{ $t(menu.name) | upper }}
        </span>
      </a>
      <ul class="nav nav-group-sub" v-if="menu.sub_menus.length">
        <li
          class="nav-item"
          v-for="(submenu, index) in menu.sub_menus"
          :key="index"
          :to="{ name: submenu.to }"
        >
          <a class="nav-link">
            <i :class="submenu.icon"></i>
            <span class="text-bold text-uppercase">
              {{ $t(submenu.name) | upper }}
            </span>
          </a>
        </li>
      </ul>
    </li>
  </ul>
</template>

<script>
import menu_academico from '@/store/modules/menu/menu_academico.json';
import menu_12classe from '@/store/modules/menu/menu_12classe.json';
import menu_acesso from '@/store/modules/menu/menu_acesso.json';
export default {
  name: 'QMenu',
  props: ['menu_type'],
  data() {
    return {
      menus: [],
      menu_academico,
      menu_12classe,
      menu_acesso,
    };
  },
  mounted() {
    console.log(this.menu_type);
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
          this.menus = this.menu_academico;
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
