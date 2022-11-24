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
                                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-split position-left"></i> Listagem dos Candidatos Distribuídos por Júri</a></li>
                                            </ul>
                
                                        </div>
                                    </div>
                                    <!-- /toolbar -->
                
                                    <div class = "row">
                                        <!-- Vertical form options -->
                                        <div class="col-md-12"> 
                                            <!-- Basic layout-->
                
                                            <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?YWNjYW8jZGlzdHJpYnVpY2FvLWp1cmlz">
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
                
                                                                <select class="select" name="idProvincia"  placeholder="Selecione a provincia" id="make">
                                                                    <optgroup label="Selecione a provincia">
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
                                                            <div class="col-md-12">
                                                                <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                                    <b><i class="icon-search4 position-right"></i></b> 
                                                                    Filtrar Registos
                                                                </button>
                
                                                                <br><br>
                
                                                                <h4 class="text-bold">
                                                                    <span class="text-danger-600"></span> <span class="text-primary-600"></span>  <span> </span>
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
                
                
                                        <div class="col-md-6">
                
                                            <!-- Basic responsive configuration -->
                                            <div class="panel panel-flat">
                                                <div class="panel-heading">
                                                    <h6 class="panel-title text-bold text-uppercase"></h6>
                                                    <div class="heading-elements">
                                                        <ul class="icons-list">
                                                            <li><a data-action="collapse"></a></li>
                                                            
                                                        </ul>
                                                    </div>
                                                </div>
                
                
                
                                                <div class="panel-body">
                
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <button id="btnExport" onclick="fnExcelReport('id<%=x%>', 'LISTAGEM DE CANDIDATOS (<%=desc%>) - <%=di%>', '<%=an%>', '<%=cur%>', '<%=loc%>');" class="btn bg-success-800 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                                <b><i class="icon-file-excel"></i></b>
                                                                Exportar Júri
                                                            </button>
                                                        </div>
                
                                                    </div>
                
                                                    <div class="col-md-1"></div>
                
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <button id="btnExport" onclick="fnExcelReport('idP<%=x%>', 'LISTAGEM DE CANDIDATOS - PRESENÇAS (<%=desc%>) - <%=di%>', '<%=an%>', '<%=cur%>', '<%=loc%>');" class="btn bg-teal-600 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                                <b><i class="icon-file-excel"></i></b>
                                                                Exportar Lista de presenças
                                                            </button>
                                                        </div>
                                                    </div>
                
                                                </div>
                
                
                                                <table class="table datatable-responsive">
                                                    <thead>
                                                        <tr>
                                                            <th class="text-bold text-uppercase">#</th>
                                                            <th class="text-bold text-uppercase">Cód.</th>
                                                            <th class="text-bold text-uppercase">Nome Candidato</th>
                                                            <th class="text-bold text-uppercase">Género</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                
                                                   
                                                        <tr>
                                                            <td><a  href="#" class="text-bold"></a></td>
                                                            <td><small class="text-bold text-danger"></small></td>
                                                            <td><small></small></td>
                                                            <td><small></small></td>
                                                        </tr>
                
                                                    </tbody>
                                                </table>
                
                
                                                <table  class="table" hidden="" id="id<%=x%>">
                                                    <thead>
                                                        <tr>
                                                            <th class="text-bold text-uppercase">Cód. Candidato</th>
                                                            <th class="text-bold text-uppercase">Nº</th>
                                                            <th class="text-bold text-uppercase">Nome Candidato</th>
                                                            <th class="text-bold text-uppercase">Género</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td style="width: 200px;"><small></small></td>
                                                            <td><small></small></td>
                                                            <td style="width: 600px;"><small></small></td>
                                                            <td><small></small></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                
                
                
                                                <table  class="table" hidden="" id="idP<%=x%>">
                                                    <thead>
                                                        <tr>
                                                            <th class="text-bold text-uppercase">Cód. Candidato</th>
                                                            <th class="text-bold text-uppercase">Nº</th>
                                                            <th class="text-bold text-uppercase">Nome Candidato</th>
                                                            <th class="text-bold text-uppercase">Género</th>
                                                            <th class="text-bold text-uppercase">Nº Doc. Identificação</th>
                                                            <th class="text-bold text-uppercase">Asinatura do Candidato</th>
                                                            <th class="text-bold text-uppercase">OBS.</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td style="width: 200px;"><small></small></td>
                                                            <td><small></small></td>
                                                            <td style="width: 600px;"><small></small></td>
                                                            <td><small></small></td>
                                                            <td><small></small></td>
                                                            <td style="width: 200px;"><small>&nbsp;</small> </td>
                                                            <td style="width: 100px;"><small>&nbsp; </small></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                
                                            </div>
                                            <!-- /basic responsive configuration -->
                                        </div>
                                    </div>
                                    <!-- /vertical form options -->
                
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