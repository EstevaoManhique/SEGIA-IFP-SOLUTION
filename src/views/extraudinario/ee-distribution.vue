<template>
    <v-container>
        <nav-bar :menu_types = "4"/>
        <v-row>
            <div class="content-wrapper">
                <div>Distribution</div>
            </div>
        </v-row>
    </v-container>
  </template>
  
  <script>
  import NavBar from '@/components/layout/NavBar.vue';
  export default {
    components:{NavBar}
  };
  </script>
  
  <style>
  </style>