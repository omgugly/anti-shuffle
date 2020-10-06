# anti-shuffle for fivem
there are a few other scripts to prevent seat shuffling. the difference is that this script uses the native ped config flags to disable seat shuffling instead of trying to catch and cancel the player attempts to shuffle seats. this script includes various other vehicle seat related functions like entering a vehicle straight into the rear seat or shuffling between any two neighboring seats with a key-press, check the features below for a full list and read the configuration section for setup intructions

### description
normally, when the driver of a vehicle exits that vehicle, the player occupying the front passenger-seat will shuffle over into the driver's seat and take control of the vehicle. this resource prevents that from happening. the player can press the 'left-shift' key to override the script when they want to slide into the driver's seat. people requested that the script block players from sliding into driver's seat even if they were entering an empty vehicle, so the default behavior has been changed to reflect this. you can toggle this setting in the config.lua file

#### new
* optionally, players can press 'left-shift' (default key) to shuffle between any two neighboring seats with 'allowKeyShuffle' set to 'true' in config.lua
* player can enter vehicle directly into rear seats (for vehicles with > 2 seats) by pressing 'B' (default key) when near vehicle
### features
* prevents passenger in front seat from sliding into unoccupied driver's seat
* player can press 'left-shift' key (default key) to override the script when they want to slide into driver's seat from passenger manually
* does not interrupt other actions inside the vehicle, ie: aiming, shooting, exiting the vehicle etc
* does not prevent back-seat passengers from sliding over to make room for new passenger
* entire script can be toggled with '/antishuffle' command in chat
* '/entryslide' chat command can be used to toggle sliding to driver seat when entering empty vehicle while leaving main script intact
* '/seat x' command allowing player to switch to any seat in the vehicle, disabled by default, must enable in config.lua to use
* standalone script, does not require essentialmode or any other

### installation
* copy the 'anti-shuffle-main' directory to your server 'resources' folder
* rename the folder to 'anti-shuffle'
* add 'ensure anti-shuffle' to your server.cfg file

### configuration
the configuration variables are located in the 'config.lua' file. there are 6 total:
* __stopPassengerShuffle__  - true/false  - toggle the whole script on/off. __default: true__; [true = on / false = off]
* __allowEntrySlide__ - true/false  - toggle allowing players entering empty vehicle to slide from passenger side into driver's seat. __default: false__; [true = allow / false = prevent]
* __allowKeyShuffle__ - true/false - toggle allowing players to use any of the 'exemptKeys' set to shuffle between any two neighboring seats. __default: false__; [true = allow / false = prevent]
* __enableSeatCommand__ - true/false - toggle use of the '/seat' command. __default: false__; [true = enable '/seat' / false = disable '/seat']
* __enterRearSeatKey__ - the key that will be used to enter the vehicle's rear seat from outside when nearby. __default: 29__ [B]
* __exemptKeys__  - comma seperated list  - the key/keys the player will press to override the script when they want to slide into driver's seat manually. __default: 21__ [left-shift]  - a full list of key codes can be found at: https://docs.fivem.net/docs/game-references/controls/

#### update 1.3a
 * added config.lua variable 'allowKeyShuffle'. default is false. if true, pressing 'left-shift' will allow players to shuffle from __any__ seat into the __neighboring__ seat, not just from passenger to driver; ie from rear left seat into rear right seat. feature suggested by <a href="https://github.com/XvenDeR">XvenDeR</a>
 * added ability to enter rear seat directly from outside by pressing 'B' when near a vehicle
 * added 'isShuffling' boolean to check whether a shuffle was already in progress before starting a new shuffle. suggested by <a href="https://github.com/XvenDeR">XvenDeR</a>
 * selecting seat target during shuffle now uses a modulo to determine target, allowing shuffle to work properly on vehicles with seats > 4
>#### update v1.2
> * added '/seat x' command. 'x' represents a number between 1 (driver's seat) and the total number of seats in the vehicle. allows the player to swap to another empty seat in the vehicle. this command is __disabled__ by default. set 'enableSeatCommand' to 'true' to enable
> * added config.lua variable 'enableSeatCommand'. default is false. if true, enables use of the '/seat' command
>#### update v1.1a
> * fixed a mistake using wrong task id causing players to warp to passenger seat (thanks <a href="https://github.com/XvenDeR">XvenDeR</a> for pointing it out)
>#### update v1.1
> * configuration variables moved to config.lua
> * per request - new default functionality blocks all attempts to enter driver's seat from passenger (even when the player is attempting to enter an empty vehicle from passenger side)
> * new config.lua variable 'allowEntrySlide'. can be changed to modify this behavior; default value is false (preventing slide across when entering from passenger side)
> * new chat command '/entryslide' can be used to toggle 'allowEntrySlide' setting in-game
> * added chat responses to /antishuffle and /entryslide commands, you can easily change this to pNotify or whatever notification resource you use
> * code further simplified

### notes
this resource requires FXServer, make sure you're up-to-date (https://github.com/citizenfx/cfx-server-data)

### credits
Ascaped for the concept/idea with their anti-seat-shuffle script (https://github.com/Ascaped/SeatShuffle)
