class Employee

    def getAllUsers
        response = HTTParty.get('https://reqres.in/api/users?page=1')
        return response.body if response.code == 200
    end

    def getUser(id)
        response = HTTParty.get('https://reqres.in/api/users/' + id)
        return response.body if response.code == 200
    end


end
