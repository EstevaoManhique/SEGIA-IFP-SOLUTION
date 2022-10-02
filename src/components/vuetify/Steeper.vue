<template>
    <div>
      <v-card class="mb-4">
        <v-card-text>
          <v-select
            v-model="steps"
            :items="[2, 3, 4, 5, 6]"
            label="# of steps"
          ></v-select>
        </v-card-text>
      </v-card>
      <v-stepper v-model="e1">
        <v-stepper-header>
          <template v-for="n in steps">
            <v-stepper-step
              :key="`${n}-step`"
              :complete="e1 > n"
              :step="n"
              editable
            >
              Step {{ n }}
            </v-stepper-step>

            <v-divider v-if="n !== steps" :key="n"></v-divider>
          </template>
        </v-stepper-header>

        <v-stepper-items>
          <v-stepper-content v-for="n in steps" :key="`${n}-content`" :step="n">
            <v-card
              class="mb-12"
              color="grey lighten-1"
              height="200px"
            ></v-card>

            <v-btn color="primary" @click="nextStep(n)"> Continue </v-btn>

            <v-btn text> Cancel </v-btn>
          </v-stepper-content>
        </v-stepper-items>
      </v-stepper>

      <v-stepper v-model="e6" vertical>
        <v-stepper-step :complete="e6 > 1" step="1">
          Select an app
          <small>Summarize if needed</small>
        </v-stepper-step>

        <v-stepper-content step="1">
          <v-card color="grey lighten-1" class="mb-12" height="200px"></v-card>
          <v-btn color="primary" @click="e6 = 2"> Continue </v-btn>
          <v-btn text> Cancel </v-btn>
        </v-stepper-content>

        <v-stepper-step :complete="e6 > 2" step="2">
          Configure analytics for this app
        </v-stepper-step>

        <v-stepper-content step="2">
          <v-card color="grey lighten-1" class="mb-12" height="200px"></v-card>
          <v-btn color="primary" @click="e6 = 3"> Continue </v-btn>
          <v-btn text> Cancel </v-btn>
        </v-stepper-content>

        <v-stepper-step :complete="e6 > 3" step="3">
          Select an ad format and name ad unit
        </v-stepper-step>

        <v-stepper-content step="3">
          <v-card color="grey lighten-1" class="mb-12" height="200px"></v-card>
          <v-btn color="primary" @click="e6 = 4"> Continue </v-btn>
          <v-btn text> Cancel </v-btn>
        </v-stepper-content>

        <v-stepper-step step="4"> View setup instructions </v-stepper-step>
        <v-stepper-content step="4">
          <v-card color="grey lighten-1" class="mb-12" height="200px"></v-card>
          <v-btn color="primary" @click="e6 = 1"> Continue </v-btn>
          <v-btn text> Cancel </v-btn>
        </v-stepper-content>
      </v-stepper>
    </div>
  </template>

  <script>
    export default {
      data() {
        return {
          e6: 1,
           e1: 1,
        steps: 2,
        };
      },

    watch: {
      steps (val) {
        if (this.e1 > val) {
          this.e1 = val
        }
      },
    },

    methods: {
      nextStep (n) {
        if (n === this.steps) {
          this.e1 = 1
        } else {
          this.e1 = n + 1
        }
      },
    },
    };
  </script>

  <style></style>
</template>
