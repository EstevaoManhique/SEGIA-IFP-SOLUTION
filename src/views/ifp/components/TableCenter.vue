<template>
    <div class="col-md-8">
      <!-- Bordered panel body table -->
      <div class="panel panel-flat">
        <div class="panel-heading">
          <h6
            class="
              panel-title
              text-uppercase text-bold text-bold text-uppercase
            "
          >
            <span class="text-danger-600">
              
            </span>
          </h6>
          <div class="heading-elements">
            <ul class="icons-list">
              <li><a data-action="collapse"></a></li>
              <li><a data-action="reload"></a></li>
            </ul>
          </div>
        </div>
      </div>
      <template>
        <v-simple-table
          fixed-header
          height="300px"
        >
          <template v-slot:default>
            <thead>
              <tr>
                <th class="text-left">
                  ID
                </th>
                <th class="text-left">
                  SIGLA
                </th>
                <th>
                  Centro
                </th>
                <th>
                  Tipo
                </th>
                <th>
                  Distrito
                </th>
                <th>
                  Remover
                </th>
              </tr>
            </thead>
            <tbody> 
                <tr v-for="(school, index) in schools" :key="index" v-if="school.isCentro">
                  <td>{{school.id }}</td>
                  <td>{{school.abbreviation}}</td>
                  <td>{{school.name}}</td>
                  <td>{{school.type}}</td>
                  <td>{{school.district.name}}</td> 
                  <td>
                    <button  @click="removCenter(school)">
                      <v-icon color="red">mdi-trash-can-outline</v-icon>
                    </button>
                  </td>
                </tr> 
            </tbody>
          </template>
        </v-simple-table>
      </template>
   <!-- /bordered panel body table -->
    </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
export default {
  name: "TableCenter",
  components: {},
  data: () => ({
  }),
  methods: {
    ...mapActions([
        "getSchools","getCenters","updateSchool","selectSchool","getDistricSchools"
    ]),
    removCenter(school){
      //this.getDistricSchools(district);
      //this.selectSchool(name);
      school.isCentro = false
      this.updateSchool(school)
    },
    
  },
  mounted() {
    this.getSchools();
    this.getCenters();
    this.getDistricSchools();
  },
  computed: {
    ...mapGetters(["schools","centers","schoolD"]),
  },
};
</script>
