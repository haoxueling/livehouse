# Project similarity module
class ItemSimilarity(object):

    # cUserid Calculate the similarity of the target user's preference items with other items
    # cUserid Target user id
    # abstractSimilarity Similarity calculation method
    # dataModel User item preference matrix matrix
    def getItemSimilaritys(self, cUserid, abstractSimilarity, dataModel):
        # Define a project-item similarity dictionary (the key of the dictionary is the project id and the value is also a dictionary (the key is the project id and the value is the similarity))
        itemSimilarityDic = {}

        itemUserPrefMatrixDic = dataModel.itemUserPrefMatrixDic

        userItemPrefMatrixDic = dataModel.userItemPrefMatrixDic

        cUserItemPrefMatrixDic = userItemPrefMatrixDic[cUserid]

        for itemid, _ in cUserItemPrefMatrixDic.items():

            cItemUserPrefMatrixDic = itemUserPrefMatrixDic[itemid]

            for itemidTemp, itemPref in itemUserPrefMatrixDic.items():

                if itemidTemp not in cUserItemPrefMatrixDic.keys():
                    # Calculate the similarity of two projects
                    similarity = abstractSimilarity.getSimilarity(cItemUserPrefMatrixDic, itemPref)
                    # Save item similarities to the similarity dictionary
                    if itemid in itemSimilarityDic.keys():
                        itemSimilarityDic[itemid][itemidTemp] = similarity
                    else:
                        itemSimilarityDic[itemid] = {itemidTemp: similarity}
        return itemSimilarityDic


    def printItemSimilaritys(self, itemSimilarityDic):
        print("The similarity of the target user's preferred items to other items：")
        if itemSimilarityDic is None or len(itemSimilarityDic) == 0:
            print("The similarity of the target user's preference items to other items is null!")
        else:
            for itemid, similarities in itemSimilarityDic.items():
                if similarities is not None and len(similarities) > 0:
                    print("\nprojects：%-5sThe similarity with other items is:" % itemid)
                    index = 0
                    for itemidTemp, similarity in similarities.items():
                        print("projects：%-5s  similarity：%-.4f" % (itemidTemp, similarity), end="     ")
                        if (index + 1) % 5 == 0:
                            print("")
                        index += 1
