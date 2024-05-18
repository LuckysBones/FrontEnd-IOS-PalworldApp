# main.py

# Importing the Palworld-RestApi module
# Importing the PalworldRestApi module with the absolute path
from PalworldApi import PalworldRestApi

def getPlayers():
    result = PalworldRestApi.findPlayers()
    print(result)

def getMetrics():
    result = PalworldRestApi.findMetrics()
    print(result)

def getInfo():
    result = PalworldRestApi.serverInfo()
    print(result)

def pushMessage(messsage):
    result = PalworldRestApi.sendMessage(message)
    print(result)

def pushSave():
    result = PalworldRestApi.saveWorld()
    print(result)

def pushShutDown():
    result = PalworldRestApi.shutWorld()
    print(result)

def run():
    players = PalworldRestApi.findMetrics()
    #print(players)

# Your main entry point code can go here
# For example:
if __name__ == "__main__":
    # You can call functions or instantiate classes defined in Palworld-RestApi
    run()
