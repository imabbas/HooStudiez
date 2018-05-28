import csv
import re
import os
from .models import *
from django.http import JsonResponse, HttpResponse
from datetime import datetime as dt

def message(success, result):
    res = {
        'success': success,
        'result': result
    }
    return JsonResponse(res)

def loadData(request):
    data_csv = os.path.join('static', "CS1182Data.csv")
    loc_csv = os.path.join('static', "locations.csv")

    data = open(data_csv, "r")
    locations = open(loc_csv, "r")

    data_reader = csv.reader(data)
    locations_reader = csv.reader(locations)

    places = {}

    for row in locations_reader:
        places[row[0]] = row[1]

    keys = places.keys()

    for row in data_reader:
        if row[0] == "ClassNumber":
            continue

        professor = row[6].split(",")[0]
        name = row[9]
        type = row[4]
        units = row[5]
        section = row[3]
        if ("TBA" not in row[7]):
            days = re.findall('[A-Z][^A-Z]*', row[7].split()[0])
            start_time_parsed = row[7].split()[1]
            start_time = dt.strptime(start_time_parsed, "%I:%M%p")
            end_time_parsed = row[7].split()[3]
            end_time = dt.strptime(end_time_parsed, "%I:%M%p")
        else:
            days = []
            start_time = None
            end_time = None
        room = row[8]
        dpt = row[1]
        num = row[2]
        sis_num = row[0]
        building = None

        if "TBA" not in room:
            hall = row[8].split()
            del hall[-1]
            str1 = " ".join(hall)
            if str1 in keys:
                building = places[str1]

        course = Course()

        course.professor = professor
        course.name = name
        course.type = type
        course.units = units
        course.section = section
        course.days = ",".join(days)
        if (start_time and end_time):
            course.start_time = start_time
            course.end_time = end_time
        course.room = room
        course.dpt = dpt
        course.num = num
        course.sis_num = sis_num
        if building:
            course.building = building

        try:
            course.save()
        except:
            return message(False, "There was an error saving course to database.")
    return message(True, "Done")


    data.close()
    locations.close()
