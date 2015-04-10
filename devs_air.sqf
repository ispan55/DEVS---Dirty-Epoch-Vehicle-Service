/* ////////////////////////////////////
//...................................//
//             DEVS v0.3 [WIP]         //
//               by CH!LL3R              //
//            |V.I.P.|-Gaming             //
//          www.v-i-p-gaming.de         //
//...................................//
///////////////////////////////////////

DEVS v0.3 [WIP]    Dirty Epoch Vehicle Service

Here are the Credits from scripts I use to get inspired and to look how things working:

Credits:    Script:        Dead Simple Vehicle Resupply Script
            Author:        ProfCupcake
            Link:        http://www.armaholic.com/page.php?id=23235
            
            Script:     Helibot 1.5
            Author:        Soolie & ScoobySna
            Link:        http://www.armaholic.com/page.php?id=25635
            
            Script:        Generic Vehicle Service
            Author:        Jacmac
            Link:        http://www.armaholic.com/page.php?id=19737
            
            Special Thanks to:
                                WhitePearl......She's a real Pro in making awesome coffee
                                Sp4rkY..........Dude, without your lessons I never could do this shit ^^
                                KiloSwiss.......Cause he always know, where to look for information
                                Saeco Minuto....Cause this machine is the reason, why my wife is such a Pro in making awesome coffee
                                
                                
                                
This script repair, refuel and rearm Vehicles and Helis. It works with an addAction to Items you need to place on the map.
You need a file for every airvehicle and one for landvehicle.
Servicing LandVehicles costs 100 crypto, helis costs 200 crypto.


I testet the script on my server, but I could not say if this will work with EpochAH, cause I'm using infiSTAR
Also I have no BattlEye on my Server, so you need to ask google to set restrictons to the filter, if you already didn't know how to do that.
Feel free to edit and share this script, but do not remove the credits.

This is my first try of a script. I only put a lot of stuff from many other scripts together and reworked some issues.
I think it's not perfect and a lot of things could be done better. Feel free to offer criticism, cause I want to learn.
                    
                        
Install-Instructions:

Place an Item on the map (mission.sqm) and put on the init-field:
            For Heli:
                                this addAction ["Heli-Service", "path\to\the\devs_air.sqf", [5,1], 50, true, true, "", "vehicle _this isKindOf 'Air'"];
            For Landvehicle:
                                this addAction ["Vehicle-Service", "path\to\the\devs_land.sqf", [5,1], 50, true, true, "", "vehicle _this isKindOf 'LandVehicle'"];
                                
Change "path\to\the\devs_air.sqf" to where you put the files in. Let's say you want to put it in your mission.pbo (like for Altis = epoch.Altis.pbo) in a folder named "scripts".
So copy the folder "devs" from download and paste it in the scrits folder. Than the path should look like this:

                                this addAction ["Heli-Service", "scripts\devs\devs_air.sqf", [5,1], 50, true, true, "", "vehicle _this isKindOf 'Air'"];
        
Done!

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// */
private ["_user", "_veh"];

_user = (_this select 1);
_veh = vehicle _user;


if (EPOCH_playerCrypto >= 200) then {


            //--> text: welcome-messages    
                        ['Welcome to Heli Service',0,0.6,2,1] spawn bis_fnc_dynamictext;        
                        uisleep 10;
                        ['Touch down your Heli while servicing your vehicle !!!',0,0.6,2,1] spawn bis_fnc_dynamictext;                
                        uisleep 10;
                        
            //--> action: remove crypto
                        EPOCH_playerCrypto = EPOCH_playerCrypto - 200 ;
                        
            //--> text: service start, removed crypto and repairing in progresss    
                        ['Removed 200 crypto.',0,0.6,2,1] spawn bis_fnc_dynamictext;    
                        uisleep 7;
                        ['Service started.',0,0.6,2,1] spawn bis_fnc_dynamictext;    
                        uisleep 7;
                        ['Repairing in progress - please wait...',0,0.6,2,1] spawn bis_fnc_dynamictext;                                                
                        uisleep 3;        
                
            //--> action: repair Heli                    
                        _veh setDamage 0;
                        uisleep 7;
                        
            //--> text: repaired, start refuel        
                        ['Heli repaired.',0,0.6,2,1] spawn bis_fnc_dynamictext;
                        uisleep 7;
                        
                        
                        ['Refueling in progress - please wait...',0,0.6,2,1] spawn bis_fnc_dynamictext;
                        uisleep 7;
                        
            //--> action: refuel Heli
                        _veh setFuel 1;
                        uisleep 7;
                
            //--> text: refueled, start rearming            
                        ['Heli refueled.',0,0.6,2,1] spawn bis_fnc_dynamictext;
                        uisleep 7;
                        
                        
                        ['Rearming in progress - please wait...',0,0.6,2,1] spawn bis_fnc_dynamictext;
                        uisleep 7;
                        
            //--> action: rearm Heli
                        _veh setVehicleAmmo 1;
                        uisleep 0.1;
                        _veh setAmmoCargo 1;
                        uisleep 7;
                            
            //--> text: rearmed, finish service        
                        ['Heli rearmed.',0,0.6,2,1] spawn bis_fnc_dynamictext;
                        uisleep 7;
                        ['Your Heli is as new as straight from factory...',0,0.6,2,1] spawn bis_fnc_dynamictext;
                        uisleep 7;
                        ['Servicing is finished. Have a nice day',0,0.6,2,1] spawn bis_fnc_dynamictext;        
                            
} else {
            //--> text: not enough crypto
                        ['Sorry Dude, you need 200 Crypto to service your heli',0,0.6,2,1] spawn bis_fnc_dynamictext;
};   
