# main.py
import time
import subprocess
import json
import websocket
import asyncio
# Importing the PalworldRestApi module with the absolute path
from PalworldApi import PalworldRestApi

def getPlayers():
    result = PalworldRestApi.findPlayers()
    result = json.loads(result)
    print(result)

def getMetrics():
    result = PalworldRestApi.findMetrics()
    result = json.loads(result)
    print(result)

def getInfo():
    result = PalworldRestApi.serverInfo()
    result = json.loads(result)
    print(result)

def pushMessage(message):
    result = PalworldRestApi.sendMessage(message)
    print(result)

def pushSave():
    result = PalworldRestApi.saveWorld()
    print(result)

def pushShutDown(shutdownMessage,shutdownTime):
    result = PalworldRestApi.shutWorld(shutdownMessage,shutdownTime)
    print(result)

# Your main entry point code can go here
# For example:
if __name__ == "__main__":
    # You can call functions or instantiate classes defined in Palworld-RestApi
    getPlayers()
    getMetrics()
    getInfo()
    pushMessage("Message Here - Ignore if seen")
    pushSave()
    pushShutDown("Message Here - ShutDown Happening shortly", 30)
