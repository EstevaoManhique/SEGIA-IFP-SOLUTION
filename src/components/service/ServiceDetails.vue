<template>
  <v-container fluid>
    <v-card class="mt-4">
      <div class="section-header">
        <span>{{ $t('title.our_service_products') }} </span>
        <h2>{{ $t('title.our_service_products') }}</h2>
      </div>
      <v-tabs v-model="active_tab">
        <v-tab
          v-for="card in services"
          :key="card.id"
          :activeClass="card.id == service_id"
        >
          {{ $i18n.locale.toLowerCase() == 'en' ? card.name : card.nome }}
        </v-tab>

        <v-tab-item v-for="(card, index) in services" :key="index">
          <v-card flat class="mt-4">
            <v-row>
              <v-col sm="12">
                <v-img
                  :src="card.img"
                  class="white--text align-end"
                  gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                  height="200px"
                >
                  <v-card-title
                    v-text="
                      $i18n.locale.toLowerCase() == 'en' ? card.name : card.nome
                    "
                  ></v-card-title>
                </v-img>
                <v-card-content>
                  <v-card-text
                    class="text--primary"
                    v-text="
                      $i18n.locale.toLowerCase() == 'en'
                        ? card.description
                        : card.descricao
                    "
                  ></v-card-text>
                </v-card-content>
              </v-col>
            </v-row>
            <v-row>
              <h1>{{ $t('title.our_offerings') }}</h1>
              <v-row
                dense
                v-for="(product, index) in products"
                :key="index"
                v-show="product.service_id == card.id"
              >
                <q-product :card="product" :index="index" />
              </v-row>
            </v-row>
          </v-card>
        </v-tab-item>
      </v-tabs>
    </v-card>
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import QProduct from '@/components/product/Products.vue';
export default {
  name: 'ServiceDetails',
  data: () => ({
    active_tab: 0,
    service_id: 0,
  }),
  components: { QProduct },

  created() {
    this.fetchServices();
    this.fetchProducts();
    this.productt(1);
    this.active_tab = this.$route.params.id;
  },
  computed: mapGetters(['services', 'user', 'products']),
  methods: {
    ...mapActions([
      'fetchServices',
      'fetchProducts',
      'removeService',
      'setService',
      'resetService',
    ]),
    productt(service_id) {
      console.log(this.products);
      product = this.products.filter((product) => {
        product.service_id == service_id;
      });

      return product;
    },
    editService(id) {
      this.resetService();
      this.setService(id);
    },
  },
};
</script>

<style></style>
