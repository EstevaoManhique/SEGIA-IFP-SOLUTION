<template>
  <v-container>
    <slider />

    <v-row>
      <v-col sm="6" class="col-12 col-sm-6">
        <our-service />
      </v-col>

      <v-col sm="6" class="col-12 col-sm-6">
        <google-maps :link="google_link" />
      </v-col>

      <!-- <google-maps /> -->
    </v-row>
    <online-post />
  </v-container>
</template>

<script>
import OnlinePost from '@/components/post/OnlinePost.vue';
import Slider from '@/components/layout/Slider.vue';
//import OurNetwork from '@/components/network/OurNetwork.vue';
import OurService from '@/components/service/OurService.vue';
//import LMap from '@/components/LMaps.vue';
import GoogleMaps from '@/components/layout/GoogleMaps.vue';
//import QIcon from "@/components/Icon.vue";
//import GoogleMaps from "@/components/GoogleMaps.vue";
import { mapGetters } from 'vuex';
export default {
  name: 'HomeView',
  components: {
    OnlinePost,
    Slider,
    // OurNetwork,
    OurService,
    //LMap,
    GoogleMaps,
    // GoogleMaps,
  },
  data: () => ({
    google_link:
      'https://www.google.com/maps/d/embed?mid=1E1g5XvnXQpYZFJeBuWMYOPcRvnBOMEQ&ehbc=2E312F',
  }),

  computed: {
    ...mapGetters(['user']),
  },
};
</script>
