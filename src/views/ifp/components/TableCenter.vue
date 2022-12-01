<template>
    <div class="col-md-8">
      <!-- Bordered panel body table -->
      <div class="panel panel-flat">
        <div class="panel-heading">
          <h6
            class="
              panel-title
              text-uppercase text-bold text-bold text-uppercase
            "
          >
            Listagem de Centros de Exame
            <span class="text-danger-600">[<!--=ano-->]</span>
          </h6>
          <div class="heading-elements">
            <ul class="icons-list">
              <li><a data-action="collapse"></a></li>
              <li><a data-action="reload"></a></li>
            </ul>
          </div>
        </div>

        <div class="panel-body">
          <table class="table datatable-responsive" width="100%">
            <thead>
              <tr>
                <th class="text-bold text-uppercase">#</th>
                <th class="text-bold text-uppercase">Centro</th>
                <th class="text-bold text-uppercase">Provincia</th>
                <th class="text-bold text-uppercase">Distrito</th>
                <th class="text-bold text-uppercase text-danger-600">
                  ---
                </th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="text-blue-700 text-bold"></td>
                <td class="text-bold"></td>
                <td></td>
                <td></td>

                <td>
                  <a
                    href="#"
                    data-toggle="modal"
                    data-target="#modal_rem_<!--=id-->"
                    data-popup="tooltip"
                    title="Remover registo"
                    ><i class="icon-cancel-circle2 text-danger-800"></i
                  ></a>

                  <!-- Danger modal -->
                  <div id="modal_rem_<!--=id-->" class="modal fade">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <button
                            type="button"
                            class="close"
                            data-dismiss="modal"
                          >
                            &times;
                          </button>
                          <h6 class="modal-title text-semibold">
                            Confirma a remoção do centro:
                            <b class="text-danger-600"><!--=nm--></b> ?
                          </h6>
                        </div>
                        <div class="modal-body text-center">
                          <h6 class="text-bold text-danger">
                            <i
                              class="icon-question6 text-danger"
                              style="font-size: 100px"
                            ></i>
                          </h6>
                        </div>

                        <div class="modal-footer">
                          <button
                            type="button"
                            class="btn text-bold text-uppercase btn-link"
                            data-dismiss="modal"
                          >
                            Cancelar
                          </button>

                          <a
                            href="SUZQU2VydmxldCNEQ0k=?<!--=actR-->"
                            class="
                              btn
                              text-bold text-uppercase
                              btn-danger
                            "
                            >Sim, confirmo !</a
                          >
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- /danger modal -->
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <!-- /bordered panel body table -->
    </div>
</template>

<script>
import { mapGetters } from 'vuex';
export default {
  name: 'TableCenter',
  components: { },
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
