# anti-shuffle for fivem
a simple resource to prevent the player who is occupying the front passenger-seat of a vehicle from shuffling into the driver's seat.
all the other resources i could find accomplish this by trying to catch the player when they begin to shuffle seats and then cancelling
the shuffle by re-setting the player back into the same vehicle. this works, but it causes the glitchy animation of the player continually
being re-set into the vehicle. it also has the side-effect of interfering with other actions like aiming or exiting the vehicle. this script
uses native ped config flags to actually disable seat shuffling in vehicles. this means no glitchy animations, and no interfering with other
actions inside the vehicle.

# description
normally, when the driver of a vehicle exits that vehicle, the player occupying the front passenger-seat will shuffle over into the driver's
seat and take control of the vehicle. this resource prevents that from happeing while still allowing it under certain circumstances. if a player
is entering an empty vehicle from the passenger side, they will be allowed to slide into the driver's seat. also, the player can hold down the
'left-shift' key to override the script and allow themselves to slide into the driver's seat.

# features
- prevents passenger in front seat from sliding into unoccupied driver's seat
- player can hold 'left-shift' key to override the script and allow themselves to slide into driver's seat
- does not prevent player from entering empty vehicle and sliding into driver's seat
- does not interfere with other actions inside the vehicle, ie: aiming, shooting, exiting the vehicle, opening the glovebox etc
- does not cause glitchy animations for passneger in front seat
- entire script can be toggled with '/antishuffle' command in chat

# notes
this resource requires FXServer, make sure you're up-to-date (https://github.com/citizenfx/cfx-server-data)

# credits
Ascaped for the concept/idea with their anti-seat-shuffle script (https://github.com/Ascaped/SeatShuffle)
