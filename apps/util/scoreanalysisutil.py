# Scoring analysis entity class
class ScoreAnalysis(object):

    def __init__(self):
        self.avgScore = None  # # Average rating
        self.scoreCount = None  # scoreCount
        self.sumScore = None  # sumScore
        self.curScoreAnalysisList = None

    # Setting average Score
    def setAvgScore(self):
        if self.sumScore == 0 or self.scoreCount == 0:
            return 0
        else:
            return round(self.sumScore / self.scoreCount, 1)


# Currently scoring the analysed entity class
class CurScoreAnalysis(object):

    def __init__(self):
        self.curScore = None  # Current score
        self.percent = None  # percent
        self.scoreCount = None  # scoreCount

    # Percentage set
    def setPercent(self, percentTemp):
        if percentTemp == 0 or self.scoreCount == 0:
            return 0
        else:
            percentTemp = percentTemp / self.scoreCount * 100
        return round(percentTemp, 1)
