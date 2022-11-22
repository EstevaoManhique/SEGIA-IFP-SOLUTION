<template>
  <v-footer dark padless fixed>
    <v-card class="flex text-center" flat tile color="primary">
      <v-card-text class="py-2 white--text text-center">
        Copyright © {{ new Date().getFullYear() }}
        <strong>MINEDH. SEGIA</strong> Todos Direitos Reservados.
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
