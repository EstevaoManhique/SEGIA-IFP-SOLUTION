<template>
  <div>
    <v-alert shaped dark color="info">
      I'm a shaped alert with a border-radius at top-left, bottom-right
    </v-alert>
    <v-alert shaped outlined type="success">
      I'm a shaped alert with a outline option
    </v-alert>
    <v-alert shaped dense dark type="warning">
      I'm a shaped alert with a dense option option
    </v-alert>
    <v-alert shaped prominent type="error">
      I'm a shaped alert with a dense prominent option that Praesent blandit
      laoreet nibh. Praesent nonummy mi in odio. Phasellus tempus. Mauris turpis
      nunc, blandit et, volutpat molestie, porta ut, ligula. Duis leo.
    </v-alert>
    <v-alert
      v-model="alert"
      dismissible
      color="cyan"
      border="left"
      elevation="2"
      colored-border
      icon="mdi-twitter"
    >
      You've got <strong>5</strong> new updates on your timeline!.
    </v-alert>

    <div class="text-center">
      <v-btn v-if="!alert" dark @click="alert = true"> Reset Alert </v-btn>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      alert: true,
    };
  },
};
</script>

<style></style>
