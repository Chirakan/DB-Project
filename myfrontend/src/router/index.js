import Vue from 'vue'
import VueRouter from 'vue-router'


//components Page
import main from '../views/main.vue'
// import CreateBlog from '../views/blogs/CreateBlog.vue'
// import BlogDetail from '../views/blogs/BlogDetail.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: main
  }
//   ,
//   {
//     path: '/blog/create',
//     name: 'Create new blog',
//     component: CreateBlog
//   },
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