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
        <tr>
          <td colspan="2"></td>          
          <td v-for="error in errors">{{error}}</td>          
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
      new_user: {name: "",email: ""},
      errors: []
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
      // alert(JSON.stringify(user, null, 3))
      this.axios.delete("/users/"+user.id)
        .then(res=>{
          // console.log(res)
          this.users.splice( this.users.indexOf(user), 1 );
        })
        .catch(err=>{
          console.log(err)
        })      
    },
    add(){
      //alert(JSON.stringify(this.new_user, null, 3))
      this.axios.post("/users.json",{user: this.new_user})
        .then(res=>{
          // console.log(res)          
          if (res.data.errors.length==0){
            this.users.push(res.data.user)
            this.new_user={name: "",email: ""}
            this.errors=[]
          }
          else{            
            this.errors=res.data.errors
          }
        })
        .catch(err=>{
          console.log(err)
        })     
    }
  } 
}
</script>

<style scoped>
h1 {    
  color: grey;
}
</style>
