<template lang="">
    <div>
        <div class="input-group" style="width: 35%; float: right;">
            <div class="input-group-prepend">
              <span class="input-group-text">Search by email</span>
            </div>
            <input class="form-control" aria-label="With textarea" v-model="searchKey"/>
        </div>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Avatar</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr  v-for="row in employees.data ">
                    <td>{{ row.id }}</td>
                    <td>{{ row.first_name }}</td>
                    <td>{{ row.last_name }}</td>
                    <td>{{ row.email }}</td>
                    <td><img :src="`${row.avatar}`" alt="" style="width: 50px;"></td>
                    <td><a :href="'/employee/' + row.id">Show</a></td>
                </tr>
            </tbody>
        </table>
        <nav aria-label="Page navigation example">
            <ul class="pagination">
              <li class="page-item" :class="{ disabled: isActive}"><a class="page-link" @click="setPage(currentPageIndex-1)">Previous</a></li>
              <li class="page-item" :class="{ disabled: isActive}" v-for="i in totalPage"><a class="page-link "  @click="setPage(i)" v-bind:class="{'active':currentPageIndex === i}" href="#">{{i}}</a></li>
              <li class="page-item" :class="{ disabled: isActive}"><a class="page-link" @click="setPage(currentPageIndex+1)">Next</a></li>
            </ul>
        </nav>
    </div>

</template>

<script>
import axios from "redaxios";
export default {
    data() {
        return {
            employees: [],
            searchKey: '',
            currentPageIndex: 1,
            perpage: 0,
            totalPage: 0,
            total: 0,
            isActive: false
        }
    },
    created() {
        this.getEmployees(); // Get the all employees from first page
    },
    methods: {
        setPage: function (index) {// Set the current page and get the data
            if (index > 0 && index <= this.pages) {
                this.currentPageIndex = index;
                this.getEmployees(index)
            }
        },
        getEmployees(page) {//This method for getting data from related page
            return axios
                .get("http://localhost:3000/employee/getEmps/"+page)
                .then(response => {
                    this.perpage = response.data.per_page //Get the informations from API. Because it could be change
                    this.totalPage = response.data.total_pages //Get the informations from API. Because it could be change
                    this.total = response.data.total //Get the informations from API. Because it could be change
                    this.employees = response.data;
                })
                .catch(e => {
                    console.log(e);
                });
        },
    },
    computed: {
        pages: function () { //Calculate the total pages count 
            console.log("pages: " + Math.ceil(this.total / this.perpage));
            return Math.ceil(this.total / this.perpage);
        }
    },

    watch: {
        searchKey: function () { //Filter data acording to written text.
            if (this.currentPageIndex + 1 > this.pages)
                this.currentPageIndex = this.pages - 1;
                if(this.searchKey.length >= 3 && this.searchKey != ''){ // I checked the word length because the performance of the application
                    return axios
                        .get("http://localhost:3000/employee/searchedData/"+this.searchKey)
                        .then(response => {
                            this.employees = response.data;
                            this.isActive = true;
                        })
                        .catch(e => {
                            console.log(e);
                        });
                }else{
                    this.getEmployees();
                    this.isActive = false;
                }
                
        }
    },
}
</script>
<style lang="css">

</style>