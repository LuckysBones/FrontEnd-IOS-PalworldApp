import asyncio
import websockets

async def hello():
    uri = "ws://localhost:8000/ws/shutdown/"  # Replace with your WebSocket server URI
    async with websockets.connect(uri) as websocket:
            await websocket.send("message")
            await websocket.close()


asyncio.run(hello())
