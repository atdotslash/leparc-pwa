<template>
  <section class="min-h-screen flex items-center justify-center bg-gray-100 p-4">
    <div class="w-full max-w-md bg-white rounded-2xl shadow-md p-6">
      <h1 class="text-2xl font-bold text-gray-900">Ingresá a LeParc</h1>
      <p class="text-sm text-gray-600 mt-1">Tu entrenamiento, rutina y progreso en un solo lugar.</p>

      <form class="mt-6 space-y-4">
        <label class="block">
          <span class="text-sm font-medium text-gray-700">Email</span>
          <input type="email" class="mt-1 w-full rounded-lg border-gray-300" placeholder="vos@correo.com" />
        </label>

        <label class="block">
          <span class="text-sm font-medium text-gray-700">Contraseña</span>
          <input type="password" class="mt-1 w-full rounded-lg border-gray-300" placeholder="••••••••" />
        </label>

        <button type="submit" class="w-full rounded-lg bg-leparc-primary text-white py-2 font-semibold">
          Entrar
        </button>
      </form>
    </div>
  </section>
</template>
