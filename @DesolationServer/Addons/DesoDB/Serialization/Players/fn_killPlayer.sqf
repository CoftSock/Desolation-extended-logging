/*
 * Desolation Redux
 * http://desolationredux.com/
 * � 2016 Desolation Dev Team
 * 
 * This work is licensed under the Arma Public License Share Alike (APL-SA) + Bohemia monetization rights.
 * To view a copy of this license, visit:
 * https://www.bistudio.com/community/licenses/arma-public-license-share-alike/
 * https://www.bistudio.com/monetization/
 */
 
 /// used in Desolation killPlayer request
 
#include "\DesoDB\constants.hpp" 

params["_playerObj","_killerObj"];

_killType = 0;
if(!isNull _killerObj && isPlayer _killerObj && _killerObj != _playerObj) then {
	_killType = 1;
};
if(!isNull _killerObj && isPlayer _killerObj && _killerObj == _playerObj) then {
	_killType = 2;
};
if ((currentWeapon _killer) isEqualTo "DSR_Melee_Axe") then {
    _killType = 3;
};

_deadCharUUID = _playerObj getVariable ["cUUID",""];
_killerPlayerUUID = "";
_type = "Unknown";
_killerWeapon = currentWeapon _killerObj;
_killerAmmo = currentMagazineDetail _killerObj;
_killerZeroing = currentZeroing _killerObj;
_killerAmmoDetail = currentMagazineDetail _killerObj;
_killerAmmoDetail splitString "([ ]/:)";
_killerAmmoDetail = str _killerAmmoDetail;
_killerName = name _killerObj;
_killerUID = getPlayerUID _killerObj;
_victimName = name _playerObj;
_victimUID = getPlayerUID _playerObj;
_closesttown = nearestLocations [_playerObj,["NameCityCapital","NameCity","NameVillage"],1400] select 0;
_nearbyLocation = text _closesttown;
_distance = 0;

switch(_killType) do {
	case 1: {
		_killerPlayerUUID = _killerObj getVariable ["pUUID",""];
		_killerWeapon = "TODO: get weapon";
		_distance = _killerObj distance _playerObj;
		_type = "Murder";
	};
	case 2: {
		_type = "Suicide";
	};
	case 3: {
		_type = "Chopped";
	};
};
_request = [PROTOCOL_DBCALL_FUNCTION_DECLARE_CHAR_DEATH,[
	PROTOCOL_DBCALL_ARGUMENT_CHARUUID,_deadCharUUID,
	PROTOCOL_DBCALL_ARGUMENT_ATTACKER,_killerPlayerUUID,
	PROTOCOL_DBCALL_ARGUMENT_TYPE,_type,
	PROTOCOL_DBCALL_ARGUMENT_WEAPON,_killerWeapon,
	PROTOCOL_DBCALL_ARGUMENT_DISTANCE,_distance
]];
[_request] call DB_fnc_sendRequest;

//A3log
[format["Type: %1 KillerUID: %2 KillerName: %3 DeadUID: %4 DeadName: %5 Weapon: %6 Zeroing: %7 AmmoDetail: %8 Distance: %9 Location: %10 %11",
_type,
_killerUID,
_killerName,
_victimUID,
_victimName,
_killerWeapon,
_killerZeroing,
_killerAmmoDetail,
_distance,
mapGridPosition getPos _playerObj,
_nearbyLocation],"KillLog"] call A3Log;

