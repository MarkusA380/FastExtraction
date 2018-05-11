{
    _x setBehaviour "CARELESS";
} forEach (units attackGroup);
sleep (4 * 60);

{
    _x setBehaviour "AWARE";
} forEach (units attackGroup);

attackGroup addWaypoint [position (leader playerGroup), 0];
[attackGroup, 0] waypointAttachVehicle (leader playerGroup);
[attackGroup, 0] setWaypointType "DESTROY";
