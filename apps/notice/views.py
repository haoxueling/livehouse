from django.shortcuts import render
from apps.common.models import Constant
from apps.notice.models import Notice
from django.core.paginator import Paginator


# Create your views here.

# notice list
def list(request):
    # Get all notice objects
    page = request.POST.get("page", 1)
    notifications = Notice.objects.all().order_by("-id")
    paginator = Paginator(notifications, Constant.pageSize)
    notices = paginator.page(page)
    data = {
        "pageBean": notices,
        "page": page,
    }
    # Render the template and pass the notification object to the template
    return render(request, 'notice/list.html', context=data)
