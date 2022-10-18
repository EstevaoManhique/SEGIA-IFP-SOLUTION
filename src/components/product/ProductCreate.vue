<template>
  <v-row justify="center">
    <v-dialog v-model="productDialog" v-if="user" persistent>
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
          {{ $t('title.create_product') }}
        </v-btn>
      </template>
      <v-card class="col-sm-8 mx-auto">
        <v-toolbar color="deep-purple accent-4" cards dark flat>
          <v-card-title class="text-h6 font-weight-regular">
            {{ $t('title.create_product') }}
          </v-card-title>
          <v-spacer></v-spacer>
        </v-toolbar>

        <v-form
          ref="form"
          v-model="form"
          class="pa-4 pt-6"
          @submit.prevent="onSub"
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
                <v-checkbox v-model="product.online" color="deep-purple">
                  <template v-slot:label> Online &nbsp; </template>
                </v-checkbox>
              </v-row>
              <v-btn color="primary" @click="e6 = 2"> Continue </v-btn>
            </v-stepper-content>

            <v-stepper-step :complete="e6 > 2" step="2">
              {{ $t('title.pt_register') }}
            </v-stepper-step>

            <v-stepper-content step="2">
              <v-text-field
                v-model="product.name"
                :rules="[rules.required, rules.length(100)]"
                filled
                color="deep-purple"
                counter="100"
                :label="$t('fieldes.name')"
                style="min-height: 96px"
                type="text"
              ></v-text-field>
              <v-text-field
                v-model="product.price"
                :rules="[rules.required]"
                filled
                color="deep-purple"
                counter="100"
                :label="$t('fieldes.price')"
                style="min-height: 96px"
                type="number"
              ></v-text-field>
              <v-textarea
                v-model="product.description"
                auto-grow
                filled
                :rules="[rules.required]"
                color="deep-purple"
                :label="$t('fieldes.description')"
              ></v-textarea>
              <v-btn color="primary" @click="e6 = 3"> Continue </v-btn>
            </v-stepper-content>

            <v-stepper-step :complete="e6 > 3" step="3">
              {{ $t('title.en_register') }}
            </v-stepper-step>

            <v-stepper-content step="3">
              <v-text-field
                v-model="product.nome"
                :rules="[rules.required, rules.length(100)]"
                filled
                color="deep-purple"
                counter="100"
                :label="$t('fieldes.name')"
                style="min-height: 96px"
                type="text"
              ></v-text-field>
              <v-text-field
                v-model="product.price"
                :rules="[rules.required]"
                filled
                color="deep-purple"
                counter="100"
                :label="$t('fieldes.price')"
                style="min-height: 96px"
                type="number"
              ></v-text-field>
              <v-textarea
                v-model="product.descricao"
                auto-grow
                filled
                :rules="[rules.required]"
                color="deep-purple"
                :label="$t('fieldes.description')"
              ></v-textarea>
              <v-btn color="primary" @click="e6 = 1"> Continue </v-btn>
            </v-stepper-content>
          </v-stepper>

          <v-divider></v-divider>
          <v-card-actions>
            <v-btn text @click="onClose"> Close </v-btn>
            <v-spacer></v-spacer>
            <v-btn
              :disabled="!form"
              :loading="isLoading"
              type="submit"
              class="white--text"
              color="deep-purple accent-4"
              depressed
            >
              Submit
            </v-btn>
          </v-card-actions>
        </v-form>
      </v-card>
    </v-dialog>
  </v-row>
</template>
<script>
import { mapGetters, mapActions } from 'vuex';
export default {
  name: 'ProductCreate',
  data: () => ({
    imgPreview: null,
    form: false,
    isLoading: false,
    e6: 1,

    rules: {
      email: (v) => !!(v || '').match(/@/) || 'Please enter a valid email',
      length: (len) => (v) =>
        (v || '').length < len || `Invalid character length, required ${len}`,
      password: (v) =>
        !!(v || '').match(
          /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*(_|[^\w])).+$/
        ) ||
        'Password must contain an upper case letter, a numeric character, and a special character',
      required: (v) => !!v || 'error.require',
    },
  }),

  methods: {
    ...mapActions([
      'addProduct',
      'updateProduct',
      'createProductDialog',
      'setProductDialog',
      'resetProduct',
    ]),
    onOpen() {
      // this.$refs.form.reset();
      this.resetProduct();
      this.imgPreview = this.product.img;
      this.setProductDialog(true);
    },
    onSub() {
      if (this.imgPreview) {
        this.product.img = this.imgPreview;
      }
      if (this.product.id != null) {
        this.updateProduct(this.product);
        //this.resetProduct();
      } else {
        this.addProduct(this.product);
      }
      this.setProductDialog(false);
      this.$refs.form.reset();
    },
    onClose() {
      // this.$refs.form.reset();
      this.resetProduct();
      this.setProductDialog(false);
    },
    previewImg(e) {
      this.productt.img = e.target.files[0];
      let reader = new FileReader();
      reader.readAsDataURL(this.product.img);
      reader.onload = (e) => {
        this.imgPreview = e.target.result;
      };
    },
  },
  created() {
    this.createProductDialog();
  },
  computed: {
    ...mapGetters(['user', 'productDialog', 'product']),
  },
};
</script>
