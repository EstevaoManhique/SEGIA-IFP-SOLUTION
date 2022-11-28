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
                        <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-users position-left"></i> Júris Exames</a></li>
                    </ul>

                </div>
            </div>
            <!-- /toolbar -->




            <div class = "row">
                <!-- Vertical form options -->
                <div class="col-md-6"> 
                    <!-- Basic layout-->

                    <form method="post" accept-charset="ISO-8859-1" action="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?YWNjYW8janVyaXM=">
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
                                                        <option value=""></option>
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





                <div class="col-md-4">

                    <!--
                        String act2 = encryptUtils.encodeString("accao#definir-juri");
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
                                    <select class="select" name="idCalendario" required="">
                                        <optgroup label="Selecione uma disciplina">
                                            <!--
                                                if (calendariosExame != null) {

                                                    for (CalendarioExame ce : calendariosExame) {

                                                        int id = ce.getCaleeId();
                                                        String desc = encryptUtils.decodeString(ce.getDisciplina().getDiscDescricao());

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
                                    <label class="text-bold text-uppercase">Sala:</label>
                                    <select class="select" name="idSala" required="">
                                        <optgroup label="Selecione uma sala">
                                            <!--
                                                if (salas != null) {

                                                    for (Sala s : salas) {

                                                        int id = s.getSalaId();
                                                        String desc = encryptUtils.decodeString(s.getSalaDescricao());

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
                                    <label class="text-bold text-uppercase">Chamada:</label>
                                    <select class="select" name="categoria">
                                        <optgroup label="Selecione a época">
                                            <option value="1ª Chamada">1ª Chamada</option>
                                            <option value="2ª Chamada">2ª Chamada</option>
                                        </optgroup>
                                    </select>
                                </div>


                                <div class="form-group">
                                    <label class="text-bold text-uppercase">Júri 1:</label>
                                    <select class="select" name="idDocente1" required="">
                                        <optgroup label="Selecione uma docente">
                                            <!--
                                                if (docentes != null) {

                                                    for (Docente d: docentes) {

                                                        int id = d.getDoceId();
                                                        String desc = encryptUtils.decodeString(d.getPessoa().getPessNome())+" "+encryptUtils.decodeString(d.getPessoa().getPessApelido());

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
                                    <label class="text-bold text-uppercase">Júri 2:</label>
                                    <select class="select" name="idDocente2" required="">
                                        <optgroup label="Selecione uma docente">
                                            <!--
                                                if (docentes != null) {

                                                    for (Docente d: docentes) {

                                                        int id = d.getDoceId();
                                                        String desc = encryptUtils.decodeString(d.getPessoa().getPessNome())+" "+encryptUtils.decodeString(d.getPessoa().getPessApelido());

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
                                    <label class="text-bold text-uppercase">Nº Máx. Alunos:</label>
                                    <input type="text" class="form-control" placeholder="Nº máximo de alunos ..." name="numAlunos" required="">
                                </div>


                                <div class="text-right">
                                    <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 text-uppercase text-bold">Definir Júri <i class="icon-circle-right2 position-right"></i></button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- /basic layout -->
                </div>



                <div class="col-md-8">

                    <!--
                        String cur = "";

                        if (curso != null) {
                            cur = encryptUtils.decodeString(curso.getCursDescricao());
                        }
                    -->
                    <!-- Bordered panel body table -->
                    <div class="panel panel-flat">
                        <div class="panel-heading">
                            <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Júris dos Exames <span class="text-danger-600">[<!--=cur-->]</span></h6>
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
                                    Imprimir júris
                                </a>

                            </p>

                            <table class="table datatable-responsive" width="100%">
                                <thead>
                                    <tr>
                                        <th class="text-bold text-uppercase">Disciplina</th>
                                        <th class="text-bold text-uppercase">Sala</th>
                                        <th class="text-bold text-uppercase">Data</th>
                                        <th class="text-bold text-uppercase">Nº Máx. Alunos</th>
                                        <th class="text-bold text-uppercase">Júri 1</th>
                                        <th class="text-bold text-uppercase">Júri 2</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <!--
                                        if (salasExame != null) {
                                            for (SalaExame se: salasExame) {

                                                String dis = encryptUtils.decodeString(se.getDisciplina().getDiscDescricao());

                                                String d1 = sdf.format(se.getSalaeData().toGregorianCalendar().getTime());
                                                String sa = encryptUtils.decodeString(se.getSala().getSalaDescricao());
                                                int num = se.getSalaeMaxAlunos();
                                                String j1 = encryptUtils.decodeString(se.getJuri1().getPessoa().getPessNome())+" "+encryptUtils.decodeString(se.getJuri1().getPessoa().getPessApelido());
                                                String j2 = encryptUtils.decodeString(se.getJuri2().getPessoa().getPessNome())+" "+encryptUtils.decodeString(se.getJuri2().getPessoa().getPessApelido());
                                    -->
                                    <tr>
                                        <td><!--=dis--></td>
                                        <td><!--=sa--></td>
                                        <td><!--=d1--></td>
                                        <td><!--=num--></td> 
                                        <td><!--=j1--></td> 
                                        <td><!--=j2--></td>  
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
