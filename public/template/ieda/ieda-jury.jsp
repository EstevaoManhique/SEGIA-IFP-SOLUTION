<%@ include file="super_header.jsp" %>

<%@ include file="navebar.jsp" %> 

<%@ include file="header.jsp" %> 

<%@ include file="menu.jsp" %>  

<!-- Main content -->
<div class="content-wrapper">
    <!-- Toolbar -->
    <div class="navbar navbar-default navbar-component navbar-xs">
        <ul class="nav navbar-nav visible-xs-block">
            <li class="full-width text-center"><a data-toggle="collapse" data-target="#navbar-filter"><i class="icon-menu7"></i></a></li>
        </ul>

        <div class="navbar-collapse collapse" id="navbar-filter">
            <ul class="nav navbar-nav element-active-orange-400">
                <li class="active"><a href="#settings" data-toggle="tab" class="text-bold text-uppercase"><i class="icon-reading position-left"></i> Criação de Júris Exames (Exames do Ensino a Distância)</a></li>
            </ul>

        </div>
    </div>
    <!-- /toolbar -->

    <!-- rom.1-->
    <div class="row">
        <!-- Vertical form options -->
        <form class="row col-sm-4" method="post" accept-charset="ISO-8859-1" action="SUVEQVNlcnZsZXQjRENJ?YWNjYW8janVyaXM=">
            <div class="panel panel-flat ">
                <div class="panel-body">
                    <div class="col-sm-12">
                        <label for="idCurso" class="form-label">Classe</label>
                        <select class="form-control" id="idCurso" name="idCurso"></select>
                    </div> 
                    <%--           <div class="col-sm-12 mt-20">
                                  <button type="submit" class="btn bg-slate-800 btn-labeled text-bold text-uppercase" onclick="this.disabled = 'disabled'; this.form.submit();"> <b><i class="icon-search4 position-right"></i></b>  Filtrar</button>
                              </div> --%>
                </div>
            </div>
        </form>
        <!-- /Vertical form options -->
    </div> 
    <!-- /row.1--> 

    <!-- row 2-->
    <div class="row">
        <div class="col-md-4">
            <%                                String act2 = encryptUtils.encodeString("accao#definir-juri");
            %>
            <!-- Basic layout-->
            <form class="form-horizontal" method="post" accept-charset="ISO-8859-1" action="SUVEQVNlcnZsZXQjRENJ?<%=act2%>">
                <div class="panel panel-flat ">
                    <div class="panel-heading">
                        <h6 class="panel-title text-bold text-uppercase">Definição de Calendário</h6>
                        <div class="heading-elements">
                            <ul class="icons-list">
                                <li>
                                    <a data-action="collapse"></a>
                                </li>
                                <li>
                                    <a data-action="reload"></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="panel-body"> 

                        <div class="form-group">
                            <label for="idDisciplina" class="form-label text-bold text-uppercase">Disciplina:</label>
                            <select class="form-control" id="idDisciplina" name="idDisciplina"></select>
                        </div>

                        <div class="form-group">
                            <label class="text-bold text-uppercase">Sala:</label>
                            <select class="select form-control" name="idSala" id="idSala"required="">
                                <optgroup label="Selecione uma sala">
                                </optgroup>

                            </select>
                        </div>

                        <div class="form-group">
                            <label class="text-bold text-uppercase">Chamada:</label>
                            <select class="select form-control" name="categoria">
                                <optgroup label="Selecione a época">
                                    <option value="1ª Chamada">1ª Chamada</option>
                                </optgroup>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="text-bold text-uppercase">Júri 1:</label>
                            <select class="select form-control" name="idDocente1" id="idDocente1" required="">
                                <optgroup label="Selecione um docente">

                                </optgroup>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="text-bold text-uppercase">Júri 2:</label>
                            <select class="select form-control" name="idDocente2" id="idDocente2" required="">
                                <optgroup label="Selecione uma docente">

                                </optgroup>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="text-bold text-uppercase">Nº Máx. Alunos:</label>
                            <input type="text" class="form-control" placeholder="Nº máximo de alunos ..." name="numAlunos" required="">
                        </div>

                        <div class="text-right">
                            <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn bg-orange-600 text-uppercase text-bold">Definir Júri <i class="icon-circle-right2 position-right"></i></button>
                        </div> 
                    </div>
                </div>
            </form> 
            <!-- /basic layout -->
        </div>
        <div class="col-md-8">

            <%
                String cur = "";

                if (curso != null) {
                    cur = encryptUtils.decodeString(curso.getCursDescricao());
                }
            %>
            <!-- Bordered panel body table -->
            <div class="panel panel-flat">
                <div class="panel-heading">
                    <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">Júris dos Exames <span class="text-danger-600" id="curso">[<%=cur%>]</span></h6>
                    <div class="heading-elements">
                        <ul class="icons-list">
                            <li>
                                <a data-action="collapse"></a>
                            </li>
                            <li>
                                <a data-action="reload"></a>
                            </li>

                        </ul>
                    </div>
                </div>

                <div class="panel-body">

                    <p>
                        <a href="#" target="_blank" class="btn  bg-slate-800 btn-labeled btn-lg text-bold text-uppercase">
                            <b><i class="icon-printer2"></i></b> Imprimir júris
                        </a>

                    </p>

                    <table class="table datatable-responsive" width="100%" id="tableSalaExames">
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

                            <%
                                if (salasExame != null) {
                                    for (SalaExame se : salasExame) {

                                        String dis = encryptUtils.decodeString(se.getDisciplina().getDiscDescricao());

                                        String d1 = sdf.format(se.getSalaeData().toGregorianCalendar().getTime());
                                        String sa = encryptUtils.decodeString(se.getSala().getSalaDescricao());
                                        int num = se.getSalaeMaxAlunos();
                                        String j1 = encryptUtils.decodeString(se.getJuri1().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(se.getJuri1().getPessoa().getPessApelido());
                                        String j2 = encryptUtils.decodeString(se.getJuri2().getPessoa().getPessNome()) + " " + encryptUtils.decodeString(se.getJuri2().getPessoa().getPessApelido());
                            %>
                            <tr>
                                <td>
                                    <%=dis%>
                                </td>
                                <td>
                                    <%=sa%>
                                </td>
                                <td>
                                    <%=d1%>
                                </td>
                                <td>
                                    <%=num%>
                                </td>
                                <td>
                                    <%=j1%>
                                </td>
                                <td>
                                    <%=j2%>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- /bordered panel body table -->

        </div> 
    </div>
    <!-- /row.2 -->
</div>
<!-- /Main content -->

</div>
</div>

<!-- /main content -->
<%@ include file="footer.jsp" %> 

<!-- /page container -->
<script type="text/javascript" src="assets/js/pages/picker_date.js"></script>

<script type="text/javascript" src="assets/js/owner/selects_dependent.js">




</script>

</body>

</html>
