<template>
  <ul class="nav navbar-nav navbar-right">
    <li class="dropdown dropdown-user">
      <a class="dropdown-toggle" data-toggle="dropdown">
        <img
          src="http://<%=ip%>:8081/suc/images/profile-pictures/<%=fotoPerfil%>"
          alt="<%=nome%>"
        />
        <span class="text-bold text-uppercase"> #User_Name# </span>
        <i class="caret"></i>
      </a>

      <ul class="dropdown-menu dropdown-menu-right">
        <li>
          <a href="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jdmVyLXBlcmZpbA=="
            ><i class="icon-user-plus"></i> Definições da Conta</a
          >
        </li>

        <li class="divider"></li>
        <li>
          <a href="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jbG9nb3V0I0RDSQ=="
            ><i class="icon-switch2"></i> Terminar Sessão</a
          >
        </li>
      </ul>
    </li>
  </ul>
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
