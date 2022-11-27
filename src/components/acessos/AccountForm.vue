<template>
  <v-container>
    <!-- Account settings -->
    <div class="panel panel-flat">
      <div class="panel-heading">
        <h6 class="panel-title text-uppercase text-bold">
          Definições da conta
        </h6>
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
        <form method="post" action="" accept-charset="ISO-8859-1">
          <div class="form-group">
            <div class="row">
              <div class="col-md-6">
                <label>Username</label>
                <input
                  type="text"
                  v-model="user.email"
                  readonly="readonly"
                  class="form-control"
                />
              </div>

              <div class="col-md-6">
                <label>Password actual</label>
                <input
                  type="password"
                  class="form-control"
                  placeholder="Sua password actual..."
                  name="passAntiga"
                  value=""
                />
              </div>
            </div>
          </div>

          <div class="form-group">
            <div class="row">
              <div class="col-md-6">
                <label>Nova password</label>
                <input
                  type="password"
                  class="form-control"
                  placeholder="Nova password..."
                  name="passNova"
                  value=""
                />
              </div>

              <div class="col-md-6">
                <label>Repetir password</label>
                <input
                  type="password"
                  class="form-control"
                  placeholder="Confirme a nova password..."
                  name="rePassNova"
                  value=""
                />
              </div>
            </div>
          </div>

          <div class="form-group">
            <div class="row">
              <div class="col-md-6">
                <label>Pergunta de segurança</label>
                <select
                  class="select"
                  name="perguntaSeguranca"
                  required=""
                  placeholder="Selecione uma pergunta"
                >
                  <%
                  perguntaSeguranca=encryptUtils.decodeString(perguntaSeguranca);
                  %>
                  <option value="<%=perguntaSeguranca%>">
                    <%=perguntaSeguranca%>
                  </option>
                  <option
                    value="Qual era o nome do seu melhor amigo na adolescência?"
                  >
                    Qual era o nome do seu melhor amigo na adolescência?
                  </option>
                  <option
                    value="Qual era o nome do seu primeiro animal de estimação?"
                  >
                    Qual era o nome do seu primeiro animal de estimação?
                  </option>
                  <option
                    value="Qual foi o primeiro prato que você aprendeu a cozinhar?"
                  >
                    Qual foi o primeiro prato que você aprendeu a cozinhar?
                  </option>
                  <option
                    value="Qual foi o primeiro filme que você viu no cimema?"
                  >
                    Qual foi o primeiro filme que você viu no cimema?
                  </option>
                  <option
                    value="Qual foi o destino da sua primeira viagem de avião?"
                  >
                    Qual foi o destino da sua primeira viagem de avião?
                  </option>
                  <option
                    value="Qual era o nome do seu professor favorito da escola primária?"
                  >
                    Qual era o nome do seu professor favorito da escola
                    primária?
                  </option>
                  <option value="Qual é o emprego dos seus sonhos?">
                    Qual é o emprego dos seus sonhos?
                  </option>
                  <option value="Qual era o seu apelido de infância?">
                    Qual era o seu apelido de infância?
                  </option>
                  <option value="Qual é o seu cantor favorito?">
                    Qual é o seu cantor favorito?
                  </option>
                  <option value="Qual foi o seu livro infantil favorito?">
                    Qual foi o seu livro infantil favorito?
                  </option>
                </select>
              </div>

              <div class="col-md-6">
                <label>Resposta de segurança</label>
                <input
                  type="password"
                  class="form-control"
                  placeholder="Resposta de Segurança ..."
                  required
                  name="respostaSeguranca"
                  value="<%=respostaSeguranca%>"
                />
              </div>
            </div>
          </div>

          <div class="form-group">
            <div class="row">
              <div class="col-md-6">
                <label>Visibilidade do Perfil</label>

                <div class="radio">
                  <label>
                    <input
                      type="radio"
                      name="visibility"
                      class="styled"
                      checked="checked"
                    />
                    Visivel para todos
                  </label>
                </div>

                <div class="radio">
                  <label>
                    <input type="radio" name="visibility" class="styled" />
                    Visivel para colegas apenas
                  </label>
                </div>

                <div class="radio">
                  <label>
                    <input type="radio" name="visibility" class="styled" />
                    Visivel para minhas conexões apenas
                  </label>
                </div>

                <div class="radio">
                  <label>
                    <input type="radio" name="visibility" class="styled" />
                    Visivel para os administradores apenas
                  </label>
                </div>
              </div>

              <div class="col-md-6">
                <label>Notificações</label>

                <div class="checkbox">
                  <label>
                    <input type="checkbox" class="styled" checked="checked" />
                    Notificação da validade da password
                  </label>
                </div>

                <div class="checkbox">
                  <label>
                    <input type="checkbox" class="styled" checked="checked" />
                    Notificaçãdo de nova mensagem
                  </label>
                </div>

                <div class="checkbox">
                  <label>
                    <input type="checkbox" class="styled" checked="checked" />
                    Notificação de nova tarefa
                  </label>
                </div>

                <div class="checkbox">
                  <label>
                    <input type="checkbox" class="styled" />
                    Notificação de novo ticket
                  </label>
                </div>
              </div>
            </div>
          </div>

          <div class="text-right">
            <button
              type="submit"
              onclick="this.disabled='disabled'; this.form.submit();"
              class="btn text-bold text-uppercase bg-primary-600"
            >
              Gravar alterações
              <i class="icon-arrow-right14 position-right"></i>
            </button>
          </div>
        </form>
      </div>
    </div>
    <!-- /account settings -->
  </v-container>
</template>

<script>
export default {
  name: 'AccountForm',
  props: ['user'],
};
</script>

<style></style>
