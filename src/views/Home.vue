<template>
  <v-container>
    <v-row>
      <q-slider />
    </v-row>

    <v-row>
      <div class="pb-16">
        <p>{{ $t('message') }}</p>
        <div class="mb-4 text-2xl font-bold">This is a title</div>
        <p>
          Lorem ipsum dolor sit amet
          <a href="#" class="text-blue-600 hover:text-blue-800">consectetur</a>
          adipisicing elit. Aut dicta incidunt ea ut commodi quidem temporibus
          illo quia. Et itaque deleniti veniam tempore facere ipsum animi totam
          culpa minima vel voluptatem adipisci natus blanditiis similique sunt
          expedita, ex dicta doloremque repellat vitae temporibus. Quisquam
          quia, accusantium blanditiis architecto facilis saepe! Lorem ipsum
          dolor sit amet consectetur adipisicing elit. Ad unde laborum ut
          suscipit iure aliquam sapiente doloribus exercitationem nam sint.
        </p>
      </div>
    </v-row>
  </v-container>
</template>

<script>
import QSlider from '@/components/layout/Slider.vue';
export default {
  components: { QSlider },
  data() {
    return {
      activePlan: '',
    };
  },
};
</script>
