EH_Inv = {
  _source = _this select 3;
  _damage = _this select 2;

  if (_source in allPlayers) then {_damage} else {0};
};

for "_i" from 0 to (count hostages) - 1 do {
  _hostage = hostages select _i;
  [_hostage, true] call ACE_captives_fnc_setHandcuffed;
  /* Otherwise hostages might not follow player when there is incoming fire */
  _hostage setBehaviour "CARELESS";
  _hostage setVariable["ACE_medical_allowDamage", false];
  _hostage addEventHandler ["HandleDamage", {_this call EH_Inv}];
  _hostage setUnitPos "MIDDLE";
};

progress = 1;

[] spawn {
  _running = true;

  while {_running} do {

    for "_i" from 0 to (count hostages) - 1 do {

      /* If any hostage is killed, the mission will fail */
      if (!alive (hostages select _i)) then {
        "EveryoneLost" call BIS_fnc_endMissionServer;
        _running = false;
      };

      /* Make the hostages always follow the current team leader */
      _pos = getPosATL (leader playerGroup);
      _dir = getDir (leader playerGroup);
      _var = 60 * (_i / (count hostages) - 0.5);
      _vec = [[0, -5, 0], -(_dir + _var)] call BIS_fnc_rotateVector2D;
      (hostages select _i) move (_pos vectorAdd _vec);
    };

    sleep 5;
  };
};
