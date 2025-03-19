
import os
import random
# from rpvputil.util.abstractutil import AbstractUtil
import time, datetime


class Util(object):

    # Get the current time
    def getCurrentTime(self):
        # return super().getCurrentDate().strftime('%Y-%m-%d %H:%M:%S')
        return datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    # Get timestamp + six random numbers for uploading filenames
    def getCurrentTimeRandom(self):
        strTemp = ""
        for i in range(6):
            ch = chr(random.randrange(ord('0'), ord('9') + 1))
            strTemp += ch
        # return super().getCurrentDateLong() + "_" + strTemp
        return str(round(time.time() * 1000)) + "_" + strTemp

    # Framed file uploads formatted path and filename methods
    def upload_path_handler(self, instance, filename):
        fileType = os.path.splitext(filename)[1]  # .jpg  Get filename suffix
        filename = self.getCurrentTimeRandom() + fileType  # Generate a random file name
        return "{file}".format(file=filename)  # Save path and format
