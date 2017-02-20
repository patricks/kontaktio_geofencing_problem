# kontaktio_geofencing_problem

If there is a CLLocationManager (Geofences) and KTKBeaconManager (iBeacons) running in the same Swift project. The KTKBeaconManagerDelegate sometimes tries to handle a CLCircularRegion. If I try to access the KTKBeaconRegion proximityUUID the app crashes with the following error:

```swift
libswiftFoundation.dylib`static Foundation.UUID._unconditionallyBridgeFromObjectiveC (Swift.Optional<__ObjC.NSUUID>) -> Foundation.UUID:
```
