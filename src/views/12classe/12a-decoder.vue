<template>
  <v-container>
    <nav-bar :menu_types="2" />
    <v-row>
         <div class="content-wrapper">


<!-- Toolbar -->
<div class="navbar navbar-default navbar-component navbar-xs">
    <ul class="nav navbar-nav visible-xs-block">
        <li class="full-width text-center"><a data-toggle="collapse" data-target="#navbar-filter"><i class="icon-menu7"></i></a></li>
    </ul>

    <div class="navbar-collapse collapse" id="navbar-filter">
        <ul class="nav navbar-nav element-active-orange-400">
            <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-download4 position-left"></i> Decoder de Leitura</a></li>
        </ul>

    </div>
</div>
<!-- /toolbar -->

<div class = "row">



    <!-- Vertical form options -->
    <div class="col-md-6">
        <!-- Basic layout-->

        <form method="post" accept-charset="ISO-8859-1" action="MTJDbGFzc2VTZXJ2bGV0I0RDSQ==?YWNjYW8jZGVjb2Rlcg==">
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
                                            <option value="<!--=id-->" <!--=sel-->><!--=desc--></option>
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

        <form method="post" accept-charset="ISO-8859-1" action="MTJDbGFzc2VTZXJ2bGV0I0RDSQ==?YWNjYW8jZGVjb2Rlcg==">
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
                                            <option value="<!--=id-->" <!--=sel-->><!--=desc--></option>
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

        <!--                                String act4 = encryptUtils.encodeString("accao#filtrar-salaExame&to=12a-decoder");
        -->

        <form method="post" accept-charset="ISO-8859-1" action="MTJDbGFzc2VTZXJ2bGV0I0RDSQ==?<!--=act4-->">
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
                                            <option value="<!--=id-->" <!--=sel-->><!--=desc--></option>
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






<!-- Vertical form options -->
<div class="row">


    <!--
        String dd = "";
        String cur = "";
        String di = "";

        String an = "";

        if (disciplina != null) {
            cur = "12ª Classe";
            di = encryptUtils.decodeString(disciplina.getDiscDescricao());
        }
    -->

    <div class="col-md-4">

        <!--
            String actX = encryptUtils.encodeString("accao#carregar-ficheiro-res");
        -->
        <!-- Basic layout-->
        <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="MTJDbGFzc2VTZXJ2bGV0I0RDSQ==?<!--=actX-->">
            <div class="panel panel-flat">

                <div class="panel-body">
                    <div class ="row">
                        <div class="col-md-12">

                            <fieldset>
                                <legend class="text-bold text-uppercase"><i class="icon-download10 position-left"></i>Carregamento de ficheiro</legend>




                                <div class="form-group">
                                    <label class="text-bold text-uppercase">Localizar ficheiro:</label>
                                    <br>


                                    Faça aqui o carregamento do documento com as senhas:

                                    <span class="help-block">Formatos aceites: xls, xlxs. Tamanho máximo 2Mb</span>

                                    <center>
                                        <iframe src="http://<!--=ip-->:8081/suc/index-import-segia.php" style=" width: 90%; height: 25em; background: transparent;" frameBorder="0" scrolling="no" id="upload_target" name="upload_target"> </iframe>
                                    </center>

                                </div>


                            </fieldset>

                        </div>

                    </div>

                    <div class="text-right">
                        <button type="submit" id='btn3' onclick="this.disabled = 'disabled'; this.form.submit();" class="text-bold text-uppercase btn bg-danger-600 text-bold text-uppercase">Carregar Ficheiro <i class="icon-download4 position-right"></i></button>
                    </div>
                </div>
            </div>
        </form>
        <!-- /basic layout -->


    </div>


    <div class="col-md-8">

        <!-- Basic responsive configuration -->
        <div class="panel panel-flat">
            <div class="panel-heading">
                <h6 class="panel-title text-bold text-uppercase">Listagem de dados à importar  <span class="text-danger-600">[<!--=cur + " | Turma:" + dd-->]</span> <span class="text-primary-600"> - [<!--=di-->]</span></h6>
                <div class="heading-elements">
                    <ul class="icons-list">
                        <li><a data-action="collapse"></a></li>
                        <li><a data-action="reload"></a></li>
                    </ul>
                </div>
            </div>


            <div class="panel-body">
                <p>

                    <!--
                        if (have) {
                    -->

                <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="MTJDbGFzc2VTZXJ2bGV0I0RDSQ==?YWNjYW8jY29uZmlybWFyLXVwbG9hZC1yZXM=">

                    <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="text-bold text-uppercase btn bg-primary-600 text-bold text-uppercase"> Confirmar importação de dados <i class="icon-check position-right"></i></button>
                </form>
                <!--
                    }
                -->

                </p>

            </div>


            <table class="table datatable-responsive">
                <thead>
                    <tr>
                        <th class="text-bold text-uppercase">#</th>
                        <th class="text-bold text-uppercase">Disciplina</th>
                            <!--
                                for (int i = 1; i <= 40; i++) {
                            -->
                        <th class="text-bold text-uppercase text-right">P<!--=i--></th>
                            <!--
                                }
                            -->
                    </tr>
                </thead>
                <tbody>
                    <!--
                        if (importacoes != null) {
                            for (ImpRes ir : importacoes) {

                                String cod = ir.getCod();
                                String dis = ir.getDis();
                                List<String> respostas = ir.getRespostas();
                    -->
                    <tr>

                        <td><!--=cod--></td>
                        <td><!--=dis--></td>
                        <!--
                            if (respostas != null) {
                                for (String s : respostas) {
                        -->
                        <td><!--=s--></td>

                        <!--
                                }
                            }
                        -->
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
<!-- /vertical form options -->


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
