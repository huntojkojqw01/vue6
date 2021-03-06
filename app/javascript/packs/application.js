/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
import Vue from 'vue'
import Axios from 'axios'
import VueAxios from 'vue-axios'
Vue.use(VueAxios,Axios)
import Users from './users.vue'
console.log('Hello World from Webpacker')
document.addEventListener('DOMContentLoaded', () => {
  new Vue(Users).$mount("#users")
})

