from django.db import models
import uuid
# Create your models here.


class Floor(models.Model):
    id = models.UUIDField(max_length=36, primary_key=True, default=uuid.uuid4)
    floor_number = models.IntegerField(null=True, blank=False)

    def __str__(self):
        return f"Floor : {self.floor_number}"


MOVING_STATUS = (
    ('U', 'Moving Up'),
    ('D', 'Moving Down'),
    ('S', 'Still'),
)

DOOR_STATUS = (
    ('O', 'Open'),
    ('C', 'Class'),
)

STATUS_LIGHT = (
    ('R', 'Red'),
    ('G', 'Green'),
)


class Elevator(models.Model):
    id = models.UUIDField(max_length=36, primary_key=True, default=uuid.uuid4)
    elevator_name = models.CharField(max_length=20, null=True, blank=True)
    elevator_number = models.IntegerField(null=False, blank=True)
    last_floor = models.IntegerField(null=True, blank=True)
    moving_status = models.CharField(max_length=1, default="S", choices=MOVING_STATUS, null=True, blank=True)
    door_status = models.CharField(max_length=1, default="C", choices=DOOR_STATUS, null=True, blank=True)
    status_light = models.CharField(max_length=1, default="G", choices=STATUS_LIGHT, null=True, blank=True)

    def save(self, *args, **kwargs):
        if self.id is None:
            latest_elevator = Elevator.objects.latest()
            self.elevator_number = latest_elevator.elevator_number + 1 if latest_elevator else 1
        super(Elevator, self).save(*args, **kwargs)



class ElevatorRequest(models.Model):
    id = models.UUIDField(max_length=36, primary_key=True, default=uuid.uuid4)
    floor = models.OneToOneField(Floor, on_delete=models.CASCADE, null=True, blank=False, related_name="requests")
    elevator = models.ForeignKey(Elevator, on_delete=models.CASCADE, null=True, blank=False, related_name="requests")

    def __str__(self):
        return f"request --> floor number : {self.floor.floor_number} elevator : {self.elevator.elevator_number}"
