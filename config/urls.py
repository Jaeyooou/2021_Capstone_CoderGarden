"""config URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
import config.views
import account.views
import visualize.views
urlpatterns = [
    path('',config.views.index , name = 'index'),
    path('admin/', admin.site.urls),
    path('login/' , account.views.login , name = 'login'),
    path('signup/' , account.views.signup , name = 'signup'),
    path('mypage/' , account.views.mypage , name = 'mypage'),
    path('code/<int:code_num>/' , account.views.codeview , name = 'codeview'),
    path('code_write/' ,visualize.views.code_write  , name = 'code_write') ,
    path('compile/' , visualize.views.compiler , name = 'compile') ,
    path('test_h/', visualize.views.test_h, name='test_h'),
    path('test2_h/', visualize.views.test2_h, name='test2_h'),

]
