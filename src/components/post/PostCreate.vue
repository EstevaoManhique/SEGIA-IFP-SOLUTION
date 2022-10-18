<template>
  <v-row justify="center">
    <v-dialog v-model="postDialog" v-if="user" persistent>
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          color="primary"
          justify="right"
          dark
          v-bind="attrs"
          v-on="on"
          v-if="user.admin"
          @click="onOpen"
        >
          {{ $t('title.create_post') }}
        </v-btn>
      </template>
      <v-card class="col-sm-8 mx-auto">
        <v-toolbar color="deep-purple accent-4" cards dark flat>
          <v-card-title class="text-h6 font-weight-regular">
            {{ $t('title.create_post') }}
          </v-card-title>
          <v-spacer></v-spacer>
        </v-toolbar>
        <v-form
          ref="form"
          v-model="form"
          class="pa-4 pt-6"
          @submit.prevent="submit"
        >
          <v-stepper v-model="e6" vertical>
            <v-stepper-step :complete="e6 > 1" step="1">
              {{ $t('title.upload_img') }}
            </v-stepper-step>

            <v-stepper-content step="1">
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
                <v-checkbox v-model="post.online" color="deep-purple">
                  <template v-slot:label> Online &nbsp; </template>
                </v-checkbox>
              </v-row>
              <v-btn color="primary" @click="e6 = 2"> Continue </v-btn>
            </v-stepper-content>

            <v-stepper-step :complete="e6 > 2" step="2">
              {{ $t('title.en_register') }}
            </v-stepper-step>

            <v-stepper-content step="2">
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
              <v-btn color="primary" @click="e6 = 3"> Continue </v-btn>
            </v-stepper-content>

            <v-stepper-step :complete="e6 > 3" step="3">
              {{ $t('title.pt_register') }}
            </v-stepper-step>

            <v-stepper-content step="3">
              <v-text-field
                v-model="post.titulo"
                :rules="[rules.required, rules.length(100)]"
                filled
                color="deep-purple"
                counter="100"
                label="Title"
                style="min-height: 96px"
                type="text"
              ></v-text-field>
              <v-textarea
                v-model="post.conteudo"
                auto-grow
                filled
                :rules="[rules.required]"
                color="deep-purple"
                label="Content"
              ></v-textarea>
              <v-btn color="primary" @click="e6 = 1"> Continue </v-btn>
            </v-stepper-content>
          </v-stepper>
        </v-form>
        <v-divider></v-divider>
        <v-card-actions>
          <v-btn text @click="onClose"> Close </v-btn>

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
import { mapGetters, mapActions } from 'vuex';
export default {
  name: 'QPostCreate',
  data: () => ({
    imgPreview: null,
    e6: 1,
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
    ...mapActions([
      'addPost',
      'updatePost',
      'createPostDialog',
      'setPostDialog',
      'resetPost',
    ]),
    onOpen() {
      // this.$refs.form.reset();
      this.resetPost();
      this.imgPreview = this.post.img;
      this.setPostDialog(true);
    },
    submit() {
      if (this.post.id != null) {
        this.updatePost(this.post);
      } else {
        this.addPost(this.post);
      }
      this.setPostDialog(false);
      this.$refs.form.reset();
    },
    onClose() {
      // this.$refs.form.reset();
      this.$refs.form.reset();
      this.resetPost();
      this.setPostDialog(false);
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
  created() {
    this.createPostDialog();
  },
  computed: {
    ...mapGetters(['user', 'postDialog', 'post']),
  },
};
</script>
