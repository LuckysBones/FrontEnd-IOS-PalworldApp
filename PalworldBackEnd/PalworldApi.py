import requests
import json

class PalworldRestApi:

    def restAPI():
        return "restAPI"

    def findPlayers():
        url = "http://admin:AlecSucks@localhost:8212/v1/api/players"
        payload={}
        headers = {
                'Accept': 'application/json'
                }
        response = requests.request("GET", url, headers=headers, data=payload)
        return response.text

    def findMetrics():
        print("findMetrics")
