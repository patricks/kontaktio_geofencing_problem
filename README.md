# kontaktio_geofencing_problem

If there is a ```CLLocationManager``` (Geofences) and a ```KTKBeaconManager``` (iBeacons) running in the same Swift project, the ```KTKBeaconManagerDelegate``` sometimes tries to handle a ```CLCircularRegion```.
If I try to access the ```proximityUUID``` from the ```KTKBeaconRegion``` object in the methods ```didDetermineState:```, ```didEnter:``` or ```didExitRegion:``` I get the following error:
```swift
libswiftFoundation.dylib`static Foundation.UUID._unconditionallyBridgeFromObjectiveC (Swift.Optional<__ObjC.NSUUID>) -> Foundation.UUID:
```
