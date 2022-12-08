class Employee

    def getAllUsers
        response = HTTParty.get('https://reqres.in/api/users?page=2')
        return response.body if response.code == 200
    end


end
