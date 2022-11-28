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
                                    <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-collaboration position-left"></i> Lista de Júris</a></li>
                                </ul>
    
                            </div>
                        </div>
                        <!-- /toolbar -->
    
    
    
    
    
                        <div class = "row">
    
    
    
                            <!-- Vertical form options -->
                            <div class="col-md-6"> 
                                <!-- Basic layout-->
    
                                <form method="post" accept-charset="ISO-8859-1" action="SUZQU2VydmxldCNEQ0k=?YWNjYW8jdHVybWFz">
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
                                                            <button type="submit" onclick="this.disabled = 'disabled';
                                                                    this.form.submit();" class="btn bg-slate-800 btn-labeled text-bold text-uppercase">
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
    
                                <form method="post" accept-charset="ISO-8859-1" action="SUZQU2VydmxldCNEQ0k=?YWNjYW8jdHVybWFz">
                                    <div class="panel panel-flat">
                                        <div class="panel-body">
    
                                            <div class="form-group">
                                                <div class="col-lg-12">
                                                    <div class="row">
    
                                                        <div class="col-md-7">
    
    
                                                            <select class="select" name="idDisciplina">
                                                                <optgroup label="Selecione disciplina">
    
                                                                    <!--
                                                                        if (disciplinas != null) {
                                                                            for (Disciplina d : disciplinas) {
    
                                                                                int id = d.getDiscId();
                                                                                String desc = encryptUtils.decodeString(d.getDiscDescricao());
    
                                                                                String sel = "";
    
                                                                                if (disciplina != null) {
                                                                                    if (id == disciplina.getDiscId()) {
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
                                                                Filtrar Disciplina
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
    
    
    
                        <div class = "row">
    
                            <!-- Vertical form options -->
                            <div class="col-md-6"> 
                                <!-- Basic layout-->
    
                                <!--                                String act4 = encryptUtils.encodeString("accao#filtrar-salaExame&to=ifp-classroom");
                                -->
    
                                <form method="post" accept-charset="ISO-8859-1" action="SUZQU2VydmxldCNEQ0k=?<!--=act4-->">
                                    <div class="panel panel-flat">
                                        <div class="panel-body">
    
                                            <div class="form-group">
                                                <div class="col-lg-12">
                                                    <div class="row">
    
                                                        <div class="col-md-7">
    
    
                                                            <select class="select" name="idSala">
                                                                <optgroup label="Selecione uma Sala">
    
                                                                    <!--
                                                                        if (salasExame != null) {
                                                                            for (SalaExame s : salasExame) {
    
                                                                                int id = s.getSalaeId();
                                                                                String desc = encryptUtils.decodeString(s.getSala().getSalaDescricao()) + " - " + sdf.format(s.getSalaeData().toGregorianCalendar().getTime());
    
                                                                                String sel = "";
    
                                                                                if (salaExame != null) {
                                                                                    if (id == salaExame.getSalaeId()) {
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
                                                            <button type="submit" onclick="this.disabled = 'disabled';
                                                                    this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                                <b><i class="icon-search4 position-right"></i></b> 
                                                                Filtrar Sala
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
    
    
                        <div class = "row">
    
                            <!--
                                String decT = "---";
                                String decD = "---";
                                String decJ1 = "---";
                                String decJ2 = "---";
                                String cap = "";
    
                                int id = -1;
    
                                if (salaExame != null) {
    
                                    decT = encryptUtils.decodeString(salaExame.getSala().getSalaDescricao());
                                    decD = sdf.format(salaExame.getSalaeData().toGregorianCalendar().getTime());
    
                                    if (salaExame.getJuri1() != null) {
                                        decJ1 = encryptUtils.decodeString(salaExame.getJuri1().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(salaExame.getJuri1().getPessoa().getPessApelido());
    
                                    } else if (salaExame.getSalaeJuri1() != null) {
                                        decJ1 = encryptUtils.decodeString(salaExame.getSalaeJuri1());
                                    }
    
                                    if (salaExame.getJuri2() != null) {
                                        decJ2 = encryptUtils.decodeString(salaExame.getJuri2().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(salaExame.getJuri2().getPessoa().getPessApelido());
    
                                    } else if (salaExame.getSalaeJuri2() != null) {
                                        decJ2 = encryptUtils.decodeString(salaExame.getSalaeJuri2());
                                    }
    
                                    cap = salaExame.getSalaeMaxAlunos() + "";
                                    id = salaExame.getSalaeId();
                                }
                            -->
                            <div class="col-md-5">
    
    
                                <div class="row">
                                    <!-- Basic table -->
                                    <div class="panel panel-flat">
                                        <div class="panel-heading">
                                            <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Detalhes da turma</h6>
                                            <div class="heading-elements">
                                                <ul class="icons-list">
                                                    <li><a data-action="collapse"></a></li>
                                                    <li><a data-action="reload"></a></li>
    
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td class="text-bold">Sala: </td>
                                                        <td><!--=decT--></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-bold">Capacidade: </td>
                                                        <td><!--=cap--></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-bold">Data: </td>
                                                        <td><!--=decD--></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-bold">Júri 1: </td>
                                                        <td><!--=decJ1--></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-bold">Júri 2: </td>
                                                        <td><!--=decJ2--></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <!-- /basic table -->
                                </div>
    
                                <div class="row">
    
                                    <!-- Line and bar combination -->
                                    <div class="panel panel-flat">
                                        <div class="panel-heading">
                                            <h6 class="panel-title text-uppercase text-bold">Distribuição por Genero</h6>
                                            <div class="heading-elements">
                                                <ul class="icons-list">
                                                    <li><a data-action="collapse"></a></li>
                                                    <li><a data-action="reload"></a></li>
                                                </ul>
                                            </div>
                                        </div>
    
                                        <!--
                                            int total = homens + mulheres;
    
                                            int perH = Math.round((homens * 100.0f) / total);
                                            int perM = Math.round((mulheres * 100.0f) / total);
    
                                            int difH = 100 - perH;
                                            int difM = 100 - perM;
                                        -->
                                        <div class="panel-body">
                                            <div class="chart-container">
                                                <div class="chart has-fixed-height has-minimum-width" id="multiple_donuts" style="height: 250px;"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /line and bar combination -->
    
    
                                </div>
    
                            </div>
    
                            <div class = "col-md-7">
                                <!-- Vertical form options -->
    
    
    
                                <!-- Basic responsive configuration -->
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Lista dos alunos da turma <span class="text-danger">(<!--=decT-->)</span></h6>
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
                                                <a id="btnExport" target="_blank" href="print-juri" class="btn bg-success-600 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                    <b><i class="icon-file-excel"></i></b>
                                                    Imprimir Júri
                                                </a>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <a id="btnExport" target="_blank" href="print-juri-list" class="btn bg-success-600 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                    <b><i class="icon-file-excel"></i></b>
                                                    Imprimir Lista de Presenças
                                                </a>
                                            </div>
                                        </div>
    
                                    </div>
    
    
                                    <table class="table datatable-responsive">
                                        <thead>
                                            <tr>
                                                <th class="text-bold text-uppercase">COD</th>
                                                <th class="text-bold text-uppercase">Nome</th>
                                                <th class="text-bold text-uppercase text-right">Média</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!--
                                                if (exames != null) {
                                                    int x = 0;
                                                    for (Exame e : exames) {
    
                                                        x++;
    
                                                        String ref = encryptUtils.decodeString(e.getAluno().getAlunBadgnumber());
    
                                                        if (e.getAluno().getAlunUnico() != null) {
                                                            ref = encryptUtils.decodeString(e.getAluno().getAlunUnico());
                                                        }
    
                                                        String nom = encryptUtils.decodeString(e.getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(e.getAluno().getPessoa().getPessApelido());
                                                        String med = df.format(e.getExamMedia());
    
                                                        int idA = e.getExamId();
                                            -->
                                            <tr>
                                                <td><a href="#"><!--=ref--></a></td>
                                                <td><!--=nom--></td>
                                                <td class="text-bold text-slate text-right"><!--=med--></td>
                                            </tr>
    
                                            <!--
                                                    }
                                                }
                                            -->
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /basic responsive configuration -->
    
    
    
                            </div>
                            <!-- /vertical form options -->
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
  components: {NavBar},
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
