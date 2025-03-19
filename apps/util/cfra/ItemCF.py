# Project-based collaborative filtering recommendation algorithm implementation module
import operator
from apps.util.cfra.common.Constant import Constant
from apps.util.cfra.recommender.ItemRecommenderByBoolean import ItemRecommenderByBoolean
from apps.util.cfra.similarity.ItemSimilarity import ItemSimilarity
from apps.util.cfra.similarity.JaccardSimilarity import JaccardSimilarity


class ItemCF(object):

    # Recommended methods
    def recommend(self, dataModel, cUserid):
        print("Project-based collaborative filtering recommendation algorithms begin")
        # Determine if the current user has shopping data
        if cUserid not in dataModel.userItemPrefMatrixDic.keys():
            print("\ntarget user %s No shopping data！" % cUserid)
            print("\nEnd of project-based collaborative filtering recommendation algorithm")
            return None

        abstractSimilarity = JaccardSimilarity()

        itemSimilarity = ItemSimilarity()
        print("\nCalculate the similarity between items...")

        itemSimilarityDic = itemSimilarity.getItemSimilaritys(cUserid, abstractSimilarity, dataModel)
        # Output the similarity of the target user's preferred items to other items
        itemSimilarity.printItemSimilaritys(itemSimilarityDic)

        itemRecommender = ItemRecommenderByBoolean()

        recItemDic = itemRecommender.getItemRecommender(cUserid, itemSimilarityDic, dataModel)
        # Sort items in descending order of predicted preference and take the top n items with the highest predicted preference
        recItemDic = sorted(recItemDic.items(), key=operator.itemgetter(1), reverse=True)[0: Constant.cfCount]
        print("\ntarget user：%-5sThe top %d recommended projects are：" % (cUserid, Constant.cfCount))

        itemRecommender.printPref(recItemDic)
        print("\nEnd of project-based collaborative filtering recommendation algorithm")
        return recItemDic
