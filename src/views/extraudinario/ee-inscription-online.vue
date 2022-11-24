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
                                            <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-file-plus position-left"></i> Inscrição do Aluno (Exame Extraordinário)</a></li>
                                        </ul>
            
                                    </div>
                                </div>
                                <!-- /toolbar -->
            
            
            
            
                                <div class = "row">
                                    <!-- Vertical form options -->
                                    <div class="col-md-6"> 
                                        <!-- Basic layout-->
            
                                        <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?YWNjYW8jaW5zY3JpY2Fv">
                                            <div class="panel panel-flat">
                                                <div class="panel-body">
            
                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <div class="row">
            
                                                                <div class="col-md-8">
            
                                                                    <select class="select" name="idCurso">
                                                                        <optgroup label="Selecione a classe">
            
                                                                            <option></option>
            
                                                                        </optgroup>
                                                                    </select>
                                                                </div>
            
                                                                <div class="col-md-3">
                                                                    <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-slate-800 btn-labeled text-bold text-uppercase">
                                                                        <b><i class="icon-search4 position-right"></i></b> 
                                                                        Filtrar Classe
                                                                    </button>
            
                                                                </div>
                                                                <br> <br> <br>
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
            
                                        <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?YWNjYW8jcGVzcXVpc2FyLWFsdW5v">
                                            <div class="panel panel-flat">
                                                <div class="panel-body">
            
                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <div class="row">
            
                                                                <div class="col-md-8">
                                                                    <input type="text" class="form-control" placeholder="Código do Aluno ..." name="codAluno" required="">
                                                                </div>
            
                                                                <div class="col-md-3">
                                                                    <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-slate-800 btn-labeled text-bold text-uppercase">
                                                                        <b><i class="icon-search4 position-right"></i></b> 
                                                                        Pesquisar
                                                                    </button>
            
                                                                </div>
                                                                <br> <br> <br>
                                                            </div>
                                                        </div>
                                                    </div>
            
                                                </div>
                                            </div>
                                        </form>
                                        <!-- /basic layout -->
            
                                    </div>
            
                                </div>
                                <!-- /row.1-->
            
            
                                <div class = "row">
                                    <!-- Vertical form options -->
                                    <div class="col-md-12"> 
                                        <!-- Basic layout-->
            
                                        <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?YWNjYW8jcGVzcXVpc2FyLWFsdW5v">
                                            <div class="panel panel-flat">
                                                <div class="panel-body">
            
                                                    <div class="row">
            
            
                                                        <div class="col-md-3">
            
                                                            <label class="control-label text-bold text-uppercase">provincia:</label>
            
                                                            <select class="select" name="idProvincia"  placeholder="Selecione a provincia" id="make">
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
            
                                                                </optgroup>
                                                            </select>
            
                                                        </div>
            
            
                                                        <div class="col-md-4">
                                                            <label class="control-label text-bold text-uppercase">Aluno:</label>
                                                            <input type="text" class="form-control" placeholder="Nome do Aluno ..." name="nomeAluno" required="">
                                                        </div>
            
                                                    </div> <!-- /row.1.1-->
            
                                                    <div class="row">
                                                        <br>
                                                        <div class="col-md-4">
                                                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 btn-labeled text-bold text-uppercase">
                                                                <b><i class="icon-search4 position-right"></i></b> 
                                                                Pesquisar Aluno
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
            
            
            
                                <div class = "row">
            
                                    <div class = "col-md-12 col-md-offset-0">
            
        
                                        <!-- 2 columns form -->
                                        <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?<%=act%>">
                                            <div class="panel panel-flat">
            
                                                <div class="panel-heading">
                                                    <h6 class="panel-title text-bold text-uppercase">Formulário de Inscrição (Exames Extraordinários)</h6>
                                                    <div class="heading-elements">
                                                        <ul class="icons-list">
                                                            <li><a data-action="collapse"></a></li>
                                                            
                                                        </ul>
                                                    </div>
                                                </div>
            
                                                <div class="panel-body">
            
                                                    <div class="row">
            
                                                        <div class="col-md-6">
            
                                                            <a  href="print-inscription" target="_blank" class="btn bg-orange-600 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                                <b><i class="icon-printer"></i></b>
                                                                Imprimir Ficha de Inscrição
                                                            </a>
            
            
                                                        </div>
                                                    </div>
            
                                                    <div class="row">
            
                                                        <br>
                                                        <div class="col-md-6">
                                                            <fieldset>
                                                                <legend class="text-semibold"><i class="icon-reading position-left"></i> Dados do aluno</legend>
            
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase">Nome:</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <div class="form-group has-feedback has-feedback-right">
            
                                                                                    <input type="text" placeholder="Nome" class="form-control" name="nomeCompleto">
                                                                                    <div class="form-control-feedback">
                                                                                        <i class="icon-regexp2 text-danger"></i>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
            
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase"> <i class="icon-regexp2 text-danger"></i>  Identificação:</label>
                                                                    <div class="col-lg-9">
            
                                                                        <div class="row">
                                                                            <div class="col-md-5">
                                                                                <select data-placeholder="Selecione o tipo" class="select" required="" name="documento">
                                                                                    <option></option>
                                                                                    
                                                                                    <option></option> 
                                                                                    
                                                                                </select>
                                                                            </div>
            
                                                                            <div class="col-md-7">
                                                                                <div class="form-group has-feedback has-feedback-right">
            
                                                                                    <input type="text" placeholder="BI/DIRE/Passaporte N.º" class="form-control" name="bi" value="" required="">
                                                                                    <div class="form-control-feedback">
                                                                                        <i class="icon-regexp2 text-danger"></i>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
            
            
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase">Validade Doc.:</label>
                                                                    <div class="col-lg-9">
            
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <input type="text" placeholder="Data de Validade" class="form-control mb-15  daterange-single" name="validadeDocumento" value="">
                                                                            </div>
            
                                                                            <div class="col-md-6">
                                                                                <input type="text" placeholder="NUIT" class="form-control" name="nuit" value="">
                                                                            </div>
                                                                        </div>
            
                                                                    </div>
                                                                </div>
            
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase">Data Nascimento:</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <div class="form-group has-feedback has-feedback-right">
            
                                                                                    <input type="text" placeholder="Data de Nascimento" class="form-control mb-15  daterange-single" name="dataNascimento" value="" required="">
                                                                                    <div class="form-control-feedback">
                                                                                        <i class="icon-regexp2 text-danger"></i>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
            
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase">Sexo:</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
            
                                                                            <label class="radio-inline">
                                                                                <input type="radio" name="sexo" class="styled">
                                                                                Masculino
                                                                            </label>
            
                                                                            <label class="radio-inline">
                                                                                <input type="radio" name="sexo" class="styled">
                                                                                Feminino
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
            
            
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase">Contacto:</label>
                                                                    <div class="col-lg-9">
            
                                                                        <div class="row">
                                                                            <div class="col-md-7">
                                                                                <input type="email" placeholder="E-mail" class="form-control" name="email" value="">
                                                                            </div>
            
                                                                            <div class="col-md-5">
                                                                                <div class="form-group has-feedback has-feedback-right">
            
                                                                                    <input type="text" placeholder="Telefone/telemóvel:" class="form-control" name="contacto" value="" required="">
                                                                                    <div class="form-control-feedback">
                                                                                        <i class="icon-regexp2 text-danger"></i>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
            
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase">Pai:</label>
                                                                    <div class="col-lg-9">
            
                                                                        <div class="row">
                                                                            <div class="col-md-7">
                                                                                <input type="text" placeholder="Nome do Pai" class="form-control" name="nomePai" value="">
            
                                                                            </div>
            
                                                                            <div class="col-md-5">
                                                                                <input type="text" placeholder="Contacto do Pai" class="form-control" name="contactoPai" value="">
            
                                                                            </div>
                                                                        </div>
                                                                        <br>
                                                                        <div class="row">
                                                                            <div class="col-md-7">
                                                                                <input type="text" placeholder="Local Trabalho do Pai" class="form-control" name="localPai"  value="">
            
                                                                            </div>
            
                                                                            <div class="col-md-5">
                                                                                <input type="text" placeholder="Profissão do Pai" class="form-control" name="profissaoPai" value="">
                                                                            </div>
                                                                        </div>
            
            
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase">Mãe:</label>
                                                                    <div class="col-lg-9">
            
                                                                        <div class="row">
                                                                            <div class="col-md-7">
                                                                                <input type="text" placeholder="Nome do Mãe" class="form-control" name="nomeMae"  value="">
                                                                            </div>
            
                                                                            <div class="col-md-5">
                                                                                <input type="text" placeholder="Contacto da Mãe" class="form-control" name="contactoMae" value="">
            
                                                                            </div>
                                                                        </div>
                                                                        <br>
                                                                        <div class="row">
                                                                            <div class="col-md-7">
                                                                                <input type="text" placeholder="Local Trabalho da Mãe" class="form-control" name="localMae" value="">
            
                                                                            </div>
            
                                                                            <div class="col-md-5">
                                                                                <input type="text" placeholder="Profissão da Mãe" class="form-control" name="profissaoMae" value="">
                                                                            </div>
                                                                        </div>
            
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase">Encarregado Educação:</label>
                                                                    <div class="col-lg-9">
            
                                                                        <div class="row">
                                                                            <div class="col-md-7">
                                                                                <div class="form-group">
                                                                                    <input type="text" placeholder="Nome do Encarregado Educação" class="form-control" name="responsavel" value="">
            
                                                                                </div>
                                                                            </div>
            
                                                                            <div class="col-md-5">
                                                                                <div class="form-group">
                                                                                    <input type="text" placeholder="Contacto " class="form-control" name="contactoResponsavel" >
            
                                                                                </div>
                                                                            </div>
                                                                        </div>
            
                                                                    </div>
                                                                </div>
            
                                                            </fieldset>
            
            
                                                        </div>
            
            
            
                                                        <div class="col-md-6">
            
            
            
            
                                                            <fieldset>
                                                                <legend class="text-semibold"><i class="icon-home5 position-left"></i> ENDEREÇO</legend>
            
            
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase">Província:</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <select id="make2" data-placeholder="Selecione a provincia" class="select" name="provincia">
                                                                                    <option></option>
                                                                                    
                                                                                    <option></option>
                                                                                    
                                                                                </select>
            
                                                                            </div>
            
                                                                            <div class="col-md-6">
                                                                                <select id="models"  data-placeholder="Selecione o distrito" class="select" name="distrito" required="">
                                                                                    <option></option>
                                                                                </select>       
                                                                            </div>
                                                                        </div>
                                                                        <br>
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <div class="form-group">
                                                                                    <input type="text" placeholder="Endereço" class="form-control" name="endereco" value="">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <br>
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <input type="text" placeholder="Quarteirão/Talhão" class="form-control mb-15"  name="quarteirao" value="">
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                                <input type="text" placeholder="Nº da Casa" class="form-control"  name="casa" value="">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
            
                                                            <fieldset>
                                                                <legend class="text-semibold"><i class="icon-clipboard2 position-left"></i> Inscrição & Local de Realização do Exame</legend>
            
            
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase"> <i class="icon-regexp2 text-danger"></i> Província:</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <select id="make3" data-placeholder="Selecione a província de realização do exame" class="select" name="provincia2" required="">
                                                                                    <option></option>
                                                                                    
                                                                                    <option></option>
                                                                                    
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
            
                                                                </div>
            
            
            
            
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase"> <i class="icon-regexp2 text-danger"></i> Escola:</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <select data-placeholder="Selecione a escola" class="select" name="escola" required="" id="schools2">
                                                                                    <option></option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
            
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase"> <i class="icon-regexp2 text-danger"></i> Classe:</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
                                                                            <div class="col-md-8">
                                                                                <div class="mb-15">
                                                                                    <select data-placeholder="Selecione a classe" class="select" required="" name="idCurso" readonly="">
            
                                                                                        <option value="<%=id%>"></option> 
                                                                                        
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
            
            
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label text-bold text-uppercase"> <i class="icon-regexp2 text-danger"></i> Disciplina(s):</label>
                                                                    <div class="col-lg-9">
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <select  data-placeholder="Selecione a(s) disciplina(s)"  multiple="multiple" class="select select-access-multiple" name="refDisciplinas">
                                                                                    <optgroup label="Selecione a(s) disciplina(s)">
            
                                                                                        <option ></option> 
                                                                                        
                                                                                    </optgroup>
                                                                                </select>
            
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
            
                                                            </fieldset>
            
                                                        </div>
            
                                                    </div>
            
            
                                                    <div class="text-left">
                                                        <i class="icon-regexp2 text-danger"></i> -  <span class="text-semibold text-muted">Campos de preenchimento obrigatório</span>
                                                    </div>
            
                                                    <div class="text-right">
                                                    
                                                        <a href="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?YWNjYW8jaW5zY3JpY2Fv" class="btn text-bold text-uppercase bg-danger-400 btn-labeled-left ml-10"><i class="icon-cross2"></i> Cancelar edição</a>
                                                      
                                                        <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800"> <i class="icon-arrow-right14 position-right"></i></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                        <!-- /2 columns form -->
                                    </div>
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