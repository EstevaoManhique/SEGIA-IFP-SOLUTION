<template>
  <div>
    <v-card>
      <v-toolbar flat color="primary" dark>
        <v-toolbar-title>User Profile</v-toolbar-title>
      </v-toolbar>
      <v-tabs vertical>
        <v-tab>
          <v-icon left> mdi-account </v-icon>
          Option 1
        </v-tab>
        <v-tab>
          <v-icon left> mdi-lock </v-icon>
          Option 2
        </v-tab>
        <v-tab>
          <v-icon left> mdi-access-point </v-icon>
          Option 3
        </v-tab>

        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <p>
                Sed aliquam ultrices mauris. Donec posuere vulputate arcu. Morbi
                ac felis. Etiam feugiat lorem non metus. Sed a libero.
              </p>

              <p>
                Nam ipsum risus, rutrum vitae, vestibulum eu, molestie vel,
                lacus. Aenean tellus metus, bibendum sed, posuere ac, mattis
                non, nunc. Aliquam lobortis. Aliquam lobortis. Suspendisse non
                nisl sit amet velit hendrerit rutrum.
              </p>

              <p class="mb-0">
                Phasellus dolor. Fusce neque. Fusce fermentum odio nec arcu.
                Pellentesque libero tortor, tincidunt et, tincidunt eget, semper
                nec, quam. Phasellus blandit leo ut odio.
              </p>
            </v-card-text>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <p>
                Morbi nec metus. Suspendisse faucibus, nunc et pellentesque
                egestas, lacus ante convallis tellus, vitae iaculis lacus elit
                id tortor. Sed mollis, eros et ultrices tempus, mauris ipsum
                aliquam libero, non adipiscing dolor urna a orci. Curabitur
                ligula sapien, tincidunt non, euismod vitae, posuere imperdiet,
                leo. Nunc sed turpis.
              </p>

              <p>
                Suspendisse feugiat. Suspendisse faucibus, nunc et pellentesque
                egestas, lacus ante convallis tellus, vitae iaculis lacus elit
                id tortor. Proin viverra, ligula sit amet ultrices semper,
                ligula arcu tristique sapien, a accumsan nisi mauris ac eros. In
                hac habitasse platea dictumst. Fusce ac felis sit amet ligula
                pharetra condimentum.
              </p>

              <p>
                Sed consequat, leo eget bibendum sodales, augue velit cursus
                nunc, quis gravida magna mi a libero. Nam commodo suscipit quam.
                In consectetuer turpis ut velit. Sed cursus turpis vitae tortor.
                Aliquam eu nunc.
              </p>

              <p>
                Etiam ut purus mattis mauris sodales aliquam. Ut varius
                tincidunt libero. Aenean viverra rhoncus pede. Duis leo. Fusce
                fermentum odio nec arcu.
              </p>

              <p class="mb-0">
                Donec venenatis vulputate lorem. Aenean viverra rhoncus pede. In
                dui magna, posuere eget, vestibulum et, tempor auctor, justo.
                Fusce commodo aliquam arcu. Suspendisse enim turpis, dictum sed,
                iaculis a, condimentum nec, nisi.
              </p>
            </v-card-text>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <p>
                Fusce a quam. Phasellus nec sem in justo pellentesque facilisis.
                Nam eget dui. Proin viverra, ligula sit amet ultrices semper,
                ligula arcu tristique sapien, a accumsan nisi mauris ac eros. In
                dui magna, posuere eget, vestibulum et, tempor auctor, justo.
              </p>

              <p class="mb-0">
                Cras sagittis. Phasellus nec sem in justo pellentesque
                facilisis. Proin sapien ipsum, porta a, auctor quis, euismod ut,
                mi. Donec quam felis, ultricies nec, pellentesque eu, pretium
                quis, sem. Nam at tortor in tellus interdum sagittis.
              </p>
            </v-card-text>
          </v-card>
        </v-tab-item>
      </v-tabs>
    </v-card>
    <v-card>
      <v-toolbar color="deep-purple accent-4" dark flat>
        <v-app-bar-nav-icon></v-app-bar-nav-icon>

        <v-toolbar-title>Page title</v-toolbar-title>

        <v-spacer></v-spacer>

        <v-btn icon>
          <v-icon>mdi-magnify</v-icon>
        </v-btn>

        <v-btn icon>
          <v-icon>mdi-dots-vertical</v-icon>
        </v-btn>

        <template v-slot:extension>
          <v-tabs v-model="currentItem" fixed-tabs slider-color="white">
            <v-tab v-for="item in items" :key="item" :href="'#tab-' + item">
              {{ item }}
            </v-tab>

            <v-menu v-if="more.length" bottom left>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  text
                  class="align-self-center mr-4"
                  v-bind="attrs"
                  v-on="on"
                >
                  more
                  <v-icon right> mdi-menu-down </v-icon>
                </v-btn>
              </template>

              <v-list class="grey lighten-3">
                <v-list-item
                  v-for="item in more"
                  :key="item"
                  @click="addItem(item)"
                >
                  {{ item }}
                </v-list-item>
              </v-list>
            </v-menu>
          </v-tabs>
        </template>
      </v-toolbar>

      <v-tabs-items v-model="currentItem">
        <v-tab-item
          v-for="item in items.concat(more)"
          :key="item"
          :value="'tab-' + item"
        >
          <v-card flat>
            <v-card-text>
              <h2>{{ item }}</h2>
              {{ text }}
            </v-card-text>
          </v-card>
        </v-tab-item>
      </v-tabs-items>
    </v-card>
  </div>
</template>

<script>
export default {
  data: () => ({
    currentItem: 'tab-Web',
    items: ['Web', 'Shopping', 'Videos', 'Images'],
    more: ['News', 'Maps', 'Books', 'Flights', 'Apps'],
    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  }),

  methods: {
    addItem(item) {
      const removed = this.items.splice(0, 1);
      this.items.push(...this.more.splice(this.more.indexOf(item), 1));
      this.more.push(...removed);
      this.$nextTick(() => {
        this.currentItem = 'tab-' + item;
      });
    },
  },
};
</script>

<style></style>
