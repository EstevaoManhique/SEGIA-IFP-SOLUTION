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
                                            <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-bookmark position-left"></i> Listagem dos Candidatos Inscritos por Disciplina</a></li>
                                        </ul>
            
                                    </div>
                                </div>
                                <!-- /toolbar -->
            
                                <div class = "row">
                                    <!-- Vertical form options -->
                                    <div class="col-md-12"> 
                                        <!-- Basic layout-->
            
                                        <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?YWNjYW8jYXB1cmFkb3MtZGlzY2lwbGluYQ==">
                                            <div class="panel panel-flat">
                                                <div class="panel-body">
            
                                                    <div class="row">
            
                                                        <div class="col-md-2">
            
                                                            <label class="control-label text-bold text-uppercase">Classe:</label>
            
                                                            <select class="select" name="idCurso" disabled="">
                                                                <optgroup label="Selecione a classe">
                                                                    <option value=""></option>
                                                                </optgroup>
                                                            </select>
                                                        </div>
            
                                                        <div class="col-md-3">
            
                                                            <label class="control-label text-bold text-uppercase">provincia:</label>
            
                                                            <select class="select" name="idProvincia"  placeholder="Selecione a provincia" id="make" >
                                                                <optgroup label="Selecione a provincia">
                                                                    <option></option>                                                  
                                                                </optgroup>
                                                            </select>
            
                                                        </div>
            
                                                        <div class="col-md-4">
                                                            <label class="control-label text-bold text-uppercase">Escola:</label>
                                                            <select class="select" name="escola" data-placeholder="Selecione a escola" id="schools" >
                                                                <optgroup label="Selecione a escola">
                                                                    
                                                                    <option value="<%=escUs%>" selected></option>
                                                                    
                                                                </optgroup>
                                                            </select>
            
                                                        </div>
            
                                                        <div class="col-md-3">
            
                                                            <label class="control-label text-bold text-uppercase">Disciplina:</label>
                                                            <select class="select" name="idDisciplina">
                                                                <optgroup label="Selecione disciplina">
            
                                                           <option value=""></option>
                                                                </optgroup>
                                                            </select>
            
                                                        </div>
            
                                                    </div> <!-- /row.1.1-->
            
                                                    <div class="row">
                                                        <br>
                                                        <div class="col-md-4">
                                                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                                <b><i class="icon-search4 position-right"></i></b> 
                                                                Filtrar Registos
                                                            </button>
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
            
                                <div class="col-md-12">
            
                                        <!-- Basic responsive configuration -->
                                        <div class="panel panel-flat">
                                            <div class="panel-heading">
                                                <h6 class="panel-title text-bold text-uppercase">LISTA DE CANDIDATOS A EXAME  <i class=" icon-arrow-right7"></i>  <span class="text-danger-600"></span> <span class="text-primary-600"></span> <span></span></h6>
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li><a data-action="collapse"></a></li>
                                                        
                                                    </ul>
                                                </div>
                                            </div>
            
            
            
                                            <div class="panel-body">
            
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <button id="btnExport" onclick="fnExcelReport('id18', 'LISTA DE CANDIDATOS A EXAME', '<%=an%>', '<%=cur%> | DISCIPLINA: <%=di%>');" class="btn bg-success-600 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                            <b><i class="icon-file-excel"></i></b>
                                                            Exportar registos
                                                        </button>
                                                    </div>
                                                </div>
            
                                            </div>
            
            
                                            <table class="table datatable-responsive">
                                                <thead>
                                                    <tr>
                                                        <th class="text-bold text-uppercase">#</th>
                                                        <th class="text-bold text-uppercase">Província</th>
                                                        <th class="text-bold text-uppercase">Escola</th>
                                                        <th class="text-bold text-uppercase">Código</th>
                                                        <th class="text-bold text-uppercase">Candidato ID</th>
                                                        <th class="text-bold text-uppercase">Nome Completo</th>
                                                        <th class="text-bold text-uppercase">Género</th>
                                                        <th class="text-bold text-uppercase">Tipo de Doc.</th>
                                                        <th class="text-bold text-uppercase">Nº Do Documento</th>
                                                        <th class="text-bold text-uppercase">Grupo Científico</th>
                                                        <th class="text-bold text-uppercase">Disciplina</th>
                                                        <th class="text-bold text-uppercase text-center">---</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="text-bold text-primary-600"></td>
                                                        <td class="text-uppercase"></td>
                                                        <td class="text-uppercase"></td>
                                                        <td class="text-uppercase"></td>
                                                        <td class="text-bold"></td>
                                                        <td class="text-uppercase"></td>
                                                        <td class="text-uppercase"></td>
                                                        <td class="text-uppercase"></td>
                                                        <td class="text-uppercase"></td>
                                                        <td class="text-uppercase"></td>
                                                        <td class="text-uppercase"></td>
                                                        <td class="text-center">
                                                            <a href='<%=actF%>' data-popup="tooltip" title="Corrigir Júri"><i class="icon-user-check <%=colorF%>"></i></a>
                                                            <a href='<%=actE%>' data-popup="tooltip" title="Editar"><i class="icon-pencil4 <%=colorE%>"></i></a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
            
            
            
            
                                            <table class="table" hidden="" id="id18">
                                                <thead>
                                                    <tr>
                                                        <th class="text-bold text-uppercase">#</th>
                                                        <th class="text-bold text-uppercase">Província</th>
                                                        <th class="text-bold text-uppercase">Escola</th>
                                                        <th class="text-bold text-uppercase">Código</th>
                                                        <th class="text-bold text-uppercase">Candidato ID</th>
                                                        <th class="text-bold text-uppercase">Nome Completo</th>
                                                        <th class="text-bold text-uppercase">Género</th>
                                                        <th class="text-bold text-uppercase">Tipo de Doc.</th>
                                                        <th class="text-bold text-uppercase">Nº Do Documento</th>
                                                        <th class="text-bold text-uppercase">Grupo Científico</th>
                                                        <th class="text-bold text-uppercase">Disciplina</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="text-bold text-primary-600"></td>
                                                        <td class="text-uppercase"></td>
                                                        <td class="text-uppercase"></td>
                                                        <td class="text-uppercase"></td>
                                                        <td class="text-bold"></td>
                                                        <td class="text-uppercase"></td>
                                                        <td class="text-uppercase"></td>
                                                        <td class="text-uppercase"></td>
                                                        <td class="text-uppercase"></td>
                                                        <td class="text-uppercase"></td>
                                                        <td class="text-uppercase"></td>
                                                    </tr>
            
            
                                                </tbody>
                                            </table>
            
                                        </div>
                                        <!-- /basic responsive configuration -->
                                    </div>
            
                                </div>
                                <!-- /row.2 -->
            
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