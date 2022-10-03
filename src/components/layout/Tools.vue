<template>
  <div class="d-flex align-content-end flex-wrap">
    <v-list-item link router :to="{ name: 'login' }">
      <v-list-item-icon>
        <v-icon>mdi-account</v-icon>
      </v-list-item-icon>
      <v-list-item-content>
        <v-list-item-title> Login</v-list-item-title>
      </v-list-item-content>
    </v-list-item>
  </div>
</template>

<script>
export default {
  name: "QTools",
};
</script>

<style></style>
