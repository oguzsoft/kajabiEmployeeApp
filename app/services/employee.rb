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
        while i <= totalPage.to_i #Search written text for all pages that coming from API. For each coming page.
            data = getAllUsers(i)
            data = JSON.parse!(data)
            data["data"].each do |m| #For each data inside the current page
                if m["email"].include? word.to_s #If the word contains, add this record to array. I will use use this array when I render the all related records below
                    returnedData.push(m)
                end
            end
            i += 1
        end
        return {"page" => 1, "per_page" => perPage, "total" =>  totalPage * perPage, "total_pages" =>  totalPage, "data" => returnedData} #Same format as API
    end

    def totalPage #Get the total pages information from API
        response = HTTParty.get('https://reqres.in/api/users')
        if response.code == 200
            data = response.body
            return JSON.parse!(data)['total_pages']
        end
    end

    def perPage #Get the per page information from API
        response = HTTParty.get('https://reqres.in/api/users')
        if response.code == 200
            data = response.body
            return JSON.parse!(data)['per_page']
        end
    end
end
