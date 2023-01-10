<template>
  <v-container>
    <v-row>
      <v-col cols="12" md="4">
        <v-card>
          <v-select @change="getQuestionsExam()" v-model="exam_id" :items="opcoesdisciplina" label="Escolha a disciplina" outlined dense class="ma-1">
          </v-select>
          <template>
            <div>
              <v-data-table
                :headers="headers1"
                :items="respostas"
                class="elevation-1"
              >
                <template v-slot:item.a="{ item }">
                  <v-simple-checkbox
                    class="hover"
                    @click="setAnswerA(item.id, !item.a)"
                    v-model="item.a"
                    disabled
                  ></v-simple-checkbox>
                </template>
                <template v-slot:item.b="{ item }">
                  <v-simple-checkbox
                    class="hover"
                    @click="setAnswerB(item.id, !item.b)"
                    v-model="item.b"
                    disabled
                  ></v-simple-checkbox>
                </template>
                <template v-slot:item.c="{ item }">
                  <v-simple-checkbox
                    class="hover"
                    @click="setAnswerC(item.id, !item.c)"
                    v-model="item.c"
                    disabled
                  ></v-simple-checkbox>
                </template>
                <template v-slot:item.d="{ item }">
                  <v-simple-checkbox
                    class="hover"
                    @click="setAnswerD(item.id, !item.d)"
                    v-model="item.d"
                    disabled
                  ></v-simple-checkbox>
                </template>
              </v-data-table>
              <div class="d-flex justify-end mr-2 my-3">
                <v-btn @click="saveQuestion()"
               depressed color="primary"> Salvar Alteracoes </v-btn>
              </div>
            </div>
          </template>
        </v-card>
      </v-col>
      <v-col cols="10" md="8">
        <v-card>
            <v-select @change="getQuestionsExam()" v-model="exam_id" :items="opcoesdisciplina" label="Escolha a disciplina" outlined dense class="ma-1">
            </v-select>
          <template>
            <v-data-table
              :headers="headers"
              :items="questionsByExam"
              class="elevation-1"
            ></v-data-table>
            
          </template>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>
  <script>
