<template>
  <!-- Toolbar -->
  <div class="navbar navbar-default navbar-component navbar-xs">
    <ul class="nav navbar-nav visible-xs-block">
      <li class="full-width text-center">
        <a data-toggle="collapse" data-target="#navbar-filter"
          ><i class="icon-menu7"></i
        ></a>
      </li>
    </ul>

    <div class="navbar-collapse collapse" id="navbar-filter">
      <ul class="nav navbar-nav element-active-orange-400">
        <li class="active">
          <a
            href="#settings"
            data-toggle="tab"
            class="text-bold text-uppercase"
            ><i class="icon-calendar2 position-left"></i> Periodos de
            Inscrição</a
          >
        </li>
      </ul>
    </div>
  </div>
  <!-- /toolbar -->
</template>

<script>
import { mapGetters } from 'vuex';
export default {
  name: 'ToolBar',
  components: {},
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
