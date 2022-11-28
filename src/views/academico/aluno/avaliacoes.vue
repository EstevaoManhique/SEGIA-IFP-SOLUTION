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
                            <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-calendar52 position-left"></i> Gestão do Calendário de Testes</a></li>
                        </ul>

                    </div>
                </div>
                <!-- /toolbar -->




                <div class = "row">



                    <!-- Vertical form options -->
                    <div class="col-md-6"> 
                        <!-- Basic layout-->

                        <form method="post" accept-charset="ISO-8859-1" action="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?YWNjYW8jdGVzdGVz">
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





                    <!-- Vertical form options -->
                    <div class="col-md-6"> 
                        <!-- Basic layout-->


                        <!--
                            String act = encryptUtils.encodeString("accao#filtrar-semestre&to=schedule-test");
                        -->

                        <!-- Basic layout-->
                        <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?<!--=act-->">
                            <div class="panel panel-flat">
                                <div class="panel-body">

                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <div class="row">

                                                <div class="col-md-8">

                                                    <select class="select" name="semestre">
                                                        <optgroup label="Selecione o semestre">

                                                            <!--
                                                                String semestres[] = {"1º TRIMESTRE", "2º TRIMESTRE", "3º TRIMESTRE"};

                                                                for (String s : semestres) {

                                                                    String sel = "";

                                                                    if (s.equals(semestre)) {
                                                                        sel = "selected";
                                                                    }

                                                            -->
                                                            <option value=""></option>
                                                            <!--
                                                                }

                                                            -->                                                                

                                                        </optgroup>
                                                    </select>
                                                </div>

                                                <div class="col-md-3">
                                                    <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                        <b><i class="icon-search4 position-right"></i></b> 
                                                        Filtrar Semestre
                                                    </button>

                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </form>
                        <!-- /basic layout -->

                    </div>
                    <!-- /vertical form options -->
                </div>
                <!-- /row.1-->




                <!-- User profile -->
                <div class="row">

                    <!--                            String ref = "";
                        String dd = "";
                        String tur = "";
                        String cur = "";
                        String hor = "";
                        String dI = "";
                        String dF = "";
                        String min = "";
                        String max = "";

                        String testes[] = {"1ª ACS", "2ª ACS", "3ª ACS", "4ª ACS", "1ª ACP", "2ª ACP"};

                        String horarios[] = {"07:00 - 07:45", "07:50 - 08:35", "08:40 - 09:25", "09:45 - 10:30", "10:35 - 11:20", "11:25 - 12:10",
                            "12:15 - 13:00", "13:05 - 13:50", "13:55 - 14:10", "14:45 - 15:30", "15:45 - 16:30", "16:35 - 17:20", "17:25 - 18:10"};

                        if (turma != null) {

                            ref = encryptUtils.decodeString(turma.getTurmReferencia());
                            dd = encryptUtils.decodeString(turma.getTurmDescricao());
                            tur = encryptUtils.decodeString(turma.getTurmTurno());
                            hor = encryptUtils.decodeString(turma.getTurmHorario());
                            cur = encryptUtils.decodeString(turma.getCurso().getCursCod())
                                    + " - " + encryptUtils.decodeString(turma.getCurso().getCursDescricao());

                            dI = sdf.format(turma.getTurmDataInicio().toGregorianCalendar().getTime());
                            dF = sdf.format(turma.getTurmDataFim().toGregorianCalendar().getTime());

                            min = turma.getTurmMinEstudantes() + "";
                            max = turma.getTurmMaxEstudantes() + "";
                        }
                    -->

                    <div class="col-md-7">

                        <!-- Row -->
                        <div class="row">


                            <!-- Vertical form options -->
                            <div class="col-md-12"> 
                                <!-- Basic layout-->


                                <!--
                                    String act3 = encryptUtils.encodeString("accao#filtrar-turma&to=schedule-test");
                                -->

                                <!-- Basic layout-->
                                <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?<!--=act3-->">
                                    <div class="panel panel-flat">
                                        <div class="panel-body">

                                            <div class="form-group">
                                                <div class="col-lg-12">
                                                    <div class="row">

                                                        <div class="col-md-8">

                                                            <select class="select" name="idTurma">
                                                                <optgroup label="Selecione a turma">

                                                                    <!--
                                                                        if (turmas != null) {
                                                                            for (Turma t : turmas) {

                                                                                int id = t.getTurmId();
                                                                                String desc = encryptUtils.decodeString(t.getTurmReferencia()) + " - " + encryptUtils.decodeString(t.getTurmDescricao());

                                                                                String sel = "";

                                                                                if (turma != null) {
                                                                                    if (id == turma.getTurmId()) {
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
                                                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                                <b><i class="icon-search4 position-right"></i></b> 
                                                                Filtrar Turma
                                                            </button>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </form>
                                <!-- /basic layout -->

                            </div>
                            <!-- /vertical form options -->

                        </div>
                        <!--/row -->

                        <!-- row -->
                        <div class="row">

                            <!-- Vertical form options -->
                            <div class="col-md-12"> 
                                <!-- Bordered striped table -->
                                <div class="panel panel-flat">

                                    <div class="table-responsive">
                                        <table class="table table-bordered table-striped">
                                            <tbody>
                                                <tr>
                                                    <td class="text-bold text-uppercase"><i class="icon-markup"></i> Código</td>
                                                    <td class="text-bold text-danger-600"><!--=ref--></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-bold text-uppercase"><i class="icon-file-text"></i> Descrição</td>
                                                    <td class="text-bold"><!--=dd--></td>
                                                </tr>

                                                <tr>
                                                    <td class="text-bold text-uppercase"><i class="icon-archive"></i> Curso</td>
                                                    <td><!--=cur--></td>
                                                </tr>

                                                <tr>
                                                    <td class="text-bold text-uppercase"><i class="icon-popout"></i> Turno</td>
                                                    <td><!--=tur--></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- /bordered striped table -->


                            </div>
                            <!-- /vertical form options -->
                        </div>
                        <!-- /row -->



                        <!-- row.3 -->
                        <div class ="row">

                            <div class="col-md-12">
                                <!-- Bordered panel body table -->
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Calendário de Avaliações <span class="text-danger-600">[<!--=cur + " | " + dd + " | " + semestre-->]</span></h6>
                                        <div class="heading-elements">
                                            <ul class="icons-list">
                                                <li><a data-action="collapse"></a></li>
                                                <li><a data-action="reload"></a></li>

                                            </ul>
                                        </div>
                                    </div>

                                    <div class="panel-body">

                                        <p>
                                            <a href="Q2FsZW5kYXJpb1NlcnZsZXQjRENJ?YWNjYW8jaW1wcmltaXItY2FsZW5kYXJpbw==" target="_blank" class="btn  bg-slate-800 btn-labeled btn-lg text-bold text-uppercase">
                                                <b><i class="icon-printer2"></i></b>
                                                Imprimir calendário
                                            </a>

                                        </p>

                                        <table class="table datatable-fixed-left" width="100%">
                                            <thead>
                                                <tr>
                                                    <th class="text-bold text-uppercase"></th>

                                                    <!--                                                        for (String d : testes) {
                                                    -->
                                                    <th class="text-bold text-uppercase"><!--=d--></th>
                                                        <!--
                                                            }
                                                        -->
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <!--
                                                    if (calendarios != null) {
                                                        for (Calendario c : calendarios) {

                                                            String dis = encryptUtils.decodeString(c.getDisciplina().getDiscDescricao());

                                                            String d1 = "---";
                                                            String d2 = "---";
                                                            String d3 = "---";
                                                            String d4 = "---";
                                                            String d5 = "---";
                                                            String d6 = "---";

                                                            if (c.getCaleTeste1() != null) {
                                                                d1 = sdf.format(c.getCaleTeste1().toGregorianCalendar().getTime());
                                                            }

                                                            if (c.getCaleTeste2() != null) {
                                                                d2 = sdf.format(c.getCaleTeste2().toGregorianCalendar().getTime());
                                                            }

                                                            if (c.getCaleTeste3() != null) {
                                                                d3 = sdf.format(c.getCaleTeste3().toGregorianCalendar().getTime());
                                                            }

                                                            if (c.getCaleTeste4() != null) {
                                                                d4 = sdf.format(c.getCaleTeste4().toGregorianCalendar().getTime());
                                                            }

                                                            if (c.getCaleAcp() != null) {
                                                                d5 = sdf.format(c.getCaleAcp().toGregorianCalendar().getTime());
                                                            }

                                                            if (c.getCaleAcp2() != null) {
                                                                d6 = sdf.format(c.getCaleAcp2().toGregorianCalendar().getTime());
                                                            }
                                                -->
                                                <tr>
                                                    <td><!--=dis--></td>
                                                    <td><!--=d1--></td>
                                                    <td><!--=d2--></td>
                                                    <td><!--=d3--></td>
                                                    <td><!--=d4--></td>
                                                    <td><!--=d5--></td>
                                                    <td><!--=d6--></td>
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
                        <!-- /row.3 -->

                    </div>





                    <div class="col-md-5">

                        <!--
                            String act2 = encryptUtils.encodeString("accao#definir-calendario-teste");
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
                                        <div class="row">
                                            <div class="col-md-6">

                                                <label class="text-bold">1ª ACS - Data Avaliação: </label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                    <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data1" required="">
                                                </div>
                                            </div>

                                            <div class="col-md-6">

                                                <label class="text-bold">1ª ACS - Limite Submissão: </label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                    <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data1Limite" required="">
                                                </div>
                                            </div>

                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-6">

                                                <label class="text-bold">2ª ACS - Data Avaliação: </label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                    <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data2" required="">
                                                </div>
                                            </div>

                                            <div class="col-md-6">

                                                <label class="text-bold">2ª ACS - Limite Submissão: </label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                    <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data2Limite" required="">
                                                </div>
                                            </div>

                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-6">

                                                <label class="text-bold">3ª ACS - Data Avaliação: </label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                    <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data3" required="">
                                                </div>
                                            </div>

                                            <div class="col-md-6">

                                                <label class="text-bold">3ª ACS - Limite Submissão: </label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                    <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data3Limite" required="">
                                                </div>
                                            </div>

                                        </div>
                                    </div>




                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-6">

                                                <label class="text-bold">4ª ACS - Data Avaliação: </label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                    <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data4" required="">
                                                </div>
                                            </div>

                                            <div class="col-md-6">

                                                <label class="text-bold">4ª ACS - Limite Submissão: </label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                    <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data4Limite" required="">
                                                </div>
                                            </div>

                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-6">

                                                <label class="text-bold">1ª ACP - Data Avaliação: </label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                    <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data5" required="">
                                                </div>
                                            </div>

                                            <div class="col-md-6">

                                                <label class="text-bold">1ª ACP - Limite Submissão: </label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                    <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data5Limite" required="">
                                                </div>
                                            </div>

                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-6">

                                                <label class="text-bold">2ª ACP - Data Avaliação: </label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                    <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data6" required="">
                                                </div>
                                            </div>

                                            <div class="col-md-6">

                                                <label class="text-bold">2ª ACP - Limite Submissão: </label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-calendar52"></i></span>
                                                    <input type="text" class="form-control daterange-single" placehorlder="Data..." name="data6Limite" required="">
                                                </div>
                                            </div>

                                        </div>
                                    </div>


                                    <!-- Single styled checkbox -->
                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <code class="text-bold text-uppercase">Nota:</code> 
                                            Ao desselecionar as opções, o sistema não considera as datas das avaliações.
                                        </div>
                                    </div>
                                    <!-- /single styled checkbox -->

                                    <!-- Single styled checkbox -->
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="acs3" class="styled">
                                                        <b class="text-uppercase">3ª Acs ?</b>
                                                    </label>
                                                </div>

                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="acs4" class="styled">
                                                        <b class="text-uppercase">4ª Acs ?</b>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="acp2" class="styled">
                                                        <b class="text-uppercase">2ª Acp ?</b>
                                                    </label>
                                                </div>


                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="tem" class="styled">
                                                        <b class="text-uppercase">Disciplina com exame ?</b>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /single styled checkbox -->

                                    <div class="text-right">
                                        <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 text-uppercase text-bold">Definir calendário <i class="icon-circle-right2 position-right"></i></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- /basic layout -->




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
