# backendtests.py
import time
import subprocess
import json
import time
import subprocess
import json
import asyncio
import socketio
# Importing the Palworld-RestApi module
from PalworldApi import PalworldRestApi

def __get_players():
    result = PalworldRestApi.findPlayers()
    print(result)

def __get_metrics():
    result = PalworldRestApi.findMetrics()
    result = json.loads(result)
    print(result)

def __get_info():
    result = PalworldRestApi.serverInfo()
    result = json.loads(result)
    print(result)

def __push_message(message):
    result = PalworldRestApi.sendMessage(message)
    print(result)

def __push_save():
    result = PalworldRestApi.saveWorld()
    print(result)

def __push_shutdown(shutdownMessage,shutdownTime):
    result = PalworldRestApi.shutWorld(shutdownMessage,shutdownTime)
    print(result)

async def client_connect():
        async with socketio.AsyncSimpleClient() as sio:
            await sio.connect('http://localhost:5000')
            event = await sio.receive()
            print(event)
            await sio.emit('Sending from Server Side', __get_players())
            await sio.disconnect()

def test():
    get_players()
    time.sleep(5)
    get_metrics()
    time.sleep(5)
    get_info()
    time.sleep(5)
    push_save()
    time.sleep(5)
    push_message("***Test*** - Message sent from testunit/pushMessage")
    time.sleep(10)
    push_shutdown("***Test*** - Message sent from testunit/pushShutDown",10)
    time.sleep(30)
    runServer = "sudo systemctl restart palserver.service"
    result = subprocess.run(runServer, shell=True, capture_output=True, text=True)
    print(result)
# Your main entry point code can go here
# For example:
if __name__ == "__main__":
    # You can call functions or instantiate classes defined in Palworld-RestApi
    test()
