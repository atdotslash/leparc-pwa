/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        leparc: {
          primary: '#111827',
          accent: '#22c55e'
        }
      }
    }
  },
  plugins: []
}
