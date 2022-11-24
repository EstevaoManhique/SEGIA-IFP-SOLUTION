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
                                            <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-table2 position-left"></i> Pauta de Exame</a></li>
                                        </ul>
            
                                    </div>
                                </div>
                                <!-- /toolbar -->
            
            
                              
            
                                <div class = "row">
                                    <!-- Vertical form options -->
                                    <div class="col-md-12"> 
                                        <!-- Basic layout-->
            
                                        <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?YWNjYW8jcGF1dGE=">
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
            
                                                        <div class="col-md-4">
            
                                                            <label class="control-label text-bold text-uppercase">provincia:</label>
            
                                                            <select class="select" name="idProvincia"  placeholder="Selecione a provincia" id="make">
                                                                <optgroup label="Selecione a provincia">
                                                                    <option></option>
            
                                                                
                                                             <option value=""></option>                                                          
            
                                                                </optgroup>
                                                            </select>
            
                                                        </div>
            
                                                        <div class="col-md-6">
                                                            <label class="control-label text-bold text-uppercase">Escola:</label>
                                                            <select class="select" name="escola" data-placeholder="Selecione a escola" id="schools">
                                                                <optgroup label="Selecione a escola">
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
            
                                <!-- Estatisticas Gerais -->
                                <div class="row">
            
                                    <div class="col-lg-3 col-md-6">
                                        <div class="panel panel-body">
                                            <div class="media">
                                                <div class="media-left">
                                                    <i class="icon-users" style="font-size: 60px;"></i>
                                                </div>
            
                                                <div class="media-body">
                                                    <h6 class="media-heading text-bold"  style="font-size: 30px;"><!--=df.format(numInscritos)--></h6>
                                                    <p class="text-muted text-uppercase text-size-large text-bold">CANDIDATOS INSCRITOS</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
            
                                    <div class="col-lg-3 col-md-6">
                                        <div class="panel panel-body bg-success-400">
                                            <div class="media">
                                                <div class="media-left">
                                                    <i class="icon-stack-check" style="font-size: 60px;"></i>
                                                </div>
            
                                                <div class="media-body">
                                                    <h6 class="media-heading text-bold"  style="font-size: 30px;"><!--=df.format(numAvaliados)--></h6>
                                                    <p class="text-muted text-uppercase text-size-large text-bold">EXAMES REALIZADOS</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
            
                                    <div class="col-lg-3 col-md-6">
                                        <div class="panel panel-body bg-slate-400">
                                            <div class="media">
                                                <div class="media-left">
                                                    <i class="icon-stack-cancel" style="font-size: 60px;"></i>
                                                </div>
            
                                                <div class="media-body">
                                                    <h6 class="media-heading text-bold"  style="font-size: 30px;"><!--=df.format(numAusentes)--></h6>
                                                    <p class="text-muted text-uppercase text-size-large text-bold">AUSÊNCIAS</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6">
                                        <div class="panel panel-body bg-danger-400">
                                            <div class="media">
                                                <div class="media-left">
                                                    <i class="icon-warning22" style="font-size: 60px;"></i>
                                                </div>
            
                                                <div class="media-body">
                                                    <h6 class="media-heading text-bold"  style="font-size: 30px;"><!--=df.format(numFraudes)--></h6>
                                                    <p class="text-muted text-uppercase text-size-large text-bold">FRAUDES</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /estatisticas gerais -->
            
                                <div class="row">
            
            
                                    <div class = "col-md-12">
                                        <!-- Vertical form options -->
                                        <!-- Basic responsive configuration -->
                                        <div class="panel panel-flat">
                                            <div class="panel-heading">
                                                <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">PAUTA DE EXAME   <i class=" icon-arrow-right7"></i>  <span class="text-danger-600"><!--=cur--> - <!--=descTur--></span> <span> - [<!--=provinciaSel + " : " + escolaSel-->]</span></h6>
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li><a data-action="collapse"></a></li>
            
                                                    </ul>
                                                </div>
                                            </div>
            
            
                                            <div class="panel-body">
                                                <p>
            
                                                    <button id="btnExport" onclick="fnExcelReport('id<!--=x-->', 'PAUTA DO EXAME', '<!--=an-->', '<!--=cur-->', '<!--=loc-->', '<!--=descTur-->');" class="btn bg-success-800 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                        <b><i class="icon-printer2"></i></b> Imprimir a Pauta 
                                                    </button>
            
            
                                                </p>
                                            </div>
            
            
                                            <table class="table table-bordered table-striped" id="id<!--=x-->">
                                                <thead>
                                                    <tr>
                                                 
                                                        <th class="text-bold text-uppercase" rowspan="2" style="font-size: 11px;">#</th>
                                                        <th class="text-bold text-uppercase" rowspan="2" style="font-size: 11px;">Candidato ID</th>
                                                        <th class="text-bold text-uppercase" rowspan="2" style="font-size: 11px;">Nome Completo</th>
                                                        <th class="text-bold text-uppercase" rowspan="2" style="transform: rotate(90deg); font-size: 11px;">Género</th>
                                                        <th class="text-bold text-uppercase text-center" colspan="<!--=num-->" style="font-size: 11px;">Disciplinas</th>
                                                        <th class="text-bold text-uppercase text-center" colspan="2"  style="font-size: 11px;">Resultado Final</th>
                                                    </tr>
            
                                                    <tr>
                                               
                                                        <th class="text-bold text-uppercase text-center" style="transform: rotate(90deg); font-size: 11px;"><!--=desc--></th>
            
                                                 
            
                                                        <th class="text-bold text-uppercase text-center" style="font-size: 11px;">Aprovado</th>
                                                        <th class="text-bold text-uppercase text-center text-danger-600" style="font-size: 11px;">Reprovado</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                             
                                                    <tr>
                                                        <td class="text-bold text-primary-600"  style="font-size: 11px;"><!--=i--></td>
                                                        <td style="font-size: 11px;"><b>&nbsp;<!--=cod--></b></td>
                                                        <td style="font-size: 11px;"><!--=nm--></td>
                                                        <td style="font-size: 11px; text-align: center;"><!--=gen--></td>
                                                   
                                                        <td style="text-align: center; font-weight: bold; font-size: 11px;"><!--=str--></td>
                                              
                                                        <td><small><!--=aprovadas--></small></td>
                                                        <td><small><!--=reprovadas--></small></td>
                                                    </tr>
                                              
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- /basic responsive configuration -->
                                    </div>
                                    <!-- /vertical form options -->
            
            
                                    <!--
                                            }
                                        }
                                    -->
            
            
                                </div>
            
            
            
                                <!-- Combination and connection -->
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel panel-flat">
                                            <div class="panel-heading">
                                                <h6 class="panel-title text-bold text-uppercase">Análise do Aproveitamento dos candidatos avaliados</h6>
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li><a data-action="collapse"></a></li>
            
                                                    </ul>
                                                </div>
                                            </div>
            
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="chart-container">
                                                            <div class="chart has-fixed-height" id="connect_pie"></div>
                                                        </div>
                                                    </div>
            
                                                    <div class="col-lg-6">
                                                        <div class="chart-container">
                                                            <div class="chart has-fixed-height" id="connect_column"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /combination and connection -->
            
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