import requests
r = requests.get('https://la2.api.riotgames.com/tft/summoner/v1/summoners/by-name/xXRunAwayX?api_key=RGAPI-55562368-5a78-41e8-a7d6-a8317122aa3d')

print(r.content)
