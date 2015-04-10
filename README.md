DEVS - Dirty-Epoch-Vehicle-Service
Repair, Refuel and Reammo Script for ArmA3 Epoch
.
.
.
Install Instructions:

Step 1
If you already have a folder called "scripts" in your mission.pbo continue with step 2. All other create a folder called "scripts" in your mission.pbo

Step 2
In your folder called "scripts" create a folder called "devs".

Step 3 
Put the devs_air.sqf and the devs_land.sqf into the folder "devs"

Step 4
Now, go to editor and place an Object on the map. I have used this little workshop from gasstations (Land_CarService_F) for Landvehicle and a Container (Land_Cargo40_military_green_F) for Helis

If you only want to have a Service-Point for LandVehicle, you will only need one building/Item. If you want to have a ServicePoint for Helis too, you need to put a second building to the mission.sqm ( !! Heli-Pads do not work !! ).
So you need 2 buildings for Heli AND Landvehicle, or only one building for Heli OR Landvehicle

Put this code in the Init.Field of the placed object:

        For LandVehicles:

        this addAction ["Vehicle-Service", "scripts\devs\devs_land.sqf", [5,1], 50, true, true, "", "vehicle _this isKindOf 'LandVehicle'"];

        For Helis:

        this addAction ["Heli-Service", "scripts\devs\devs_air.sqf", [5,1], 50, true, true, "", "vehicle _this isKindOf 'Air'"];

After you placed and saved your object(s) in the editor, copy & paste the objects to your mission.sqm
This should look like this:
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Vehicles {
		items = 2;
		class Item0 {
			position[] = {1111.111, 0.01, 2222.22};
			azimut = 190;
			id = 1;
			side = "EMPTY";
			vehicle = "Land_Cargo40_military_green_F";
			skill = 0.6;
			init = "this addAction [""Heli-Service"", ""scripts\devs\devs_air.sqf"", [5,1], 50, true, true, """", ""vehicle _this isKindOf 'Air'""];";
		};
		class Item1 {
			position[] = 2222.222, 0.01, 11111.111};
			azimut = 59.770031;
			id = 2;
			side = "EMPTY";
			vehicle = "Land_CarService_F";
			skill = 0.6;
			init = "this addAction [""Vehicle-Service"", ""scripts\devs\devs_land.sqf"", [5,1], 50, true, true, """", ""vehicle _this isKindOf 'LandVehicle'""];";
		};
	};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

That's it.....

Epilogue
I want to let you know: I didn't use epochAH on my server cause I have infiSTAR and I didn't use BE-Filter.
So I couldn't guarantee that this script will work with epochAH or with active BE. All I could do is to announce what other admins telling me to do for BE, but I couldn't confirm the correctness.

