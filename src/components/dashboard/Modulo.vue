<template>
  <div class="panel">
    <div class="panel-body text-center">
      <div class="icon-object">
        <i :class="modulo.icon"></i>
      </div>
      <h6 class="text-bold text-uppercase">{{ modulo.name }}</h6>
      <span class="btn text-bold text-uppercase btn-labeled btn-rounded">
        <router-link :to="{ name: modulo.router }">
          <b><i :class="modulo.icon"></i></b> Aceder ao módulo
        </router-link>
      </span>
    </div>
  </div>
</template>

<script>
export default {
  props: ['modulo'],
};
</script>

<style></style>