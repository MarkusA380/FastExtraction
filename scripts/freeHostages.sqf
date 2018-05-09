freeTask call BIS_fnc_setTask;
sleep 3;

while {false in freed} do {
  for "_i" from 0 to (count hostages) - 1 do {
    _hostage = hostages select _i;
    if(!(_hostage getVariable "ACE_captives_isHandcuffed")) then {
      freed set [_i, true];
    }
  };

  sleep 1;
};

freeTask set [4, "SUCCEEDED"];
freeTask call BIS_fnc_setTask;

progress = 3;
