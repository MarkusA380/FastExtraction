sleep 4 * 60;

attackGroup addWaypoint [position (leader playerGroup), 0];
[attackGroup, 0] waypointAttachVehicle (leader playerGroup);
[attackGroup, 0] setWaypointType "DESTROY";
