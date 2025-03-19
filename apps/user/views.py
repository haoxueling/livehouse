# Front-end user view module
from django.http import JsonResponse
from django.shortcuts import render, redirect
from WebShopRSMPython import settings
from apps.common.models import Constant
from apps.user.models import User


# User details
def detail(request):
    user = User.objects.get(id=request.session[Constant.session_user_id])
    data = {
        "user": user,
    }
    return render(request, "user/detail.html", context=data)


# Jump to user edit page
def edit(request):
    user = User.objects.get(id=request.session[Constant.session_user_id])
    data = {
        "user": user,
    }
    return render(request, "user/edit.html", context=data)


# Save user-modified data
def doEdit(request):
    post = request.POST
    email = post.get("email")
    header = post.get("header")
    success = User.objects.filter(id=request.session[Constant.session_user_id]) \
        .update(email=email, header=header)
    url = ""
    if success > 0:
        url = "reload"
        # Modify user information in session
        request.session[Constant.session_user_header] = settings.MEDIA_URL + header
    data = {
        "success": success,
        "url": url,
    }
    return JsonResponse(data)


# Jump to the change password page
def password(request):
    return render(request, "user/password.html")


# Change password
def doPassword(request):
    post = request.POST
    oldPassword = post.get("oldPassword")
    password = post.get("password")

    user = User.objects.get(id=request.session[Constant.session_user_id])
    success = 0
    url = ""
    message = ""
    if user.password == oldPassword:
        success = User.objects.filter(id=user.id).update(password=password)
        if success > 0:
            url = "/login"
            request.session.flush()
    else:
        message = "The original password is incorrect!"
    data = {
        "success": success,
        "url": url,
        "message": message,
    }
    return JsonResponse(data)
