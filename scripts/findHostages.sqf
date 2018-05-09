findTask call BIS_fnc_setTask;
sleep 3;

while {false in found} do {
  for "_i" from 0 to (count hostages) - 1 do {
    {
      _hostage = hostages select _i;
      _vis = [objNull, "VIEW"] checkVisibility [eyePos _x, eyePos _hostage];

      if(_vis == 1) then {
        found set [_i, true];
      }
    } forEach allPlayers; /* AI units don't matter, so here I prefer allPlayers over playerGroup */
  };

  sleep 1;
};

findTask set [4, "SUCCEEDED"];
findTask call BIS_fnc_setTask;

progress = 2;
