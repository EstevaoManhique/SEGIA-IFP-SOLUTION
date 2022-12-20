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
              v-on:input="event => this.$emit('inputChange', event)"
            >
          </div>
          <div>
            <label class="text-bold text-uppercase">Provincia:</label>
            <v-select
              :items="filterProvinces()"
              labreturn
              @change="filterDistricts($event)"
              dense
              class=""
              label="Slecione a Provincia"
              outlined
            >
            </v-select>
          </div>

          <div>
            <label class="text-bold text-uppercase">Distrito:</label>
            <v-select
              labreturn
              :items="districtsname"
              @change="filterSchools($event)"
              dense
              label="Slecione o Distrito"
              class=""
              outlined
            >
            </v-select>
          </div>

          <div>
            <label class="text-bold text-uppercase">Escola:</label>
            <v-select
              labreturn
              :items="districtsname"
              @change="filterSchools($event)"
              dense
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
import { mapGetters, mapActions } from "vuex";
export default {
  name: "FormExamCenter",
  components: {},
  data: () => ({
    schoolsname: null,
    districtsname: null,
  }),
  props: ['schools'],
  methods: {
    ...mapActions(["getProvinces", "getDistricToSchools"]),
    filterProvinces() {
      return this.provinces.map((province) => {
        return { text: province.name, value: province.id };
      });
    },
    filterDistricts(idProvince) {
      let index = this.provinces.findIndex((p) => {
        return idProvince == p.id;
      });
      this.districtsname = this.provinces[index].districts.map((district) => {
        return { text: district.name, value: district.id };
      });
    },
    filterSchools(idDistrict) {
      this.editedItem.district_id = idDistrict;
      let index = this.district.findIndex((d) => {
        return idDistrict == d.id;
      });
      this.schoolsname = this.district[index].schools.map((s) => {
        return { text: s.name, value: s.id };
      });
    },
    setSchoolAsCenter() {
      this.schools = null
      //this.updateSchool(this.schoolD);
      this.age()
    },
  },
  mounted() {
    this.getProvinces();
    this.getDistricToSchools();
    this.filterProvinces();
  },
  computed: {
    ...mapGetters(["provinces", "district"]),
  },
};
</script>