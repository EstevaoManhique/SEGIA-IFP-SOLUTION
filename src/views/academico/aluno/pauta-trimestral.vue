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
                            <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-grid-alt position-left"></i> Pautas</a></li>
                        </ul>

                    </div>
                </div>
                <!-- /toolbar -->





                <div class = "row">



                    <!-- Vertical form options -->
                    <div class="col-md-6"> 
                        <!-- Basic layout-->

                        <form method="post" accept-charset="ISO-8859-1" action="QXZhbGlhY2FvU2VydmxldCNEQ0k=?YWNjYW8jcGF1dGFz">
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
                        <!--                                String act3 = encryptUtils.encodeString("accao#filtrar-turma&to=avl-guidelines");
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



                <div class = "row">

                    <!-- Vertical form options -->
                    <div class="col-md-6"> 
                        <!-- Basic layout-->

                        <!--                                String act4 = encryptUtils.encodeString("accao#filtrar-calendario&to=avl-guidelines");
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


                <!-- User profile -->
                <div class="row">

                    <div class="col-md-12">



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

                            int numACS = 2;
                            int numACP = 1;

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
                                numACS++;
                            }

                            if (haveT4) {
                                nACS++;
                                nr++;
                                numACS++;
                            }

                            if (haveA2) {
                                nACP++;
                                nr++;
                                numACP++;
                            }
                        -->


                        <!-- Basic responsive configuration -->
                        <div class="panel panel-flat">
                            <div class="panel-heading">

                                <h6 class="panel-title text-bold text-uppercase">Pautas Trimestrais  <span class="text-danger-600">[<!--=cur + "| Turma:" + dd-->]</span> <span class="text-primary-600"> - [<!--=di-->]</span></h6>
                                <div class="heading-elements">
                                    <ul class="icons-list">
                                        <li><a data-action="collapse"></a></li>
                                        <li><a data-action="reload"></a></li>
                                    </ul>
                                </div>
                            </div>



                            <div class="panel-body">

                                <p>
                                    <a href="QXZhbGlhY2FvU2VydmxldCNEQ0k=?YWNjYW8jaW1wcmltaXItcGF1dGE=" target="_blank" class="btn  bg-slate-800 btn-labeled btn-lg text-bold text-uppercase">
                                        <b><i class="icon-printer2"></i></b>
                                        Imprimir pauta
                                    </a>

                                </p>

                            </div>

                            <table class="table datatable-fixed-left table-bordered table-striped" width="100%">
                                <thead>
                                    <tr>
                                        <th class="text-bold text-uppercase text-center" rowspan="3">Aluno</th>
                                        <th class="text-bold text-uppercase text-center bg-slate-400" colspan="<!--=nr-->">1º Trimistre</th>
                                        <th class="text-bold text-uppercase text-center bg-slate-400" colspan="<!--=nr-->">2º Trimistre</th>
                                        <th class="text-bold text-uppercase text-center bg-slate-400" colspan="<!--=nr-->">3º Trimistre</th>
                                        <th class="text-bold text-uppercase text-center" rowspan="3">Média Final</th>
                                        <th class="text-bold text-uppercase text-center" rowspan="3">Status</th>
                                    </tr>
                                    <tr>
                                        <th colspan="<!--=nACS-->" class="text-bold text-uppercase text-center">ACS</th>
                                        <th colspan="<!--=nACP-->" class="text-bold text-uppercase text-center">ACP</th>
                                        <th rowspan="2" class="text-bold text-uppercase text-center">MÉDIA FINAL</th>
                                        <th rowspan="2" class="text-bold text-uppercase text-center">COMP.</th>

                                        <th colspan="<!--=nACS-->" class="text-bold text-uppercase text-center">ACS</th>
                                        <th colspan="<!--=nACP-->" class="text-bold text-uppercase text-center">ACP</th>
                                        <th rowspan="2" class="text-bold text-uppercase text-center">MÉDIA FINAL</th>
                                        <th rowspan="2" class="text-bold text-uppercase text-center">COMP.</th>

                                        <th colspan="<!--=nACS-->" class="text-bold text-uppercase text-center">ACS</th>
                                        <th colspan="<!--=nACP-->" class="text-bold text-uppercase text-center">ACP</th>
                                        <th rowspan="2" class="text-bold text-uppercase text-center">MÉDIA FINAL</th>
                                        <th rowspan="2" class="text-bold text-uppercase text-center">COMPOR.</th>
                                    </tr>
                                    <tr>

                                        <!-- 1º TRIMISTRE -->
                                        <th class="text-bold text-uppercase text-right">1ª</th>
                                        <th class="text-bold text-uppercase text-right">2ª</th>
                                            <!--
                                                if (haveT3) {
                                            -->
                                        <th class="text-bold text-uppercase text-right">3ª</th>
                                            <!--
                                                }
                                            -->
                                            <!--
                                                if (haveT4) {
                                            -->
                                        <th class="text-bold text-uppercase text-right">4ª</th>
                                            <!--
                                                }
                                            -->
                                        <th class="text-bold text-uppercase text-right">MÉDIA</th>
                                        <th class="text-bold text-uppercase text-right">1ª</th>

                                        <!--
                                            if (haveA2) {
                                        -->
                                        <th class="text-bold text-uppercase text-right">2ª</th>
                                            <!--
                                                }
                                            -->

                                        <th class="text-bold text-uppercase text-right">MÉDIA</th>
                                        <!-- 1º trimestre -->

                                        <!-- 2º TRIMISTRE -->
                                        <th class="text-bold text-uppercase text-right">1ª</th>
                                        <th class="text-bold text-uppercase text-right">2ª</th>
                                            <!--
                                                if (haveT3) {
                                            -->
                                        <th class="text-bold text-uppercase text-right">3ª</th>
                                            <!--
                                                }
                                            -->
                                            <!--
                                                if (haveT4) {
                                            -->
                                        <th class="text-bold text-uppercase text-right">4ª</th>
                                            <!--
                                                }
                                            -->
                                        <th class="text-bold text-uppercase text-right">MÉDIA</th>
                                        <th class="text-bold text-uppercase text-right">1ª</th>

                                        <!--
                                            if (haveA2) {
                                        -->
                                        <th class="text-bold text-uppercase text-right">2ª</th>
                                            <!--
                                                }
                                            -->
                                        <th class="text-bold text-uppercase text-right">MÉDIA</th>
                                        <!-- 2º trimestre -->

                                        <!-- 3º TRIMISTRE -->
                                        <th class="text-bold text-uppercase text-right">1ª</th>
                                        <th class="text-bold text-uppercase text-right">2ª</th>
                                            <!--
                                                if (haveT3) {
                                            -->
                                        <th class="text-bold text-uppercase text-right">3ª</th>
                                            <!--
                                                }
                                            -->
                                            <!--
                                                if (haveT4) {
                                            -->
                                        <th class="text-bold text-uppercase text-right">4ª</th>
                                            <!--
                                                }
                                            -->
                                        <th class="text-bold text-uppercase text-right">MÉDIA</th>
                                        <th class="text-bold text-uppercase text-right">1ª</th>

                                        <!--
                                            if (haveA2) {
                                        -->
                                        <th class="text-bold text-uppercase text-right">2ª</th>
                                            <!--
                                                }
                                            -->
                                        <th class="text-bold text-uppercase text-right">MÉDIA</th>
                                        <!-- 3º trimestre -->

                                    </tr>
                                </thead>
                                <tbody>

                                    <!--
                                        if (pautas != null) {
                                            for (Pauta p : pautas) {

                                                List<Notas> notas = p.getNotas();
                                                Inscricao i = p.getInscricao();

                                                String s1 = /*encryptUtils.decodeString(i.getAluno().getAlunBadgnumber()) + " - " + */ encryptUtils.decodeString(i.getAluno().getPessoa().getPessNome()) + " "
                                                        + encryptUtils.decodeString(i.getAluno().getPessoa().getPessApelido());
                                                String comp1 = "---";
                                                String comp2 = "---";
                                                String comp3 = "---";

                                                if (i.getInscComp1() != null) {
                                                    comp1 = encryptUtils.decodeString(i.getInscComp1());
                                                }

                                                if (i.getInscComp2() != null) {
                                                    comp2 = encryptUtils.decodeString(i.getInscComp2());
                                                }

                                                if (i.getInscComp3() != null) {
                                                    comp3 = encryptUtils.decodeString(i.getInscComp3());
                                                }

                                                float mediaFinal = 0;

                                                String status = "-";
                                                String lblStatus = "bg-slate-400";
                                                String lblMediaFinal = "text-slate-400";
                                    -->
                                    <tr>

                                        <td><!--=s1--></td>
                                        <!--

                                            if (notas != null) {
                                                for (Notas n : notas) {

                                                    String n1 = "-";
                                                    String n2 = "-";
                                                    String n3 = "-";
                                                    String n4 = "-";
                                                    String n5 = "-";
                                                    String n6 = "-";

                                                    String l1 = "text-danger";
                                                    String l2 = "text-danger";
                                                    String l3 = "text-danger";
                                                    String l4 = "text-danger";
                                                    String l5 = "text-danger";
                                                    String l6 = "text-danger";

                                                    String lblMediaACS = "text-slate-400";
                                                    String lblMediaACP = "text-slate-400";

                                                    String lblMedia = "text-slate-400";

                                                    float media = 0;
                                                    float mediaACS = 0;
                                                    float mediaACP = 0;

                                                    String comp = "-";
                                                    if (n != null) {

                                                        n1 = df.format(n.getNotaTeste1());
                                                        n2 = df.format(n.getNotaTeste2());
                                                        n3 = df.format(n.getNotaTeste3());
                                                        n4 = df.format(n.getNotaTeste4());
                                                        n5 = df.format(n.getNotaAcp());
                                                        n6 = df.format(n.getNotaAcp2());

                                                        media = n.getNotaMedia();
                                                        mediaACS = Math.round((n.getNotaTeste1() + n.getNotaTeste2() + n.getNotaTeste3() + n.getNotaTeste4()) / numACS);
                                                        mediaACP = Math.round((n.getNotaAcp() + n.getNotaAcp2()) / numACP);

                                                        if (n.getNotaTeste1() >= 10) {
                                                            l1 = "text-success";
                                                        }

                                                        if (n.getNotaTeste2() >= 10) {
                                                            l2 = "text-success";
                                                        }

                                                        if (n.getNotaTeste3() >= 10) {
                                                            l3 = "text-success";
                                                        }

                                                        if (n.getNotaTeste4() >= 10) {
                                                            l4 = "text-success";
                                                        }

                                                        if (n.getNotaAcp() >= 10) {
                                                            l5 = "text-success";
                                                        }

                                                        if (n.getNotaAcp2() >= 10) {
                                                            l6 = "text-success";
                                                        }

                                                        if (mediaACS < 10) {
                                                            lblMediaACS = "text-danger-700";
                                                        } else {
                                                            lblMediaACS = "text-success-700";
                                                        }

                                                        if (mediaACP < 10) {
                                                            lblMediaACP = "text-danger-700";
                                                        } else {
                                                            lblMediaACP = "text-success-700";
                                                        }

                                                        if (media < 10) {
                                                            lblMedia = "text-danger-700";
                                                        } else {
                                                            lblMedia = "text-success-400";
                                                        }

                                                        if (media >= 14) {
                                                            lblMedia = "text-success-800";
                                                        }

                                                        String sem = encryptUtils.decodeString(n.getNotaSemestre());

                                                        switch (sem) {
                                                            case "1º TRIMESTRE":
                                                                comp = comp1;
                                                                break;
                                                            case "2º TRIMESTRE":
                                                                comp = comp2;
                                                                break;
                                                            case "3º TRIMESTRE":
                                                                comp = comp3;
                                                                break;
                                                        }
                                                    }

                                                    mediaFinal += media;
                                        -->
                                        <td class="text-bold <!--=l1--> text-right"><!--=n1--></td>
                                        <td class="text-bold <!--=l2--> text-right"><!--=n2--></td>


                                        <!--
                                            if (haveT3) {
                                        -->
                                        <td class="text-bold <!--=l3--> text-right"><!--=n3--></td>

                                        <!--

                                            }-->
                                        <!--
                                            if (haveT4) {
                                        -->

                                        <td class="text-bold <!--=l4--> text-right"><!--=n4--></td>
                                        <!--
                                            }
                                        -->
                                        <td class="text-bold <!--=lblMediaACS--> text-right"><!--=mediaACS--></td>
                                        <td class="text-bold <!--=l5--> text-right"><!--=n5--></td>


                                        <!--
                                            if (haveA2) {
                                        -->
                                        <td class="text-bold <!--=l6--> text-right"><!--=n6--></td>
                                        <!--
                                            }
                                        -->
                                        <td class="text-bold <!--=lblMediaACP--> text-right"><!--=mediaACP--></td>
                                        <td class="text-bold <!--=lblMedia--> text-right"><!--=media--></td>
                                        <td class="text-bold"><!--=comp--></td>
                                        <!--
                                                }
                                            }

                                            mediaFinal = Math.round(mediaFinal / 3);

                                            if (mediaFinal < 10) {
                                                if (calendario.isCaleHaveExame()) {
                                                    status = "Excluido";
                                                } else {
                                                    status = "Reprovado";
                                                }

                                                lblStatus = "bg-danger-700";
                                                lblMediaFinal = "text-danger-700";
                                            } else {

                                                status = "Aprovado";
                                                lblStatus = "bg-success-400";
                                                lblMediaFinal = "text-success-400";

                                            }

                                            if (mediaFinal >= 14) {
                                                if (calendario.isCaleHaveExame()) {
                                                    status = "Dispensado";
                                                }

                                                lblStatus = "bg-success-800";
                                                lblMediaFinal = "text-success-800";
                                            }

                                            if (mediaFinal >= 9.5 && mediaFinal < 13.5) {
                                                if (calendario.isCaleHaveExame()) {
                                                    status = "Admitdo ao Exame";
                                                }

                                                lblStatus = "bg-slate-800";
                                                lblMediaFinal = "text-slate-800";
                                            }

                                        -->


                                        <td class="text-bold <!--=lblMediaFinal--> text-center"><!--=mediaFinal--></td>
                                        <td class="text-center"><span class="label <!--=lblStatus-->"><!--=status--></span></td>
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
