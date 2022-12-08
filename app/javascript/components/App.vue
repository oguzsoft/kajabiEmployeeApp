<template lang="">
    <div>
        <h1 class="text-3xl font-bold underline">Hello vue</h1>
        <table class="table-auto">
            <thead>
              <tr>
                <th>ID</th>
                <th>Email</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Avatar</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <tr  v-for="row in desserts.data">
                <td>{{ row.id }}</td>
                <td>{{ row.email }}</td>
                <td>{{ row.first_name }}</td>
                <td>{{ row.last_name }}</td>
                <td><img :src="`${row.avatar}`" alt=""></td>
                <td><a :href="'/employee/' + row.id">Show</a></td>
              </tr>
              
            </tbody>
          </table>
        <button @click="haydi">adsa</button>
          
    </div>

</template>

<script>
import axios from "redaxios";
export default {
    data(){
        return {
            counter: 0,
            desserts: [],
            url: "http://localhost:3000/employee/"
        }
    },
    created() {
        this.haydi();
    },
    methods: {
        haydi(){
            return axios
        .get("http://localhost:3000/employee/getEmps")
        .then(response => {
            console.log(response.data);
            this.desserts = response.data;
        })
        .catch(e => {
            console.log(e);
        });
        }
    },
    initialize() {
        return axios
        .get("http://localhost:3000/employee/getEmps")
        .then(response => {
            console.log(response.data);
            this.desserts = response.data;
        })
        .catch(e => {
            console.log(e);
        });
    }
}
</script>
<style lang="">
    
</style>