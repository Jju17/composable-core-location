import Combine
import CoreLocation
import XCTestDynamicOverlay

extension LocationManager {
  /// The failing implementation of the ``LocationManager`` interface. By default this
  /// implementation stubs all of its endpoints as functions that immediately call `XCTFail`.
  ///
  /// This allows you to test an even deeper property of your features: that they use only the
  /// location manager endpoints that you specify and nothing else. This can be useful as a
  /// measurement of just how complex a particular test is. Tests that need to stub many endpoints
  /// are in some sense more complicated than tests that only need to stub a few endpoints. It's not
  /// necessarily a bad thing to stub many endpoints. Sometimes it's needed.
  ///
  /// As an example, to create a failing manager that simulates a location manager that has already
  /// authorized access to location, and when a location is requested it immediately responds
  /// with a mock location we can do something like this:
  ///
  /// ```swift
  /// // Send actions to this subject to simulate the location manager's delegate methods
  /// // being called.
  /// let locationManagerSubject = PassthroughSubject<LocationManager.Action, Never>()
  ///
  /// // The mock location we want the manager to say we are located at
  /// let mockLocation = Location(
  ///   coordinate: CLLocationCoordinate2D(latitude: 40.6501, longitude: -73.94958),
  ///   // A whole bunch of other properties have been omitted.
  /// )
  ///
  /// var manager = LocationManager.failing
  ///
  /// // Override any CLLocationManager endpoints your test invokes:
  /// manager.authorizationStatus = { .authorizedAlways }
  /// manager.delegate = { locationManagerSubject.eraseToEffect() }
  /// manager.locationServicesEnabled = { true }
  /// manager.requestLocation = {
  ///   .fireAndForget { locationManagerSubject.send(.didUpdateLocations([mockLocation])) }
  /// }
  /// ```
  public static let failing = Self(
    accuracyAuthorization: {
      XCTFail("A failing endpoint was accessed: 'LocationManager.accuracyAuthorization'")
      return nil
    },
    authorizationStatus: {
      XCTFail("A failing endpoint was accessed: 'LocationManager.authorizationStatus'")
      return .notDetermined
    },
    delegate: { XCTestDynamicOverlay.unimplemented("LocationManager.delegate") },
    dismissHeadingCalibrationDisplay: {
        XCTestDynamicOverlay.unimplemented("LocationManager.dismissHeadingCalibrationDisplay")
    },
    heading: {
      XCTFail("A failing endpoint was accessed: 'LocationManager.heading'")
      return nil
    },
    headingAvailable: {
      XCTFail("A failing endpoint was accessed: 'LocationManager.headingAvailable'")
      return false
    },
    isRangingAvailable: {
      XCTFail("A failing endpoint was accessed: 'LocationManager.isRangingAvailable'")
      return false
    },
    location: {
      XCTFail("A failing endpoint was accessed: 'LocationManager.location'")
      return nil
    },
    locationServicesEnabled: {
      XCTFail("A failing endpoint was accessed: 'LocationManager.locationServicesEnabled'")
      return false
    },
    maximumRegionMonitoringDistance: {
      XCTFail("A failing endpoint was accessed: 'LocationManager.maximumRegionMonitoringDistance'")
      return CLLocationDistanceMax
    },
    monitoredRegions: {
      XCTFail("A failing endpoint was accessed: 'LocationManager.monitoredRegions'")
      return []
    },
    requestAlwaysAuthorization: { XCTestDynamicOverlay.unimplemented("LocationManager.requestAlwaysAuthorization") },
    requestLocation: { XCTestDynamicOverlay.unimplemented("LocationManager.requestLocation") },
    requestWhenInUseAuthorization: {
        XCTestDynamicOverlay.unimplemented("LocationManager.requestWhenInUseAuthorization")
    },
    requestTemporaryFullAccuracyAuthorization: { _ in
        XCTestDynamicOverlay.unimplemented("LocationManager.requestTemporaryFullAccuracyAuthorization")
    },
    set: { _ in XCTestDynamicOverlay.unimplemented("LocationManager.set") },
    significantLocationChangeMonitoringAvailable: {
      XCTFail()
      return false
    },
    startMonitoringForRegion: { _ in XCTestDynamicOverlay.unimplemented("LocationManager.startMonitoringForRegion") },
    startMonitoringSignificantLocationChanges: {
        XCTestDynamicOverlay.unimplemented("LocationManager.startMonitoringSignificantLocationChanges")
    },
    startMonitoringVisits: { XCTestDynamicOverlay.unimplemented("LocationManager.startMonitoringVisits") },
    startUpdatingHeading: { XCTestDynamicOverlay.unimplemented("LocationManager.startUpdatingHeading") },
    startUpdatingLocation: { XCTestDynamicOverlay.unimplemented("LocationManager.startUpdatingLocation") },
    stopMonitoringForRegion: { _ in XCTestDynamicOverlay.unimplemented("LocationManager.stopMonitoringForRegion") },
    stopMonitoringSignificantLocationChanges: {
        XCTestDynamicOverlay.unimplemented("LocationManager.stopMonitoringSignificantLocationChanges")
    },
    stopMonitoringVisits: { XCTestDynamicOverlay.unimplemented("LocationManager.stopMonitoringVisits") },
    stopUpdatingHeading: { XCTestDynamicOverlay.unimplemented("LocationManager.stopUpdatingHeading") },
    stopUpdatingLocation: { XCTestDynamicOverlay.unimplemented("LocationManager.stopUpdatingLocation") }
  )
}
