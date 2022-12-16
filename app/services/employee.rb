class Employee

    def getAllUsers(page)
        response = HTTParty.get('https://reqres.in/api/users?page=' + page.to_s)
        return response.body if response.code == 200
    end

    def getUser(id)
        response = HTTParty.get('https://reqres.in/api/users/' + id)
        return response.body if response.code == 200
    end

    def searchedData(word)
        i = 1
        returnedData = Array.new
        while i <= totalPage.to_i
            data = getAllUsers(i)
            data = JSON.parse!(data)
            data["data"].each do |m|
                if m["email"].include? word.to_s
                    returnedData.push(m)
                end
            end
            i += 1
        end
        return {"page" => 1, "per_page" => perPage, "total" =>  totalPage * perPage, "total_pages" =>  totalPage, "data" => returnedData}
    end

    def totalPage
        response = HTTParty.get('https://reqres.in/api/users')
        if response.code == 200
            data = response.body
            return JSON.parse!(data)['total_pages']
        end
    end

    def perPage
        response = HTTParty.get('https://reqres.in/api/users')
        if response.code == 200
            data = response.body
            return JSON.parse!(data)['per_page']
        end
    end
end
