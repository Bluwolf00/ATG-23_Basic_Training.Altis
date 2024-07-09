params ["_pos"];

if (isServer) then {

	_bayOccupied = false;

	{
		if (typeOf _x == "B_UGV_02_Demining_F") then {
			_bayOccupied = true;
			break;
		}
	} forEach (nearestObjects [_pos, [], 1.5]);

	if !(_bayOccupied) then {
		_ugv = [getPosATL _pos, 0, "B_UGV_02_Demining_F", WEST] call BIS_fnc_spawnVehicle;
		createVehicleCrew (_ugv select 0);
	} else {
		["Drone Already In Bay"] remoteExec ["hint",0];
	};
};
