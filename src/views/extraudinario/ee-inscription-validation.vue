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
                                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-checkmark position-left"></i> LISTAGEM DE INSCRIÇÕES POR VALIDAR</a></li>
                                            </ul>
                
                                        </div>
                                    </div>
                                    <!-- /toolbar -->
                
                                    <div class = "row">
                                        <!-- Vertical form options -->
                                        <div class="col-md-12"> 
                                            <!-- Basic layout-->
                
                                            <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?YWNjYW8jdmFsaWRhci1pbnNjcmljb2Vz">
                                                <div class="panel panel-flat">
                                                    <div class="panel-body">
                
                                                        <div class="row">
                
                
                                                            <div class="col-md-3">
                
                                                                <label class="control-label text-bold text-uppercase">provincia:</label>
                
                                                                <select class="select" name="idProvincia"  placeholder="Selecione a provincia" id="make" >
                                                                    <optgroup label="Selecione a provincia">
                                                                        <option></option>
                
                                                            
                                                                        <option></option>
                                                                 
                                                                    </optgroup>
                                                                </select>
                
                                                            </div>
                
                                                            <div class="col-md-5">
                                                                <label class="control-label text-bold text-uppercase">Escola:</label>
                                                                <select class="select" name="escola" data-placeholder="Selecione a escola" id="schools" required="">
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
                
                
                                    <!-- User profile -->
                                    <div class="row">
                
                
                
                
                
                                        <div class="col-md-12">
                
                                            <!-- Basic responsive configuration -->
                                            <div class="panel panel-flat">
                                                <div class="panel-heading">
                                                    <h6 class="panel-title text-bold text-uppercase">LISTAGEM DE INSCRIÇÕES POR VALIDAR <i class=" icon-arrow-right7"></i> <span class="text-danger-600"></span> <span class="text-primary-600"></span></h6>
                                                    <div class="heading-elements">
                                                        <ul class="icons-list">
                                                            <li><a data-action="collapse"></a></li>
                                                            
                                                        </ul>
                                                    </div>
                                                </div>
                
                
                
                                                <div class="panel-body">
                
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <button id="btnExport" onclick="fnExcelReport('id18', 'LISTAGEM DE ALUNOS POR VALIDAR', '<%=an%>', '<%=cur%>');" class="btn bg-success-600 btn-labeled btn-labeled-left text-bold text-uppercase">
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
                                                            <th class="text-bold text-uppercase">Nome Completo</th>
                                                            <th class="text-bold text-uppercase">Género</th>
                                                            <th class="text-bold text-uppercase">Tipo de Doc.</th>
                                                            <th class="text-bold text-uppercase">Nº Do Documento</th>
                                                            <th class="text-bold text-uppercase">Disciplina(s)</th>
                                                            <th class="text-bold text-uppercase text-center text-danger-600">---</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td class="text-bold text-primary-600"></td>
                                                            <td class="text-uppercase"></td>
                                                            <td class="text-uppercase text-bold"></td>
                                                            <td class="text-uppercase"></td>
                                                            <td class="text-uppercase"></td>
                                                            <td class="text-uppercase"></td>
                                                            <td class="text-uppercase"></td>
                                                            <td>
                
                                                                <small>
                                                                    <a href="#" data-toggle="modal" data-target="#modal_info_<%=id%>">
                                                                        Ver Disciplinas
                                                                    </a>
                                                                </small>
                
                                                                <!-- Vertical form modal -->
                                                                <div id="modal_info_<%=id%>" class="modal fade">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                                <h6 class="modal-title text-bold text-uppercase">Disciplinas do Candidato: <span class="text-danger-600"></span></h6>
                                                                            </div>
                
                                                                            <div class="modal-body">
                                                                                <h6></h6>
                                                                            </div>
                
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn bg-danger-600 text-bold text-uppercase" data-dismiss="modal">Fechar <i class="icon-chevron-down"></i> </button>
                                                                            </div>
                
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- /vertical form modal -->
                
                                                            </td>
                
                                                            <td class="text-center">
                                                                <a href='RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?<%=actE%>' data-popup="tooltip" title="Editar"><i class="icon-pencil4 text-primary-600"></i></a>
                                                                &nbsp;
                                                                <a href='RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?<%=actA%>' data-popup="tooltip" title="Validar"><i class="icon-check text-success-600"></i></a>
                                                                &nbsp;
                                                                <a href='RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?<%=actR%>' data-popup="tooltip" title="Remover"><i class="icon-cross text-danger-600"></i></a>
                
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
                                                            <th class="text-bold text-uppercase">Nome Completo</th>
                                                            <th class="text-bold text-uppercase">Género</th>
                                                            <th class="text-bold text-uppercase">Tipo de Doc.</th>
                                                            <th class="text-bold text-uppercase">Nº Do Documento</th>
                                                            <th class="text-bold text-uppercase">Grupo Científico</th>
                                                            <th class="text-bold text-uppercase">Disciplina(s)</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td class="text-bold text-primary-600"></td>
                                                            <td class="text-uppercase"></td>
                                                            <td class="text-uppercase text-bold"></td>
                                                            <td class="text-uppercase"></td>
                                                            <td class="text-uppercase"></td>
                                                            <td class="text-uppercase"></td>
                                                            <td class="text-uppercase"></td>
                                                            <td class="text-uppercase"></td>
                                                            <td class="text-uppercase"><small></small></td>
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