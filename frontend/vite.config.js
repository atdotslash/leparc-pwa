import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { VitePWA } from 'vite-plugin-pwa'

const repositoryName = 'leparc-pwa'
const base = process.env.GITHUB_ACTIONS ? `/${repositoryName}/` : '/'

export default defineConfig({
  base,
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
        start_url: base,
        icons: []
      }
    })
  ]
})
