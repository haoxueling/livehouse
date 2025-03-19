# Custom template global variables, in the view html can be directly take the value, but also need to be configured in settings

# Order status (1: unpaid, 2: paid, 3: dispatched, 4, received)
shareOrderStateParamsDic = {
    1: "unpaid",
    2: "paid",
    3: "dispatched",
    4: "received",
}

shareOrderStateParamsList = [
    (1, "unpaid"),
    (2, "paid"),
    (3, "dispatched"),
    (4, "received"),
]


def shareTemplateParam(request):
    data = {
        "shareOrderStateParamsDic": shareOrderStateParamsDic,
        "shareOrderStateParamsList": shareOrderStateParamsList,
    }
    return data
