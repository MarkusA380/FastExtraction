exfilTask call BIS_fnc_setTask;
sleep 3;
"LeadTrack06_F_EPC" remoteExec ["playMusic", 0, false];

while {false in exfiltrated} do {
  for "_i" from 0 to (count hostages) - 1 do
  {
    _hostage = hostages select _i;
    _distance = _hostage distance2D areaCenter;
    /* Check if the hostage is outside of the AO */
    if (_distance > exfilRadius) then {
      exfiltrated set [_i, true];
    };
  };

  sleep 1;
};

exfilTask set [4, "SUCCEEDED"];
exfilTask call BIS_fnc_setTask;

progress = 4;
