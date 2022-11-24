<template>
  <v-container>
      <nav-bar :menu_types = "4"/>
      <v-row>
          <div class="content-wrapper">
                              <!-- Main content -->
                              <div class="content-wrapper">


                                <!-- Toolbar -->
                                <div class="navbar navbar-default navbar-component navbar-xs">
                                    <ul class="nav navbar-nav visible-xs-block">
                                        <li class="full-width text-center"><a data-toggle="collapse" data-target="#navbar-filter"><i class="icon-menu7"></i></a></li>
                                    </ul>
            
                                    <div class="navbar-collapse collapse" id="navbar-filter">
                                        <ul class="nav navbar-nav element-active-orange-400">
                                            <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-collaboration position-left"></i> Visualizar Júri</a></li>
                                        </ul>
            
                                    </div>
                                </div>
                                <!-- /toolbar -->
            
            
            
            
            
                                <div class = "row">
            
            
            
                                    <!-- Vertical form options -->
                                    <div class="col-md-6"> 
                                        <!-- Basic layout-->
            
                                        <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?YWNjYW8jdHVybWFz">
                                            <div class="panel panel-flat">
                                                <div class="panel-body">
            
                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <div class="row">
            
                                                                <div class="col-md-7">
            
                                                                    <select class="select" name="idCurso">
                                                                        <optgroup label="Selecione a classe">
            
                                                                       <option value=""></option>
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
            
                                        <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?YWNjYW8jdHVybWFz">
                                            <div class="panel panel-flat">
                                                <div class="panel-body">
            
                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <div class="row">
            
                                                                <div class="col-md-7">
            
            
                                                                    <select class="select" name="idDisciplina">
                                                                        <optgroup label="Selecione disciplina">
            
                                                                         <option value=""></option>
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
            
                                       
            
                                        <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?<%=act4%>">
                                            <div class="panel panel-flat">
                                                <div class="panel-body">
            
                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <div class="row">
            
                                                                <div class="col-md-7">
            
            
                                                                    <select class="select" name="idSala">
                                                                        <optgroup label="Selecione uma Sala">
                                                                            <option value=""></option>
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
            
                                    <div class="col-md-5">
            
            
                                        <div class="row">
                                            <!-- Basic table -->
                                            <div class="panel panel-flat">
                                                <div class="panel-heading">
                                                    <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Detalhes da turma</h6>
                                                    <div class="heading-elements">
                                                        <ul class="icons-list">
                                                            <li><a data-action="collapse"></a></li>
                                                            
            
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <tbody>
                                                            <tr>
                                                                <td class="text-bold">Sala: </td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-bold">Capacidade: </td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-bold">Data: </td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-bold">Júri 1: </td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-bold">Júri 2: </td>
                                                                <td></td>
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
                                                            
                                                        </ul>
                                                    </div>
                                                </div>
            
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
                                                <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Lista dos alunos da turma <span class="text-danger"></span></h6>
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li><a data-action="collapse"></a></li>
                                                        
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
                                       
                                                    <tr>
                                                        <td><a href="#"></a></td>
                                                        <td></td>
                                                        <td class="text-bold text-slate text-right"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- /basic responsive configuration -->
            
            
            
                                    </div>
                                    <!-- /vertical form options -->
                                </div>	
            
            
                            </div>
                            <!-- /main content -->
          </div>
      </v-row>
  </v-container>
</template>

<script>
import NavBar from '@/components/layout/NavBar.vue';
export default {
  components:{NavBar}
};
</script>

<style>
</style>