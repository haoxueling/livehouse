# User Nearest Neighbour module
import operator
from apps.util.cfra.common.Constant import Constant


class UserNeighborhood(object):

    # get all neighbours of the target user
    # userSimilarityDic Dictionary of similarities between the target user and other users
    def getUserNeighborhoods(self, userSimilarityDic):
        # Output all neighbours of the target user in descending order of similarity, the returned object is a list
        neighborhoods = sorted(userSimilarityDic.items(), key=operator.itemgetter(1), reverse=True)
        return [(key, value) for key, value in neighborhoods if value > 0]

    # get the nearest neighbours of the target user
    # userSimilarityDic Dictionary of similarities between the target user and other users
    def getKUserNeighborhoods(self, userSimilarityDic):
        # Get the nearest neighbours of the target user
        userNeighborhoodsTemp = self.getUserNeighborhoods(userSimilarityDic)[:Constant.knn]
        # Exclude users with 0 similarity
        return [(key, value) for key, value in userNeighborhoodsTemp if value > 0]

    # Print out the nearest neighbours of the target user
    def printKUserNeighborhoods(self, kNUserNeighborhood):
        for i, val in enumerate(kNUserNeighborhood):
            print("User：%-5s  Similarity：%-.4f" % (val[0], val[1]), end="     ")
            if (i + 1) % 4 == 0:
                print("")
