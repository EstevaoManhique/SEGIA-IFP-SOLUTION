<template>
  <v-card class="col-sm-8 mx-auto">
    <v-toolbar color="deep-purple accent-4" cards dark flat>
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
        label="Email"
        style="min-height: 96px"
        type="email"
      ></v-text-field>
      <v-text-field
        v-model="user.password"
        :rules="[rules.required, rules.length(8)]"
        filled
        color="deep-purple"
        counter="100"
        label="Password"
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
        color="deep-purple accent-4"
        depressed
        @click="submit"
      >
        Submit
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
import { mapActions } from 'vuex';
export default {
  name: 'QLogin',
  data: () => ({
    user: {
      name: '',
      email: '',
      password: '',
      admin: false,
      authenticated: false,
    },
    rules: {
      email: (v) => !!(v || '').match(/@/) || 'Please enter a valid email',
      length: (len) => (v) =>
        (v || '').length >= len || `Invalid character length, required ${len}`,
      password: (v) =>
        !!(v || '').match(
          /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*(_|[^\w])).+$/
        ) ||
        'Password must contain an upper case letter, a numeric character, and a special character',
      required: (v) => !!v || 'This field is required',
    },
  }),
  methods: {
    ...mapActions(['login']),
    submit() {
      this.login(this.user);
      this.$router.push('/');
    },
  },
};
</script>

<style></style>