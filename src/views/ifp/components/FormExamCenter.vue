<template>
  <div class="col-md-4">
    <form
      class="form-horizontal"
      method="post"
      accept-charset="ISO-8859-1"
      action="SUZQU2VydmxldCNEQ0k=?"
    >
      <div class="panel panel-flat">
        <div class="panel-heading">
          <h6 class="panel-title text-bold text-uppercase">
            Adicionar Centro de Exame
          </h6>
          <div class="heading-elements">
            <ul class="icons-list">
              <li><a data-action="collapse"></a></li>
              <li><a data-action="reload"></a></li>
            </ul>
          </div>
        </div>

        <div class="panel-body">
          <div>
            <label class="text-bold text-uppercase">Provincia:</label>
            <v-select :items="items" label="Outlined style" outlined></v-select>
          </div>

          <div>
            <label class="text-bold text-uppercase">Distrito:</label>
            <v-select :items="items" label="Outlined style" outlined></v-select>
          </div>

          <div>
            <label class="text-bold text-uppercase">Escola:</label>
            <v-select :items="items" label="Outlined style" outlined></v-select>
          </div>

          <div class="text-right">
            <button
              type="submit"
              onclick="this.disabled = 'disabled'; this.form.submit();"
              class="btn bg-orange-600 text-uppercase text-bold"
            >
              Adicionar Centro
              <i class="icon-circle-right2 position-right"></i>
            </button>
          </div>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "FormExamCenter",
  components: {},
  data: () => ({}),

  computed: {
    ...mapGetters(["user"]),
  },
};
</script>
