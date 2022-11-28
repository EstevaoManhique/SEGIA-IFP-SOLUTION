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


                            <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-grid2 position-left"></i> Pauta de Frequência</a></li>
                        </ul>

                    </div>
                </div>
                <!-- /toolbar -->


                <div class = "row">
                    <!-- Vertical form options -->
                    <div class="col-md-6"> 
                        <!-- Basic layout-->

                        <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?YWNjYW8jbGlzdGEtZXhhbWVz">
                            <div class="panel panel-flat">
                                <div class="panel-body">

                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <div class="row">

                                                <div class="col-md-7">

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
                        <!--                                String act3 = encryptUtils.encodeString("accao#filtrar-turma&to=avl-guidelines-freq");
                        -->

                        <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?<!--=act3-->">
                            <div class="panel panel-flat">
                                <div class="panel-body">

                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <div class="row">

                                                <div class="col-md-7">


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
                <!-- /row.1-->

                <div class="row">



                    <!--
                        String dd = "";
                        String cur = "";

                        if (turma != null) {

                            dd = encryptUtils.decodeString(turma.getTurmDescricao());
                            cur = encryptUtils.decodeString(turma.getCurso().getCursCod())
                                    + " - " + encryptUtils.decodeString(turma.getCurso().getCursDescricao());

                        }
                    -->

                    <div class="col-md-12">
                        <!-- Basic setup -->
                        <div class="panel panel-white">
                            <div class="panel-heading">
                                <h6 class="panel-title text-bold text-uppercase">PAUTA DE FREQUÊNCIA ANUAL</h6>
                                <div class="heading-elements">
                                    <ul class="icons-list">
                                        <li><a data-action="collapse"></a></li>
                                        <li><a data-action="reload"></a></li>

                                    </ul>
                                </div>
                            </div>





                            <div class="panel-body">

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <button id="btnExport" onclick="fnExcelReport('id18', 'PAUTA DE FREQUÊNCIA ANUAL', '<!--=cur--> | TURMA: <!--=dd-->');" class="btn bg-success-600 btn-labeled btn-labeled-left text-bold text-uppercase">
                                            <b><i class="icon-file-excel"></i></b>
                                            Exportar registos
                                        </button>
                                    </div>
                                </div>

                            </div>


                            <table class="table table-bordered table-striped"  id="id18">
                                <thead>
                                    <tr>
                                        <th class="text-bold text-uppercase" rowspan="2">Nº</th>
                                        <th class="text-bold text-uppercase" rowspan="2">Cod.</th>
                                        <th class="text-bold text-uppercase" rowspan="2">Nome Aluno</th>
                                        <th class="text-bold text-uppercase text-center" rowspan="2">Sexo</th>
                                        <th class="text-bold text-uppercase text-center" colspan="<!--=num-->">Disciplinas</th>
                                        <th class="text-bold text-uppercase text-center" rowspan="2">Média</th>
                                        <th class="text-bold text-uppercase text-center" rowspan="2">Comp.</th>
                                        <th class="text-bold text-uppercase text-center" rowspan="2">Resultado</th>
                                    </tr>
                                    <!--
                                        if (disciplinasCurso != null) {
                                    -->
                                    <tr>

                                        <!--
                                            for (DisciplinaCurso dc : disciplinasCurso) {

                                                String desc = encryptUtils.decodeString(dc.getDisciplina().getDiscDescricao());
                                                if (desc.length() >= 4) {
                                                    desc = desc.substring(0, 3);
                                                }
                                        -->
                                        <td class="text-bold text-uppercase text-right"><!--=desc--></td>
                                        <!--
                                            }
                                        -->

                                    </tr> 
                                    <!--
                                        }
                                    -->
                                </thead>
                                <tbody>

                                    <!--
                                        int i = 0;
                                        if (pms != null) {

                                            for (PM pm : pms) {

                                                String s1 = encryptUtils.decodeString(pm.getInscricao().getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(pm.getInscricao().getAluno().getPessoa().getPessApelido());
                                                String s2 = encryptUtils.decodeString(pm.getInscricao().getAluno().getAlunBadgnumber());
                                                String s3 = encryptUtils.decodeString(pm.getInscricao().getAluno().getPessoa().getPessSexo()).charAt(0) + "";
                                                String s4 = df.format(Math.round(pm.getMediaFinal()));
                                                String s5 = pm.getComportamentoFinal();
                                                String res = "Reprovado";

                                                String lblM = "text-danger-600";

                                                if (Math.round(pm.getMediaFinal()) > 9.5) {
                                                    lblM = "text-success-600";
                                                    res = "Admitido";
                                                }

                                                List<DN> dns = pm.getDns();

                                                i++;

                                    -->
                                    <tr>
                                        <td><!--=i--></td>
                                        <td><!--=s2--></td>
                                        <td><!--=s1--></td>
                                        <td class=" text-center"><!--=s3--></td>
                                        <!--
                                            if (dns != null) {
                                                for (DN d : dns) {

                                                    float m = Math.round(d.getMed());
                                                    String lbl = "text-danger-400";
                                                    if (m > 9.5) {
                                                        lbl = "text-teal-400";
                                                    }

                                        -->
                                        <td class="text-right text-bold <!--=lbl-->"><!--=df.format(m)--></td>
                                        <!--
                                                }
                                            }
                                        -->
                                        <td class="text-black text-center <!--=lblM-->"><!--=s4--></td>
                                        <td class=" text-center"><!--=s5--></td>
                                        <td class="text-bold text-center <!--=lblM-->"><!--=res--></td>
                                    </tr>

                                    <!--                                                }
                                        }
                                    -->
                                </tbody>
                            </table>


                        </div>
                        <!-- /basic setup -->
                    </div>
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
  name: 'AddStudent',
  components: { NavBar },
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
