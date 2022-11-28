<template>
  <v-container>
    <nav-bar :menu_types = "6"/>
    <v-row>
                           <!-- Main content -->
                           <div class="content-wrapper">




                            <div class = "row">
        
                                <div class = "col-md-12 col-md-offset-0">
        
        
                                    <!--
                                        String lst = "";
                                        String act = encryptUtils.encodeString("accao#registar-aluno-online");
                                        String vlBtn = "Registar Pré-Inscrição";
                                        String lblReg = "Novo Registo";
                                        String icnReg = "icon-file-plus";
                                        String nm = session.getAttribute("nome").toString();
                                        String apl = session.getAttribute("apelido").toString();
                                        String bi = session.getAttribute("bi").toString();
                                        String nuit = session.getAttribute("nuit").toString();
                                        String sex = session.getAttribute("sexo").toString();
                                        String sM = "checked";
                                        String sF = "";
                                        String mail = session.getAttribute("email").toString();
                                        String cnt = session.getAttribute("contacto").toString();
                                        String prov = session.getAttribute("provincia").toString();
                                        String quar = session.getAttribute("quarteirao").toString();
                                        String casa = session.getAttribute("casa").toString();
                                        String end = session.getAttribute("endereco").toString();
                                        String doc = session.getAttribute("documento").toString();
                                        String distr = session.getAttribute("distrito").toString();
                                        String dNas = "";
        
                                        String resp = session.getAttribute("responsavel").toString();
                                        String cntResp = session.getAttribute("contactoResponsavel").toString();
        
                                        String bS = "checked";
                                        String bN = "";
                                        String bI = "";
        
                                        String dS = "";
                                        String dN = "checked";
        
                                        String niv = session.getAttribute("nivel").toString();
                                        String ocup = session.getAttribute("ocupacao").toString();
                                        String cat = session.getAttribute("categoria").toString();
        
                                        String bos = "NORMAL";
        
                                        String tB = "checked";
                                        String tD = "";
                                        String cH = "";
        
                                        String con = "";
        
                                        String cD = "";
                                        String cB = "";
                                        String fT = "";
        
        
                                    -->
        
        
        
        
        
                                    <!-- 2 columns form -->
                                    <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="SUZQU2VydmxldCNEQ0k=?<!--=act-->">
                                        <div class="panel panel-flat">
                                            <div class="panel-body">
        
        
                                                <div class="row">
        
                                                    <div class="text-center">
                                                        <center>	<img src="http://<!--=ip-->:8081/suc/images/app-icons/governo.png" alt="" class="img-responsive" style="width:50%; max-width: 120px;"></center>
                                                        <h5 class="content-group-lg text-bold text-uppercase">Formulário de Pré-Inscrição (Exames Extraodinários)<small class="display-block">Preencha os campos abaixo</small></h5>
                                                    </div>
        
        
        
        
                                                    <div class="col-md-6">
        
                                                        <!--
                                                            if (inscricao != null) {
                                                        -->
        
                                                        <a  href="print-inscription" target="_blank" class="btn bg-orange-600 btn-labeled btn-labeled-left text-bold text-uppercase">
                                                            <b><i class="icon-printer"></i></b>
                                                            Imprimir Ficha de Inscrição
                                                        </a>
        
                                                        <!--
                                                            }
                                                        -->
        
                                                    </div>
                                                    <br>
                                                    <fieldset>
                                                        <legend class="text-semibold"><i class="icon-reading position-left"></i> Dados do aluno</legend>
        
                                                        <div class="form-group">
                                                            <label class="col-lg-3 control-label text-bold text-uppercase">Nome:</label>
                                                            <div class="col-lg-9">
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <div class="form-group has-feedback has-feedback-right">
        
                                                                            <input type="text" placeholder="Nome" class="form-control" name="nomeCompleto" >
                                                                            <div class="form-control-feedback">
                                                                                <i class="icon-regexp2 text-danger"></i>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
        
                                                        <div class="form-group">
                                                            <label class="col-lg-3 control-label text-bold text-uppercase"> <i class="icon-regexp2 text-danger"></i> Identificação:</label>
                                                            <div class="col-lg-9">
        
                                                                <div class="row">
                                                                    <div class="col-md-5">
                                                                        <select data-placeholder="Selecione o tipo" class="select" required="" name="documento">
                                                                            <option></option>
                                                                            <!--
                                                                                String documentos[] = {"BI", "Passaporte", "DIRE", "Cédula pessoal", "Cartão de eleitor", "Carta de condução", "Outro"};
        
                                                                                for (String s : documentos) {
        
                                                                                    String sel = "";
        
                                                                                    if (s.equals(doc)) {
                                                                                        sel = "selected";
                                                                                    }
                                                                            -->
                                                                            <option value=""></option>
                                                                            <!--
                                                                                }
                                                                            -->
                                                                        </select>
                                                                    </div>
        
                                                                    <div class="col-md-7">
                                                                        <div class="form-group has-feedback has-feedback-right">
        
                                                                            <input type="text" placeholder="BI/DIRE/Passaporte N.º" class="form-control" name="bi" value="<!--=bi-->" required="">
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
                                                                        <input type="text" placeholder="Data de Validade" class="form-control mb-15  daterange-single" name="validadeDocumento">
                                                                    </div>
        
                                                                    <div class="col-md-6">
                                                                        <input type="text" placeholder="NUIT" class="form-control" name="nuit" value="<!--=nuit-->">
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
        
                                                                            <input type="text" placeholder="Data de Nascimento" class="form-control mb-15  daterange-single" name="dataNascimento" value="<!--=dNas-->" required="">
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
                                                                        <input type="email" placeholder="E-mail" class="form-control" name="email" value="<!--=mail-->">
                                                                    </div>
        
                                                                    <div class="col-md-5">
                                                                        <div class="form-group has-feedback has-feedback-right">
        
                                                                            <input type="text" placeholder="Telefone/telemóvel:" class="form-control" name="contacto" value="<!--=cnt-->" required="">
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
                                                                        <input type="text" placeholder="Nome do Pai" class="form-control" name="nomePai">
        
                                                                    </div>
        
                                                                    <div class="col-md-5">
                                                                        <input type="text" placeholder="Contacto do Pai" class="form-control" name="contactoPai">
        
                                                                    </div>
                                                                </div>
                                                                <br>
                                                                <div class="row">
                                                                    <div class="col-md-7">
                                                                        <input type="text" placeholder="Local Trabalho do Pai" class="form-control" name="localPai">
        
                                                                    </div>
        
                                                                    <div class="col-md-5">
                                                                        <input type="text" placeholder="Profissão do Pai" class="form-control" name="profissaoPai">
                                                                    </div>
                                                                </div>
        
        
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-lg-3 control-label text-bold text-uppercase">Mãe:</label>
                                                            <div class="col-lg-9">
        
                                                                <div class="row">
                                                                    <div class="col-md-7">
                                                                        <input type="text" placeholder="Nome do Mãe" class="form-control" name="nomeMae" >
                                                                    </div>
        
                                                                    <div class="col-md-5">
                                                                        <input type="text" placeholder="Contacto da Mãe" class="form-control" name="contactoMae">
        
                                                                    </div>
                                                                </div>
                                                                <br>
                                                                <div class="row">
                                                                    <div class="col-md-7">
                                                                        <input type="text" placeholder="Local Trabalho da Mãe" class="form-control" name="localMae">
        
                                                                    </div>
        
                                                                    <div class="col-md-5">
                                                                        <input type="text" placeholder="Profissão da Mãe" class="form-control" name="profissaoMae">
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
                                                                            <input type="text" placeholder="Nome do Encarregado Educação" class="form-control" name="responsavel" value="<!--=resp-->">
        
                                                                        </div>
                                                                    </div>
        
                                                                    <div class="col-md-5">
                                                                        <div class="form-group">
                                                                            <input type="text" placeholder="Contacto " class="form-control" name="contactoResponsavel" value="<!--=cntResp-->">
        
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
                                                            <label class="col-lg-3 control-label text-bold text-uppercase"> <i class="icon-regexp2 text-danger"></i> Província:</label>
                                                            <div class="col-lg-9">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <select id="make" data-placeholder="Selecione a provincia" class="select" name="provincia" required="">
                                                                            <option></option>
                                                                            <!--
        
                                                                                for (EdstProvince s : provincias) {
                                                                                    String sel = "";
        
                                                                                    String desc = s.getName();
        
                                                                                    if (prov.equals(desc)) {
                                                                                        sel = "selected";
                                                                                    }
                                                                            -->
                                                                            <option value=""></option>
                                                                            <!--
                                                                                }
                                                                            -->
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
                                                                            <input type="text" placeholder="Endereço" class="form-control" name="endereco" value="<!--=end-->">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <br>
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <input type="text" placeholder="Quarteirão/Talhão" class="form-control mb-15"  name="quarteirao" value="<!--=quar-->">
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <input type="text" placeholder="Nº da Casa" class="form-control"  name="casa" value="<!--=casa-->">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>
        
                                                    <fieldset>
                                                        <legend class="text-semibold"><i class="icon-clipboard2 position-left"></i> Inscrição</legend>
        
                                                        <div class="form-group">
                                                            <label class="col-lg-3 control-label text-bold text-uppercase"> <i class="icon-regexp2 text-danger"></i> Escola:</label>
                                                            <div class="col-lg-9">
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <select data-placeholder="Selecione a escola" class="select" name="escola" required="" id="schools">
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
        
                                                                                <!--
                                                                                    if (cursos != null) {
                                                                                        for (Curso c : cursos) {
                                                                                            int id = c.getCursId();
                                                                                            String s = encryptUtils.decodeString(c.getCursDescricao());
        
                                                                                -->
                                                                                <option value="<!--=id-->"><!--=s--></option> 
                                                                                <!--
                                                                                        }
                                                                                    }
                                                                                -->
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
                                                                        <select  data-placeholder="Selecione a(s) disciplina(s)" class="select select-access-multiple"  multiple="multiple" name="refDisciplinas">
                                                                            <optgroup label="Selecione a(s) disciplina(s)">
                                                                                <!--
                                                                                    for (Disciplina d : disciplinas) {
        
                                                                                        String s = encryptUtils.decodeString(d.getDiscDescricao());
        
                                                                                -->
                                                                                <option value="<!--=s-->"><!--=s--></option> 
                                                                                <!--
                                                                                    }
                                                                                -->
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
                                                <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn text-bold text-uppercase  bg-slate-800"><!--=vlBtn--> <i class="icon-arrow-right14 position-right"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                  
                                <!-- /2 columns form -->
                            </div>
                        </div>	
         
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
