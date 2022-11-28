<template>
  <v-container>
    <nav-bar :menu_types = "6"/>
    <v-row>
                      <!-- Main content -->
                      <div class="content-wrapper">


                        <!-- Toolbar -->
                        <div class="navbar navbar-default navbar-component navbar-xs">
                            <ul class="nav navbar-nav visible-xs-block">
                                <li class="full-width text-center"><a data-toggle="collapse" data-target="#navbar-filter"><i class="icon-menu7"></i></a></li>
                            </ul>
    
                            <div class="navbar-collapse collapse" id="navbar-filter">
                                <ul class="nav navbar-nav element-active-orange-400">
                                    <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-office position-left"></i> Centros de Exame</a></li>
                                </ul>
    
                            </div>
                        </div>
                        <!-- /toolbar -->
    
    
    
    
                        <!-- User profile -->
                        <div class="row">
    
    
                            <div class="col-md-4">
    
                                <!--
                                    String act2 = encryptUtils.encodeString("accao#adicionar-centro");
                                -->
    
                                <!-- Basic layout-->
                                <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="SUZQU2VydmxldCNEQ0k=?<!--=act2-->">
                                    <div class="panel panel-flat">
                                        <div class="panel-heading">
                                            <h6 class="panel-title text-bold text-uppercase">Adicionar Centro de Exame</h6>
                                            <div class="heading-elements">
                                                <ul class="icons-list">
                                                    <li><a data-action="collapse"></a></li>
                                                    <li><a data-action="reload"></a></li>
                                                </ul>
                                            </div>
                                        </div>
    
                                        <div class="panel-body">
    
    
    
                                            <div class="form-group">
                                                <label class="text-bold text-uppercase">Provincia:</label>
    
                                                <select id="make" data-placeholder="Selecione a provincia" class="select" name="provincia" required="">
                                                    <option></option>
                                                    <!--
    
                                                        for (EdstProvince s : provincias) {
                                                            String sel = "";
                                                            String desc = s.getName();
                                                    -->
                                                    <option value=""></option>
                                                    <!--
                                                        }
                                                    -->
                                                </select>
    
                                            </div>
    
                                            <div class="form-group">
                                                <label class="text-bold text-uppercase">Distrito:</label>
    
                                                <select id="models"  data-placeholder="Selecione o distrito" class="select" name="distrito" required="">
                                                    <option></option>
                                                </select>  
    
                                            </div>
    
                                            <div class="form-group">
                                                <label class="text-bold text-uppercase">Escola:</label>
                                                <select data-placeholder="Selecione a escola" class="select" name="nome" required="" id="schools">
                                                    <option></option>
                                                </select>
                                            </div>
    
    
                                            <div class="text-right">
                                                <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 text-uppercase text-bold">Adicionar Centro <i class="icon-circle-right2 position-right"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!-- /basic layout -->
                            </div>
    
    
    
                            <div class="col-md-8">
    
                                <!-- Bordered panel body table -->
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Listagem de Centros de Exame <span class="text-danger-600">[<!--=ano-->]</span></h6>
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
                                                    <th class="text-bold text-uppercase text-danger-600">---</th>
                                                </tr>
                                            </thead>
                                            <tbody>
    
                                                <!--
                                                    if (centros != null) {
                                                        for (Centro c : centros) {
    
                                                            int id = c.getCentId();
                                                            String nm = c.getCentNome();
                                                            String prov = c.getCentProvincia();
                                                            String dist = c.getCentDistrito();
    
                                                            String actR = encryptUtils.encodeString("accao#remover-centro&ci=" + id);
                                                -->
                                                <tr>
                                                    <td class="text-blue-700 text-bold"><!--=id--></td>
                                                    <td class="text-bold"><!--=nm--></td>
                                                    <td><!--=prov--></td> 
                                                    <td><!--=dist--></td> 
    
                                                    <td>
                                                        <a  href="#" data-toggle="modal" data-target="#modal_rem_<!--=id-->" data-popup="tooltip" title="Remover registo"><i class="icon-cancel-circle2 text-danger-800"></i></a>
    
                                                        <!-- Danger modal -->
                                                        <div id="modal_rem_<!--=id-->" class="modal fade">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                        <h6 class="modal-title text-semibold">Confirma a remoção do centro: <b class="text-danger-600"><!--=nm--></b> ?</h6>
                                                                    </div>
                                                                    <div class="modal-body text-center">
                                                                        <h6 class="text-bold text-danger" ><i class="icon-question6 text-danger" style="font-size: 100px"></i></h6>
    
                                                                    </div>
    
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn text-bold text-uppercase btn-link" data-dismiss="modal">Cancelar</button>
    
                                                                        <a href="SUZQU2VydmxldCNEQ0k=?<!--=actR-->" class="btn text-bold text-uppercase btn-danger">Sim, confirmo !</a>
    
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- /danger modal -->   
    
                                                    </td>
                                                </tr>
                                                <!--
                                                        }
                                                    }
                                                -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- /bordered panel body table -->
    
                            </div>
                        </div>
                        <!-- /row.2 -->
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
  components: {NavBar},
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
