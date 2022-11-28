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
                        <ul class="nav navbar-nav element-active-orange-400">
                            <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-calendar position-left"></i> Gestão do Calendário dos Exames</a></li>
                        </ul>

                    </div>
                </div>
                <!-- /toolbar -->




                <div class = "row">
                    <!-- Vertical form options -->
                    <div class="col-md-6"> 
                        <!-- Basic layout-->

                        <form method="post" accept-charset="ISO-8859-1" action="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?YWNjYW8jY2FsZW5kYXJpby1leGFtZQ==">
                            <div class="panel panel-flat">
                                <div class="panel-body">

                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <div class="row">

                                                <div class="col-md-8">

                                                    <select class="select" name="idCurso">
                                                        <optgroup label="Selecione a classe">

                                                            <!--
                                                                if (cursos != null) {
                                                                    for (Curso c : cursos) {

                                                                        int id = c.getCursId();
                                                                        String desc = encryptUtils.decodeString(c.getCursCod()) + " - " + encryptUtils.decodeString(c.getCursDescricao());

                                                                        String sel = "";

                                                                        if (curso != null) {
                                                                            if (id == curso.getCursId()) {
                                                                                sel = "selected";
                                                                            }
                                                                        }
                                                            -->
                                                            <option value="x`"></option>
                                                            <!--
                                                                    }
                                                                }
                                                            -->                                                                

                                                        </optgroup>
                                                    </select>
                                                </div>

                                                <div class="col-md-3">
                                                    <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-slate-800 btn-labeled text-bold text-uppercase">
                                                        <b><i class="icon-search4 position-right"></i></b> 
                                                        Filtrar Classe
                                                    </button>

                                                </div>
                                                <br> <br> <br>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </form>
                        <!-- /basic layout -->

                    </div>

                </div>
                <!-- /row.1-->




                <!-- User profile -->
                <div class="row">





                    <div class="col-md-5">

                        <!--
                            String act2 = encryptUtils.encodeString("accao#definir-calendario-exame");
                        -->

                        <!-- Basic layout-->
                        <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?<!--=act2-->">
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-bold text-uppercase">Definição de Calendário</h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="panel-body">



                                    <div class="form-group">
                                        <label class="text-bold text-uppercase">Disciplina:</label>


                                        <select class="select" name="idDisciplina" required="">
                                            <optgroup label="Selecione uma disciplina">
                                                <!--                                                        if (disciplinas != null) {

                                                        for (Disciplina d : disciplinas) {

                                                            int id = d.getDiscId();
                                                            String desc = encryptUtils.decodeString(d.getDiscDescricao());

                                                -->
                                                <option value="<!--=id-->"><!--=desc--></option>
                                                <!--
                                                        }
                                                    }
                                                -->
                                            </optgroup>
                                        </select>

                                    </div>


                                    <div class="form-group">
                                        <label class="text-bold text-uppercase">1ª ÉPOCA: </label>
                                        <div class="input-group col-md-12">
                                            <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                            <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data1" required="">
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="text-bold text-uppercase">2ª ÉPOCA: </label>
                                        <div class="input-group col-md-12">
                                            <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                            <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data2" required="">
                                        </div>
                                    </div>


                                    <div class="form-group" hidden="">
                                        <label class="text-bold text-uppercase">2ª ÉPOCA: </label>
                                        <div class="input-group col-md-12">
                                            <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                            <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data1Limite" required="">
                                        </div>
                                    </div>



                                    <div class="form-group" hidden="">
                                        <label class="text-bold text-uppercase">2ª ÉPOCA: </label>
                                        <div class="input-group col-md-12">
                                            <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                            <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data2Limite" required="">
                                        </div>
                                    </div>




                                    <div class="text-right">
                                        <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 text-uppercase text-bold">Definir calendário <i class="icon-circle-right2 position-right"></i></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- /basic layout -->
                    </div>



                    <div class="col-md-6">

                        <!--
                            String cur = "";

                            if (curso != null) {
                                cur = encryptUtils.decodeString(curso.getCursDescricao());
                            }
                        -->
                        <!-- Bordered panel body table -->
                        <div class="panel panel-flat">
                            <div class="panel-heading">
                                <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Calendário dos Exames <span class="text-danger-600">[<!--=cur-->]</span></h6>
                                <div class="heading-elements">
                                    <ul class="icons-list">
                                        <li><a data-action="collapse"></a></li>
                                        <li><a data-action="reload"></a></li>

                                    </ul>
                                </div>
                            </div>

                            <div class="panel-body">

                                <p>
                                    <a href="#" target="_blank" class="btn  bg-slate-800 btn-labeled btn-lg text-bold text-uppercase">
                                        <b><i class="icon-printer2"></i></b>
                                        Imprimir calendário
                                    </a>

                                </p>

                                <table class="table datatable-responsive" width="100%">
                                    <thead>
                                        <tr>
                                            <th class="text-bold text-uppercase">Disciplina</th>
                                            <th class="text-bold text-uppercase">1ª Chamada</th>
                                            <th class="text-bold text-uppercase">2ª Chamada</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <!--
                                            if (calendariosExame != null) {
                                                for (CalendarioExame c : calendariosExame) {

                                                    String dis = encryptUtils.decodeString(c.getDisciplina().getDiscDescricao());

                                                    String d1 = "---";
                                                    String d2 = "---";

                                                    if (c.getCaleeExame() != null) {
                                                        d1 = sdf.format(c.getCaleeExame().toGregorianCalendar().getTime());
                                                    }

                                                    if (c.getCaleeRecorrencia() != null) {
                                                        d2 = sdf.format(c.getCaleeRecorrencia().toGregorianCalendar().getTime());
                                                    }
                                        -->
                                        <tr>
                                            <td><!--=dis--></td>
                                            <td><!--=d1--></td>
                                            <td><!--=d2--></td>  
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
  name: 'AddStudent',
  components: { NavBar },
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
