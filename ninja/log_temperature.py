"""
An example showing how to keep a running log of a temperature sensor's readings
in a CSV file. Note: uses the Device.pulse method, which allows for watching
only one device at a time.
"""
import os
dir = os.path.dirname(__file__)

from _examples  import *

from ninja.api  import NinjaAPI
from ninja.devices import TemperatureSensor

from datetime   import datetime



# Set up the NinjaAPI and Device wrappers:
api     = NinjaAPI(secrets.ACCESS_TOKEN)
device  = TemperatureSensor(api, secrets.TEMP_ID)



# Prep the logfile with some headings
LOGFILE = os.path.join(dir, '../media/temps.csv')
file(LOGFILE, 'w').write('Date,Temperature (C)\n')



# Log the current temperature reading to a file, adding each
# new entry of date and temperature in celsius to a new line.
def saveTempCelsius(inst, data):
    date = inst.last_read.isoformat()
    line = date + ',' + str(data.c) + '\n'
    print line[:-2]
    file(LOGFILE, 'a').write(line)

# Update the log on the heartbeat event.
device.onHeartbeat(saveTempCelsius)

# Run the heartbeat every 30 seconds.
device.pulse(period=5)
