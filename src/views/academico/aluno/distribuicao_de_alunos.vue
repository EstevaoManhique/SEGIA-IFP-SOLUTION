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
                                            <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-split position-left"></i> Distribuição de Alunos</a></li>
                                        </ul>
            
                                    </div>
                                </div>
                                <!-- /toolbar -->
            
            
            
            
            
                                <div class = "row">
            
            
            
                                    <!-- Vertical form options -->
                                    <div class="col-md-6"> 
                                        <!-- Basic layout-->
            
                                        <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?YWNjYW8jZGlzdHJpYnVpY2FvLWV4YW1l">
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
                                        <!--                                String act3 = encryptUtils.encodeString("accao#filtrar-turma&to=exam-distribution");
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
                                                                    <button type="submit" onclick="this.disabled = 'disabled';
                                                                            this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
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
            
            
            
                                <div class = "row">
            
                                    <!-- Vertical form options -->
                                    <div class="col-md-6"> 
                                        <!-- Basic layout-->
            
                                        <!--                                String act4 = encryptUtils.encodeString("accao#filtrar-calendario&to=exam-distribution");
                                        -->
            
                                        <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?<!--=act4-->">
                                            <div class="panel panel-flat">
                                                <div class="panel-body">
            
                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <div class="row">
            
                                                                <div class="col-md-7">
            
            
                                                                    <select class="select" name="idCalendario">
                                                                        <optgroup label="Selecione disciplina">
            
                                                                            <!--
                                                                                if (calendarios != null) {
                                                                                    for (Calendario c : calendarios) {
            
                                                                                        int id = c.getCaleId();
                                                                                        String desc = encryptUtils.decodeString(c.getDisciplina().getDiscDescricao());
            
                                                                                        String sel = "";
            
                                                                                        if (calendario != null) {
                                                                                            if (id == calendario.getCaleId()) {
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
            
            
                                <!-- User profile -->
                                <div class="row">
            
            
            
                                    <!--
                                        String dd = "";
                                        String cur = "";
                                        String di = "";
            
                                        boolean haveT3 = false;
                                        boolean haveT4 = false;
                                        boolean haveA2 = false;
            
                                        int nACS = 3;
                                        int nACP = 2;
                                        int nr = 7;
            
                                        if (turma != null) {
            
                                            dd = encryptUtils.decodeString(turma.getTurmDescricao());
                                            cur = encryptUtils.decodeString(turma.getCurso().getCursCod())
                                                    + " - " + encryptUtils.decodeString(turma.getCurso().getCursDescricao());
            
                                        }
            
                                        if (calendario != null) {
                                            di = encryptUtils.decodeString(calendario.getDisciplina().getDiscDescricao());
            
                                            haveT3 = calendario.isCaleHaveTeste3();
                                            haveT4 = calendario.isCaleHaveTeste4();
                                            haveA2 = calendario.isCaleHaveAcp();
                                        }
            
                                        if (haveT3) {
                                            nACS++;
                                            nr++;
                                        }
            
                                        if (haveT4) {
                                            nACS++;
                                            nr++;
                                        }
            
                                        if (haveA2) {
                                            nACP++;
                                            nr++;
                                        }
                                    -->
            
            
            
                                    <div class="col-md-10 col-md-offset-1">
            
                                        <!-- Basic responsive configuration -->
                                        <div class="panel panel-flat">
                                            <div class="panel-heading">
                                                <h6 class="panel-title text-bold text-uppercase">Listagem dos Alunos Admitidos ao Exame  <span class="text-danger-600">[<!--=cur + "| Turma:" + dd-->]</span> <span class="text-primary-600"> - [<!--=di-->]</span></h6>
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li><a data-action="collapse"></a></li>
                                                        <li><a data-action="reload"></a></li>
                                                    </ul>
                                                </div>
                                            </div>
            
            
                                            <form method="post" accept-charset="ISO-8859-1">
            
            
                                                <a href="#"  data-toggle="modal" data-target="#modal_noty" class="btn bg-slate-600 btn-labeled btn-lg text-bold text-uppercase">
                                                    <b><i class="icon-chevron-right"></i></b>
                                                    Atribuir sala de Exame
                                                </a>
            
            
            
                                                <!-- Vertical form modal -->
                                                <div id="modal_noty" class="modal fade">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-body">
            
            
                                                                <div class="panel panel-flat">
                                                                    <div class="panel-heading">
                                                                        <h6 class="panel-title text-bold text-uppercase">Selecione a sala</h6>
                                                                        <div class="heading-elements">
                                                                            <ul class="icons-list">
                                                                                <li><a data-action="collapse"></a></li>
                                                                                <li><a data-action="reload"></a></li>
            
                                                                            </ul>
                                                                        </div>
                                                                    </div>
            
                                                                    <div class="panel-body">
            
                                                                        <div class="form-group">
                                                                           <div class="col-lg-12">
                                                                                <div class="row">
                                                                                    <div class="col-md-12">
                                                                                        <select data-placeholder="Selecione a sala" class="select" name="idSala" required="">
                                                                                            <option></option>
                                                                                            <!--
            
                                                                                                if (salasExame != null) {
                                                                                                    for (SalaExame s : salasExame) {
                                                                                                        int idT = s.getSalaeId();
                                                                                                        String desc = encryptUtils.decodeString(s.getSala().getSalaDescricao()) + " [" + (s.getSalaeMaxAlunos() - s.getSalaeOcupado()) + " lugares disponíveis] - "+sdf.format(s.getSalaeData().toGregorianCalendar().getTime());
                                                                                            -->
                                                                                            <option value="<!--=idT-->" class="text-bold"><!--=desc--></option> 
                                                                                            <!--
            
                                                                                                    }
                                                                                                }
                                                                                            -->
                                                                                        </select>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
            
            
                                                                    </div>
            
            
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn bg-danger-600 text-bold text-uppercase" data-dismiss="modal">Fechar <i class="icon-chevron-down"></i> </button>
                                                                        <button type="submit" class="btn bg-teal-800  text-bold text-uppercase">Confirmar Atribuição <i class="icon-chevron-right"></i></button>
                                                                    </div>
                                                                </div>
            
            
                                                            </div>
            
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /vertical form modal -->
            
                                                <table class="table datatable-responsive">
                                                    <thead>
                                                        <tr>
                                                            <th class="text-bold text-uppercase">#</th>
                                                            <th class="text-bold text-uppercase">Cód.</th>
                                                            <th class="text-bold text-uppercase">Aluno</th>
                                                            <th class="text-bold text-uppercase">Média do Exame</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
            
            
                                                        <!--
                                                            if (medias != null) {
            
                                                                for (Media me : medias) {
            
                                                                    int id = me.getMediId();
            
                                                                    String s1 = encryptUtils.decodeString(me.getAluno().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(me.getAluno().getPessoa().getPessApelido());
                                                                    String s2 = encryptUtils.decodeString(me.getAluno().getAlunBadgnumber());
            
                                                                    float med = Math.round((me.getMediMedia() + me.getMediMedia2() + me.getMediMedia3()) / 3);
                                                                    String s3 = df.format(med);
            
                                                        -->
                                                        <tr>
                                                            <td><input type="checkbox" name="noty_list" value="<!--=id-->" class="styled"></td>
                                                            <td class="text-bold"><!--=s2--></td>
                                                            <td><!--=s1--></td>
                                                            <td class="text-bold text-teal-700 text-uppercase"><!--=s3--></td>
                                                        </tr>
            
                                                        <!--
            
                                                                }
                                                            }
                                                        -->
            
                                                    </tbody>
                                                </table>
                                            </form>
            
                                        </div>
                                        <!-- /basic responsive configuration -->
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
