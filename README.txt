Working process of the elevator:

POSTMAN Collection is added at path "POSTMAN_COLLECTION/Elevator Problem.postman_collection.json"
Sample Database path: "elevator_problem/Sample_Database/elevator.sql" ##Postgres BAckup file
 username : admin
 password : 12345
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


1. Create number of floors(let's say 15) either from django admin or using the APIs.
2. Create elevator using API.
3. Floor - 0 is considered as ground floor.
4. Every elevator will be on ground floor by default.
5. Lets say 2 persons requested the elevator at floor number - 2.
6. Use the APi from postman collection to create request.
7. After request an API will hit to check all the requests and move accordingly so it will go up(moving_status="U")
8. how it will behave:
 (i) Suppose if lift is coming from bottom to top:
    it will server first all the requests/destinations which is above the current floor
    ex current_floor : 2 , requests = [4, 5, 1], destinations = [3, 7, 0]
    so it will go to 3, 4, 5, 7 then will come back to 1 , 0

 (ii) Suppose if lift is coming from top to bottom:
    it will server first all the requests/destinations which is below the current floor
    ex current_floor : 2 , requests = [4, 5, 1], destinations = [3, 7, 0]
    so it will go to 1, 0 then will come back to 3, 4, 5, 7

 9. so on every floor there are two APIs which play crucial role
    1. update_elevator_floor API:
        it checks if there is any requests/destinations are pending on this floor or not if yes then:
        moving status gets still amd door gets opened

    2. run_elevator API:
        this API needs to be hit right after the above API and it decides what  will be the next movement of the lift
        will be ie up/down/still
        if there is no request and no destinations asked for this lift then its door will be closed and availability will
        become True and moving status will become still.

 10. How to use:
    - Create floor & Elevator.
    - Add request for  elevator for floor(let=2)
    - Run Elevator from flloor=0
    - After running its status will be "U" means moving u so next floor will be 1
    - Call update_elevator_floor API for floor = 1 ie elevator has reached floor 1 & will show status of lift
    - Call run_elevator API: for floor 1 because now elevator will run from floor 1 its status will be "U" (as a request is there on 2nd floor)
    - call 9.1 API again as it reached the 2nd floor, lift door will be open
    - both persons entered so after entering the lift they will enter their destination lets say 3, 1 (use API to create destination)
    - call 9.2 API for lift to get its status it will be "U" as its coming up from bottom so will serve the flow first
    - reached floor 3 then again 9.1 API will needed to be hit to there the lift wil open as one person's destination is there
    - need to call 9.2 for lift's next move and moving status will NOW be "D" means Down as there are no requests/destinations above the 3rd floor
        no matter how many floors are there if no request above then lift will not move up and there exists a destination request
        at floor =1 so it will go down
    - same process upto floor = 1 lift will be open for 2nd person's destion
    - 9.2 API will be hit again to check pending request/destination if not found then door will be closed moving status will be still
        and availability status will become True

 11. You can also get/update the health of the elevator
    - when the health of the elevator is not "w" ie working then no one can request or can add destination

 12. To get the next destination of the elevator we can simply hit an API to get the next destinated floor number
        elevator_next_destination/<pk>/ pk : id of the elevator

    THIS IS JUST SIMPLE EXAMPLE , elevator will work in as much as requests and upto as much as floors
    for explaining I made small example

    NOTE : Every API is in the postman collection

    *** how to run the project ?
    * clone the repo
    * install requirments [ pip install -r requirments.txt ]
    * backup db (if u want to use my db) else create a db and migrate it [ python manage.py migrate ]
    * run the server [ python manage.py runserver ]

    ALL above three commands will be in terminal and path which incules manage.py file







