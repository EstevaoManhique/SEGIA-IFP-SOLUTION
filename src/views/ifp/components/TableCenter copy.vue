<template>
  <div>
    <v-data-table
      :headers="headers"
      :items="desserts"
      item-key="name"
      class="elevation-1"
      :search="search"
      :custom-filter="filterOnlyCapsText"
    >
    </v-data-table>
    <!-- /bordered panel body table -->
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  name: "TableCenter",
  components: {},
  data () {
      return {
        search: '',
        calories: '',
        desserts: [
          {
            name: 'Frozen Yogurt',
            calories: 159,
            fat: 6.0,
            carbs: 24,
            protein: 4.0,
            iron: '1%',
          },
          {
            name: 'Ice cream sandwich',
            calories: 237,
            fat: 9.0,
            carbs: 37,
            protein: 4.3,
            iron: '1%',
          }],
    provinceSelected: (string = ""),
    headers: [
      {
        text: "Dessert (100g serving)",

        value: "name",
      },
      { text: "Calories", value: "calories" },
      { text: "Fat (g)", value: "fat" },
      { text: "Carbs (g)", value: "carbs" },
      { text: "Protein (g)", value: "protein" },
      { text: "Iron (%)", value: "iron" },
    ],
     
  }},
  methods: {
    ...mapActions([
      "getSchools",
      "getCenters",
      "updateSchool",
      "selectSchool",
      "getDistricSchools",
      "getProvinces",
      "setProvinceToFilterCenter",
    ]),
    removCenter(school) {
      school.isCentro = false;
      this.updateSchool(school);
    },
    filterCenters() {
      this.provinces.provincename = this.provinceSelected;
      this.setProvinceToFilterCenter(this.provinces);
    },
  },
  mounted() {
    this.getSchools();
    this.getCenters();
    this.getDistricSchools();
    this.getProvinces();
  },
  computed: {
    ...mapGetters([
      "schools",
      "centers",
      "schoolD",
      "provincesname",
      "provinces",
      "provinceToFilterCenter",
    ]),
  },
};
</script>
