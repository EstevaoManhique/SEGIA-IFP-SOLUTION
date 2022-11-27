<template>
  <v-container>
    <nav-bar :menu_types="3" />
    <v-row>
      <div class="content-wrapper">
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
            <ul class="nav navbar-nav element-active-slate-400">
              <li class="active">
                <a
                  href="#settings"
                  data-toggle="tab"
                  class="text-bold text-uppercase"
                  ><i class="icon-collaboration position-left"></i> Estado dos
                  utilizadores</a
                >
              </li>
            </ul>
          </div>
        </div>
        <!-- /toolbar -->

        <div class="col-md-7 col-md-offset-2">
          <!-- Basic responsive configuration -->
          <div class="panel panel-flat">
            <div class="panel-heading">
              <h6 class="panel-title text-bold text-uppercase">
                Estado dos utilizadores
              </h6>
              <div class="heading-elements">
                <ul class="icons-list">
                  <li><a data-action="collapse"></a></li>
                  <li><a data-action="reload"></a></li>
                </ul>
              </div>
            </div>

            <div class="panel-body">
              A lista de registos abaixo é composta pelo estado actual dos
              usuários dentro do sistema, clicando no icon
              <code
                ><b><i class="icon-user-minus text-danger"></i></b></code
              >,pode terminar a sessão do usuário.
              <br />
              <br />

              <form
                method="post"
                accept-charset="ISO-8859-1"
                action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jY29uZXhvZXM="
              >
                <button class="btn bg-success-800 bt-sm" type="submit">
                  <span class="icon-reload-alt"></span> Actualizar
                </button>
              </form>
            </div>

            <table class="table datatable-responsive">
              <thead>
                <tr>
                  <th class="text-bold text-uppercase">Usuário</th>
                  <th class="text-center">Último Login</th>
                  <th class="text-bold text-uppercase text-danger-400">
                    Opções
                  </th>
                </tr>
              </thead>
              <tbody>
                <!-- if (usuarios != null) { for (Usuario u : usuarios) { String
                ufoto = u.getUsuaFotoperfil(); String hor = "---"; if
                (u.getUsuDataUltimaVisita() != null) { hor =
                sdf.format(u.getUsuDataUltimaVisita().toGregorianCalendar().getTime());
                } String nm =
                encryptUtils.decodeString(u.getPessoapess().getPessNome()) + " "
                + encryptUtils.decodeString(u.getPessoapess().getPessApelido());
                int id = u.getUsuaId(); String lblStatus = "label-success";
                String status = u.getUsuaOnline(); if (status.equals("Offline"))
                { lblStatus = "label-danger"; } -->

                <tr>
                  <td>
                    <ul class="media-list">
                      <li class="media">
                        <div class="media-left media-middle">
                          <a href="#">
                            <img
                              src="http://<!--=ip-->:8081/suc/images/profile-pictures/<!--=ufoto-->"
                              class="img-circle"
                              alt="<!--=nm-->"
                            />
                          </a>
                        </div>

                        <div class="media-body">
                          <div class="media-heading text-semibold">
                            <!--=nm-->
                          </div>
                          <span class="label <!--=lblStatus-->"
                            ><!--=status--></span
                          >
                        </div>
                      </li>
                    </ul>
                  </td>
                  <td class="text-center" width="30%">
                    <a> <!--=hor--></a>
                  </td>

                  <td class="text-center">
                    <ul class="icons-list">
                      <!-- if (status.equals("Online")) { String actB =
                      encryptUtils.encodeString("accao#bloquear-sessao&id=" +
                      id); -->
                      <li>
                        <a href="VXN1YXJpb1NlcnZsZXQjRENJ?<!--=actB-->"
                          ><i class="icon-user-minus text-danger"></i
                        ></a>
                      </li>
                      <!-- } else { -->
                      <li>
                        <a href="#"><i class="icon-minus2 text-default"></i></a>
                      </li>
                      <!-- } -->
                    </ul>
                  </td>
                </tr>
                <!-- } } -->
              </tbody>
            </table>
          </div>
          <!-- /basic responsive configuration -->
        </div>
      </div>
      <!-- /main content -->
    </v-row>
  </v-container>
</template>

<script>
import NavBar from '@/components/layout/NavBar.vue';
import { mapGetters } from 'vuex';
export default {
  name: 'HomeView',
  components: { NavBar },
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
