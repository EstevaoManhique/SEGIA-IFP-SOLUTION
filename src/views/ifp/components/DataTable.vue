<template>
  <div class="col-md-8">
    <!-- Bordered panel body table -->
    <div class="panel panel-flat">
      <div class="panel-heading">
        <h6 class="panel-title text-uppercase text-bold text-bold text-uppercase">
          Periodos de Inscrição
          <span class="text-danger-600"></span>
        </h6>
        <div class="heading-elements">
          <ul class="icons-list">
            <li><a data-action="collapse"></a></li>
            <li><a data-action="reload"></a></li>
          </ul>
        </div>
      </div>

      <div class="panel-body">
        <table class="table datatable-responsive" width="100%">
          <thead>
            <tr>
              <th class="text-bold text-uppercase">#</th>
              <th class="text-bold text-uppercase">Descrição</th>
              <th class="text-bold text-uppercase">Data Inicio</th>
              <th class="text-bold text-uppercase">Data Fim</th>
              <th class="text-bold text-uppercase">Opcoes</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(calendar,index) in calendars" :key="index">
              <td class="text-blue-700 text-bold">{{calendar.id_shedule_exam}}</td>
              <td class="text-bold">{{calendar.description}}</td>
              <td>{{calendar.start_date | date_with_week}}</td>
              <td>{{calendar.end_date | date_with_week}}</td>
              <td>
                  <button  @click="removCalendar(calendar.id_shedule_exam)">
                    <v-icon color="red">mdi-trash-can-outline</v-icon>
                  </button>
                  <button  @click="removCalendar(calendar.id_shedule_exam)">
                    <v-icon color="bg-red">mdi-application-edit</v-icon>
                  </button>
                </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <!-- /bordered panel body table -->
  </div>

  <!-- /row.2 -->
</template>

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  name: "DataTable",
  components: {},
  data: () => ({
     
  }),
  methods : {
   ...mapActions(['getCalendars','removeCalendar']),
      removCalendar(id){
        if(confirm("Tem Certeza Que Deseja Eliminar?")){
            this.removeCalendar(id)
        }
      }
  },
  mounted () {
    this.getCalendars();
  },
  computed: {
    ...mapGetters(["calendars"]),
  },
};
</script>