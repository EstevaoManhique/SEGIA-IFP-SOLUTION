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
                                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-stack-check position-left"></i> Guião de Respostas (Exames Extraordinários)</a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /toolbar -->

                    <div class = "row">
                        <!-- Vertical form options -->
                        <div class="col-md-6"> 
                            <!-- Basic layout-->

                            <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?YWNjYW8jZm9saGE=">
                                <div class="panel panel-flat">
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <div class="row">

                                                    <div class="col-md-7">

                                                        <select class="select" name="idCurso" readonly>
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
                                                                <option value="<!--=id-->"><!--=desc--></option>
                                                                <!--
                                                                        }
                                                                    }
                                                                -->                                                                

                                                            </optgroup>
                                                        </select>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-slate-800 btn-labeled text-bold text-uppercase">
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


                            <form method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?YWNjYW8jZm9saGE=">
                                <div class="panel panel-flat">
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <div class="row">

                                                    <div class="col-md-7">


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
                                                                <option ><!--=desc--></option>
                                                                <!--
                                                                        }
                                                                    }
                                                                -->         
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

                    <!-- User profile -->
                    <div class="row">

                        <!--
                            String cur = "";
                            String dis = "";

                            if (curso != null) {
                                cur = encryptUtils.decodeString(curso.getCursDescricao());
                            }

                            if (disciplina != null) {
                                dis = encryptUtils.decodeString(disciplina.getDiscDescricao());
                            }

                            String act = encryptUtils.encodeString("accao#registar-respostas");
                        -->

                        <div class="col-md-5">

                            <!-- Basic layout-->
                            <form class="form-horizontal"   method="post" accept-charset="ISO-8859-1" action="RXh0cmFvZGluYXJpb1NlcnZsZXQjRENJ?<!--=act-->">
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <h6 class="panel-title text-bold text-uppercase">Defina as questões para a folha de resposta</h6>
                                        <div class="heading-elements">
                                            <ul class="icons-list">
                                                <li><a data-action="collapse"></a></li>
                                                
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="panel-body">

                                        <div class="form-group">
                                            <label class="text-bold text-uppercase">Chamada:</label>
                                            <select class="select" name="categoria">
                                                <optgroup label="Selecione a época">
                                                    <option value="1ª Chamada">1ª Chamada</option>
                                                </optgroup>
                                            </select>
                                        </div>


                                        <div class="form-group">
                                            <label class="display-block text-bold text-uppercase text-danger-600">Pergunta <!--=i-->:</label>

                                            <label class="radio-inline">
                                                <input type="radio" class="styled" name="opcao<!--=i-->" checked="checked" value="A">
                                                <b>A</b>
                                            </label>

                                            <label class="radio-inline">
                                                <input type="radio" class="styled" name="opcao<!--=i-->" value="B">
                                                <b>B</b>
                                            </label>

                                            <label class="radio-inline">
                                                <input type="radio" class="styled" name="opcao<!--=i-->" value="C">
                                                <b>C</b>
                                            </label>

                                            <label class="radio-inline">
                                                <input type="radio" class="styled" name="opcao<!--=i-->" value="D">
                                                <b>D</b>
                                            </label>

                                            <label class="radio-inline">
                                                <input type="radio" class="styled" name="opcao<!--=i-->" value="E">
                                                <b>E</b>
                                            </label>

                                            <label class="radio-inline">
                                                <input type="radio" class="styled" name="opcao<!--=i-->" value="F">
                                                <b>F</b>
                                            </label>
                                        </div>
                                   
                                        <div class="text-right">
                                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-slate-800 text-bold text-uppercase">Definir Respostas<i class="icon-file-check2 position-right"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- /basic layout -->

                        </div>

                        <div class="col-md-7">
                            <div class="panel panel-flat">
                                <div class="panel-heading">
                                    <h6 class="panel-title text-bold text-uppercase">Listagem da Folha de Respota <span class="text-danger-600">[<!--=cur--> | <!--=dis-->]</span></h6>
                                    <div class="heading-elements">
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            
                                        </ul>
                                    </div>
                                </div>

                                <div class="panel-body">

                                    <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th class="text-bold text-uppercase">#</th>
                                                <th class="text-bold text-uppercase">Pergunta</th>
                                                <th class="text-bold text-uppercase text-right">Pontuação</th>
                                                <th class="text-bold text-uppercase text-danger">Alt. Correcta</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><a href="#">1</a></td>
                                                <td class="text-bold">Pergunta 1</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op1--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">2</a></td>
                                                <td class="text-bold">Pergunta 2</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op2--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">3</a></td>
                                                <td class="text-bold">Pergunta 6</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op6--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">4</a></td>
                                                <td class="text-bold">Pergunta 7</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op7--></td>
                                            </tr> 
                                            <tr>
                                                <td><a href="#">5</a></td>
                                                <td class="text-bold">Pergunta 6</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op6--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">6</a></td>
                                                <td class="text-bold">Pergunta 6</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op6--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">7</a></td>
                                                <td class="text-bold">Pergunta 7</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op7--></td>
                                            </tr> 
                                            <tr>
                                                <td><a href="#">8</a></td>
                                                <td class="text-bold">Pergunta 8</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op8--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">9</a></td>
                                                <td class="text-bold">Pergunta 9</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op9--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">10</a></td>
                                                <td class="text-bold">Pergunta 10</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op10--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">11</a></td>
                                                <td class="text-bold">Pergunta 11</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op11--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">12</a></td>
                                                <td class="text-bold">Pergunta 12</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op12--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">13</a></td>
                                                <td class="text-bold">Pergunta 13</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op13--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">14</a></td>
                                                <td class="text-bold">Pergunta 14</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op14--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">15</a></td>
                                                <td class="text-bold">Pergunta 15</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op15--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">16</a></td>
                                                <td class="text-bold">Pergunta 16</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op16--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">17</a></td>
                                                <td class="text-bold">Pergunta 17</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op17--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">18</a></td>
                                                <td class="text-bold">Pergunta 18</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op18--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">19</a></td>
                                                <td class="text-bold">Pergunta 19</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op19--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">20</a></td>
                                                <td class="text-bold">Pergunta 20</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op20--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">21</a></td>
                                                <td class="text-bold">Pergunta 21</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op21--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">22</a></td>
                                                <td class="text-bold">Pergunta 22</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op22--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">23</a></td>
                                                <td class="text-bold">Pergunta 23</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op23--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">24</a></td>
                                                <td class="text-bold">Pergunta 24</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op24--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">25</a></td>
                                                <td class="text-bold">Pergunta 25</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op25--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">26</a></td>
                                                <td class="text-bold">Pergunta 26</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op26--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">27</a></td>
                                                <td class="text-bold">Pergunta 27</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op27--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">28</a></td>
                                                <td class="text-bold">Pergunta 28</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op28--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">29</a></td>
                                                <td class="text-bold">Pergunta 29</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op29--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">30</a></td>
                                                <td class="text-bold">Pergunta 30</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op30--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">31</a></td>
                                                <td class="text-bold">Pergunta 31</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op31--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">32</a></td>
                                                <td class="text-bold">Pergunta 32</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op32--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">33</a></td>
                                                <td class="text-bold">Pergunta 33</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op33--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">34</a></td>
                                                <td class="text-bold">Pergunta 34</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op34--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">35</a></td>
                                                <td class="text-bold">Pergunta 35</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op35--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">36</a></td>
                                                <td class="text-bold">Pergunta 36</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op36--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">37</a></td>
                                                <td class="text-bold">Pergunta 37</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op37--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">38</a></td>
                                                <td class="text-bold">Pergunta 38</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op38--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">39</a></td>
                                                <td class="text-bold">Pergunta 39</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op39--></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">40</a></td>
                                                <td class="text-bold">Pergunta 40</td>
                                                <td class="text-bold text-right text-info-800"><!--=pontuacao--></td>
                                                <td class="text-bold text-danger-600"><!--=op40--></td>
                                            </tr>
                                            <!--
                                                    }

                                                }
                                            -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
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