<template>
  <div>Logout</div>
</template>

<script>
import { mapActions } from "vuex";
export default {
  name: "QLogout",
  methods: {
    ...mapActions(["logout"]),
  },
  created() {
    this.logout();
    localStorage.removeItem("token");
    this.$router.push("/");
  },
  mounted() {
    this.$router.push("/");
  },
};
</script>

<style></style>
