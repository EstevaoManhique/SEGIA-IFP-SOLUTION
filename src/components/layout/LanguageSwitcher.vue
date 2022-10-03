<template>
  <div class="relative">
    <v-menu transition="scale-transition" origin="center center">
      <template v-slot:activator="{ on, attrs }">
        <v-list-item
          v-bind="attrs"
          v-on="on"
          color="#c2202f"
          class="rounded-pill"
        >
          <v-avatar size="40">
            <img
              :src="`/flag_${$i18n.locale}.png`"
              alt="flag"
              class="w-8 h-8"
            />
          </v-avatar>
          <span class="ml-2">{{ $i18n.locale.toUpperCase() }}</span>
        </v-list-item>
      </template>
      <v-list color="#c2202f">
        <v-list-item
          v-for="(lang, index) in langs"
          :key="index"
          link
          @click.prevent="setLocale(lang.locale)"
        >
          <v-list-item-content>
            <v-list-item-title>
              <v-avatar size="40">
                <img :src="lang.icon" alt="flag" class="w-8 h-8" />
              </v-avatar>
              {{ lang.title }}</v-list-item-title
            >
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-menu>
  </div>
</template>

<script>
import { mixin as clickaway } from 'vue-clickaway';

export default {
  mixins: [clickaway],
  data() {
    return {
      isVisible: false,
      focusedIndex: 0,
      langs: [
        {
          locale: 'pt',
          icon: '/flag_pt.png',
          title: 'Portuguese',
        },
        {
          locale: 'en',
          icon: '/flag_en.png',
          title: 'Engles',
        },
        {
          locale: 'fr',
          icon: '/flag_fr.png',
          title: 'French',
        },
      ],
    };
  },
  methods: {
    toggleVisibility() {
      this.isVisible = !this.isVisible;
    },
    hideDropdown() {
      this.isVisible = false;
      this.focusedIndex = 0;
    },
    startArrowKeys() {
      if (this.isVisible) {
        // this.$refs.account.focus()
        this.$refs.dropdown.children[0].children[0].focus();
      }
    },
    focusPrevious(isArrowKey) {
      this.focusedIndex = this.focusedIndex - 1;
      if (isArrowKey) {
        this.focusItem();
      }
    },
    focusNext(isArrowKey) {
      this.focusedIndex = this.focusedIndex + 1;
      if (isArrowKey) {
        this.focusItem();
      }
    },
    focusItem() {
      this.$refs.dropdown.children[this.focusedIndex].children[0].focus();
    },
    setLocale(locale) {
      this.$i18n.locale = locale;
      this.$router.push({
        params: { lang: locale },
      });
      this.hideDropdown();
    },
  },
};
</script>

<style scoped>
.dropdown-fade-enter-active,
.dropdown-fade-leave-active {
  transition: all 0.1s ease-in-out;
}
.dropdown-fade-enter,
.dropdown-fade-leave-to {
  opacity: 0;
  transform: translateY(-12px);
}
</style>
