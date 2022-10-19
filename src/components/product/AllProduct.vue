<template>
  <v-container>
    <div class="section-header">
      <span>{{ $t('title.our_products') }} </span>
      <h2>{{ $t('title.our_products') }}</h2>
    </div>

    <v-row>
      <v-col v-for="(product, index) in products" :key="index" sm="6" md="3">
        <v-card>
          <v-img
            :src="product.img"
            class="white--text align-end"
            gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
            height="200px"
          >
            <v-card-title
              v-text="
                $i18n.locale.toLowerCase() == 'en' ? product.name : product.nome
              "
            ></v-card-title>
          </v-img>
          <v-card-text
            class="text--primary"
            v-text="
              $i18n.locale.toLowerCase() == 'en'
                ? product.description
                : product.descricao
            "
          >
          </v-card-text>

          <v-card-actions>
            <v-card-text class="text--success" v-text="product.price">
            </v-card-text>
            <v-spacer></v-spacer>
            <v-btn
              icon
              @click="editProduct(product.id)"
              v-if="user && user.admin"
            >
              <v-icon>mdi-pencil</v-icon>
            </v-btn>
            <v-btn
              icon
              color="danger"
              @click="removeProduct(product.id)"
              v-if="user && user.admin"
            >
              <v-icon>mdi-trash-can</v-icon>
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
export default {
  name: 'AllProduct',
  methods: {
    ...mapActions([
      'fetchProducts',
      'removeProduct',
      'setProductDialog',
      'setProduct',
      'resetProduct',
    ]),
    editProduct(id) {
      this.resetProduct();
      this.setProduct(id);
      this.setProductDialog(true);
    },
  },
  created() {
    this.fetchProducts();
  },
  computed: mapGetters(['products', 'user', 'product']),
};
</script>

<style></style>
