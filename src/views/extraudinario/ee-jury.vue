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
                                            <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-reading position-left"></i> Criação de Júris Exames (Exame Extraordinário)</a></li>
                                        </ul>
            
                                    </div>
                                </div>
                                <!-- /toolbar -->
            
                                <div class="panel panel-flat">
            
                                    <div class="panel-body">
            
            
                                        <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?YWNjYW8janVyaXM=">
            
            
                                            <div class="row">
            
            
                                                <div class="col-md-2">
            
                                                    <label class="control-label text-bold text-uppercase">provincia:</label>
            
                                                    <select class="select" name="idProvincia"  placeholder="Selecione a provincia" id="make"  >>
                                                        <optgroup label="Selecione a provincia">
                                                            <option></option>
            
                                                 
                                                        </optgroup>
                                                    </select>
            
                                                </div>
            
            
                                                <div class="col-md-3">
                                                    <label class="control-label text-bold text-uppercase">Distrito:</label>
            
                                                    <select id="models"  data-placeholder="Selecione o distrito" class="select" name="distrito" required="">
                                                        <optgroup label="Selecione o distrito">
                                                        
                                                       <option value=""></option>
                                                        </optgroup>
                                                    </select>  
            
            
                                                </div>
            
                                                <div class="col-md-5">
                                                    <label class="control-label text-bold text-uppercase">Escola:</label>
                                                    <select class="select" name="escola" data-placeholder="Selecione a escola" id="schools">
                                                        <optgroup label="Selecione a escola">
                                                          
                                                            <option value="<%=escUs%>" selected></option>
                                                        
                                                        </optgroup>
                                                    </select>
                                                </div>
            
            
            
                                                <div class="col-md-2">
                                                    <label class="control-label text-bold text-uppercase">Classe:</label>
                                                    <select class="select" name="idCurso" data-placeholder="Selecione a classe" disabled="">
                                                        <optgroup label="Selecione a classe">
                                                            <option value=""></option>
                                                        </optgroup>
                                                    </select>
                                                </div>
            
            
                                            </div> <!-- /row.1.1-->
            
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <br>
            
                                                    <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="text-bold text-uppercase btn bg-primary-600 text-bold text-uppercase"> Filtrar Escola <i class="icon-search4 position-right"></i></button>
                                                </div>
                                            </div>
            
                                        </form>
                                    </div>
                                </div>
            
                                <!-- User profile -->
                                <div class="row">
            
            
            
            
            
                                    <div class="col-md-5">
            
                                    
                                        <!-- Basic layout-->
                                        <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?<%=act2%>">
                                            <div class="panel panel-flat">
                                                <div class="panel-heading">
                                                    <h6 class="panel-title text-bold text-uppercase">Criação de Júris</h6>
                                                    <div class="heading-elements">
                                                        <ul class="icons-list">
                                                            <li><a data-action="collapse"></a></li>
                                                            
                                                        </ul>
                                                    </div>
                                                </div>
            
                                                <div class="panel-body">
            
                                                    <div class="form-group">
                                                        <div class="row">
            
                                                            <div class="col-md-6">
            
                                                                <label class="text-bold text-uppercase">Disciplina:</label>
                                                                <select class="select" name="idDisciplina" required="">
                                                                    <optgroup label="Selecione uma disciplina">
                                                               
                                                                        <option value="<%=id%>"></option>
                                                                    
                                                                    </optgroup>
                                                                </select>
                                                            </div>
            
                                                            <div class="col-md-6">
                                                                <label class="text-bold text-uppercase">Sala:</label>
                                                                <input type="text" class="form-control" placeholder="Descrição da sala..." name="idSala">
                                                            </div>
            
                                                        </div>
                                                    </div>
            
            
            
                                                    <div class="form-group">
                                                        <div class="row">
            
                                                            <div class="col-md-6">
            
                                                                <label class="text-bold text-uppercase">Chamada:</label>
                                                                <select class="select" name="categoria" disabled="">
                                                                    <optgroup label="Selecione a época">
                                                                        <option value="1ª Chamada">1ª Chamada</option>
                                                                    </optgroup>
                                                                </select>
                                                            </div>
            
                                                            <div class="col-md-6">
                                                                <label class="text-bold text-uppercase">Nº Máx. Alunos:</label>
                                                                <input type="text" class="form-control" placeholder="Nº máximo de alunos ..." name="numAlunos" value="30" readonly="">
                                                            </div>
            
                                                        </div>
                                                    </div>
            
            
                                                    <div class="form-group">
                                                        <label class="text-bold text-uppercase">Júri 1:</label>
                                                        <select class="select" name="idDocente1" required="" id ="idDocente1">
                                                            <optgroup label="Selecione uma docente">
                                                                <option value="">Selecione um docente</option>
                                                           
                                                                <option value="<%=id%>"></option>
                                                             
                                                                <option value="0">OUTROS JÚRIS</option>
                                                            </optgroup>
                                                        </select>
            
                                                        <div class="form-group" hidden="" id="juri1">
                                                            <br>
                                                            <label class="text-bold text-uppercase">Nome do Júri 1:</label>
                                                            <input type="text" class="form-control" placeholder="Nome do Juri ..." name="juri1">
                                                        </div>  
            
                                                    </div>
            
            
                                                    <div class="form-group">
                                                        <label class="text-bold text-uppercase">Júri 2:</label>
                                                        <select class="select" name="idDocente2" required="" id ="idDocente2">
                                                            <optgroup label="Selecione uma docente">
                                                                <option value="">Selecione um docente</option>
                                                          
                                                                <option value="<%=id%>"></option>
                                                             
                                                                <option value="0">OUTROS JÚRIS</option>
                                                            </optgroup>
                                                        </select>
            
            
                                                        <div class="form-group" hidden="" id="juri2">
                                                            <br>
                                                            <label class="text-bold text-uppercase">Nome do Júri 2:</label>
                                                            <input type="text" class="form-control" placeholder="Nome do Juri ..." name="juri2">
                                                        </div>  
                                                    </div>
            
            
            
                                                    <div class="form-group">
            
                                                    </div>
            
            
                                                    <div class="text-right">
                                                        <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 text-uppercase text-bold">Definir Júri <i class="icon-circle-right2 position-right"></i></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                        <!-- /basic layout -->
                                    </div>
            
            
            
                                    <div class="col-md-7">
            
                                   
                                        <!-- Bordered panel body table -->
                                        <div class="panel panel-flat">
                                            <div class="panel-heading">
                                                <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Júris dos Exames <span class="text-danger-600"></span></h6>
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li><a data-action="collapse"></a></li>
                                                        
            
                                                    </ul>
                                                </div>
                                            </div>
            
                                            <div class="panel-body">
            
                                                <p>
                                                    <a href="#" target="_blank" class="btn  bg-slate-800 btn-labeled btn-lg text-bold text-uppercase">
                                                        <b><i class="icon-printer2"></i></b>
                                                        Imprimir júris
                                                    </a>
            
                                                </p>
            
                                                <table class="table datatable-responsive" width="100%">
                                                    <thead>
                                                        <tr>
                                                            <th class="text-bold text-uppercase">Disciplina</th>
                                                            <th class="text-bold text-uppercase">Sala</th>
                                                            <th class="text-bold text-uppercase">Data</th>
                                                            <th class="text-bold text-uppercase">Nº Máx. Alunos</th>
                                                            <th class="text-bold text-uppercase">Júri 1</th>
                                                            <th class="text-bold text-uppercase">Júri 2</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
            
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td> 
                                                            <td></td> 
                                                            <td></td>  
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- /bordered panel body table -->
            
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