<template>
  <v-stepper v-model="e6" vertical>
    <v-stepper-step :complete="e6 > 1" step="1">
      {{ $t('title.upload_img') }}
    </v-stepper-step>

    <v-stepper-content step="1">
      <v-card color="grey lighten-1" class="mb-12" height="200px"></v-card>
      <v-btn color="primary" @click="e6 = 2"> Continue </v-btn>
      <v-btn text> Cancel </v-btn>
    </v-stepper-content>

    <v-stepper-step :complete="e6 > 2" step="2">
      {{ $t('title.pt_register') }}
    </v-stepper-step>

    <v-stepper-content step="2">
      <v-card color="grey lighten-1" class="mb-12" height="200px"></v-card>
      <v-btn color="primary" @click="e6 = 3"> Continue </v-btn>
      <v-btn text> Cancel </v-btn>
    </v-stepper-content>

    <v-stepper-step :complete="e6 > 3" step="3">
      {{ $t('title.en_register') }}
    </v-stepper-step>

    <v-stepper-content step="3">
      <v-card color="grey lighten-1" class="mb-12" height="200px"></v-card>
      <v-btn color="primary" @click="e6 = 1"> Continue </v-btn>
      <v-btn text> Cancel </v-btn>
    </v-stepper-content>
  </v-stepper>
  <!--  <v-stepper v-model="e1" vertical>
    <v-stepper-step :complete="e1 > 1" step="1">
      {{ $t('title.upload_img') }}
    </v-stepper-step>
    <v-stepper-content step="1">
      <v-card class="mb-12" color="grey lighten-1" height="200px"></v-card>

      <v-btn color="primary" @click="e1 = 2"> Continue </v-btn>

      <v-btn text> Cancel </v-btn>
    </v-stepper-content>

    <v-stepper-step :complete="e1 > 2" step="2">
      {{ $t('title.pt_register') }}
    </v-stepper-step>
    <v-stepper-content step="2">
      <v-card class="mb-12" color="grey lighten-1" height="200px"></v-card>

      <v-btn color="primary" @click="e1 = 3"> Continue </v-btn>

      <v-btn text> Cancel </v-btn>
    </v-stepper-content>

    <v-stepper-step step="3"> {{ $t('title.en_register') }} </v-stepper-step>
    <v-stepper-content step="3">
      <v-card class="mb-12" color="grey lighten-1" height="200px"></v-card>

      <v-btn color="primary" @click="e1 = 1"> Continue </v-btn>

      <v-btn text> Cancel </v-btn>
    </v-stepper-content>
  </v-stepper> -->
</template>

<script>
export default {
  data() {
    return {
      e6: 1,
    };
  },
};
</script>

<style></style>
