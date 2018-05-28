from django.db import models

# Create your models here.
class Course(models.Model):
    # TODO: Define fields here
    professor = models.CharField(max_length=100)
    name = models.CharField(max_length=250)
    type = models.CharField(max_length=20)
    units = models.CharField(max_length=10)
    section = models.CharField(max_length=5)
    days = models.CharField(max_length=20, default="")
    start_time = models.TimeField(blank=True, null=True)
    end_time = models.TimeField(blank=True, null=True)
    room = models.CharField(max_length=100)
    dpt = models.CharField(max_length=20, default="")
    num = models.CharField(max_length=5)
    sis_num = models.CharField(max_length=5)
    building = models.CharField(max_length=250)

    def __str__(self):
        return self.dpt + " " + self.num

    def to_json(self):
        return {
            "professor": self.professor,
            "name": self.name,
            "type": self.type,
            "units": self.units,
            "section": self.section,
            "days": self.days,
            "start_time": self.start_time.strftime('%I:%M %p'),
            "end_time": self.end_time.strftime('%I:%M %p'),
            "room": self.room,
            "dpt": self.dpt,
            "num": self.num,
            "sis_num": self.sis_num,
        }
