<template>
  <div>
    <div
    class="navbar navbar-inverse bg-slate-800"
    style="position: relative; z-index: 99"
  >
    <div class="navbar-header">
      <h6
        class="text-semibold class text-uppercase"
        style="margin-left: 2em"
      >
        Formulário de Inscrição (Instituto de Formação de Professores)
      </h6>

      <ul class="nav navbar-nav pull-right visible-xs-block">
        <li>
          <a data-toggle="collapse" data-target="#demo1"
            ><i class="icon-tree5"></i
          ></a>
        </li>
      </ul>
    </div>

    <div class="navbar-collapse collapse" id="demo1">
      <ul class="nav navbar-nav">
        <v-list-item
          :to="'ifp-inscription'"
        >
          <a
            href="#tab-demo1"
            data-toggle="tab"
            class="text-bold text-uppercase"
          >
            <i class="icon-file-plus position-left"></i>
            NOVO REGISTO
          </a>
        </v-list-item>
        <v-list-item
          :to="'ifp-listcandidates'"
        >
          <a
            href="#tab-demo2"
            data-toggle="tab"
            class="text-bold text-uppercase"
            ><i class="icon-files-empty position-left"></i>
            LISTA DE INSCRICOES
            <span
              class="
                badge
                bg-danger-800
                badge-inline
                position-right
              "
              ></span
            >
          </a>
          </v-list-item>
      </ul>
    </div>
  </div>
  </div>
</template>

<script>
export default {
    name: "MenuSuperior",
}
</script>

<style>

</style>