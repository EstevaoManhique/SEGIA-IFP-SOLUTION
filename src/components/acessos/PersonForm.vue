<template>
  <v-container>
    <!-- Profile info -->
    <div class="panel panel-flat">
      <div class="panel-heading">
        <h6 class="panel-title text-uppercase text-bold">
          Informações pessoais
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
        <v-form ref="form">
          <div class="form-group">
            <div class="row">
              <div class="col-md-6">
                <label>Nome</label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Introduza o nome ..."
                  required
                  name="nome"
                  v-model="person.name"
                />
              </div>
              <div class="col-md-6">
                <label>Apelido</label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Introduza o apelido ..."
                  required
                  v-model="person.surname"
                />
              </div>
            </div>
          </div>

          <div class="form-group">
            <div class="row">
              <div class="col-md-6">
                <label>Data de nascimento</label>
                <input
                  type="date"
                  class="form-control daterange-single"
                  name="dataNascimento"
                  placeholder="Data de Nascimento..."
                  v-model="person.birth_date"
                />
              </div>
              <div class="col-md-6">
                <label>Sexo</label>
                <div class="row col-md-offset-0">
                  <label class="radio-inline">
                    <input
                      type="radio"
                      name="radio-inline-left"
                      class="styled"
                      value="Masculino"
                    />
                    Masculino
                  </label>

                  <label class="radio-inline">
                    <input
                      type="radio"
                      name="radio-inline-left"
                      class="styled"
                      value="Feminino"
                    />
                    Feminino
                  </label>
                </div>
              </div>
            </div>
          </div>

          <div class="form-group">
            <div class="row">
              <div class="col-md-4">
                <label>Cidade</label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Cidade"
                  name="cidade"
                  v-model="person.city"
                />
              </div>
              <div class="col-md-4">
                <label>Estado/Provincia</label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Estado ou Pronvincia"
                  name="naturalidade"
                  v-model="person.province"
                />
              </div>
              <div class="col-md-4">
                <label>Codigo postal</label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Codígo Postal"
                  name="cPostal"
                  v-model="person.cPostal"
                />
              </div>
            </div>
          </div>

          <div class="form-group">
            <div class="row">
              <div class="col-md-6">
                <label>Email</label>
                <input
                  type="text"
                  readonly="readonly"
                  name="email"
                  v-model="person.email"
                  class="form-control"
                />
              </div>

              <div class="col-md-6">
                <label>País</label>
                <select
                  class="select form-control"
                  name="nacionalidade"
                  required=""
                >
                  <option
                    v-for="(nat, index) in nationalities"
                    :value="nat.description"
                    :key="index"
                  >
                    {{ nat.description }}
                  </option>
                </select>
              </div>
            </div>
          </div>

          <div class="form-group">
            <div class="row">
              <div class="col-md-6">
                <label>Contacto #</label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="+999-99-999-9999"
                  v-model="person.contact"
                  name="contacto"
                  required=""
                />
                <span class="help-block">+999-99-999-9999</span>
              </div>

              <div class="col-md-6">
                <label>Endereço</label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Introduza o endereço"
                  name="endereco"
                  required=""
                  v-model="person.address"
                />
              </div>
            </div>
          </div>

          <div class="form-group">
            <div class="row">
              <div class="col-md-6">
                <label>Cargo</label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Introduza o cargo"
                  name="cargo"
                  required=""
                  value="<%=cargoUser%>"
                />
              </div>
            </div>
          </div>

          <div class="text-right">
            <v-btn
              @click="submit"
              class="btn text-bold text-uppercase bg-primary-600"
            >
              Gravar alterações
              <i class="icon-arrow-right14 position-right"></i>
            </v-btn>
          </div>
        </v-form>
      </div>
    </div>
    <!-- /profile info -->
  </v-container>
</template>

<script>
export default {
  name: 'PersonForm',
  props: ['person'],
  data() {
    return {
      nationalities: [],
      nat: [],
    };
  },
  methods: {
    submit() {
      if (this.person.id)
        this.$api.put('person/' + this.person.id, this.person).then((data) => {
          console.log(data);
        });
      else
        this.$api.post('person/store', this.person).then((data) => {
          console.log(data);
        });
    },
  },
  mounted() {
    this.$api.get('config/nationality').then((data) => {
      this.nationalities = data.data.sort((a, b) =>
        a.description.localeCompare(b.description)
      );
      this.nat = this.nationalities.map((n) => {
        return n.description;
      });
    });
  },
};
</script>

<style></style>
