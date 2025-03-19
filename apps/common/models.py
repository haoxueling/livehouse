  # Public module constants
import os

from django.db import models


from apps.util.util import Util


class Constant(object):
    pageSize = 10  # of front-end paging entries

    pageSizeAdmin = 10  # of page breaks in the background

    default_user_password = "123456"  # Default password for backend recharge password

    default_user_header = "header.jpg"  # Default avatar

    session_user_isLogin = "session_user_isLogin"  # Judgement key value of the logged in user saved in session

    session_user_id = "session_user_id"  # Primary key key value of the logged in user saved in the session

    session_user_username = "session_user_username"  # The username key value of the logged in user saved in the session

    session_user_header = "session_user_header"  # Avatar key value of the logged in user saved in session
