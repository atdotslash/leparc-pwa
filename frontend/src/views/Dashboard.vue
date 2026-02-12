<template>
  <main class="min-h-screen bg-gray-50 p-6">
    <header class="mb-6">
      <h1 class="text-2xl font-bold text-gray-900">Dashboard</h1>
      <p class="text-gray-600">Resumen de tu rutina de hoy.</p>
    </header>

    <section class="grid gap-4 md:grid-cols-2">
      <article class="bg-white rounded-xl p-4 shadow-sm">
        <h2 class="font-semibold text-gray-900">Rutina asignada</h2>
        <p class="text-sm text-gray-600 mt-1">Sentadillas 5x5, Press banca 4x8, Remo 4x10.</p>
      </article>

      <PhysicsBadge :joules="13200" equivalent-object="un auto compacto (tipo Twingo)" />
    </section>
  </main>
</template>

<script setup>
import PhysicsBadge from '../components/PhysicsBadge.vue'
</script>
