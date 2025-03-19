# User-based collaborative filtering recommendation algorithm implementation module
import operator
from apps.util.cfra.common.Constant import Constant
from apps.util.cfra.neighborhood.UserNeighborhood import UserNeighborhood
from apps.util.cfra.recommender.UserRecommenderByBoolean import UserRecommenderByBoolean
from apps.util.cfra.similarity.JaccardSimilarity import JaccardSimilarity
from apps.util.cfra.similarity.UserSimilarity import UserSimilarity


class UserCF(object):


    def recommend(self, dataModel, cUserid):
        print("User-based collaborative filtering recommendation algorithms begin")

        if cUserid not in dataModel.userItemPrefMatrixDic.keys():
            print("\nTarget Users %s No shopping data available at this time!" % cUserid)
            print("\nEnd of user-based collaborative filtering recommendation algorithms")
            return None

        abstractSimilarity = JaccardSimilarity()

        userSimilarity = UserSimilarity()

        userSimilarityDic = userSimilarity.getUserSimilaritys(cUserid, abstractSimilarity, dataModel)
        # Sort the similarity dictionary by user id in ascending order
        userSimilarityDicTemp = sorted(userSimilarityDic.items(), key=operator.itemgetter(0), reverse=False)
        print("\nTarget users: %-5s are similar to other users:" % cUserid)

        userSimilarity.printUserSimilaritys(userSimilarityDicTemp)

        userNeighborhood = UserNeighborhood()

        kNUserNeighborhood = userNeighborhood.getKUserNeighborhoods(userSimilarityDic)
        print("\nTarget users: %-5s of the first %d nearest neighbours are:" % (cUserid, Constant.knn))

        userNeighborhood.printKUserNeighborhoods(kNUserNeighborhood)

        userRecommender = UserRecommenderByBoolean()

        recommenderItemFinalDic = userRecommender.getUserRecommender(cUserid, dict(kNUserNeighborhood), dataModel)
        print("\nTarget users: %-5s of the first %d recommended items are:" % (cUserid, Constant.cfCount))

        recommenderItemFinalDic = sorted(recommenderItemFinalDic.items(), key=operator.itemgetter(1), reverse=True)
        # Take the top n items with the highest predicted preferences
        recommenderItemFinalDic = recommenderItemFinalDic[0: Constant.cfCount]

        userRecommender.printPref(recommenderItemFinalDic)
        print("\nEnd of user-based collaborative filtering recommendation algorithms")
        return recommenderItemFinalDic
