<template>
  <v-container>
    <q-header :item="item" />

    <div>
      <v-expansion-panels v-model="panel" multiple>
        <what-we-do />
        <q-history />
        <where-we-operate />
      </v-expansion-panels>
    </div>

    <div class="container mx-auto px-8 lg:px-48">
      <h2 class="text-3xl font-bold">{{ $t('about.title') }}</h2>

      <p class="mt-4" v-html="$t('about.content')" />
    </div>
  </v-container>
</template>

<script>
import QHistory from '@/components/about_us/History.vue';
import WhatWeDo from '@/components/about_us/WhatWeDo.vue';
import WhereWeOperate from '@/components/about_us/WhereWeOperate.vue';
import QHeader from '@/components/layout/Header.vue';

export default {
  name: 'AbaoutView',
  components: { QHistory, WhatWeDo, WhereWeOperate, QHeader },
  data: () => ({
    dialog: false,
    item: {
      img: 'http://localhost:8001/assets/img/header/moz-top-01.jpeg',
    },
    panel: [0, 1, 2],
  }),
};
</script>
