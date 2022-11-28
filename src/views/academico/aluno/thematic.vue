<template>
    <v-container>
        <nav-bar :menu_types = "5"/>
        <v-row>
              <!-- Main content -->
              <div class="content-wrapper">


                <!-- Toolbar -->
                <div class="navbar navbar-default navbar-component navbar-xs">
                    <ul class="nav navbar-nav visible-xs-block">
                        <li class="full-width text-center">
                            <a data-toggle="collapse" data-target="#navbar-filter"><i
                                    class="icon-menu7"></i></a>
                        </li>
                    </ul>

                    <div class="navbar-collapse collapse" id="navbar-filter">
                        <ul class="nav navbar-nav element-active-slate-400">
                            <li class="active">
                                <a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i
                                        class="icon-books position-left"></i>
                                    Planos
                                    de
                                    Aulas</a>
                            </li>
                        </ul>

                    </div>
                </div>
                <!-- /toolbar -->





                <div class="row">
                    <!-- Vertical form options -->
                    <div class="col-md-6">
                        <!-- Basic layout-->

                        <form method="post" accept-charset="ISO-8859-1" action="UGxhbm9zU2VydmxldCNEQ0k=?YWNjYW8jcGxhbm9hdWxh">
                            <div class="panel panel-flat">
                                <div class="panel-body">

                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <div class="row">

                                                <div class="col-md-7">

                                                    <select class="select" name="idCurso">
                                                        <optgroup
                                                            label="Selecione a classe">

                                                            <!-- if
                                                                (cursos
                                                                !=null)
                                                                {
                                                                for
                                                                (Curso
                                                                c
                                                                :
                                                                cursos)
                                                                {
                                                                int
                                                                id=c.getCursId();
                                                                String
                                                                desc=encryptUtils.decodeString(c.getCursCod())
                                                                + " - "
                                                                +
                                                                encryptUtils.decodeString(c.getCursDescricao());
                                                                String
                                                                sel=""
                                                                ;
                                                                if
                                                                (curso
                                                                !=null)
                                                                {
                                                                if
                                                                (id==curso.getCursId())
                                                                {
                                                                sel="selected"
                                                                ;
                                                                }
                                                                }
                                                                -->
                                                                <option value=""></option>
                                                                <!-- } }
                                                                    -->

                                                        </optgroup>
                                                    </select>
                                                </div>

                                                <div class="col-md-3">
                                                    <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-slate-800 btn-labeled text-bold text-uppercase">
                                                        <b><i
                                                                class="icon-search4 position-right"></i></b>
                                                        Filtrar
                                                        Classe
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


                        <form method="post" accept-charset="ISO-8859-1" action="UGxhbm9zU2VydmxldCNEQ0k=?YWNjYW8jcGxhbm9hdWxh">
                            <div class="panel panel-flat">
                                <div class="panel-body">

                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <div class="row">

                                                <div class="col-md-7">


                                                    <select class="select" name="idDisciplina">
                                                        <optgroup
                                                            label="Selecione disciplina">

                                                            <!-- if
                                                                (disciplinas
                                                                !=null)
                                                                {
                                                                for
                                                                (Disciplina
                                                                d
                                                                :
                                                                disciplinas)
                                                                {
                                                                int
                                                                id=d.getDiscId();
                                                                String
                                                                desc=encryptUtils.decodeString(d.getDiscDescricao());
                                                                String
                                                                sel=""
                                                                ;
                                                                if
                                                                (disciplina
                                                                !=null)
                                                                {
                                                                if
                                                                (id==disciplina.getDiscId())
                                                                {
                                                                sel="selected"
                                                                ;
                                                                }
                                                                }
                                                                -->
                                                                <option value=""></option>
                                                                <!-- } }
                                                                    -->
                                                        </optgroup>
                                                    </select>
                                                </div>

                                                <div class="col-md-3">
                                                    <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                        <b><i
                                                                class="icon-search4 position-right"></i></b>
                                                        Filtrar
                                                        Disciplina
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

                    <!-- String cur="" ;
                        String dis="" ;
                        if (curso
                        !=null) {
                        cur=encryptUtils.decodeString(curso.getCursDescricao());
                        } if (disciplina
                        !=null) {
                        dis=encryptUtils.decodeString(disciplina.getDiscDescricao());
                        } -->


                        <div class="col-md-10 col-md-offset-1">

                            <!-- Basic responsive configuration -->
                            <div class="panel panel-flat">
                                <div class="panel-heading">

                                    <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">
                                        Programa Temático
                                        <span class="text-danger-600">[
                                            <!--=cur-->
                                                |
                                                <!--=dis-->
                                                    ]</span>
                                    </h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li>
                                                <a data-action="collapse"></a>
                                            </li>
                                            <li>
                                                <a data-action="reload"></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>


                                <div class="panel-body">
                                    <p>
                                        <a href="#" target="_blank" class="btn bg-slate-400 btn-labeled btn-lg text-bold text-uppercase">
                                            <b><i
                                                    class="icon-printer2"></i></b>                                                                                                                            Imprimir registos
                                        </a>
                                    </p>

                                </div>

                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="text-bold text-uppercase">
                                                #
                                            </th>
                                            <th class="text-bold text-uppercase">
                                                Contéudo
                                            </th>
                                            <th class="text-bold text-uppercase">
                                                Tema
                                            </th>
                                            <th class="text-bold text-uppercase">
                                                Data
                                            </th>
                                            <th class="text-bold text-uppercase text-center text-danger-600">
                                                ---
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- int
                                            t1=0;
                                            int
                                            t2=0;
                                            if
                                            (sumarios
                                            !=null)
                                            {
                                            int
                                            i=0;
                                            for
                                            (Sumario
                                            s
                                            :
                                            sumarios)
                                            {
                                            int
                                            id=s.getSumaId();
                                            i++;
                                            String
                                            s1=encryptUtils.decodeString(s.getSumaDescricao());
                                            String
                                            s2=encryptUtils.decodeString(s.getSumaBibliografia());
                                            String
                                            s3=encryptUtils.decodeString(s.getSumaAvaliacao());
                                            String
                                            s4=encryptUtils.decodeString(s.getSumaMetodologia());
                                            String
                                            s5=encryptUtils.decodeString(s.getSumaObjectivo());
                                            String
                                            s6=encryptUtils.decodeString(s.getSumaRecursos());
                                            String
                                            s7=encryptUtils.decodeString(s.getSumaResumo());
                                            String
                                            t=encryptUtils.decodeString(s.getTema().getTemaDescricao());
                                            String
                                            dte=sdf.format(s.getSumaData().toGregorianCalendar().getTime());
                                            String
                                            actR=encryptUtils.encodeString("accao#remover-sumario&ei=" + id);


-->
                                            <tr>
                                                <td>
                                                    <a href=" #">
                                                        <!--=i-->
                                                    </a>
                                                </td>
                                                <td>
                                                    <!--=s1-->
                                                </td>
                                                <td class="text-bold text-danger-600">
                                                    <!--=t-->
                                                </td>
                                                <td class="text-bold">
                                                    <!--=dte-->
                                                </td>

                                                <td>
                                                    <a href="#" data-toggle="modal" data-target="#modal_resp_<!--=id-->" data-popup="tooltip" title="Mais detalhes do plano de aula"><i
                                                            class="icon-info22 text-primary-600"></i></a>
                                                    <a href="#" data-toggle="modal" data-target="#modal_rem_<!--=id-->" data-popup="tooltip" title="Remover registo"><i
                                                            class="icon-cancel-circle2 text-danger-800"></i></a>



                                                    <!-- Danger modal -->
                                                    <div id="modal_rem_<!--=id-->" class="modal fade">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <h6 class="modal-title text-semibold">
                                                                        Confirma a remoção do sumário com a referência #
                                                                        <!--=id-->
                                                                            ?
                                                                    </h6>
                                                                </div>
                                                                <div class="modal-body text-center">
                                                                    <h6 class="text-bold text-danger">
                                                                        <i class="icon-question6 text-danger" style="font-size: 100px"></i>
                                                                    </h6>

                                                                </div>

                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn text-bold text-uppercase btn-link" data-dismiss="modal">Cancelar</button>

                                                                    <a href="UGxhbm9zU2VydmxldCNEQ0k=?<!--=actR-->" class="btn text-bold text-uppercase btn-danger">Sim,
                                                                        confirmo
                                                                        !</a>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /danger modal -->


                                                    <!-- Table modal -->
                                                    <div id="modal_resp_<!--=id-->" class="modal fade">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <h6 class="modal-title text-bold">
                                                                        PLANO DE AULA
                                                                    </h6>
                                                                </div>
                                                                <div class="modal-body">

                                                                    <table class="table table-bordered table-striped">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="text-bold text-uppercase text-danger-600">
                                                                                    Disciplina
                                                                                </td>
                                                                                <td>
                                                                                    <!--=dis-->
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-bold text-uppercase text-danger-600">
                                                                                    Tema
                                                                                </td>
                                                                                <td>
                                                                                    <!--=t-->
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-bold text-uppercase text-danger-600">
                                                                                    Contéudo
                                                                                </td>
                                                                                <td>
                                                                                    <!--=s1-->
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-bold text-uppercase text-danger-600">
                                                                                    Data
                                                                                </td>
                                                                                <td>
                                                                                    <!--=dte-->
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>


                                                                    <h6 class="text-danger-600 text-uppercase text-bold">
                                                                        OBJECTIVOS
                                                                    </h6>
                                                                    <!--=s5-->
                                                                        <hr>
                                                                        <h6 class="text-danger-600 text-uppercase text-bold">
                                                                            RESUMO DO CONTEÚDO A SER TRABALHADO
                                                                        </h6>
                                                                        <!--=s7-->
                                                                            <hr>
                                                                            <h6 class="text-danger-600 text-uppercase text-bold">
                                                                                METODOLOGIA
                                                                            </h6>
                                                                            <!--=s4-->
                                                                                <hr>
                                                                                <h6 class="text-danger-600 text-uppercase text-bold">
                                                                                    RECURSOS NECESSÁRIOS
                                                                                </h6>
                                                                                <!--=s6-->
                                                                                    <hr>
                                                                                    <h6 class="text-danger-600 text-uppercase text-bold">
                                                                                        AVALIAÇÃO
                                                                                    </h6>
                                                                                    <!--=s3-->
                                                                                        <hr>
                                                                                        <h6 class="text-danger-600 text-uppercase text-bold">
                                                                                            BIBLIOGRAFIA DE APOIO
                                                                                        </h6>
                                                                                        <!--=s2-->
                                                                </div>

                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn text-bold text-uppercase btn-link" data-dismiss="modal">Fechar</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /table modal -->


                                                </td>

                                            </tr>
                                            <!-- } }
                                                    -->
                                    </tbody>
                                </table>
                            </div>
                            <!-- /basic responsive configuration -->



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
