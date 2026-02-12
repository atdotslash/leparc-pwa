import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { VitePWA } from 'vite-plugin-pwa'

export default defineConfig({
  plugins: [
    vue(),
    VitePWA({
      registerType: 'autoUpdate',
      manifest: {
        name: 'LeParc PWA',
        short_name: 'LeParc',
        theme_color: '#111827',
        background_color: '#ffffff',
        display: 'standalone',
        lang: 'es-AR',
        start_url: '/',
        icons: []
      }
    })
  ]
})
