# Construct user-project preference matrix classes
class DataModel(object):

    def __init__(self):
        self.userItemPrefMatrixDic = dict()  # User-project preference dictionary
        self.itemUserPrefMatrixDic = dict()  # Project - User Preference Dictionary
        self.maxPref = None  # Maximum preference
        self.minPref = None  # Minimum preferences

    # Construct a user-project preference matrix

    def setDataModel(self, userid, itemid, value):

        self.setUserItemValue(userid, itemid, value)

        self.setItemUserValue(itemid, userid, value)

        self.setMaxPref(value)

        self.setMinPref(value)


    def setUserItemValue(self, userid, itemid, value):
        if userid in self.userItemPrefMatrixDic.keys():
            self.userItemPrefMatrixDic[userid][itemid] = value
        else:
            self.userItemPrefMatrixDic[userid] = {itemid: value}


    def setItemUserValue(self, itemid, userid, value):
        if itemid in self.itemUserPrefMatrixDic.keys():
            self.itemUserPrefMatrixDic[itemid][userid] = value
        else:
            self.itemUserPrefMatrixDic[itemid] = {userid: value}


    def setMaxPref(self, value):
        if self.maxPref is None:
            self.maxPref = value
        else:
            if value > self.maxPref:
                self.maxPref = value


    def setMinPref(self, value):
        if self.minPref is None:
            self.minPref = value
        else:
            if value < self.minPref:
                self.minPref = value
