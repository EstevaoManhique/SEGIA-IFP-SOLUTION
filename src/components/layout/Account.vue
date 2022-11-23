<template>
  <div>
    <v-menu offset-y v-if="user">
      <template v-slot:activator="{ on, attrs }">
        <v-btn icon dark v-bind="attrs" v-on="on">
          <v-icon large color="green darken-2"
            >mdi-account-circle-outline
          </v-icon>
        </v-btn>
      </template>
      <v-list dense>
        <v-list-item>
          <v-list-item-title>{{
            $t('title.wellcome', [user.name])
          }}</v-list-item-title>
        </v-list-item>
        <v-divider></v-divider>

        <v-list-item router :to="{ name: 'user-perfil' }">
          <v-list-item-icon>
            <v-icon>mdi-cog</v-icon>
          </v-list-item-icon>
          <v-list-item-title>{{ $t('title.setting') }}</v-list-item-title>
        </v-list-item>
        <v-list-item router :to="{ name: 'logout' }">
          <v-list-item-icon>
            <v-btn icon>
              <v-icon>mdi-power</v-icon>
            </v-btn>
          </v-list-item-icon>
          <v-list-item-title>{{ $t('title.logout') }}</v-list-item-title>
        </v-list-item>
      </v-list>
    </v-menu>
    <v-list-item router :to="{ name: 'login' }" v-else>
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
import { mapGetters, mapActions } from 'vuex';
export default {
  name: 'QAccount',
  methods: {
    ...mapActions(['logout', 'getUser']),
    logout() {
      this.logout();
      localStorage.removeItem('token');
      this.$router.push('/');
    },
  },
  mounted() {
    this.getUser();
  },
  computed: {
    ...mapGetters(['user']),
  },
};
</script>

<style></style>
