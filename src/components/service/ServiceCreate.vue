<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" v-if="user">
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          color="primary"
          justify="right"
          dark
          v-bind="attrs"
          v-on="on"
          v-if="user.admin"
        >
          {{ $t('title.create_service') }}
        </v-btn>
      </template>
      <v-card class="col-sm-8 mx-auto">
        <v-toolbar color="deep-purple accent-4" cards dark flat>
          <v-card-title class="text-h6 font-weight-regular">
            {{ $t('title.create_service') }}
          </v-card-title>
          <v-spacer></v-spacer>
        </v-toolbar>
        <v-form ref="form" v-model="form" class="pa-4 pt-6">
          <v-row class="mb-4" justify="center">
            <input
              type="file"
              name=""
              @change="previewImg"
              id=""
              class="form-control"
              enctype="multipart/form-data"
              style="display: none"
              ref="imgInput"
              accept=".jpg, .png, .jpeg"
            />
            <v-img
              :src="imgPreview"
              class="white--text align-end col-12 col-md-6"
              gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
              height="300px"
              @click="$refs.imgInput.click()"
              label="Img"
            ></v-img>
          </v-row>
          <v-text-field
            v-model="service.name"
            :rules="[rules.required, rules.length(100)]"
            filled
            color="deep-purple"
            counter="100"
            label="name"
            style="min-height: 96px"
            type="text"
          ></v-text-field>

          <v-textarea
            v-model="service.description"
            auto-grow
            filled
            :rules="[rules.required]"
            color="deep-purple"
            label="Description"
          ></v-textarea>

          <v-checkbox v-model="service.active" color="deep-purple">
            <template v-slot:label> Active &nbsp; </template>
          </v-checkbox>
        </v-form>
        <v-divider></v-divider>
        <v-card-actions>
          <v-btn text @click="$refs.form.reset()"> Clear </v-btn>
          <v-spacer></v-spacer>
          <v-btn
            :disabled="!form"
            :loading="isLoading"
            class="white--text"
            color="deep-purple accent-4"
            depressed
            @click="submit"
          >
            Submit
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>
<script>
import { mapGetters } from 'vuex';
export default {
  name: 'QServiceCreate',
  data: () => ({
    service: {
      name: '',
      description: '',
      img: null,
      active: true,
    },
    dialog: false,
    imgPreview: null,
    form: false,
    isLoading: false,

    rules: {
      email: (v) => !!(v || '').match(/@/) || 'Please enter a valid email',
      length: (len) => (v) =>
        (v || '').length < len || `Invalid character length, required ${len}`,
      password: (v) =>
        !!(v || '').match(
          /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*(_|[^\w])).+$/
        ) ||
        'Password must contain an upper case letter, a numeric character, and a special character',
      required: (v) => !!v || 'This field is required',
    },
  }),

  methods: {
    submit() {
      let data = new FormData();
      data.append('name', this.service.name);
      data.append('description', this.service.description);
      data.append('img', this.service.img);
      data.append('active', this.service.active);
      this.$api.post('service/store', data);

      this.dialog = false;
    },
    previewImg(e) {
      this.service.img = e.target.files[0];
      let reader = new FileReader();
      reader.readAsDataURL(this.service.img);
      reader.onload = (e) => {
        this.imgPreview = e.target.result;
      };
    },
  },
  computed: {
    ...mapGetters(['user']),
  },
};
</script>
