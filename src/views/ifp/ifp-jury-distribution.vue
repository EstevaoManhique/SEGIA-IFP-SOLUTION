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
                                        <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-split position-left"></i> Listagem dos Candidatos Distribuídos por Júri</a></li>
                                    </ul>
        
                                </div>
                            </div>
                            <!-- /toolbar -->
        
        
        
        
                            <div class = "row">
        
        
        
        
                                <!-- Vertical form options -->
                                <div class="col-md-12"> 
                                    <!-- Basic layout-->
        
                                    <form method="post" accept-charset="ISO-8859-1" action="SUZQU2VydmxldCNEQ0k=?YWNjYW8jZGlzdHJpYnVpY2FvLWp1cmlz">
                                        <div class="panel panel-flat">
                                            <div class="panel-body">
        
                                                <div class="row">
        
                                                    <div class="col-md-2">
        
                                                        <label class="control-label text-bold text-uppercase">Classe:</label>
        
                                                        <select class="select" name="idCurso" disabled="">
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
        
                                                        <label class="control-label text-bold text-uppercase">provincia:</label>
        
                                                        <select class="select" name="idProvincia"  placeholder="Selecione a provincia" id="make">
                                                            <optgroup label="Selecione a provincia">
                                                                <option></option>
        
                                                                <!--
                                                                    if (provinces != null) {
                                                                        for (EdstProvince ep : provinces) {
        
                                                                            int id = ep.getId();
                                                                            String desc = ep.getName();
        
                                                                            String sel = "";
        
                                                                            if (desc.equals(provinciaSel)) {
                                                                                sel = "selected";
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
        
                                                    <div class="col-md-4">
                                                        <label class="control-label text-bold text-uppercase">Escola:</label>
                                                        <select class="select" name="escola" data-placeholder="Selecione a escola" id="schools">
                                                            <optgroup label="Selecione a escola">
        
                                                            </optgroup>
                                                        </select>
        
                                                    </div>
        
                                                    <div class="col-md-3">
        
                                                        <label class="control-label text-bold text-uppercase">Disciplina:</label>
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
        
                                                </div> <!-- /row.1.1-->
        
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
        
                                                        if (anoLectivo != null) {
                                                            an = encryptUtils.decodeString(anoLectivo.getAnolDescricao());
                                                        }
                                                    -->
        
                                                    <br>
                                                    <div class="col-md-12">
                                                        <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                            <b><i class="icon-search4 position-right"></i></b> 
                                                            Filtrar Registos
                                                        </button>
        
                                                        <br><br>
        
                                                        <h4 class="text-bold">
                                                            <span class="text-danger-600"><!--=cur--></span> <span class="text-primary-600"> - [<!--=di-->]</span>  <span> - [<!--=provinciaSel + " : " + escolaSel-->]</span>
                                                        </h4>
                                                    </div>
                                                </div> <!-- /row.1.2-->
        
                                            </div>
                                        </div>
                                    </form>
                                    <!-- /basic layout -->
        
                                </div>
        
        
                            </div>
                            <!-- /row.1-->
        
                            <!-- User profile -->
                            <div class="row">
        
        
                                <!--
                                    if (turs != null) {
        
                                        for (Tur t : turs) {
        
                                            String desc = t.getDescricao();
                                            List<Estudante> estudantes = t.getEstudantes();
                                -->
        
                                <div class="col-md-6">
        
                                    <!-- Basic responsive configuration -->
                                    <div class="panel panel-flat">
                                        <div class="panel-heading">
                                            <h6 class="panel-title text-bold text-uppercase"><!--=desc--></h6>
                                            <div class="heading-elements">
                                                <ul class="icons-list">
                                                    <li><a data-action="collapse"></a></li>
                                                    <li><a data-action="reload"></a></li>
                                                </ul>
                                            </div>
                                        </div>
        
        
                                        <table class="table datatable-responsive">
                                            <thead>
                                                <tr>
                                                    <th class="text-bold text-uppercase">#</th>
                                                    <th class="text-bold text-uppercase">Cód.</th>
                                                    <th class="text-bold text-uppercase">Nome Aluno</th>
                                                    <th class="text-bold text-uppercase text-right">Idade</th>
                                                </tr>
                                            </thead>
                                            <tbody>
        
                                                <!--
        
                                                    if (estudantes != null) {
                                                        int i = 0;
                                                        for (Estudante e : estudantes) {
        
                                                            i++;
        
                                                            String nomeCompleto = e.getNome();
                                                            int idade = e.getIdade();
                                                            String cod = e.getId();
                                                -->
                                                <tr>
                                                    <td><a  href="#" class="text-bold"><!--=i--></a></td>
                                                    <td><small class="text-bold text-danger"><!--=cod--></small></td>
                                                    <td><small><!--=nomeCompleto--></small></td>
                                                    <td class="text-primary text-right"><!--=idade--></td>
                                                </tr>
                                                <!--                                                }
                                                    }
                                                -->
        
                                            </tbody>
                                        </table>
        
                                    </div>
                                    <!-- /basic responsive configuration -->
                                </div>
        
                                <!--
                                        }
                                    }
                                -->
        
        
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
  components: {NavBar},
  data: () => ({}),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
