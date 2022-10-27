<!-- Main sidebar -->
<div class="sidebar sidebar-main">
    <div class="sidebar-fixed">
        <div class="sidebar-content">


            <!-- Main navigation -->
            <div class="sidebar-category sidebar-category-visible">
                <div class="category-title h6">
                    <span class="text-bold text-uppercase">Navegação Principal</span>
                    <ul class="icons-list">
                        <li>
                            <a href="#" data-action="collapse"></a>
                        </li>
                    </ul>
                </div>


                <!-- User menu -->
                <div class="category-content sidebar-user">
                    <div class="media">
                        <a href="#" class="media-left">  <img src="http://<%=ip%>:8081/suc/images/profile-pictures/<%=fotoPerfil%>" alt="<%=nome%>" class="img-circle img-sm"></a>
                        <div class="media-body">
                            <span class="media-heading text-semibold"><%=nome%></span>
                            <div class="text-size-mini text-muted">
                                <i class="icon-briefcase text-size-small"></i>
                                <%=cargo%>
                            </div>
                        </div>

                        <div class="media-right media-middle">
                            <ul class="icons-list">
                                <li>
                                    <a href="#"><i class="icon-cog3"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /user menu -->

                <div class="category-content no-padding">
                    <ul class="navigation navigation-main navigation-accordion">

                        <!-- Main -->
                        <li class="navigation-header"><span>Menu Principal</span> <i class="icon-menu" title="Menu Principal"></i></li>
                        <li class="nav-item active"><a href="TW9kdWxvU2VydmxldCNEQ0k=?YWNjYW8jaWVkYQ=="><i class="icon-home4"></i> <span class="text-bold text-uppercase">Dashboard</span></a></li>

                        <!-- GESTÃO -->
                        <%
                            if (mu.isMuiGestao()) {
                        %>
                        <li class="nav-item">
                            <a href="#" class="nav-link"><i class="icon-database-edit2"></i> <span class="text-bold text-uppercase">Gestão da Escola</span></a>

                            <ul class="nav nav-group-sub" data-submenu-title="Gestão">
                                <li class="nav-item"><a href="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jaWVkYS1hbHVubw==" class="nav-link"><i class="icon-user-plus"></i> Registar Aluno</a></li>
                                <li class="nav-item"><a href="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jaW1wb3J0YXI=" class="nav-link"><i class="icon-file-upload"></i> Importar Alunos</a></li>
                                <li class="nav-item"><a href="SUVEQUFsdW5vU2VydmxldCNEQ0k=?YWNjYW8jYWx1bm9z" class="nav-link"><i class="icon-users2"></i> Listagem Alunos</a></li>
                                <li>
                                    <a href="#"><i class="icon-profile"></i> <span class="text-bold text-orange-600 text-uppercase">Matriculas</span></a>
                                    <ul>
                                        <li class="nav-item"><a href="SUVEQUFsdW5vU2VydmxldCNEQ0k=?YWNjYW8jaW5zY3JldmVyLWFsdW5v" class="nav-link"><i class="icon-profile"></i> Matricular Aluno</a></li>
                                        <li class="nav-item"><a href="SUVEQUFsdW5vU2VydmxldCNEQ0k=?YWNjYW8jZGlzdHJpYnVpY2FvLWF1dG9tYXRpY2E=" class="nav-link"><i class="icon-align-right"></i> Distribuir Turmas</a></li>
                                        <li class="nav-item"><a href="SUVEQUFsdW5vU2VydmxldCNEQ0k=?YWNjYW8jdmFsaWRhci1tYXRyaWN1bGE=" class="nav-link"><i class="icon-user-check"></i> Matriculas Online</a></li>
                                        <li class="nav-item"><a href="SUVEQUFsdW5vU2VydmxldCNEQ0k=?YWNjYW8jbWF0cmljdWxhZG9z" class="nav-link"><i class="icon-collaboration"></i> Alunos Matriculados</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item"><a href="SUVEQUFsdW5vU2VydmxldCNEQ0k=?YWNjYW8jdHJhbnNmZXJpci1lc2NvbGE=" class="nav-link"><i class="icon-transmission"></i> Transferir para Escola</a></li>
                                <li class="nav-item"><a href="SUVEQUFsdW5vU2VydmxldCNEQ0k=?YWNjYW8jdHJhbnNmZXJpci10dXJtYQ==" class="nav-link"><i class="icon-flip-vertical4"></i> Transferir para Turma</a></li>

                            </ul>
                        </li>
                        <%
                            }
                        %>
                        <!-- /gestão -->


                        <!-- PLANOS ANUAIS -->
                        <%
                            if (mu.isMuiGestao()) {
                        %>
                        <!--<li class="nav-item nav-item-submenu">
                            <a href="#" class="nav-link"><i class="icon-book"></i> <span class="text-bold text-uppercase">Sumários/Planos aula</span></a>

                            <ul class="nav nav-group-sub" data-submenu-title="Planos Temáticos">

                                <li>
                                    <a href="#"><i class="icon-archive"></i> <span class="text-bold text-orange-600 text-uppercase">Sumários</span></a>
                                    <ul>
                                        <li class="nav-item"><a href="SUVEQVBsYW5vc1NlcnZsZXQjRENJ?YWNjYW8jdGVtYXM=" class="nav-link"><i class="icon-target"></i> Definir Tema</a></li>
                                        <li class="nav-item"><a href="SUVEQVBsYW5vc1NlcnZsZXQjRENJ?YWNjYW8jcGxhbm90ZW1hdGljbw==" class="nav-link"><i class="icon-clipboard3"></i> Visualizar Sumários</a></li>
                                    </ul>
                                </li>

                                <li>
                                    <a href="#"><i class="icon-bookmark"></i> <span class="text-bold text-orange-600 text-uppercase">PLANOS DE AULAS</span></a>
                                    <ul>
                                        <li class="nav-item"><a href="SUVEQVBsYW5vc1NlcnZsZXQjRENJ?YWNjYW8jcGxhbm9z" class="nav-link"><i class="icon-pencil6"></i> Definir Plano</a></li>
                                        <li class="nav-item"><a href="SUVEQVBsYW5vc1NlcnZsZXQjRENJ?YWNjYW8jcGxhbm9hdWxh" class="nav-link"><i class="icon-books"></i> Visualizar Planos</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li> -->
                        <%
                            }
                        %>
                        <!-- /planos anuais -->


                        <!-- Calendário -->
                        <%
                            if (mu.isMuiCalendario()) {
                        %>
                        <li>
                            <a href="#"><i class="icon-calendar52"></i> <span class="text-bold text-uppercase">Calendário</span></a>
                            <ul>
                                <%
                                    if (mu.isMuiCalendarioHorario()) {
                                %>
                                <li><a href="SUVEQUNhbGVuZGFyaW9TZXJ2bGV0I0RDSQ==?YWNjYW8jaG9yYXJpb3M="><i class="icon-calendar2"></i> Horários</a></li>
                                    <%
                                        }
                                    %>
                                    <%
                                        if (mu.isMuiCalendarioTestes()) {
                                    %>
                                <li><a href="SUVEQUNhbGVuZGFyaW9TZXJ2bGV0I0RDSQ==?YWNjYW8jdGVzdGVz"><i class="icon-calendar52"></i> Avaliações</a></li>
                                <li><a href="SUVEQUNhbGVuZGFyaW9TZXJ2bGV0I0RDSQ==?YWNjYW8jY2FsZW5kYXJpby1leGFtZQ=="><i class="icon-calendar"></i> Exames</a></li>
                                <li><a href="SUVEQUNhbGVuZGFyaW9TZXJ2bGV0I0RDSQ==?YWNjYW8janVyaXM="><i class="icon-users"></i> Jurís Exame</a></li>
                                <li><a href="SUVEQUF2YWxpYWNhb1NlcnZsZXQjRENJ?YWNjYW8jZm9saGFz"><i class="icon-checkbox-checked"></i> Folhas de Resposta</a></li>
                                    <%
                                        }
                                    %>
                            </ul>
                        </li>
                        <%
                            }
                        %>
                        <!-- /calendário -->

                        <!-- Avaliação-->
                        <%
                            if (mu.isMuiAvaliacao()) {
                        %>
                        <li>
                            <a href="#"><i class="icon-pencil4"></i> <span class="text-bold text-uppercase">Avaliação</span></a>

                            <ul>
                                <%
                                    if (mu.isMuiAvaliacaoNotas()) {
                                %>
                                <li>
                                    <a href="#"><i class="icon-pencil-ruler"></i> <span class="text-bold text-orange-600 text-uppercase">GESTÃO DE NOTAS</span></a>
                                    <ul>
                                        <li><a href="SUVEQUF2YWxpYWNhb1NlcnZsZXQjRENJ?YWNjYW8jbm90YXM="><i class="icon-grid-alt"></i> Lançar Notas</a></li>
                                        <li><a href="SUVEQUF2YWxpYWNhb1NlcnZsZXQjRENJ?YWNjYW8jaW1wb3J0YXItbm90YXM="><i class="icon-upload10"></i> Importar Notas</a></li>
                                    </ul>
                                </li>

                                <li>
                                    <a href="#"><i class="icon-stack-text"></i> <span class="text-bold text-orange-600 text-uppercase">GESTÃO DE EXAMES</span></a>
                                    <ul>
                                        <li><a href="SUVEQUF2YWxpYWNhb1NlcnZsZXQjRENJ?YWNjYW8jZGlzdHJpYnVpY2FvLWV4YW1l"><i class="icon-split"></i> Distribuição Alunos</a></li>
                                        <li><a href="SUVEQUF2YWxpYWNhb1NlcnZsZXQjRENJ?YWNjYW8jbGlzdGEtZXhhbWVz"><i class="icon-sort-alpha-asc"></i> Candidatos Exame</a></li>
                                        <li><a href="SUVEQUF2YWxpYWNhb1NlcnZsZXQjRENJ?YWNjYW8jcHJlc2VuZXNhcy1leGFtZQ=="><i class="icon-checkmark-circle"></i> Marcar Presenças</a></li>
                                        <li><a href="SUVEQUF2YWxpYWNhb1NlcnZsZXQjRENJ?YWNjYW8jbm90YXMtZXhhbWU="><i class="icon-check"></i> Carregar Respostas</a></li>
                                    </ul>
                                </li>
                                <%
                                    }

                                    if (mu.isMuiAvaliacaoPautas()) {
                                %>
                                <li><a href="SUVEQUF2YWxpYWNhb1NlcnZsZXQjRENJ?YWNjYW8jcGF1dGFz"><i class="icon-table2"></i> Pauta Trimestral</a></li>
                                <li><a href="SUVEQUF2YWxpYWNhb1NlcnZsZXQjRENJ?YWNjYW8jcGF1dGFzLWFudWFs"><i class="icon-grid2"></i> Pauta Freq. Anual</a></li>
                                    <%
                                        }

                                        if (mu.isMuiAvaliacaoPresencas()) {
                                    %>
                                <li>
                                    <a href="#"><i class="icon-spam"></i> <span class="text-bold text-orange-600 text-uppercase">Assiduidade</span></a>
                                    <ul>
                                        <li><a href="SUVEQUF2YWxpYWNhb1NlcnZsZXQjRENJ?YWNjYW8jcHJlc2VuY2Fz"><i class="icon-blocked"></i> Faltas</a></li>
                                        <li><a href="SUVEQUF2YWxpYWNhb1NlcnZsZXQjRENJ?YWNjYW8jaW1wb3J0YXItZmFsdGFz"><i class="icon-upload"></i> Importar Faltas</a></li>
                                    </ul>
                                </li>
                                <li><a href="SUVEQUF2YWxpYWNhb1NlcnZsZXQjRENJ?YWNjYW8jY29tcG9ydGFtZW50bw=="><i class="icon-info3"></i> Comportamento</a></li>
                                    <%
                                        }

                                        if (mu.isMuiAvaliacaoBoletins()) {
                                    %>
                                <li>
                                    <a href="#"><i class="icon-certificate"></i> <span class="text-bold text-orange-600 text-uppercase">Certificados</span></a>
                                    <ul>
                                        <li><a href="SUVEQUF2YWxpYWNhb1NlcnZsZXQjRENJ?YWNjYW8jY2VydGlmaWNhZG9z"><i class="icon-stack-picture"></i> Emitir Certificado</a></li>
                                        <li><a href="SUVEQUF2YWxpYWNhb1NlcnZsZXQjRENJ?YWNjYW8jdmFsaWRhci1jZXJ0aWZpY2Fkbw=="><i class="icon-checkmark3"></i>  <span>Validar Pedido</span></a></li>
                                    </ul>
                                </li>
                                <%
                                    }
                                %>
                            </ul>
                        </li>
                        <%
                            }
                        %>
                        <!-- /avaliação -->


                        <!-- Contabilidade -->
                        <%
                            if (mu.isMuiPagamentos()) {
                        %>
                        <li>
                            <a href="#"><i class="icon-cash"></i> <span class="text-bold text-uppercase">Pagamentos</span></a>
                            <ul>
                                <%
                                    if (mu.isMuiPagamentosTaxas()) {
                                %>
                                <li><a href="SUVEQVBhZ2FtZW50b1NlcnZsZXQjRENJ?YWNjYW8jdGF4YXM="><i class="icon-plus-circle2"></i> Definir Outras Taxas</a></li>
                                    <%
                                        }
                                    %>

                                <%
                                    if (mu.isMuiPagamentosPropinas()) {
                                %>
                                <li><a href="SUVEQVBhZ2FtZW50b1NlcnZsZXQjRENJ?YWNjYW8jcHJvcGluYXM="><i class="icon-cash4"></i> Pagamento Matriculas</a></li>
                                    <%
                                        }
                                    %>

                                <%
                                    if (mu.isMuiPagamentosPagamentosOnline()) {
                                %>
                                <li><a href="SUVEQVBhZ2FtZW50b1NlcnZsZXQjRENJ?YWNjYW8jcGFnYW1lbnRvcy1vbmxpbmU="><i class="icon-earth"></i> Pagamentos Online</a></li>
                                <li><a href="SUVEQVBhZ2FtZW50b1NlcnZsZXQjRENJ?YWNjYW8jcGFnYW1lbnRvcy1tYW51YWw="><i class="icon-credit-card"></i> Gerar Pagamentos</a></li>

                                <!-- Referencias -->
                                <li>
                                    <a href="#"><i class="icon-barcode2"></i> <span class="text-bold text-uppercase">Referências</span></a>
                                    <ul>

                                        <li><a href="SUVEQVBhZ2FtZW50b1NlcnZsZXQjRENJ?YWNjYW8jMmEtdmlh" ><i class="icon-copy4"></i>2ª Via</a></li>
                                        <li><a href="SUVEQVBhZ2FtZW50b1NlcnZsZXQjRENJ?YWNjYW8jc2l0dWFjYW8tcmVmZXJlbmNpYXM=" ><i class="icon-file-spreadsheet"></i> Visualizar estado</a></li>
                                        <li><a href="SUVEQVBhZ2FtZW50b1NlcnZsZXQjRENJ?YWNjYW8jcmVjaWJvc1BhZ2FtZW50b3M=" ><i class="icon-printer2"></i> Recibos Pagamento</a></li>
                                    </ul>
                                </li>
                                <!-- /referencias -->

                                <%
                                    }
                                %>


                                <%
                                    if (mu.isMuiPagamentosOutrosPagamentos()) {
                                %>
                                <li><a href="SUVEQVBhZ2FtZW50b1NlcnZsZXQjRENJ?YWNjYW8jb3V0cm9zLXBhZ2FtZW50b3M="><i class="icon-coins"></i> Outros Pagamentos</a></li>
                                    <%
                                        }
                                    %>
                                    <%
                                        if (mu.isMuiPagamentosSituacaoPagamentos()) {
                                    %>
                                <li><a href="SUVEQVBhZ2FtZW50b1NlcnZsZXQjRENJ?YWNjYW8jc2l0dWFjYW8tcGFnYW1lbnRvcw=="><i class="icon-info22"></i> Situação Pagamentos</a></li>
                                    <%
                                        }
                                    %>
                            </ul>
                        </li>
                        <%
                            }
                        %>
                        <!-- /contabilidade -->


                        <!-- CONSELHO DE ESCOLA -->
                        <%
                            if (mu.isMuiGestao()) {
                        %>
                        <li class="nav-item nav-item-submenu">
                            <a href="#" class="nav-link"><i class="icon-collaboration"></i> <span class="text-bold text-uppercase">Conselho de Escola</span></a>

                            <ul class="nav nav-group-sub" data-submenu-title="Conselho de Escola">
                                <li class="nav-item"><a href="SUVEQUNvbnNlbGhvU2VydmxldCNEQ0k=?YWNjYW8jbWVtYnJvcw==" class="nav-link"><i class="icon-users2"></i> Membros</a></li>
                                <li class="nav-item"><a href="SUVEQUNvbnNlbGhvU2VydmxldCNEQ0k=?YWNjYW8jZG9jdW1lbnRv" class="nav-link"><i class="icon-file-text2"></i> Emitir Notificação</a></li>
                                <li class="nav-item"><a href="SUVEQUNvbnNlbGhvU2VydmxldCNEQ0k=?YWNjYW8jZG9jdW1lbnRvcw==" class="nav-link"><i class="icon-stack-text"></i> Notificações Emitidas</a></li>
                            </ul>
                        </li>
                        <%
                            }
                        %>
                        <!-- /conselho de escola -->

                        <!-- RELATÓRIOS -->
                        <li class="nav-item nav-item-submenu">
                            <a href="#" class="nav-link"><i class="icon-stats-bars4"></i> <span class="text-bold text-uppercase">Relatórios</span></a>

                            <ul class="nav nav-group-sub" data-submenu-title="Relatórios">


                                <li class="nav-item"><a href="SUVEQUVzY29sYVNlcnZsZXQjRENJ?YWNjYW8jbWFwYS1mYWx0YXM=" class="nav-link"><i class="icon-spam"></i> Mapa de Faltas</a></li>
                                <li class="nav-item"><a href="SUVEQUVzY29sYVNlcnZsZXQjRENJ?YWNjYW8jYXByb3ZlaXRhbWVudG8tcGVkYWdvZ2ljbw==" class="nav-link"><i class="icon-stack-check"></i> Aproveitamento</a></li>
                                <li class="nav-item"><a href="SUVEQUVzY29sYVNlcnZsZXQjRENJ?YWNjYW8jbWF0ZXJpYWwtZGlzdHJpYnVpZG8=" class="nav-link"><i class="icon-design"></i> Material Distribuído</a></li>
                                <li class="nav-item"><a href="SUVEQUVzY29sYVNlcnZsZXQjRENJ?YWNjYW8jbWVsaG9yZXMtYWx1bm9z" class="nav-link"><i class="icon-podium"></i> Melhores Alunos</a></li>
                                <li class="nav-item"><a href="SUVEQUVzY29sYVNlcnZsZXQjRENJ?YWNjYW8jYWx1bm9zLW5lY2Vzc2l0YWRvcw==" class="nav-link"><i class="icon-collaboration"></i> Alunos Vulneráveis</a></li>
                                <li class="nav-item"><a href="SUVEQVBsYW5vc1NlcnZsZXQjRENJ?YWNjYW8jZXhlY3VjYW8tcGxhbm9z" class="nav-link"><i class="icon-clippy"></i> Execução dos Planos</a></li>
                                <li class="nav-item"><a href="TW9kdWxvU2VydmxldCNEQ0k=?YWNjYW8jdGVzb3VyYXJpYQ==" class="nav-link"><i class="icon-coins"></i> Resumo Pagamentos</a></li>
                            </ul>
                        </li>
                        <!-- /relatórios -->

                        <!-- PARAMETRIZAÇÃO -->

                        <%
                            if (mu.isMuiConfiguracao()) {
                        %>
                        <li class="nav-item nav-item-submenu">
                            <a href="#" class="nav-link"><i class="icon-keyboard"></i> <span class="text-bold text-uppercase">Parametrização</span></a>

                            <ul class="nav nav-group-sub" data-submenu-title="Parametrização">

                                <li class="nav-item"><a href="SUVEQUFub0xlY3Rpdm9TZXJ2bGV0I0RDSQ==?YWNjYW8jYW5vc0xlY3Rpdm9z" class="nav-link"><i class="icon-list-numbered"></i> Vagas</a></li>


                                <%
                                    if (mu.isMuiGestaoFormadores()) {
                                %>
                                <li class="nav-item"><a href="SUVEQURvY2VudGVTZXJ2bGV0I0RDSQ==?YWNjYW8jZG9jZW50ZXM=" class="nav-link"><i class="icon-reading"></i> Professores</a></li>
                                    <%
                                        }

                                        if (mu.isMuiGestaoTurmas()) {
                                    %>

                               
                                <li class="nav-item"><a href="SUVEQVR1cm1hU2VydmxldCNEQ0k=?YWNjYW8jc2FsYXM=" class="nav-link"><i class="icon-home7"></i> Salas</a></li>
                                <li class="nav-item"><a href="SUVEQUhvcmFyaW9TZXJ2bGV0I0RDSQ==?YWNjYW8jaG9yYXJpb3M=" class="nav-link"><i class="icon-alarm"></i> Horários de Entrada</a></li>
                                <li class="nav-item"><a href="SUVEQVR1cm1hU2VydmxldCNEQ0k=?YWNjYW8jdHVybWFz" class="nav-link"><i class="icon-table"></i> Turmas</a></li>
                                    <%
                                        }

                                        if (mu.isMuiDisciplinasGestao()) {
                                    %>
                                    <%
                                        }

                                        if (mu.isMuiDisciplinasTurma()) {
                                    %>

                                <li class="nav-item"><a href="SUVEQURpc2NpcGxpbmFTZXJ2bGV0I0RDSQ==?YWNjYW8jZG9jZW50ZXNUdXJtYQ==" class="nav-link"><i class="icon-list3"></i> Turmas Professor</a></li>

                                <%
                                    }

                                    if (mu.isMuiDisciplinasDocente()) {
                                %>
                                <li class="nav-item"><a href="SUVEQURpc2NpcGxpbmFTZXJ2bGV0I0RDSQ==?YWNjYW8jZGlzY2lwbGluYXNEb2NlbnRl" class="nav-link"><i class="icon-user"></i> Disciplinas Professor</a></li>
                                <li class="nav-item"><a href="SUVEQURpc2NpcGxpbmFTZXJ2bGV0I0RDSQ==?YWNjYW8jbW9kdWxvcw==" class="nav-link"><i class="icon-user"></i> Modulos Disciplina</a></li>
                                    <%
                                        }
                                    %>
                            </ul>
                        </li>

                        <%
                            }
                        %>
                        <!-- /parametrização -->


                        <!-- Avaliação-->
                        <%
                            if (mu.isMuiAvaliacao()) {
                        %>
                        <li class="nav-item">
                            <a href="#"><i class="icon-pencil4"></i> <span class="text-bold text-uppercase">E. Ensino a Distância</span></a>

                            <ul>
                                <%--<li class="nav-item"><a href="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jaW5zY3JpY2Fv"><i class="icon-file-plus"></i> Inscrever Aluno</a></li> --%>
                                <li class="nav-item"><a href="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jYXB1cmFkb3M="><i class="icon-users2"></i> Alunos Inscritos</a></li>
                                <li class="nav-item"><a href="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jY2FsZW5kYXJpbw=="><i class="icon-calendar3"></i> Calendário Exames</a></li>
                                <li class="nav-item"><a href="SUVEQVNlcnZsZXQjRENJ?YWNjYW8janVyaXM="><i class="icon-reading"></i> Criação de Júris</a></li>
                                <li class="nav-item"><a href="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jdHVybWFz"><i class="icon-collaboration"></i> Salas de Exame</a></li>
                                <li class="nav-item"><a href="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jZm9saGE="><i class="icon-stack-check"></i> Folhas de Resposta</a></li>
                                <li class="nav-item"><a href="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jZGVjb2Rlcg=="><i class="icon-download4"></i> Decoder de Leitura</a></li>
                                <li class="nav-item"><a href="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jcHJlc2VuY2Fz"><i class="icon-exclamation"></i> Presenças/Fraudes</a></li>
                                <li class="nav-item"><a href="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jcGF1dGE="><i class="icon-table2"></i> Pauta de Exame</a></li>
                            </ul>
                        </li>
                        <%
                            }
                        %>
                        <!-- /avaliação -->


                        <!-- Relatório -->
                        <%
                            if (mu.isMuiEstatisticas()) {
                        %>
                        <li>
                            <a href="#"><i class="icon-list3"></i> <span class="text-bold text-uppercase">Relatórios</span></a>
                            <ul>
                                <li class="nav-item"><a href="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jbWFwYS1hdmFsaWRhZG9z"><i class="icon-bookmark4"></i> Mapa de Avaliados</a></li>
                                <li class="nav-item"><a href="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jbWFwYS1wcmVzZW5jYXM="><i class="icon-list-numbered"></i> Mapa de Presenças</a></li>
                                <li class="nav-item"><a href="SUVEQVNlcnZsZXQjRENJ?YWNjYW8jbWFwYS1hcHJvdmFjb2Vz"><i class="icon-checkmark-circle"></i> Mapa de Aprovações</a></li>
                            </ul>
                        </li>
                        <%
                            }
                        %>
                        <!-- /relatório -->




                    </ul>
                </div>
            </div>
            <!-- /main navigation -->
        </div>

    </div>
</div>
<!-- /main sidebar -->