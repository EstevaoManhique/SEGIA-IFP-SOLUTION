<template>
  <v-container>
    <!-- Profile info -->
    <div class="panel panel-flat">
      <div class="panel-heading">
        <h6 class="panel-title text-uppercase text-bold">
          INFORME OS DADOS DO ALUNO
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
            <v-row>
              <legend class="text-semibold">
                <i class="icon-reading position-left"></i> Dados do aluno
              </legend>

              <v-col cols="12" md="4" sm="6">
                <v-select
                  :items="doc_type"
                  label="Tipo Identificação"
                  dense
                  filled
                  mandatory
                  v-model="student.person.doc_type"
                ></v-select>
              </v-col>
              <v-col cols="12" md="4" sm="6">
                <v-text-field
                  label="Numero Identificação"
                  placeholder="BI/DIRE/Passaporte N.º"
                  filled
                  append-icon="mdi-asterisk red"
                  dense
                  v-model="student.person.BI_number"
                ></v-text-field>
              </v-col>
              <v-col cols="12" md="4" sm="6">
                <v-text-field
                  label="Validade Doc"
                  placeholder="Data de Validade"
                  filled
                  dense
                  type="date"
                  v-model="student.person.BI_expiration_date"
                ></v-text-field>
              </v-col>
              <v-col cols="12" md="4" sm="6">
                <v-text-field
                  label="Nome"
                  placeholder="Introduza o nome ..."
                  filled
                  append-icon="mdi-asterisk red"
                  dense
                  v-model="student.person.name"
                ></v-text-field>
              </v-col>
              <v-col cols="12" md="4" sm="6">
                <v-text-field
                  label="Apelido"
                  placeholder="Introduza o apelido ..."
                  filled
                  append-icon="mdi-asterisk red"
                  dense
                  v-model="student.person.surname"
                ></v-text-field>
              </v-col>
              <v-col cols="12" md="4" sm="6">
                <v-text-field
                  label="Data de Nascimento"
                  placeholder="Introduza a data de nascimento ..."
                  filled
                  append-icon="mdi-asterisk red"
                  dense
                  type="date"
                  v-model="student.person.birth_date"
                ></v-text-field>
              </v-col>

              <v-col cols="12" md="4" sm="6">
                <v-select
                  :items="nat"
                  label="Pais de Nascimento"
                  dense
                  filled
                  mandatory
                ></v-select>
              </v-col>

              <v-col cols="12" md="4" sm="6">
                <label>Sexo</label>
                <div class="col-md-offset-0">
                  <v-radio-group v-model="student.person.genre" mandatory row>
                    <v-radio label="Masculino" value="M"></v-radio>
                    <v-radio label="Feminino" value="F"></v-radio>
                  </v-radio-group>
                </div>
              </v-col>
            </v-row>
            <v-row>
              <legend class="text-semibold">
                <i class="icon-home5 position-left"></i> Endereço e Contacto
              </legend>
              <v-col cols="12" sm="6" md="4">
                <v-select
                  :items="provinces_name"
                  label="Provincia"
                  dense
                  filled
                  @change="changeDistrict"
                  mandatory
                  v-model="student.person.province"
                ></v-select>
              </v-col>
              <v-col cols="12" sm="6" md="4">
                <v-select
                  :items="districts_name"
                  label="Cidade"
                  dense
                  filled
                  mandatory
                  v-model="student.person.city"
                ></v-select>
              </v-col>
              <v-col cols="12" sm="6" md="4">
                <v-text-field
                  label="Endereco"
                  placeholder="Introduza o endereco"
                  filled
                  dense
                  v-model="student.person.address"
                ></v-text-field>
              </v-col>
              <v-col cols="12" sm="6" md="4">
                <v-text-field
                  label="Codigo Postal"
                  placeholder="Introduza o Codigo Postal"
                  filled
                  dense
                  v-model="student.person.cPostal"
                ></v-text-field>
              </v-col>
              <v-col cols="12" md="4" sm="6">
                <v-text-field
                  label="Contacto"
                  placeholder="Introuza o contacto"
                  filled
                  append-icon="mdi-asterisk red"
                  dense
                  v-model="student.person.contact"
                ></v-text-field>
              </v-col>
              <v-col cols="12" md="4" sm="6">
                <v-text-field
                  label="Email"
                  type="email"
                  placeholder="Introuza o email"
                  filled
                  dense
                  v-model="student.person.email"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row>
              <legend class="text-semibold">
                <i class="icon-home5 position-left"></i> ENCARREGADO EDUCAÇÃO
              </legend>
              <v-col cols="12" sm="6" md="4">
                <v-text-field
                  label="Nome do Encarregado"
                  placeholder="Introduza o nome do encarregado"
                  filled
                  dense
                  v-model="student.enc_name"
                ></v-text-field>
              </v-col>
              <v-col cols="12" md="4" sm="6">
                <v-text-field
                  label="Contacto do Encarregado"
                  placeholder="Introuza o contacto do Encarregado"
                  filled
                  dense
                  v-model="student.enc_contact"
                ></v-text-field>
              </v-col>
              <v-col cols="12" md="4" sm="6">
                <v-text-field
                  label="Ocopucao"
                  placeholder="Introuza a ocupação do Encarregado"
                  filled
                  dense
                  v-model="student.enc_work"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row>
              <legend class="text-semibold">
                <i class="icon-man-woman position-left"></i> Filiação
              </legend>
              <v-col cols="12" sm="6" md="4">
                <v-text-field
                  label="Nome do Pai"
                  placeholder="Introduza o nome do Pai"
                  filled
                  dense
                  v-model="student.person.father_name"
                ></v-text-field>
              </v-col>
              <v-col cols="12" md="4" sm="6">
                <v-text-field
                  label="Contacto do Pai"
                  placeholder="Introuza o contacto do Pai"
                  filled
                  dense
                  v-model="student.person.father_contact"
                ></v-text-field>
              </v-col>
              <v-col cols="12" md="4" sm="6">
                <v-text-field
                  label="Ocupação do Pai"
                  placeholder="Introuza a ocupação do Pai"
                  filled
                  dense
                  v-model="student.person.father_work"
                ></v-text-field>
              </v-col>
              <v-col cols="12" sm="6" md="4">
                <v-text-field
                  label="Nome da mãe"
                  placeholder="Introduza o nome da mãe"
                  filled
                  dense
                  v-model="student.person.mother_name"
                ></v-text-field>
              </v-col>
              <v-col cols="12" md="4" sm="6">
                <v-text-field
                  label="Contacto da mãe"
                  placeholder="Introuza o contacto da mãe"
                  filled
                  dense
                  v-model="student.person.mother_contact"
                ></v-text-field>
              </v-col>
              <v-col cols="12" md="4" sm="6">
                <v-text-field
                  label="Ocupação da mãe"
                  placeholder="Introuza a ocupação da mãe"
                  filled
                  dense
                  v-model="student.person.mother_work"
                ></v-text-field>
              </v-col>
            </v-row>
          </div>
          <v-row>
            <legend class="text-semibold">
              <i class="icon-man-woman position-left"></i> Informação adicional
            </legend>
            <v-col cols="12" sm="6" md="4">
              <v-checkbox
                v-model="checkbox"
                label="Órfão/Vulnerável/Portador de Doença"
              ></v-checkbox>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                :items="doc_type"
                label="Formação"
                dense
                filled
                v-model="student.person.training_level"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                :items="doc_type"
                label="Ocupação"
                dense
                filled
                v-model="student.person.work"
              ></v-select>
            </v-col>
          </v-row>

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
import { mapGetters, mapActions } from 'vuex';
export default {
  name: 'StudentForm',

  data() {
    return {
      nationalities: [],
      nat: [],
      doc_type: ['BI', 'DIRE', 'Passaporte'],
      provinces_name: [],
      districts_name: [],
    };
  },
  methods: {
    ...mapActions(['getProvinces']),
    setProvinceName() {
      this.getProvinces();
      console.log(this.provinces);
      this.provinces_name = this.provinces
        .sort((a, b) => a.name.localeCompare(b.name))
        .map((prov) => {
          return prov.name;
        });
    },
    changeDistrict() {
      let prov = this.provinces.filter((prov) =>
        prov.name
          .toLowerCase()
          .includes(this.student.person.province.toLowerCase())
      )[0];
      this.districts_name = prov.districts.map((dist) => {
        return dist.name;
      });
    },
    submit() {
      console.log(this.student);
      /*  if (this.student.id)
        this.$api
          .put('student/' + this.student.id, this.student)
          .then((data) => {
            console.log(data);
          });
      else
        this.$api.post('student/store', this.student).then((data) => {
          console.log(data);
        }); */
    },
  },
  mounted() {
    this.student.person = this.person;
    this.setProvinceName();
    this.$api.get('config/nationality').then((data) => {
      this.nationalities = data.data.sort((a, b) =>
        a.description.localeCompare(b.description)
      );
      this.nat = this.nationalities.map((n) => {
        return n.description;
      });
    });
  },
  computed: {
    ...mapGetters(['student', 'person', 'provinces']),
  },
};
</script>

<style></style>
