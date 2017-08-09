<template>
  <div id="ds_user">
    <h1>User list</h1>
    <table>
      <thead>
        <tr><td>Name</td><td>Email</td></tr>
      </thead>
      <tbody>
        <user v-for="user in users" :id="user.id" :name="user.name" :email="user.email"></user>
      </tbody>
    </table>
    <p>{{ message }}</p>
  </div>
</template>

<script>
import User from './user.vue'
export default {
  data: function () {
    return {
      message: "Cha!",
      users: [
        {id: "1",name: "hung",email: "hung@com"},
        {id: "2",name: "han",email: "han@com"},
        {id: "3",name: "cao",email: "cao@com"}
      ]
    }
  },
  components: {
    'user': User
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
