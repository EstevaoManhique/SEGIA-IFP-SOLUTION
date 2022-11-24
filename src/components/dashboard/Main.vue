<template>
  <v-container>
    <v-row>
      <v-col
        class="col-12 col-sm-6 col-md-4"
        v-for="(modulo, index) in modulos"
        :key="index"
      >
        <q-modulo :modulo="modulo"
      />
  </v-col>
    </v-row>
  </v-container>
</template>

<script>
import qmodulos from '@/store/modules/modulos.json';
import QModulo from '@/components/dashboard/Modulo.vue';
export default {
  name: 'QDashboardMain',
  components: { QModulo },
  data() {
    return {
      modulos: qmodulos,
    };
  },
};
</script>

<style></style>
