<template>
  <v-footer dark padless fixed>
    <v-card class="flex text-center" flat tile color="#c2202f">
      <v-card-text class="py-2 white--text text-center">
        Copyright © {{ new Date().getFullYear() }}
        <strong>MozTop Energia</strong> Todos Direitos Reservados.
      </v-card-text>
    </v-card>
  </v-footer>
</template>

<script>
export default {
  name: 'QFooter',
};
</script>

<style></style>
