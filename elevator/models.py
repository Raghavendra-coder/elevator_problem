from django.db import models
import uuid
# Create your models here.


class Floor(models.Model):
    id = models.UUIDField(max_length=36, primary_key=True, default=uuid.uuid4)
    floor_number = models.IntegerField(null=True, blank=False)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_by = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Floor : {self.floor_number}"


MOVING_STATUS = (
    ('U', 'Moving Up'),
    ('D', 'Moving Down'),
    ('S', 'Still'),
)

AVAILABILITY = (
    ('A', 'Available'),
    ('B', 'Busy'),
)

DOOR_STATUS = (
    ('O', 'Open'),
    ('C', 'Closed'),
)

STATUS_LIGHT = (
    ('R', 'Red'),
    ('G', 'Green'),
)


class Elevator(models.Model):
    id = models.UUIDField(max_length=36, primary_key=True, default=uuid.uuid4)
    elevator_name = models.CharField(max_length=20, null=True, blank=True)
    elevator_number = models.IntegerField(null=False, blank=True)
    reached_floor = models.IntegerField(null=True, blank=True)
    moving_status = models.CharField(max_length=1, default="S", choices=MOVING_STATUS, null=True, blank=True)
    door_status = models.CharField(max_length=1, default="C", choices=DOOR_STATUS, null=True, blank=True)
    status_light = models.CharField(max_length=1, default="G", choices=STATUS_LIGHT, null=True, blank=True)
    availability = models.CharField(max_length=1, default="A", choices=AVAILABILITY, null=True, blank=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_by = models.DateTimeField(auto_now=True)

    def save(self, *args, **kwargs):
        if self.id is None:
            try:
                latest_elevator = Elevator.objects.latest('created_at').elevator_number
            except:
                latest_elevator = 1
            self.elevator_number = latest_elevator
        super(Elevator, self).save(*args, **kwargs)


    def __str__(self):
        return f"Elevator : {self.elevator_number}"



class ElevatorRequest(models.Model):
    id = models.UUIDField(max_length=36, primary_key=True, default=uuid.uuid4)
    requested_floor = models.ForeignKey(Floor, on_delete=models.CASCADE, null=True, blank=False, related_name="requests")
    elevator = models.ForeignKey(Elevator, on_delete=models.CASCADE, null=True, blank=False, related_name="requests")

    created_at = models.DateTimeField(auto_now_add=True)
    updated_by = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"elevator : {self.elevator.elevator_number}"


class DestinationFloorRequest(models.Model):
    id = models.UUIDField(max_length=36, primary_key=True, default=uuid.uuid4)
    elevator = models.ForeignKey(Elevator, on_delete=models.CASCADE, null=True, blank=False,
                                        related_name="destinations")
    destination_floor = models.ForeignKey(Floor, on_delete=models.CASCADE, null=True, blank=False,
                                          related_name="destination")

    created_at = models.DateTimeField(auto_now_add=True)
    updated_by = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"destination floor : {self.destination_floor.floor_number}"
