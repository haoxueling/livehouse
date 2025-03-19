# User-based collaborative filtering recommendation algorithm Recommender module
# Predictive preference formula: sum of similarity between target and nearest neighbour users


class UserRecommenderByBoolean(object):

    # cUserid Target user's recommended items
    # cUserid Target user id
    # kNUserNeighborhood nearest neighbour dictionary
    # dataModel User item preference matrix
    def getUserRecommender(self, cUserid, kNUserNeighborhood, dataModel):
        # Get a dictionary of user-project preferences
        userItemPrefMatrixDic = dataModel.userItemPrefMatrixDic
        # Define a dictionary of recommended items for the target user (the value of the dictionary is the item id and the key is the dictionary type (the key is the user id and the value is the preference))
        # The items to be recommended are those for which the target user has no preference and for which the nearest neighbour has a preference
        recommenderItemDic = {}

        for userid, _ in kNUserNeighborhood.items():

            for itemid, rating in userItemPrefMatrixDic[userid].items():

                if itemid not in userItemPrefMatrixDic[cUserid].keys():
                    # Save to-be-recommended items to the to-be-recommended items dictionary
                    if itemid not in recommenderItemDic.keys():
                        recommenderItemDic[itemid] = {userid: rating}
                    else:
                        recommenderItemDic[itemid][userid] = rating
        # Define a dictionary of final recommended items for the target user (the value of the dictionary is the item id and the key is the predicted preference)
        recommenderItemFinalDic = {}

        for itemid, itemPref in recommenderItemDic.items():
            temp = 0.0
            # Iterate over recommended users
            for userid, _ in itemPref.items():
                temp += kNUserNeighborhood[userid]  # Predicted values, sum of similarities
            recommenderItemFinalDic[itemid] = temp
        return recommenderItemFinalDic


    def printPref(self, recommenderItemFinalDic):
        for i, val in enumerate(recommenderItemFinalDic):
            print("Project：%-5s  Predicting preferences：%-.4f" % (val[0], val[1]), end="     ")
            if (i + 1) % 4 == 0:
                print("")
