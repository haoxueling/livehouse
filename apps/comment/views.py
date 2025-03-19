# Frontend comment view module
from django.core.paginator import Paginator
from django.http import JsonResponse
from django.shortcuts import render
from apps.comment.models import Comment
from apps.common.models import Constant
from apps.util.util import Util


# Add comment
def doComment(request):
    post = request.POST
    content = post.get("content")
    productid = post.get("productid")
    userid = request.session[Constant.session_user_id]
    comment = Comment()
    comment.userid_id = userid
    comment.productid_id = productid
    comment.content = content
    comment.createtime = Util().getCurrentTime()
    comment.save()
    data = {
        "success": 1,
        "url": "reload"
    }
    return JsonResponse(data)


# Comment list
def list(request):
    page = request.POST.get("page", 1)
    userid = request.session[Constant.session_user_id]  # userid
    records = Comment.objects.filter(userid_id=userid).order_by("-id")  # Find the current user's comment record, id descending
    paginator = Paginator(records, Constant.pageSize)
    records = paginator.page(page)
    data = {
        "pageBean": records,
        "page": page,
    }
    return render(request, "comment/list.html", context=data)


# Comment details
def detail(request):
    commentid = request.GET.get("commentid")
    comment = Comment.objects.get(id=commentid)
    data = {
        "comment": comment,
    }
    return render(request, "comment/detail.html", context=data)


# Jump to comment editing page
def edit(request):
    commentid = request.GET.get("commentid")
    comment = Comment.objects.get(id=commentid)
    data = {
        "comment": comment,
    }
    return render(request, "comment/edit.html", context=data)


# Update comments
def doEdit(request):
    commentid = request.POST.get("commentid")
    content = request.POST.get("content")
    comment = Comment.objects.get(id=commentid)
    comment.content = content
    comment.createtime = Util().getCurrentTime()
    comment.save()  # save
    data = {
        "success": 1,
        "url": "reload"
    }
    return JsonResponse(data)


# Delete comments
def delete(request):
    commentid = request.POST.get("commentid")
    userid = request.session.get(Constant.session_user_id)  # Get the id of the currently logged in user from session
    Comment.objects.filter(userid_id=userid, id=commentid).delete()  # delete
    data = {
        "success": 1,
        "url": "reload"
    }
    return JsonResponse(data)
