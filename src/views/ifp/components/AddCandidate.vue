<template>  
  <v-form >
      <div>
        <div class="row">
          <div class="col-md-12">
            <fieldset class="ms-15 me-16 ps-15 pe-15">
              <legend class="text-semibold">
                <div class="mt-10">
                  <i class="icon-user-plus position-left"></i>
                  Dados do candidato
                </div>
              </legend>

              <div class="form-group"> 
                  <div class="row">
                    <div class="col-md-6">
                      <label
                        class="control-label text-bold text-uppercase text-bold"
                        >Nome:</label
                      >
                      <input
                        type="text"
                        placeholder="Primeiro Nome"
                        class="form-control"
                        v-model="candidate.nome"
                        required=""
                      />
                    </div>
                    <div class="col-md-6">
                      <label
                        class="control-label text-bold text-uppercase text-bold"
                        >Outros Nomes:</label
                      >
                      <input
                        type="text"
                        placeholder="Outros Nomes"
                        class="form-control"
                        name="apelido"
                        required=""
                        v-model="candidate.outrosNomes"
                      />
                    </div>
                  </div> 
              </div>
              <div class="form-group"> 
                  <div class="row">
                    <div class="col-md-6">
                      <label
                        class="control-label text-bold text-uppercase text-bold"
                        >Contacto:</label
                      >
                      <input
                        type="text"
                        placeholder="(+258) 8X.XXXXXXX"
                        class="form-control"
                        required=""
                        v-model="candidate.contact"
                      />
                    </div>
                    <div class="col-md-6">
                      <label
                        class="control-label text-bold text-uppercase text-bold"
                        >Email:</label
                      >
                      <input
                        type="email"
                        placeholder="Introduza o e-mail"
                        class="form-control"
                        name="email"
                        v-model="candidate.email"
                      />
                    </div>
                  </div> 
              </div>

              <div class="form-group"> 
                  <div class="row">
                    <div class="col-md-6">
                      <label
                        class="control-label text-bold text-uppercase text-bold"
                        >Data de Nascimento:</label
                      >
                      <input
                        type="date"
                        placeholder="Data de nascimento"
                        class="form-control"
                        name="data_nascimento"
                        v-model="candidate.birth_date"
                      />
                    </div>
                    <div class="col-md-6">
                      <label
                        class="control-label text-bold text-uppercase text-bold"
                        >Identificação:</label
                      >
                      <input
                        type="text"
                        placeholder="BI/DIRE/Passaporte N.º"
                        class="form-control"
                        name="email"
                        v-model="candidate.identificacao"
                      />
                    </div>
                    <v-radio-group class="ms-3" v-model="candidate.gender_id" row>
                      <v-radio label="Masculino" value="1"></v-radio>
                      <v-radio label="Femenino" value="2"></v-radio>
                    </v-radio-group>
                  </div> 
              </div>

              <div class="form-group"> 
                  <div class="row">
                    <div class="col-md-6">
                      <v-select
                        :items="filterProvinces()"
                        label="Para qual provincia concorre?"
                        dense
                        v-model="provinceselected"
                        @change="filterDistricts()"
                      ></v-select>
                    </div>

                    <div class="col-md-6">
                      <v-select
                        :items="districtsname"
                        label="Selecione o distrito"
                        dense
                        v-model="districtselected"
                        @change="filterSchools()"
                      ></v-select>
                    </div>
                  </div> 
              </div>

              <div class="form-group"> 
                  <div class="row">
                    <div class="col-md-6">
                      <v-select
                      :items="schoolsname"
                        label="Escolha a Instituicao de formacao"
                        dense
                        v-model="schoolselected"
                        @change="filterCourses()"
                      ></v-select>
                    </div>
                    <div class="col-md-6">
                      <v-select
                        :items="coursesname"
                        label="Escolha o curso que pretente frequentar"
                        @change="setCourseId()"
                        v-model="courseselected"
                        dense
                      ></v-select>
                    </div>
                  </div> 
              </div>
            </fieldset>
          </div>
        </div>
        <div class="row mb-10 me-10"> 
          <div class="col-8"></div>
          <div class="m-0">
            <v-btn
            class="btn bg-slate-800 text-bold text-uppercase"
            @click="submit"
          >
            Gravar registo
            <i class="icon-arrow-right14 position-right"></i>
          </v-btn>
          </div>     
        </div>
      </div>
  </v-form> 
</template>

<script>
import { mapActions, mapGetters } from "vuex";
export default {
  name: "AddAccount", 
  components:{
  },
  data() {
    return {
      user:{},
      candidate: {
        nome: null,
        outrosNomes: null,
        contact: null,
        birth_date: null,
        identificacao: null,
        gender_id: null,
        district_id: null,
        school_id: null,
        course_id: null,
        province_id: null,
      },
      provincesname:null,
      provinceselected:null,
      districtselected: null,
      districtsname:null,
      schoolsname:null,
      schoolselected:null,
      coursesname:null,
      courseselected:null,
      schoolSelectedObject:null
    };
  },
  computed:{
    ...mapGetters(['provinces','district', 'schools','candidates','jurys'])
  },
  methods:{
    ...mapActions(['addCandidate','getSchools','getProvinces','getDistricToSchools','getJurys']),
    submit(){
      console.log(this.candidate)
      this.candidates.push(this.candidate);
      this.addCandidate(this.candidate)
    },
    filterProvinces() {
      return this.provinces.map((province) => {return province.name;});
    },
    filterDistricts() {
      let province = this.provinces.filter(
        (province) => province.name == this.provinceselected
      )[0];
      this.candidate.province_id = province.id;
      console.log("provinceID")
      console.log(this.candidate.province_id)
      this.districtsname = province.districts.map((d) => {
        return d.name;
      });
    },
    filterSchools() {
        let dist = this.district.filter((d) => {
          if(d.name == this.districtselected) return d
        })[0]
        this.candidate.district_id = dist.id;
        this.schoolsname = dist.schools.map((school)=> {return school.name})
    },
    filterCourses() {
        let school = this.schools.filter((s) => {
          if(s.name == this.schoolselected) return s
        })[0]
        this.schoolSelectedObject = school
        this.candidate.school_id = school.id;
        this.coursesname = school.courses.map((c)=> {return c.description})
    },
    setCourseId() { 
      let courses = this.schoolSelectedObject.courses;
      let course = courses.filter((c)=>{if(c.description==this.courseselected) return c})[0]
      this.candidate.course_id = course.id;
    }
  },
  created() {
    this.user = JSON.parse(localStorage.getItem("user"));
    
  },
  mounted() {
      this.getProvinces();
      this.filterProvinces();
      this.getDistricToSchools();
      this.getSchools();
      //this.getCandidates();
      this.getJurys();
      this.getCandidatesByCourse(1)
  },
};
</script>

<style></style>
