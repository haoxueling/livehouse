# Login rights verification middleware
# Verify that users and administrators are logged in, some features require logging in to operate them
from django.http import HttpResponseRedirect
# from rpvputil.common.abstractmiddleware import AbstractMiddleware
from WebShopRSMPython import settings
from apps.common.models import Constant
from django.utils.deprecation import MiddlewareMixin


# Define login rights authentication middleware
class LoginMiddleware(MiddlewareMixin):

    # Authentication before executing a specific request
    def process_request(self, request):
        path = request.path
        # Set the url that can be accessed without logging in
        noAuthPath = ",/,/index/,/login,/doLogin,/register,/doRegister,/logout" \
                     ",/product/list,/product/detail,/stylebias,/perform/event/detail,/perform/ambitus"
        # Backend and uploaded resources don't need to be authenticated
        if path.startswith(settings.MEDIA_URL) or path.startswith("/admin"):
            pass
        else:
            path = "," + path + ","
            if path not in noAuthPath:
                # Determine if there is login user data in session
                if request.session.get(Constant.session_user_isLogin, None):
                    pass
                else:
                    return HttpResponseRedirect('/login')  # Return to the login page
