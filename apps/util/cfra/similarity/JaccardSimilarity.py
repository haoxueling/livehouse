# jaccard coefficient similarity algorithm module
# formula: number of intersections of user A and user B divided by number of concatenations of user A and user B


class JaccardSimilarity(object):


    def getSimilarity(self, dic1, dic2):
        sameCount = 0

        for itemid, rating in dic1.items():
            if itemid in dic2.keys():
                sameCount += 1
        unionCount = len(dic1) + len(dic2) - sameCount
        if sameCount == 0 or unionCount == 0:
            return 0
        else:
            return sameCount / unionCount
