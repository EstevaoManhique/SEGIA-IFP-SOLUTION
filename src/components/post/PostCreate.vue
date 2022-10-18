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
          Addicionar Post
        </v-btn>
      </template>
      <v-card class="col-sm-8 mx-auto">
        <v-toolbar color="deep-purple accent-4" cards dark flat>
          <v-card-title class="text-h6 font-weight-regular">
            {{ $t('title.create_post') }}
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
            v-model="post.title"
            :rules="[rules.required, rules.length(100)]"
            filled
            color="deep-purple"
            counter="100"
            label="Title"
            style="min-height: 96px"
            type="text"
          ></v-text-field>

          <v-textarea
            v-model="post.content"
            auto-grow
            filled
            :rules="[rules.required]"
            color="deep-purple"
            label="Content"
          ></v-textarea>

          <v-checkbox v-model="post.online" color="deep-purple">
            <template v-slot:label> Online &nbsp; </template>
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
  name: 'QPostCreate',
  data: () => ({
    post: {
      title: '',
      content: '',
      img: '',
      online: true,
    },
    dialog: false,
    imgPreview: null,

    email: undefined,
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
      data.append('title', this.post.title);
      data.append('content', this.post.content);
      data.append('img', this.post.img);
      data.append('online', this.post.online);
      this.$api
        .post('post/store', data)
        .then((response) => {
          this.dialog = false;
          console.log(response.data);
        })
        .catch((error) => {
          console.log(error);
        })
        .finally(() => {});
    },
    previewImg(e) {
      this.post.img = e.target.files[0];
      let reader = new FileReader();
      reader.readAsDataURL(this.post.img);
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
