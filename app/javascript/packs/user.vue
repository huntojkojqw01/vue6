<template>
  <div :id="{id}">
    <tr>
      <td>{{name}}</td><td>{{email}}</td>
    </tr>
  </div>
</template>

<script>
export default {
  props: ['id','name','email']  
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
  color: green;
}
</style>
