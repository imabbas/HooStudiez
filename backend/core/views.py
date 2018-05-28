from django.shortcuts import render
from django.http import JsonResponse
from .models import *

def getClassByName(request, dpt, num):
    courses = Course.objects.filter(
        dpt = dpt,
        num = num
    )
    if (courses):
        classes = []
        for c in courses:
            classes.append(c.to_json())
        return JsonResponse({
            "success": True,
            "payload": classes
        })
    else:
        return JsonResponse({
            "success": False,
            "payload": "No classes were found from the query"
        })

def catchall(request):
    return JsonResponse({
        "success": False,
        "payload": "Unknown URL"
    })
