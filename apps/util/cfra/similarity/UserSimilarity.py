# User similarity module
class UserSimilarity(object):

    # cUserid Calculate the similarity of the target user to other users
    # cUserid Target user id
    # abstractSimilarity Similarity algorithm method
    # dataModel User item preference matrix
    def getUserSimilaritys(self, cUserid, abstractSimilarity, dataModel):

        userItemPrefMatrixDic = dataModel.userItemPrefMatrixDic

        cUserItemPrefMatrixDic = userItemPrefMatrixDic[cUserid]

        userSimilarityDic = {}

        for userid, userPref in userItemPrefMatrixDic.items():

            if cUserid != userid:

                similarity = abstractSimilarity.getSimilarity(cUserItemPrefMatrixDic, userPref)

                userSimilarityDic[userid] = similarity
        return userSimilarityDic


    def printUserSimilaritys(self, userSimilarityDic):
        for i, val in enumerate(userSimilarityDic):
            print("user：%-5s  similarity：%-.4f" % (val[0], val[1]), end="     ")
            if (i + 1) % 5 == 0:
                print("")
