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
                                            class="icon-transmission position-left"></i>
                                        Transferir
                                        para
                                        Escola</a>
                                </li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->


                    <div class="row">

                        <!-- Vertical form options -->
                        <div class="col-md-6">
                            <!-- Basic layout-->

                            <form method="post" accept-charset="ISO-8859-1" action="QWx1bm9TZXJ2bGV0I0RDSQ==?YWNjYW8jdHJhbnNmZXJpci1lc2NvbGE=">
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
                            <!-- String
                                act3=encryptUtils.encodeString("accao#filtrar-turma&to=transfer-to-school");
                                -->

                                <form method="post" accept-charset="ISO-8859-1" action="QWx1bm9TZXJ2bGV0I0RDSQ==?<!--=act3-->">
                                    <div class="panel panel-flat">
                                        <div class="panel-body">

                                            <div class="form-group">
                                                <div class="col-lg-12">
                                                    <div class="row">

                                                        <div class="col-md-7">


                                                            <select class="select" name="idTurma">
                                                                <optgroup
                                                                    label="Selecione a turma">

                                                                    <!-- if
                                                                        (turmas
                                                                        !=null)
                                                                        {
                                                                        for
                                                                        (Turma
                                                                        t
                                                                        :
                                                                        turmas)
                                                                        {
                                                                        int
                                                                        id=t.getTurmId();
                                                                        String
                                                                        desc=encryptUtils.decodeString(t.getTurmReferencia())
                                                                        + " - "
                                                                        +
                                                                        encryptUtils.decodeString(t.getTurmDescricao());
                                                                        String
                                                                        sel=""
                                                                        ;
                                                                        if
                                                                        (turma
                                                                        !=null)
                                                                        {
                                                                        if
                                                                        (id==turma.getTurmId())
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
                                                                Turma
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


                        <!-- String dd="" ; String
                            cur="" ; if (turma
                            !=null) {
                            dd=encryptUtils.decodeString(turma.getTurmDescricao());
                            cur=encryptUtils.decodeString(turma.getCurso().getCursCod())
                            + " - " +
                            encryptUtils.decodeString(turma.getCurso().getCursDescricao());
                            } -->

                            <div class="col-md-12 col-md-offset-0">

                                <!-- Basic responsive configuration -->
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">
                                            Listagem dos Alunos da Turma
                                            <span class="text-danger-600">[
                                                <!--=cur
                                                    + "| Turma:"
                                                    +
                                                    dd-->
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
                                    <table class="table datatable-responsive">
                                        <thead>
                                            <tr>
                                                <th class="text-bold text-uppercase">
                                                    Cod. Inscrição
                                                </th>
                                                <th class="text-bold text-uppercase">
                                                    Cod. Aluno
                                                </th>
                                                <th class="text-bold text-uppercase">
                                                    Nome
                                                </th>
                                                <th class="text-bold text-uppercase">
                                                    Contacto
                                                </th>
                                                <th class="text-bold text-uppercase">
                                                    Nível de formação
                                                </th>
                                                <th class="text-bold text-uppercase">
                                                    Horário
                                                </th>
                                                <th class="text-center text-bold text-uppercase text-danger-600">
                                                    ---
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
   
                                                <tr>
                                                    <td>
                                                        <a href=" #">
                                                            <!--=ref-->
                                                        </a>
                                                    </td>
                                                    <td class="text-bold text-danger-600">
                                                        <!--=bg-->
                                                    </td>
                                                    <td class="text-bold">
                                                        <!--=s1-->
                                                    </td>
                                                    <td>
                                                        <!--=s2-->
                                                    </td>
                                                    <td>
                                                        <!--=s3-->
                                                    </td>
                                                    <td class="text-bold">
                                                        <!--=s5-->
                                                    </td>
                                                    <td>
                                                      Estevao Junior
                                                    </td>
                                                  </tr>
                                        </tbody>
                                      </table>
                                                        <a href="#" data-toggle="modal" data-target="#modal_rem_<!--=id-->" data-popup="tooltip" title="Transferir Aluno"><i
                                                                class="icon-transmission text-slate-800"></i></a>


                                                        <!-- Danger modal -->
                                                        <div id="modal_rem_<!--=id-->" class="modal fade">
                                                            <div class="modal-dialog modal-lg">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                        <h6 class="modal-title text-semibold">
                                                                            Confirma a transferência do(a) aluno(a)
                                                                            <span class="text-bold text-danger-600">
                                                                                <!--=s1-->
                                                                            </span>                                                                                                                                                ?
                                                                        </h6>
                                                                    </div>

                                                                    <!-- 2 columns form -->
                                                                    <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="QWx1bm9TZXJ2bGV0I0RDSQ==?<!--=actA-->">

                                                                        <div class="modal-body">


                                                                            <!-- String
                                                                                vlBtn="Transferir Aluno"
                                                                                ;
                                                                                -->


                                                                                <div class="panel panel-flat">

                                                                                    <div class="panel-body">
                                                                                        <div class="row">



                                                                                            <div class="col-md-12">

                                                                                                <fieldset>
                                                                                                    <legend class="text-semibold">
                                                                                                        <i class="icon-clipboard2 position-left"></i> Transferência para Escola
                                                                                                    </legend>


                                                                                                    <div class="form-group">
                                                                                                        <label class="col-lg-3 control-label text-bold text-uppercase">Escola:</label>
                                                                                                        <div class="col-lg-9">
                                                                                                            <div class="row">
                                                                                                                <div class="col-md-10">
                                                                                                                    <select data-placeholder="Selecione uma escola" class="select" name="escola" required="" id="make">
                                                                                                                        <option>
                                                                                                                        </option>
                                                                                                                        <!-- if
                                                                                                                            (entidades
                                                                                                                            !=null)
                                                                                                                            {
                                                                                                                            for
                                                                                                                            (Entidade
                                                                                                                            e
                                                                                                                            :
                                                                                                                            entidades)
                                                                                                                            {
                                                                                                                            String
                                                                                                                            desc=encryptUtils.decodeString(e.getEntiNome());
                                                                                                                            -->
                                                                                                                            <option
                                                                                                                                value="<!--=desc-->">
                                                                                                                                <!--=desc-->
                                                                                                                            </option>
                                                                                                                            <!-- } }
                                                                                                                                -->
                                                                                                                    </select>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>

                                                                                                    <div class="form-group">
                                                                                                        <label class="col-lg-3 control-label text-bold text-uppercase">
                                                                                                            Classe:</label>
                                                                                                        <div class="col-lg-9">
                                                                                                            <div class="row">
                                                                                                                <div class="col-md-10">
                                                                                                                    <select data-placeholder="Selecione a classe" class="select" name="classe" id="models">
                                                                                                                        <option>
                                                                                                                        </option>

                                                                                                                    </select>
                                                                                                                </div>
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

                                                                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800">
                                                                                <!--=vlBtn-->
                                                                                    <i
                                                                                        class="icon-transmission position-right"></i>
                                                                            </button>

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
