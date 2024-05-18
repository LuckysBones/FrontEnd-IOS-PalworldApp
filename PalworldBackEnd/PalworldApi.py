import requests
import json

class PalworldRestApi:

    def restAPI():
        return "restAPI"

    def findPlayers():
        url = "http://admin:AlecSucks@localhost:8212/v1/api/players"
        payload={}
        headers = {'Accept': 'application/json'}
        response = requests.request("GET", url, headers=headers, data=payload)
        return response.text

    def findMetrics():
        url = "http://admin:AlecSucks@localhost:8212/v1/api/metrics"
        payload={}
        headers = {'Accept': 'application/json'}
        response = requests.request("GET", url, headers=headers, data=payload)
        return response.text
    
    def sendMessage(message):
        url = "http://admin:AlecSucks@localhost:8212/v1/api/announce"
        payload = json.dumps({"message": message})
        headers = {'Content-Type': 'application/json'}
        response = requests.request("POST", url, headers=headers, data=payload)
        return response.text

    def serverInfo():
        url = "http://admin:AlecSucks@localhost:8212/v1/api/info"
        payload={}
        headers = {'Accept': 'application/json'}
        response = requests.request("GET", url, headers=headers, data=payload)
        return response.text
    
    def saveWorld():
        url = "http://localhost:8212/v1/api/save"
        payload={}
        headers = {}
        response = requests.request("POST", url, headers=headers, data=payload)
        return response.text
    
    def shutDown(shutdownMessage,shutdownTime):
        url = "http://localhost:8212/v1/api/shutdown"
        payload = json.dumps({
            "waittime": shutdownTime,
            "message": shutdownMessage
            })
        headers = {
            'Content-Type': 'application/json'
            }
        response = requests.request("POST", url, headers=headers, data=payload)
        return response.text