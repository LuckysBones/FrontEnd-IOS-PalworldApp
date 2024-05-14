# main.py

# Importing the Palworld-RestApi module
# Importing the PalworldRestApi module with the absolute path
from PalworldApi import PalworldRestApi

def run():
    players = PalworldRestApi.findMetrics()
    #print(players)

# Your main entry point code can go here
# For example:
if __name__ == "__main__":
    # You can call functions or instantiate classes defined in Palworld-RestApi
    run()