import { mapActions, mapGetters } from "vuex";
export default {
  name: "InsciptionValidate",
  components: {},
  data: () => ({
    exam_id:null,
    headers: [
      {
        text: "Questao",
        align: "start",
        sortable: false,
        value: "numero",
      },
      { text: "Resposta", value: "resposta", sortable: false },
      { text: "Cotacao", value: "cotacao", sortable: false },
    ],
      opcoesdisciplina: [
        { text: "Portugues (12+1)", value: 1 },
        { text: "Matematica (12+1)", value: 2 },
      ],
    desserts: [
      {
        name: "Questao 1",
        calories: "A",
        fat: 0.5,
      },
      {
        name: "Questao 2",
        calories: "B",
        fat: 0.5,
      },
      {
        name: "Questao 3",
        calories: "C",
        fat: 0.5,
      },
      {
        name: "Questao 4",
        calories: "D",
        fat: 0.5,
      },
      {
        name: "Questao 5",
        calories: "E",
        fat: 0.5,
      },
      {
        name: "Questao 6",
        calories: "F",
        fat: 0.5,
      },
      {
        name: "Questao 7",
        calories: "D",
        fat: 0.5,
      },
      {
        name: "Questao 8",
        calories: "D",
        fat: 0.5,
      },
      {
        name: "Questao 9",
        calories: "D",
        fat: 0.5,
      },
      {
        name: "Questao 10",
        calories: "D",
        fat: 0.5,
      },
    ],
    desserts1: [
      {
        name: "Questao 1",
        calories: 159,
        fat: 6.0,
        carbs: 24,
        protein: 4.0,
        iron: "1%",
        glutenfree: true,
      },
      {
        name: "Questao 2",
        calories: 237,
        fat: 9.0,
        carbs: 37,
        protein: 4.3,
        iron: "1%",
        glutenfree: false,
      },
      {
        name: "Questao 3",
        calories: 262,
        fat: 16.0,
        carbs: 23,
        protein: 6.0,
        iron: "7%",
        glutenfree: false,
      },
      {
        name: "Questao 4",
        calories: 375,
        fat: 0.0,
        carbs: 94,
        protein: 0.0,
        iron: "0%",
        glutenfree: true,
      },
      {
        name: "Questao 5",
        calories: 392,
        fat: 0.2,
        carbs: 98,
        protein: 0,
        iron: "2%",
        glutenfree: true,
      },
      {
        name: "Questao 6",
        calories: 518,
        fat: 26.0,
        carbs: 65,
        protein: 7,
        iron: "6%",
        glutenfree: false,
      },
    ],
    headers1: [
      {
        text: "Questao",
        align: "start",
        value: "name",
        sortable: false,
      },
      { text: "A", value: "a", sortable: false },
      { text: "B", value: "b", sortable: false },
      { text: "C", value: "c", sortable: false },
      { text: "D", value: "d", sortable: false },
    ],
    respostas: [
      { id: 1, name: "Questao 1", a: false, b: false, c: false, d: false },
      { id: 2, name: "Questao 2", a: false, b: false, c: false, d: false },
      { id: 3, name: "Questao 3", a: false, b: false, c: false, d: false },
      { id: 4, name: "Questao 4", a: false, b: false, c: false, d: false },
      { id: 5, name: "Questao 5", a: false, b: false, c: false, d: false },
      { id: 6, name: "Questao 6", a: false, b: false, c: false, d: false },
      { id: 7, name: "Questao 7", a: false, b: false, c: false, d: false },
      { id: 8, name: "Questao 8", a: false, b: false, c: false, d: false },
      { id: 9, name: "Questao 9", a: false, b: false, c: false, d: false },
      { id: 10, name: "Questao 10", a: false, b: false, c: false, d: false },

      { id: 11, name: "Questao 11", a: false, b: false, c: false, d: false },
      { id: 12, name: "Questao 12", a: false, b: false, c: false, d: false },
      { id: 13, name: "Questao 13", a: false, b: false, c: false, d: false },
      { id: 14, name: "Questao 14", a: false, b: false, c: false, d: false },
      { id: 15, name: "Questao 15", a: false, b: false, c: false, d: false },
      { id: 16, name: "Questao 16", a: false, b: false, c: false, d: false },
      { id: 17, name: "Questao 17", a: false, b: false, c: false, d: false },
      { id: 18, name: "Questao 18", a: false, b: false, c: false, d: false },
      { id: 19, name: "Questao 19", a: false, b: false, c: false, d: false },
      { id: 20, name: "Questao 20", a: false, b: false, c: false, d: false },

      { id: 21, name: "Questao 21", a: false, b: false, c: false, d: false },
      { id: 22, name: "Questao 22", a: false, b: false, c: false, d: false },
      { id: 23, name: "Questao 23", a: false, b: false, c: false, d: false },
      { id: 24, name: "Questao 24", a: false, b: false, c: false, d: false },
      { id: 25, name: "Questao 25", a: false, b: false, c: false, d: false },
      { id: 26, name: "Questao 26", a: false, b: false, c: false, d: false },
      { id: 27, name: "Questao 27", a: false, b: false, c: false, d: false },
      { id: 28, name: "Questao 28", a: false, b: false, c: false, d: false },
      { id: 29, name: "Questao 29", a: false, b: false, c: false, d: false },
      { id: 30, name: "Questao 30", a: false, b: false, c: false, d: false },

      { id: 31, name: "Questao 31", a: false, b: false, c: false, d: false },
      { id: 32, name: "Questao 32", a: false, b: false, c: false, d: false },
      { id: 33, name: "Questao 33", a: false, b: false, c: false, d: false },
      { id: 34, name: "Questao 34", a: false, b: false, c: false, d: false },
      { id: 35, name: "Questao 35", a: false, b: false, c: false, d: false },
      { id: 36, name: "Questao 36", a: false, b: false, c: false, d: false },
      { id: 37, name: "Questao 37", a: false, b: false, c: false, d: false },
      { id: 38, name: "Questao 38", a: false, b: false, c: false, d: false },
      { id: 39, name: "Questao 39", a: false, b: false, c: false, d: false },
      { id: 40, name: "Questao 40", a: false, b: false, c: false, d: false },
    ],
    editedItem: {
        resposta:null, exam_id:null, id:null
    },
    defaultItem: {
      a: false,
      b: false,
      c: false,
      d: false,
    },
  }),
  methods: {
    ...mapActions(['getQuestions','addQuestions',"getQuestionsByExam"]),
    setAnswerA(id, value) {
      let index = -1;
      index = this.respostas.findIndex((r) => r.id == id);

      let payload;
      if (value) {
        payload = {
          id: id,
          name: "Questao " + (index + 1),
          a: value,
          b: !value,
          c: !value,
          d: !value,
        };
        console.log("True");
        console.log(payload);
      } else {
        payload = {
          id: id,
          name: "Questao " + (index + 1),
          a: value,
          b: value,
          c: value,
          d: value,
        };

        console.log("False");
        console.log(payload);
      }

      this.respostas.splice(index, 1, payload);
      console.log(index, id, value);
    },
    setAnswerB(id, value) {
      let index = -1;
      index = this.respostas.findIndex((r) => r.id == id);

      let payload;
      if (value) {
        payload = {
          id: id,
          name: "Questao " + (index + 1),
          a: !value,
          b: value,
          c: !value,
          d: !value,
        };
        console.log("True");
        console.log(payload);
      } else {
        payload = {
          id: id,
          name: "Questao " + (index + 1),
          a: value,
          b: value,
          c: value,
          d: value,
        };

        console.log("False");
        console.log(payload);
      }

      this.respostas.splice(index, 1, payload);
      console.log(index, id, value);
    },
    setAnswerC(id, value) {
      let index = -1;
      index = this.respostas.findIndex((r) => r.id == id);

      let payload;
      if (value) {
        payload = {
          id: id,
          name: "Questao " + (index + 1),
          a: !value,
          b: !value,
          c: value,
          d: !value,
        };
        console.log("True");
        console.log(payload);
      } else {
        payload = {
          id: id,
          name: "Questao " + (index + 1),
          a: value,
          b: value,
          c: value,
          d: value,
        };

        console.log("False");
        console.log(payload);
      }

      this.respostas.splice(index, 1, payload);
      console.log(index, id, value);
    },
    setAnswerD(id, value) {
      let index = -1;
      index = this.respostas.findIndex((r) => r.id == id);

      let payload;
      if (value) {
        payload = {
          id: id,
          name: "Questao " + (index + 1),
          a: !value,
          b: !value,
          c: !value,
          d: value,
        };
        console.log("True");
        console.log(payload);
      } else {
        payload = {
          id: id,
          name: "Questao " + (index + 1),
          a: value,
          b: value,
          c: value,
          d: value,
        };

        console.log("False");
        console.log(payload);
      }

      this.respostas.splice(index, 1, payload);
      console.log(index, id, value);
    },
    getQuestionsExam(){
        console.log("dddd")
        this.getQuestionsByExam(this.exam_id)
    },
    saveQuestion(){
        if(this.exam_id){
        let questoes = []

        this.respostas.map((r)=>{

            let questao = {id:null, resposta:null, id_exam:null}
            questao = Object.assign({}, r)
            questao.exam_id = this.exam_id

            questao.cotacao = 0.5
            if(questao.a){
                questao.resposta = "A"
                questao.numero = questao.id
            }else if(questao.b){
                questao.resposta = "B"
                questao.numero = questao.id
            }else if(questao.c){
                questao.resposta = "C"
                questao.numero = questao.id
            }else if(questao.d){
                questao.resposta = "D"
                questao.numero = questao.id
            }
            questoes.push(questao)
        })

        console.log(questoes)
        this.addQuestions(questoes)
        }else{
            alert("Escolha o exame para definir a folha de resposta!")
        }
    }
  },
  computed: {
    ...mapGetters(["questionsByExam"]),
  },
  mounted(){
    this.getQuestions()
  }
};
</script>
<style>
.hover {
  cursor: pointer;
}
</style>