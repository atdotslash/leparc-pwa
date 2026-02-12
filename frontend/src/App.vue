<template>
  <div>
    <header class="bg-leparc-primary text-white px-6 py-4 flex items-center justify-between">
      <h1 class="font-bold">LeParc PWA</h1>
      <div class="space-x-2">
        <button
          class="rounded-md px-3 py-1 text-sm"
          :class="currentView === 'login' ? 'bg-white text-black' : 'bg-gray-700'"
          @click="currentView = 'login'"
        >
          Login
        </button>
        <button
          class="rounded-md px-3 py-1 text-sm"
          :class="currentView === 'dashboard' ? 'bg-white text-black' : 'bg-gray-700'"
          @click="currentView = 'dashboard'"
        >
          Dashboard
        </button>
      </div>
    </header>

    <LoginView v-if="currentView === 'login'" />
    <DashboardView v-else />
  </div>
</template>

<script setup>
import { ref } from 'vue'
import LoginView from './views/Login.vue'
import DashboardView from './views/Dashboard.vue'

const currentView = ref('dashboard')
</script>
