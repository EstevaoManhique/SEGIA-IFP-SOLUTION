<template>
  <iframe
    :src="link"
    width="100%"
    height="480"
    frameborder="0"
    allowfullscreen
  ></iframe>
</template>

<script>
export default {
  name: 'GoogleMaps',
  props: ['link'],
};
</script>

<style></style>
