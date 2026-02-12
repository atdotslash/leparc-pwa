<template>
  <article class="bg-leparc-primary text-white rounded-xl p-4 shadow-sm">
    <h2 class="font-semibold">Impacto físico</h2>
    <p class="mt-2 text-sm">Hoy generaste <strong>{{ joules }} J</strong>.</p>
    <p class="text-sm">Eso equivale a levantar <strong>{{ equivalentObject }}</strong>.</p>
  </article>
</template>

<script setup>
defineProps({
  joules: {
    type: Number,
    required: true
  },
  equivalentObject: {
    type: String,
    required: true
  }
})
</script>
