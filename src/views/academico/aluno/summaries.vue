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
                                                                                                                                class="icon-clipboard3 position-left"></i>
                                                                                                                            Planos
                                                                                                                            Temáticos</a>
                                                                                                                    </li>
                                                                                                                </ul>
        
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <!-- /toolbar -->
        
        
        
        
        
                                                                                                        <div class="row">
                                                                                                            <!-- Vertical form options -->
                                                                                                            <div class="col-md-6">
                                                                                                                <!-- Basic layout-->
        
                                                                                                                <form method="post" accept-charset="ISO-8859-1" action="UGxhbm9zU2VydmxldCNEQ0k=?YWNjYW8jcGxhbm90ZW1hdGljbw==">
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
        
        
                                                                                                                <form method="post" accept-charset="ISO-8859-1" action="UGxhbm9zU2VydmxldCNEQ0k=?YWNjYW8jcGxhbm90ZW1hdGljbw==">
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
        
        
                                                                                                                <div class="col-md-8 col-md-offset-2">
        
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
                                                                                                                                    <th class="text-bold text-uppercase" rowspan=2>
                                                                                                                                        #
                                                                                                                                    </th>
                                                                                                                                    <th class="text-bold text-uppercase" rowspan=2>
                                                                                                                                        Temas
                                                                                                                                    </th>
                                                                                                                                    <th class="text-bold text-uppercase text-center" colspan="3">
                                                                                                                                        Horas
                                                                                                                                    </th>
                                                                                                                                </tr>
                                                                                                                                <tr>
        
                                                                                                                                    <th class="text-bold text-uppercase">
                                                                                                                                        Teóricas
                                                                                                                                    </th>
                                                                                                                                    <th class="text-bold text-uppercase">
                                                                                                                                        Práticas
                                                                                                                                    </th>
                                                                                                                                    <th class="text-bold text-uppercase">
                                                                                                                                        Total
                                                                                                                                    </th>
                                                                                                                                </tr>
                                                                                                                            </thead>
                                                                                                                            <tbody>
                                                                                                                                <!-- int
                                                                                                                                    t1=0;
                                                                                                                                    int
                                                                                                                                    t2=0;
                                                                                                                                    if
                                                                                                                                    (temas
                                                                                                                                    !=null)
                                                                                                                                    {
                                                                                                                                    int
                                                                                                                                    i=0;
                                                                                                                                    for
                                                                                                                                    (Tema
                                                                                                                                    t
                                                                                                                                    :
                                                                                                                                    temas)
                                                                                                                                    {
                                                                                                                                    int
                                                                                                                                    id=t.getTemaId();
                                                                                                                                    i++;
                                                                                                                                    String
                                                                                                                                    s1=encryptUtils.decodeString(t.getTemaDescricao());
                                                                                                                                    String
                                                                                                                                    s2=t.getTemaPratica()
                                                                                                                                    + ""
                                                                                                                                    ;
                                                                                                                                    String
                                                                                                                                    s3=t.getTemaTeorica()
                                                                                                                                    + ""
                                                                                                                                    ;
                                                                                                                                    String
                                                                                                                                    s4=(t.getTemaTeorica()
                                                                                                                                    +
                                                                                                                                    t.getTemaPratica())
                                                                                                                                    + ""
                                                                                                                                    ;
                                                                                                                                    t1
                                                                                                                                    +=t.getTemaPratica();
                                                                                                                                    t2
                                                                                                                                    +=t.getTemaTeorica();
                                                                                                                                    -->
                                                                                                                                    <tr>
                                                                                                                                        <td>
                                                                                                                                            <a href="#">
                                                                                                                                                <!--=i-->
                                                                                                                                            </a>
                                                                                                                                        </td>
                                                                                                                                        <td class="text-bold">
                                                                                                                                            <!--=s1-->
                                                                                                                                        </td>
                                                                                                                                        <td class="text-center">
                                                                                                                                            <!--=s2-->
                                                                                                                                        </td>
                                                                                                                                        <td class="text-center">
                                                                                                                                            <!--=s3-->
                                                                                                                                        </td>
                                                                                                                                        <td class="text-bold">
                                                                                                                                            <!--=s4-->
                                                                                                                                        </td>
        
                                                                                                                                    </tr>
                                                                                                                                    <!-- } }
                                                                                                                                        -->
        
                                                                                                                                        <tr>
                                                                                                                                            <td class="text-bold" colspan="2">
                                                                                                                                                Total
                                                                                                                                            </td>
                                                                                                                                            <td class="text-center">
                                                                                                                                                <!--=t1-->
                                                                                                                                            </td>
                                                                                                                                            <td class="text-center">
                                                                                                                                                <!--=t2-->
                                                                                                                                            </td>
                                                                                                                                            <td class="text-bold">
                                                                                                                                                <!--=t1
                                                                                                                                                    +
                                                                                                                                                    t2-->
                                                                                                                                            </td>
        
                                                                                                                                        </tr>
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
