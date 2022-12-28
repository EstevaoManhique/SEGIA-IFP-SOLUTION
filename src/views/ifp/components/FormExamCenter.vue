<template>
  <div class="col-md-4">
    <form class="form-horizontal" method="post" accept-charset="ISO-8859-1">
      <div class="panel panel-flat">
        <div class="panel-heading">
          <h6 class="panel-title text-bold text-uppercase">
            Adicionar Centro de Exame
          </h6>
          <div class="heading-elements">
            <ul class="icons-list">
              <li><a data-action="collapse"></a></li>
              <li><a data-action="reload"></a></li>
            </ul>
          </div>
        </div>

        <div class="panel-body">
          <div>
            <input
              type="text"
              placeholder="Enter username"
              v-on:input="(event) => this.$emit('inputChange', event)"
            />
          </div>
          <div>
            <label class="text-bold text-uppercase">Provincia:</label>
            <v-select
              @change="filterDistricts()"
              v-model="provinceselected"
              :items="provincesname"
              label="Selecione a Provincia"
              outlined
            >
            </v-select>
          </div>

          <div>
            <label class="text-bold text-uppercase">Distrito:</label>
            <v-select
              v-model="districtselected"
              @change="filterSchools()"
              :items="districtsname"
              label="Selecione o Distrito"
              outlined
            >
            </v-select>
          </div>

          <div>
            <label class="text-bold text-uppercase">Escola:</label>
            <v-select
              v-model="school1"
              :items="schoolsname"
              @change="filterSchool(school)"
              label="Selecione a Escola"
              outlined
              class=""
            >
            </v-select>
          </div>
          <div class="text-right">
            <button
              @click="setSchoolAsCenter()"
              type="button"
              class="btn bg-orange-600 text-uppercase text-bold"
            >
              Adicionar Centro
              <i class="icon-circle-right2 position-right"></i>
            </button>
          </div>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
export default {
  name: 'FormExamCenter',
  components: {},
  data: () => ({
    provinceSelected: (string = ''),
    districtSelected: (string = ''),
    school1: (string = ''),
  }),
  props: ['schools'],
  methods: {
    ...mapActions([
      'getProvinces',
      'getDistricts',
      'getDistricSchools',
      'getDistricToSchools',
      'updateSchool',
      'selectSchool',
    ]),
    filterDistricts() {
      this.getDistricts(this.provinceselected);
    },
    filterSchools() {
      this.getDistricSchools(this.districtselected);
    },
    filterSchool() {
      this.selectSchool(this.school1);
    },
    setSchoolAsCenter() {
      this.schoolD.isCentro = true;
      console.log('schoolD');
      console.log(this.schoolD);
      this.updateSchool(this.schoolD);
    },
  },
  mounted() {
    // this.getProvinces();
    this.getDistricToSchools();
    this.filterProvinces();
  },
  created() {
    this.initProvDist();
  },
  computed: {
    ...mapGetters([
      'provinces',
      'provincename',
      'provincesname',
      'districtsname',
      'schoolsname',
      'schoolD',
      'schools',
    ]),
  },
};
</script>
