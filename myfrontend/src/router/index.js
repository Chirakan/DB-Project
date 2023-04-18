import Vue from 'vue'
import VueRouter from 'vue-router'


//components Page
import HomePage from '../views/HomePage.vue'
// import CreateBlog from '../views/blogs/CreateBlog.vue'
import BlogDetail from '../views/BlogDetail.vue'
import BlogZone_1 from '../views/Zone-1.vue'

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
    name: 'BlogDetail',
    component: BlogZone_1
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
