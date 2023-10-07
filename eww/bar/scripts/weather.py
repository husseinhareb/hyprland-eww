import requests

city_name = ""
api_key = ""
unit = "metric" 
temperature_unit = "C"

icons_list = {
    "01d": "", # Clear sky day.
    "01n": "", # Clear sky night.
    "02d": "", # Few clouds day.
    "02n": "", # Few clouds night.
    "03d": "", # Scattered clouds day.
    "03n": "", # Scattered clouds night.
    "04d": "", # Broken clouds day.
    "04n": "", # Broken clouds night.
    "09d": "", # Shower rain day.
    "09n": "", # Shower rain night.
    "10d": "", # Rain day.
    "10n": "", # Rain night
    "11d": "", # Thunderstorm day.
    "11n": "", # Thunderstorm night
    "13d": "", # Snow day. Snowflake alternative: 
    "13n": "", # Snow night. Snowflake alternative: 
    "50d": "", # Mist day.
    "50n": "" # Mist night.
}



icons_list = {
    "01d": "", # Clear sky day.
    "01n": "", # Clear sky night.
    "02d": "", # Few clouds day.
    "02n": "", # Few clouds night.
    "03d": "", # Scattered clouds day.
    "03n": "", # Scattered clouds night.
    "04d": "", # Broken clouds day.
    "04n": "", # Broken clouds night.
    "09d": "", # Shower rain day.
    "09n": "", # Shower rain night.
    "10d": "", # Rain day.
    "10n": "", # Rain night
    "11d": "", # Thunderstorm day.
    "11n": "", # Thunderstorm night
    "13d": "", # Snow day. Snowflake alternative: 
    "13n": "", # Snow night. Snowflake alternative: 
    "50d": "", # Mist day.
    "50n": "" # Mist night.
}

try:
    url = ('http://api.openweathermap.org/data/2.5/weather?q={}&units={}&appid={}').format(city_name, unit, api_key)
    result = requests.get(url)
    if(result.status_code == requests.codes['ok']):
        weather = result.json()
        icon = weather['weather'][0]['icon'].capitalize()
        temp = int(float(weather['main']['temp']))
        print(icons_list[icon] + '' ' {}°{}'.format(temp, temperature_unit))
            
    else:
        print("")
except Exception as e:
    print("")
