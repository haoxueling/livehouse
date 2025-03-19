# Public view module
import json
import os
from django.http import JsonResponse
from django.shortcuts import render, redirect

from WebShopRSMPython import settings
from apps.common.models import Constant
from apps.orderitem.models import Orderitem
from apps.user.models import User
from apps.util.util import Util


# Jump to the login page
def login(request):
    return render(request, "common/login.html")


# login
def doLogin(request):
    post = request.POST
    username = post.get('username')  # username
    password = post.get('password')  # password
    users = User.objects.filter(username=username, password=password)  # Query users
    success = 0
    message = ""
    url = ""
    if len(users) != 0:
        success = 1
        sessionUser = users[0]  # Currently logged in user object
        # Save login information to session
        request.session[Constant.session_user_isLogin] = True
        request.session[Constant.session_user_id] = sessionUser.id
        request.session[Constant.session_user_username] = sessionUser.username
        request.session[Constant.session_user_header] = sessionUser.header.url
        # Login Successfully Jump to Home Page
        url = "/"
    else:
        message = "The username or password is incorrect!"
    return JsonResponse({"success": success, "message": message, "url": url})


# Jump to the registration page
def register(request):
    return render(request, "common/register.html")


# Jump to recommended page
def stylebia(request):
    orderitems = Orderitem.objects.all()

    orderitems_list = []
    for orderitem in orderitems:
        orderitem_dict = {
            'typeid': orderitem.productid.typeid.id,
            'typename': orderitem.productid.typeid.typename,
            'count': orderitem.count,
        }
        orderitems_list.append(orderitem_dict)
    print(orderitems_list)
    # Create a dictionary to store the total value of count for each typeid
    count_by_typeid = {}
    # Traverse the data list
    for item in orderitems_list:
        typename = item['typename']
        count = item['count']
        # Accumulate the count value if the typeid already exists in the dictionary, otherwise add a new typeid and set the count value
        if typename in count_by_typeid:
            count_by_typeid[typename] += count
        else:
            count_by_typeid[typename] = count
    print(count_by_typeid)
    # Convert to JSON format string
    data_json = json.dumps(count_by_typeid)
    return render(request, "common/stylebias.html", {'my_data': data_json})


# Register
def doRegister(request):
    post = request.POST
    username = post.get('username')
    password = post.get('password')
    users = User.objects.filter(username=username)  # Check if the username already exists
    success = 0
    message = ""
    url = ""
    if len(users) != 0:
        success = -1
        message = "Operation failed! User name already exists!"
    else:
        user = User()
        user.username = username
        user.password = password
        user.createtime = Util().getCurrentTime()
        user.header = Constant.default_user_header
        user.save()  # Save registered users
        success = 1
        url = "/login"  # Jump to user login page
    return JsonResponse({"success": success, "message": message, "url": url})


# logout
def logout(request):
    if not request.session.get(Constant.session_user_isLogin, None):
        # There's no such thing as logging out if you're not loggedin in the first place
        return redirect("/")
    # Delete session information
    del request.session[Constant.session_user_isLogin]
    del request.session[Constant.session_user_id]
    del request.session[Constant.session_user_header]
    del request.session[Constant.session_user_username]
    return redirect('/')


# upload
def upload(request):
    file = request.FILES.get("file")  # Get the uploaded file object
    print(file.name)
    fileName = file.name
    fileType = os.path.splitext(fileName)[1]  # .jpg
    newFileName = Util().getCurrentTimeRandom() + fileType  # Generate a random file name
    print(newFileName)
    newFilePath = os.path.join(settings.MEDIA_ROOT, newFileName)  # File save path
    with open(newFilePath, "wb") as f:  # Save file
        for line in file:
            f.write(line)
    data = {
        "success": 1,
        "newFileName": newFileName
    }
    return JsonResponse(data)
