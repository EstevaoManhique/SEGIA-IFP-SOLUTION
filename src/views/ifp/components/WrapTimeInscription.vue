<template>
  <div class="col-md-4">
    <form
      class="form-horizontal"
      accept-charset="ISO-8859-1"
    >
      <div class="panel panel-flat">
        <div class="panel-heading">
          <h6 class="panel-title text-bold text-uppercase">
            Actualizar Periodo de Inscrição
          </h6>
          <div class="heading-elements">
            <ul class="icons-list">
              <li><a data-action="collapse"></a></li>
              <li><a data-action="reload"></a></li>
            </ul>
          </div>
        </div>

        <div class="panel-body">
          <div class="form-group">
            <label class="text-bold text-uppercase"
              >DATA DE ABERTURA:
            </label>
            <div class="input-group col-md-12">
              <span class="input-group-addon"
                ><i class="icon-calendar52"></i
              ></span>
              <input
                type="date"
                class="form-control"
                placehorlder="Data..."
                name="data1"
                required=""
               v-model="calendar.start_date"
              />
            </div>
          </div>

          <div class="form-group">
            <label class="text-bold text-uppercase"
              >DATA DE TERMINO:
            </label>
            <div class="input-group col-md-12">
              <span class="input-group-addon"
                ><i class="icon-calendar52"></i
              ></span>
              <input
                type="date"
                class="form-control daterange-single"
                placehorlder="Data..."
                name="data2"
                required=""
                v-model="calendar.end_date"
              />
            </div>
          </div>

          <div class="text-right">
            <button
              type="button"
              @click="submit"
              class="btn bg-orange-600 text-uppercase text-bold"
            >
              Actualizar Datas
              <i class="icon-circle-right2 position-right"></i>
            </button>
          </div>
        </div>
      </div>
    </form>
    <!-- /basic layout -->
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex';
export default {
  name: 'WrapTimeInscription',
  components: {},
  data: () => ({
    
  }),
  methods: {
    ...mapActions(['addCalendar','removeCalendar','editCalendar', 'setCalendar','empyCalendar']),
    
    submit() {
      const x= new Date(this.calendar.start_date).getTime();
      const y= new Date(this.calendar.end_date).getTime();
      if(!this.calendar.id){
          if(x && y){
            if(x<=y){
                this.addCalendar(this.calendar)
                alert("Calendario Registrado com sucesso!")
                this.calendar = {
                  id: null,
                  start_date: null,
                  end_date: null,
                  description: null
                }
                console.log(this.calendar)
                this.setCalendar(this.calendar)
            }else{
              alert("A data de inicio deve ser antes da dat de termino!")
            }
          }else{
            alert("Preencha todos campos")
          }
      }else{
        if(x && y){
            if(x<=y){
                this.editCalendar(this.calendar)
                alert("Calendario Editado com sucesso!");
                this.empyCalendar();
               
            }else{
              alert("A data de inicio deve ser antes da dat de termino!")
            }
          }else{
            alert("Preencha todos campos")
          }
      }
    }
  },
  mounted(){
    this.calendar();
  },
  computed: {
    ...mapGetters(["calendar",'empycalendar']),
  },
};
</script>