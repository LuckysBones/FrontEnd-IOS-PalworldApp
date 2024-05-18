import time
# backendtests.py

# Importing the Palworld-RestApi module
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

def pushShutDown(shutdownMessage,shutdownTime):
    result = PalworldRestApi.shutWorld(shutdownMessage,shutdownTime)
    print(result)

def test():
    getPlayers()
    time.sleep(5)
    getMetrics()
    time.sleep(5)
    getInfo()
    time.sleep(5)
    pushSave()
    time.sleep(5)
    pushMessage("***Test*** - Message sent from testunit/pushMessage")
    time.sleep(10)
    pushShutDown("***Test*** - Message sent from testunit/pushShutDown",30)
    time.sleep(15)


# Your main entry point code can go here
# For example:
if __name__ == "__main__":
    # You can call functions or instantiate classes defined in Palworld-RestApi
    test()