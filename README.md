# anti-shuffle for fivem
there are a few other scripts to prevent seat shuffling. the difference is that this script uses the native ped config flags to disable seat shuffling instead of trying to catch and cancel the player attempts to shuffle seats.

### description
normally, when the driver of a vehicle exits that vehicle, the player occupying the front passenger-seat will shuffle over into the driver's seat and take control of the vehicle. this resource prevents that from happening. the player can press the 'left-shift' key to override the script when they want to slide into the driver's seat. people requested that the script block players from sliding into driver's seat even if they were entering an empty vehicle, so the default behavior has been changed to reflect this. you can toggle this setting in the config.lua file

### features
* prevents passenger in front seat from sliding into unoccupied driver's seat
* player can hold 'left-shift' key to override the script when they want to slide into driver's seat
* does not interrupt other actions inside the vehicle, ie: aiming, shooting, exiting the vehicle etc
* does not prevent back-seat passengers from sliding over to make room for new passenger
* entire script can be toggled with '/antishuffle' command in chat
* '/entryslide' chat command can be used to toggle sliding to driver seat when entering empty vehicle while leaving main script intact
* standalone script, does not require essentialmode or any other

#### update v1.11
 * fixed a mistake using wrong task id causing players to warp to passenger seat (thanks <a href="https://github.com/XvenDeR">XvenDeR</a> for pointing it out)
#### update v1.1
 * configuration variables moved to config.lua
 * per request - new default functionality blocks all attempts to enter driver's seat from passenger (even when the player is attempting to enter an empty vehicle from passenger side)
 * new config variable 'allowEntrySlide' can be changed to modify this behavior; default value is false (preventing slide across when entering from passenger side)
 * new chat command '/entryslide' can be used to toggle 'allowEntrySlide' setting in-game
 * added chat responses to /antishuffle and /entryslide commands, you can easily change this to pNotify or whatever notification resource you use
 * code further simplified

### installation
* copy the 'anti-shuffle-main' directory to your server 'resources' folder
* rename the folder to 'anti-shuffle'
* add 'ensure anti-shuffle' to your server.cfg file

### configuration
the configuration variables are located in the 'config.lua' file. there are only 3:
* stopPassengerShuffle  - true/false  - toggle the whole script on/off. default: true; [true = on / false = off]
* allowEntrySlide - true/false  - toggle allowing players entering empty vehicle to slide from passenger side into driver's seat. default: false; [true = allow / false = prevent]
* exemptKeys  - comma seperated list  - the key/keys the player will press to override the script when they want to slide into driver's seat manually. default: 21 [left-shit key]  - a full list of key codes can be found at: https://docs.fivem.net/docs/game-references/controls/

### notes
this resource requires FXServer, make sure you're up-to-date (https://github.com/citizenfx/cfx-server-data)

### credits
Ascaped for the concept/idea with their anti-seat-shuffle script (https://github.com/Ascaped/SeatShuffle)
