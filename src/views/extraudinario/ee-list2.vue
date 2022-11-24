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
                                            <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-user-check position-left"></i> Listagem dos Candidatos Inscritos</a></li>
                                        </ul>
            
                                    </div>
                                </div>
                                <!-- /toolbar -->
            
            
                                <div class = "row">
                                    <!-- Vertical form options -->
                                    <div class="col-md-12"> 
                                        <!-- Basic layout-->
            
                                        <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?YWNjYW8jYXB1cmFkb3M=">
                                            <div class="panel panel-flat">
                                                <div class="panel-body">
            
                                                    <div class="row">
            
                                                        <div class="col-md-2">
            
                                                            <label class="control-label text-bold text-uppercase">Classe:</label>
            
                                                            <select class="select" name="idCurso" disabled="">
                                                                <optgroup label="Selecione a classe">
            
                                               
                                                                    <option value="<%=id%>"></option>
                                                                                                                            
            
                                                                </optgroup>
                                                            </select>
                                                        </div>
            
                                                        <div class="col-md-3">
            
                                                            <label class="control-label text-bold text-uppercase">provincia:</label>
            
                                                            <select class="select" name="idProvincia"  placeholder="Selecione a provincia" id="make">
                                                                <optgroup label="Selecione a provincia">
                                                                    <option></option>
            
                                                            
                                                                    <option></option>
                                                                    
                                                                </optgroup>
                                                            </select>
            
                                                        </div>
            
                                                        <div class="col-md-4">
                                                            <label class="control-label text-bold text-uppercase">Escola:</label>
                                                            <select class="select" name="escola" data-placeholder="Selecione a escola" id="schools">
                                                                <optgroup label="Selecione a escola">
            
                                                                    <option value="<%=escUs%>" selected></option>
                                                                    
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
            
            
                                <!-- Row.1.1 -->
                                <div class="row">
            
            
                                    <div class="col-md-12">
            
                                        <!-- Basic responsive configuration -->
                                        <div class="panel panel-flat">
                                            <div class="panel-heading">
                                                <h6 class="panel-title text-bold text-uppercase">CORREÇÃO DE ANOMALIAS</h6>
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li><a data-action="collapse"></a></li>
            
                                                    </ul>
                                                </div>
                                            </div>
            
                                            <div class="panel-body">
            
                                                <div class="col-md-3">
                                                    <div class="form-group">
            
                                                  
                                                        <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?<%=actCod%>">
                                                            <button id="btnExport" class="btn bg-teal-600 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                                <b><i class="icon-barcode2"></i></b>
                                                                Corrigir Código Duplicados
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div> 
            
                                                <div class="col-md-3">
                                                    <div class="form-group">
            
            
                                                        <a href="#" data-toggle="modal" data-target="#modal_rem_dup" class="btn bg-danger-400 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                            <b><i class="icon-users2"></i></b>
                                                            Remover Duplicados
                                                        </a>
            
                                                        <!-- Danger modal -->
                                                        <div id="modal_rem_dup" class="modal fade text-center">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header"> 
                                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                        <h6 class="modal-title text-semibold">Confirma a remoção de todos alunos duplicados da lista ? Ao confirmar a acção não pode ser revertida!</h6>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <h6 class="text-bold text-danger" ><i class="icon-question6 text-danger" style="font-size: 100px"></i></h6>
            
                                                                    </div>
            
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn text-uppercase text-bold btn-link" data-dismiss="modal">Cancelar</button>
            
                                                                        <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?<%=actRem%>">
                                                                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn btn-danger text-bold text-uppercase">Sim, confirmo !</button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- /danger modal -->     
                                                    </div>
                                                </div> 
            
                                                <div class="col-md-3">
                                                    <div class="form-group">
            
                                                        <a href="#" data-toggle="modal" data-target="#modal_rem_all" class="btn bg-danger-800 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                            <b><i class="icon-user-cancel"></i></b>
                                                            Remover Toda Lista
                                                        </a>
            
            
                                                        <!-- Danger modal -->
                                                        <div id="modal_rem_all" class="modal fade text-center">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                        <h6 class="modal-title text-semibold">Confirma a remoção de todos alunos da lista ? Ao confirmar a acção não pode ser revertida!</h6>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <h6 class="text-bold text-danger" ><i class="icon-question6 text-danger" style="font-size: 100px"></i></h6>
            
                                                                    </div>
            
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn text-uppercase text-bold btn-link" data-dismiss="modal">Cancelar</button>
            
                                                                        <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?<%=actRemAll%>">
                                                                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn btn-danger text-bold text-uppercase">Sim, confirmo !</button>
            
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- /danger modal -->     
                                                    </div>
                                                </div> 
            
                                            </div>
            
                                        </div>
                                        <!-- /basic responsive configuration -->
            
                                    </div>
            
                                </div>
                                <!-- /row.1.1-->
            
            
                                <!-- User profile -->
                                <div class="row">
            
            
            
            
                                    <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?<%=act%>">
            
                                        <div class="col-md-12">
            
                                            <!-- Basic responsive configuration -->
                                            <div class="panel panel-flat">
                                                <div class="panel-heading">
                                                    <h6 class="panel-title text-bold text-uppercase">LISTA DE CANDIDATOS A EXAME  <i class=" icon-arrow-right7"></i>  <span class="text-danger-600"></span> <span></span></h6>
                                                    <div class="heading-elements">
                                                        <ul class="icons-list">
                                                            <li><a data-action="collapse"></a></li>
            
                                                        </ul>
                                                    </div>
                                                </div>
            
            
            
                                                <div class="panel-body">
            
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <button id="btnExport" onclick="fnExcelReport('id18', 'LISTA DE CANDIDATOS A EXAME', '<%=an%>', '<%=cur%>');" class="btn bg-success-600 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                                <b><i class="icon-file-excel"></i></b>
                                                                Exportar registos
                                                            </button>
                                                        </div>
                                                    </div>
            
            
                                                    <div class="col-md-3">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <label class="control-label text-bold text-uppercase"></label>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="form-group">
                                                                <a  href="#" data-toggle="modal" data-target="#modal_rem" class="btn bg-orange-600 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                                    <b> <i class="icon-clipboard2"></i></b>
                                                                    Actualizar Disciplinas
                                                                </a>
            
            
                                                                <!-- Danger modal -->
                                                                <div id="modal_rem" class="modal fade">
                                                                    <div class="modal-dialog modal-lg">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                                <h6 class="modal-title text-bold text-uppercase">Selecione as disciplinas</h6>
                                                                            </div>
            
                                                                            <!-- 2 columns form -->
            
                                                                            <div class="modal-body">
            
                                                                                <div class="panel panel-flat">
            
                                                                                    <div class="panel-body">
                                                                                        <div class="row">
            
            
            
                                                                                            <div class="col-md-12">
            
                                                                                                <fieldset>
                                                                                                    <legend class="text-semibold"><i class="icon-clipboard2 position-left"></i> Disciplinas a fazer exame</legend>
            
            
                                                                                                    <div class="form-group">
            
                                                                                                        <div class="checkbox">
                                                                                                            <label>
                                                                                                                <input type="checkbox" class="styled"  name="d1">
                                                                                                                Português
                                                                                                            </label>
                                                                                                        </div>
            
                                                                                                        <div class="checkbox">
                                                                                                            <label>
                                                                                                                <input type="checkbox" class="styled"  name="d2">
                                                                                                                Inglês
                                                                                                            </label>
                                                                                                        </div>
            
                                                                                                        <div class="checkbox">
                                                                                                            <label>
                                                                                                                <input type="checkbox" class="styled"  name="d3">
                                                                                                                Francês
                                                                                                            </label>
                                                                                                        </div>
            
                                                                                                        <div class="checkbox">
                                                                                                            <label>
                                                                                                                <input type="checkbox" class="styled"  name="d4">
                                                                                                                História
                                                                                                            </label>
                                                                                                        </div>
            
                                                                                                        <div class="checkbox">
                                                                                                            <label>
                                                                                                                <input type="checkbox" class="styled"  name="d5">
                                                                                                                Geografia
                                                                                                            </label>
                                                                                                        </div>
            
                                                                                                        <div class="checkbox">
                                                                                                            <label>
                                                                                                                <input type="checkbox" class="styled"  name="d6">
                                                                                                                Filosofia
                                                                                                            </label>
                                                                                                        </div>
            
                                                                                                        <div class="checkbox">
                                                                                                            <label>
                                                                                                                <input type="checkbox" class="styled"  name="d7">
                                                                                                                Matemática
                                                                                                            </label>
                                                                                                        </div>
            
                                                                                                        <div class="checkbox">
                                                                                                            <label>
                                                                                                                <input type="checkbox" class="styled"  name="d8">
                                                                                                                Física
                                                                                                            </label>
                                                                                                        </div>
            
                                                                                                        <div class="checkbox">
                                                                                                            <label>
                                                                                                                <input type="checkbox" class="styled"  name="d9">
                                                                                                                Química
                                                                                                            </label>
                                                                                                        </div>
            
                                                                                                        <div class="checkbox">
                                                                                                            <label>
                                                                                                                <input type="checkbox" class="styled"  name="d10">
                                                                                                                Biologia
                                                                                                            </label>
                                                                                                        </div>
            
                                                                                                        <div class="checkbox">
                                                                                                            <label>
                                                                                                                <input type="checkbox" class="styled"  name="d11">
                                                                                                                Desenho e Geometria Descritiva
                                                                                                            </label>
                                                                                                        </div>
                                                                                                    </div>
            
            
            
                                                                                                    <div class="form-group">
            
                                                                                                        <div class="checkbox">
                                                                                                            <label>
                                                                                                                <input type="checkbox" class="styled"  name="isRemove">
                                                                                                                <span class="text-bold text-danger">REMOVER DISCIPLINAS ?</span>
                                                                                                            </label>
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
                                                                                <button type="button" class="btn text-bold text-uppercase btn-link" data-dismiss="modal">Fechar</button>
            
                                                                                <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800">Actualizar Disciplinas <i class="icon-clipboard2 position-right"></i></button>
            
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- /default modal -->  
            
                                                            </div>
                                                        </div>
                                                    </div>   
            
                                                </div>
            
            
                                                <table class="table datatable-responsive">
                                                    <thead>
                                                        <tr>
                                                            <th class="text-bold text-uppercase"><input type="checkbox" class="styled"></th>
            
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
                                                            <td><input type="checkbox" name="noty_list" value="<%=id%>" class="styled"></td>
            
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
                                                                <a href='<%=actR%>' data-popup="tooltip" title="Remover"><i class="icon-cross <%=colorR%>"></i></a>
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
            
                                    </form>
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