import requests
import json




with open('text.txt', 'r') as file:

    api1 = "http://trefle.io/api/v1/species/search"

    data = []
    id = 166

    for line in file:

        data = line.strip().split('\t')

        sn = data[0].strip()
        cn = data[1].strip()
        light = data[2].split("-")[0].strip()
        temperature = data[3].split("-")[0].strip() #considerar o primeiro
        humidity = data[4].split("-")[0].strip() #considerar o primeiro
        wf = data[5].split("-")[0].strip() #considerar o primeiro
        family_id = data[6].split("-")[0].strip() #considerar o primeiro~

        #transmutations
        humidity = abs(int(humidity) - 4)
        wf = abs(int(wf) - 4)
        light = abs(int(light) - 5)
      
        api1 = "http://trefle.io/api/v1/species/search"
        param1 = {"token": "N_mOO5XHBVFf0zv-DCUy76uKGl1ZQmml2VSDwueftWY", "q": sn}

        response = requests.get(api1, params=param1)

        if response.status_code == 200:
            data = response.text
            parse_json = json.loads(data)
            if (parse_json['data']) != []:
                api2 = "http://trefle.io/api/v1/species/" + str(parse_json['data'][0]['id'])
                param2 = {"token": "N_mOO5XHBVFf0zv-DCUy76uKGl1ZQmml2VSDwueftWY"}

                response2 = requests.get(api2, params=param2)

                if response2.status_code == 200:
                    data2 = response2.text
                    parse_json2 = json.loads(data2)
                    print("(" +str(id) + ", '" +  cn + "', 'cycle', 'flowering', 'leafc', " + str(humidity) + ", " + str(light) + ", "+ str(temperature) + ", '" + str(sn) + "', 'season', " + str(parse_json2['data']['image_url']) + ", 'usual_size', " + str(wf) + ", " + str(family_id) + ")")
                    #cycle:
                    #print(parse_json2['data'])
                else :
                    print("(" +str(id) + ", '" +  cn + "', 'cycle', 'flowering', 'leafc', " + str(humidity) + ", " + str(light) + ", "+ str(temperature) + ", '" + str(sn) + "', 'season', 'photo', 'usual_size', " + str(wf) + ", " + str(family_id) + ")")

            else:
                print("(" +str(id) + ", '" +  cn + "', 'cycle', 'flowering', 'leafc', " + str(humidity) + ", " + str(light) + ", "+ str(temperature) + ", '" + str(sn) + "', 'season', 'photo', 'usual_size', " + str(wf) + ", " + str(family_id) + ")")

        else:
              print("(" +str(id) + ", '" +  cn + "', 'cycle', 'flowering', 'leafc', " + str(humidity) + ", " + str(light) + ", "+ str(temperature) + ", '" + str(sn) + "', 'season', 'photo', 'usual_size', " + str(wf) + ", " + str(family_id) + ")")


        id += 1

