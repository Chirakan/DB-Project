import Vue from 'vue'
import App from './App.vue'
import router from './router/index'
import './assets/css/detail.css'
import './assets/css/nav_main.css'
import './assets/css/complete-buy.css'
import './assets/css/login.css'
// import './assets/css/nav.css'
import './assets/css/navbar_buy.css'
import './assets/css/pay.css'
import './assets/css/register.css'
import './assets/css/seat.css'
import './assets/css/stand.css'
import './assets/css/style_main.css'
import './assets/css/style_profile.css'
import './assets/css/style_ticket.css'
import './assets/css/zone-1.css'
import './assets/css/zone-2.css'



Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
