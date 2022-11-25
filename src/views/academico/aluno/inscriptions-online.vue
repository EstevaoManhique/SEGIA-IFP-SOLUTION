<template>
    <v-container>
        <nav-bar :menu_types = "5"/>
        <v-row>
              <!-- Main content -->
              <div class="content-wrapper">


                <!-- Toolbar -->
                <div class="navbar navbar-default navbar-component navbar-xs">
                    <ul class="nav navbar-nav visible-xs-block">
                        <li class="full-width text-center"><a data-toggle="collapse" data-target="#navbar-filter"><i class="icon-menu7"></i></a></li>
                    </ul>

                    <div class="navbar-collapse collapse" id="navbar-filter">
                        <ul class="nav navbar-nav element-active-slate-400">
                            <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-user-check position-left"></i> Matriculas Por Validar</a></li>
                        </ul>

                    </div>
                </div>
                <!-- /toolbar -->



                <div class = "row">

                    <div class = "col-md-12 col-md-offset-0">

                        <!-- Basic responsive configuration -->
                        <div class="panel panel-flat">
                            <div class="panel-heading">
                                <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Listagem das Matriculas por Validar</h6>
                                <div class="heading-elements">
                                    <ul class="icons-list">
                                        <li><a data-action="collapse"></a></li>
                                        <li><a data-action="reload"></a></li>
                                    </ul>
                                </div>
                            </div>


                            <table class="table datatable-responsive">
                                <thead>
                                    <tr>
                                        <th class="text-bold text-uppercase">#</th>
                                        <th class="text-bold text-uppercase">Nome</th>
                                        <th class="text-bold text-uppercase">Contacto</th>
                                        <th class="text-bold text-uppercase">Nível de formação</th>
                                        <th class="text-bold text-uppercase">Classe</th>
                                        <th class="text-bold text-uppercase">Horário</th>
                                        <th class="text-bold text-uppercase">Status</th>
                                        <th class="text-center text-bold text-uppercase text-danger-600">---</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <tr>
                                        <td><a href="#"><!--=id--></a></td>
                                        <td class="text-bold"><!--=s1--></td>
                                        <td><!--=s2--></td>
                                        <td><!--=s3--></td>
                                        <td class="text-bold"><!--=s4--></td>
                                        <td class="text-bold text-danger-600"><!--=s5--></td>
                                        <td><span class="label <!--=lblStatus-->"><!--=status--></span></td>
                                        </tr>
                                        </tbody>
                                      </table>
                                            <a  href="#" data-toggle="modal" data-target="#modal_rem_<!--=id-->" class="text-center" data-popup="tooltip" title="Validar a matricula"><i class="icon-checkmark-circle text-orange-600"></i></a>


                                            <!-- Danger modal -->
                                            <div id="modal_rem_<!--=id-->" class="modal fade">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h6 class="modal-title text-semibold">Confirma a validação da matricula #<!--=id--> ?</h6>
                                                        </div>

                                                        <!-- 2 columns form -->
                                                        <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="QWx1bm9TZXJ2bGV0I0RDSQ==?<!--=actA-->">

                                                            <div class="modal-body">


                                                                <!--
                                                                    String vlBtn = "Validar Matricula";

                                                                -->


                                                                <div class="panel panel-flat">

                                                                    <div class="panel-body">
                                                                        <div class="row">



                                                                            <div class="col-md-12">

                                                                                <fieldset>
                                                                                    <legend class="text-semibold"><i class="icon-clipboard2 position-left"></i> Inscrição</legend>


                                                                                    <div class="form-group">
                                                                                        <label class="col-lg-3 control-label text-bold text-uppercase"> Turma & Horário:</label>
                                                                                        <div class="col-lg-9">
                                                                                            <div class="row">
                                                                                                <div class="col-md-10">
                                                                                                    <select data-placeholder="Selecione a turma" class="select" name="idTurma" required="">
                                                                                                        <option></option>
                                                                                                        <!--                                                                                                                if (turmas != null) {
                                                                                                                for (Turma t : turmas) {

                                                                                                                    int idT = t.getTurmId();

                                                                                                                    String desc = encryptUtils.decodeString(t.getTurmDescricao()) + "|" + encryptUtils.decodeString(t.getCurso().getCursDescricao()) + "|" + encryptUtils.decodeString(t.getTurmHorario());

                                                                                                                    String sel = "";
                                                                                                                    if (aluno != null) {
                                                                                                                        if (t.getTurmId() == aluno.getAlunTurno()) {
                                                                                                                            sel = "selected";
                                                                                                                        }
                                                                                                                    }
                                                                                                        -->
                                                                                                        <option value=""></option>
                                                                                                        <!--
                                                                                                                }
                                                                                                            }
                                                                                                        -->
                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Categoria:</label>
                                                                                        <div class="col-lg-9">
                                                                                            <div class="row">
                                                                                                <div class="col-md-10">
                                                                                                    <div class="mb-15">
                                                                                                        <select data-placeholder="Selecione a categoria" class="select" required="" name="categoria">
                                                                                                            <option></option>
                                                                                                            <!--
                                                                                                                String categorias[] = {"NOVO INGRESSO", "CONTINUANTE", "REPETENTE", "ASSISTENTE", "TRANSFERIDO"};

                                                                                                                for (String s : categorias) {

                                                                                                                    String sel = "";

                                                                                                            -->
                                                                                                         <option value=""></option>   <!--
                                                                                                                }
                                                                                                            -->
                                                                                                        </select>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Condição Matrícula:</label>
                                                                                        <div class="col-lg-9">
                                                                                            <div class="row">
                                                                                                <div class="col-md-10">
                                                                                                    <div class="mb-15">
                                                                                                        <select data-placeholder="Selecione a condição da matrícula" class="select" required="" name="condicao">
                                                                                                            <option></option>
                                                                                                            <!--
                                                                                                                String condicoes[] = {"GLOBAL", "LETRAS", "CIÊNCIAS", "TÉCNICO"};

                                                                                                                for (String s : condicoes) {

                                                                                                                    String sel = "";

                                                                                                            -->
                                                                                                           <option value=""></option> <!--
                                                                                                                }
                                                                                                            -->
                                                                                                        </select>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>


                                                                                    <div class="form-group" hidden="">
                                                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Condição Pagamento:</label>
                                                                                        <div class="col-lg-9">
                                                                                            <div class="row">
                                                                                                <div class="col-md-7">
                                                                                                    <div class="mb-15">
                                                                                                        <select data-placeholder="Selecione a condição de pagamento" class="select" required="" name="bolseiro">
                                                                                                            <option></option>
                                                                                                            <!--
                                                                                                                String bolsas[] = {"NORMAL", "BOLSA COMPLETA", "BOLSEIRO PARCIAL (15%)", "BOLSEIRO PARCIAL (20%)",
                                                                                                                    "BOLSEIRO PARCIAL (25%)", "BOLSEIRO PARCIAL (30%)", "BOLSEIRO PARCIAL (35%)",
                                                                                                                    "BOLSEIRO PARCIAL (40%)", "BOLSEIRO PARCIAL (45%)", "BOLSEIRO PARCIAL (50%)"};

                                                                                                                for (String s : bolsas) {

                                                                                                                    String sel = "";

                                                                                                            -->
                                                                                                            <!--
                                                                                                                }
                                                                                                            -->
                                                                                                        </select>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>



                                                                                    <div class="form-group">
                                                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Documentos:</label>
                                                                                        <div class="col-lg-9">
                                                                                            <div class="row">


                                                                                                <label class="radio-inline">
                                                                                                    <input type="checkbox" name="certificado" class="styled">
                                                                                                    Certificado/ Declaração Provisória
                                                                                                </label>

                                                                                                <label class="radio-inline">
                                                                                                    <input type="checkbox" name="copiaBI" class="styled">
                                                                                                    Cópia do BI
                                                                                                </label>

                                                                                                <label class="radio-inline">
                                                                                                    <input type="checkbox" name="fotos" class="styled">
                                                                                                    Fotos
                                                                                                </label>
                                                                                            </div>
                                                                                        </div>

                                                                                    </div>

                                                                                </fieldset>

                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- /2 columns form -->

                                                            </div>

                                                            <div class="modal-footer">
                                                                <button type="button" class="btn text-bold text-uppercase btn-link" data-dismiss="modal">Cancelar</button>

                                                                <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800"><!--=vlBtn--> <i class="icon-arrow-right14 position-right"></i></button>

                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /default modal -->  


                                            </div>
                              
                        </div>
                        <!-- /basic responsive configuration -->



                    </div>
            </div>							

        </v-row>
    </v-container>
</template>

<script>
import NavBar from '@/components/layout/NavBar.vue';
import { mapGetters } from 'vuex';
export default {
  name: 'AddStudent',
  components: { NavBar },
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
