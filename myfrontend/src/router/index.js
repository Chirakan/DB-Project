import Vue from 'vue'
import VueRouter from 'vue-router'


//components Page
import HomePage from '../views/HomePage.vue'
// import CreateBlog from '../views/blogs/CreateBlog.vue'
import BlogDetail from '../views/BlogDetail.vue'
import BlogZone_1 from '../views/Zone-1.vue'
import Complete_buy from '../views/complete-buy.vue'
import My_Ticket from '../views/MyTicket.vue'
import Page_Pay from '../views/My_Pay.vue'
import My_Profile from '../views/MyProfile.vue'
import BlogZone_2 from '../views/Zone-2.vue'
import Page_Seat from '../views/Page_Seat.vue'
import Page_Stand from '../views/Page_Stand.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: HomePage
  },
  {
    path: '/blog/detail',
    name: 'BlogDetail',
    component: BlogDetail
  },
  {
    path: '/blog/zone-1',
    name: 'BlogZone_1',
    component: BlogZone_1
  },
  {
    path: '/blog/complete_buy',
    name: 'Complete_buy',
    component: Complete_buy
  },
  {
    path: '/blog/ticket',
    name: 'Ticket',
    component: My_Ticket 
  },
  {
    path: '/blog/myprofile',
    name: 'Profile',
    component: My_Profile
  },
  {
    path: '/blog/pay',
    name: 'Pay',
    component: Page_Pay
  },
  {
    path: '/blog/zone-2',
    name: 'BlogZone_2',
    component: BlogZone_2
  },
  {
    path: '/blog/seat',
    name: 'Page_seat',
    component: Page_Seat
  },
  {
    path: '/blog/stand',
    name: 'Page_stand',
    component: Page_Stand
  },
//   {
//     path: '/blog/:id',
//     name: 'BlogDetail',
//     component: BlogDetail
//   }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
