from django.conf.urls import url
from . import parser
from . import views

urlpatterns = [
    #url(r'^data/$', parser.loadData , name="get-data"),
    url(r'^class/(?P<dpt>[A-Z]+)/(?P<num>[0-9]{4})/$', views.getClassByName , name="get-class-by-name"),
    url(r'^.*$', views.catchall, name='catch-all'), 
]
