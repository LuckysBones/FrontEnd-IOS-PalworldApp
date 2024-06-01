# main.py
# Server side for grabbing Palworld Server stats or commands 
# Program will also send and recive sent, info through a socketio api
import time
import subprocess
import json
import socketio
import asyncio


# Importing the PalworldRestApi module with the absolute path
from PalworldApi import PalworldRestApi

# Grab Player Info
def __get_players():
    result = PalworldRestApi.findPlayers()
    print(result)

# Grab Server Metrics
def __get_metrics():
    result = PalworldRestApi.findMetrics()
    print(result)

# Grab Server Info
def __get_info():
    result = PalworldRestApi.serverInfo()
    print(result)

# Send a message to the Server (Pops on the in game screen)
def __push_message(message):
    result = PalworldRestApi.sendMessage(message)
    print(result)

# Server will save the game/world
def __push_save():
    result = PalworldRestApi.saveWorld()
    print(result)

# Sever will Shutdown the server based 
# on allotted time and a message will be sent
def __push_shutdown(shutdownMessage,shutdownTime):
    result = PalworldRestApi.shutWorld(shutdownMessage,shutdownTime)
    print(result)

# Create a connection through socketio and send and recive data
async def connect_to_client():
    #from wsgi import app
    app = socketio.WSGIApp(sio, static_files=__get_players())

@sio.event
async def my_event(sid, data):
    pass

@sio.on('my custom event')
async def another_event(sid, data):
    pass



# Main entry point
if __name__ == "__main__":
    # You can call functions or instantiate classes defined in Palworld-RestApi
    connect_to_client()
