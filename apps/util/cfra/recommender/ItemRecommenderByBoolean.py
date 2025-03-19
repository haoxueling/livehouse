# Item-based collaborative filtering recommendation algorithm Recommender Module
# Predictive preference formula: the sum of similarity between items preferred by the target user and recommended items


class ItemRecommenderByBoolean(object):

    # cUserid Target user's referrals
    # cUserid Target user
    # itemSimilarityDic item-item similarity dictionary
    # dataModel User item preference matrix
    def getItemRecommender(self, cUserid, itemSimilarityDic, dataModel):
        # Project - User Preference Dictionary
        itemUserPrefMatrixDic = dataModel.itemUserPrefMatrixDic
        # User-project preference dictionary
        userItemPrefMatrixDic = dataModel.userItemPrefMatrixDic
        # All item preferences of the target user
        cUserItemPrefMatrixDic = userItemPrefMatrixDic[cUserid]
        # Define a collection of recommended items (the collection holds the item ids)
        # Recommended items need to be: items that the target user has preferences for, that are also preferred by other users, and that are other items preferred by other users
        # Not all items that are not preferred by the target user
        recItemidSet = set()
        # Loop over all of the target user's preferences
        for itemid, _ in cUserItemPrefMatrixDic.items():
            # All user preferences for the current project
            cItemUserPrefMatrixDic = itemUserPrefMatrixDic[itemid]
            # Loop over all user preferences for the current project
            for userid, _ in cItemUserPrefMatrixDic.items():
                # All preferences of the current user
                tempUserItemPrefMatrixDic = userItemPrefMatrixDic[userid]
                # Iterate over all of the current user's preferences
                for itemidTemp, _ in tempUserItemPrefMatrixDic.items():
                    # Exclude items from the target user's preferences
                    if itemidTemp not in cUserItemPrefMatrixDic.keys():
                        recItemidSet.add(itemidTemp)

        recItemDic = {}

        for itemid in recItemidSet:
            temp = 0

            for itemidTemp, rating in cUserItemPrefMatrixDic.items():
                sim = itemSimilarityDic[itemidTemp][itemid]
                temp += sim
            recItemDic[itemid] = temp
        return recItemDic


    def printPref(self, recItemDic):
        for i, val in enumerate(recItemDic):
            print("Project：%-5s  Predicting preferences：%-.4f" % (val[0], val[1]), end="     ")
            if (i + 1) % 4 == 0:
                print("")
