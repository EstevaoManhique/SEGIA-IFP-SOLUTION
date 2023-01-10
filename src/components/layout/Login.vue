<template>
  <v-card style="width: 500px" class="mt-15 mx-auto">
    <v-toolbar color="#000" cards dark flat>
      <v-card-title class="text-h6 font-weight-regular"> Login </v-card-title>
      <v-spacer></v-spacer>
    </v-toolbar>
    <v-form ref="form" class="pa-4 pt-6">
      <v-text-field
        v-model="user.email"
        :rules="[rules.required, rules.email]"
        filled
        color="deep-purple"
        counter="100"
        placeholder="Email"
        style="min-height: 96px"
        type="email"
      ></v-text-field>
      <v-text-field
        v-model="user.password"
        :rules="[rules.required, rules.length(8)]"
        filled
        color="deep-purple"
        counter="100"
        placeholder="Password"
        style="min-height: 96px"
        type="password"
      ></v-text-field>
    </v-form>
    <v-divider></v-divider>
    <v-card-actions>
      <v-btn text @click="$refs.form.reset()"> Clear </v-btn>
      <v-spacer></v-spacer>
      <v-btn
        class="white--text"
        color="#000"
        depressed
        @click="submit"
      >
        Submit
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
import { mapActions } from "vuex";
export default {
  name: "QLogin",
  data: () => ({
    exists:false,
    user: {
      name: "",
      email: "",
      password: "",
      admin: false,
      authenticated: false,
    },
    rules: {
      email: (v) => !!(v || "").match(/@/) || "Please enter a valid email",
      length: (len) => (v) =>
        (v || "").length >= len || `Invalid character length, required ${len}`,
      password: (v) =>
        !!(v || "").match(
          /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*(_|[^\w])).+$/
        ) ||
        "Password must contain an upper case letter, a numeric character, and a special character",
      required: (v) => !!v || "This field is required",
    },
  }),
  methods: {
    submit() {
      this.$http
        .post("login/", {
          email: this.user.email,
          password: this.user.password,
        })
        .then((response) => {
          if (response.status != 200) {
            return;
          }
          // console.log(response.data);
          let token = response.data.token;
          let user = response.data.user;
          //console.log(token);
          //console.log(user);
          //console.log(response);
          //this.$http.defaults.headers.common["Authorization"] = "Bearer " + token;
          localStorage.setItem("authtoken", token);
          localStorage.setItem("logged", true);
          // Put the object into storage
          localStorage.setItem("user", JSON.stringify(user));

          // Retrieve the object from storage
          var retrievedObject = localStorage.getItem("user");

          let a = JSON.parse(retrievedObject)
         
          //let decoded = jwt_decode(token);
          // console.log(token);
          //console.log(decoded);
          //this.$store.dispatch("setUser", { user: decoded });
          //this.$store.dispatch("setAccess", { token: token });
          this.setUser(user);
          this.setAccess(true);
          this.$router.push({ path: '/' }).catch(() => {});
        });
    },
    ...mapActions(["login", "setAccess", "setUser"]),
  },

  mounted() {
    this.getUser();
  },
};
</script>

<style></style>