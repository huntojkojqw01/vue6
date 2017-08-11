<template>
  <div>
    <h1>User list</h1>
    <table>
      <thead>
        <tr><th>STT</th><th>Id</th><th>Name</td><th>Email</th></tr>
      </thead>
      <tbody>
        <tr v-for="(user,index) in users">
          <td>{{index}}</td>
          <td>{{user.id}}</td>
          <td>{{user.name}}</td>
          <td>{{user.email}}</td>
          <td><button @click="del(user)">Del</button></td>        
        </tr>
        <tr>
          <td colspan="2"></td>          
          <td><input v-model="new_user.name"></td>
          <td><input v-model="new_user.email"></td>
          <td><button @click="add">New</button></td>          
        </tr>
      </tbody>
    </table>    
  </div>
</template>

<script>
export default {
  data: function () {
    return {      
      users: [],
      new_user: {name: "",email: ""}
    }
  },
  mounted: function(){
    this.axios.get("/users.json")
      .then(res=>{
        // console.log(res.data)
        this.users=res.data
      })
      .catch(err=>{
        console.log(err)
      })
  },
  methods: {
    del(user){
      this.users.splice( this.users.indexOf(user), 1 );
    },
    add(){
      alert(JSON.stringify(this.new_user, null, 3))
      this.users.push(this.new_user)
      this.new_user={name: "",email: ""}
    }
  } 
}
</script>

<style scoped>
h1 {    
  color: grey;
}
</style>
