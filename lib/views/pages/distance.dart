import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'dart:math';

class DistanceTracker extends StatefulWidget {
  @override
  _DistanceTrackerState createState() => _DistanceTrackerState();
}

class _DistanceTrackerState extends State<DistanceTracker> {
  Location _location = Location();
  List<LocationData> _locationHistory = [];
  double _totalDistance = 0.0;
  
  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }
  
  Future<void> _initializeLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    
    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        // Handle the case where the user does not enable location services
        return;
      }
    }
    
    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        // Handle the case where the user does not grant permission
        return;
      }
    }
    
    _location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        if (_locationHistory.isNotEmpty) {
          double distance = _calculateDistance(
            _locationHistory.last.latitude!,
            _locationHistory.last.longitude!,
            currentLocation.latitude!,
            currentLocation.longitude!
          );
          _totalDistance += distance;
        }
        _locationHistory.add(currentLocation);
      });
    });
  }
  
  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double rad = pi / 180.0;
    double lat1Rad = lat1 * rad;
    double lon1Rad = lon1 * rad;
    double lat2Rad = lat2 * rad;
    double lon2Rad = lon2 * rad;
    
    double dLat = lat2Rad - lat1Rad;
    double dLon = lon2Rad - lon1Rad;
    
    double a = sin(dLat / 2) * sin(dLat / 2) +
               cos(lat1Rad) * cos(lat2Rad) *
               sin(dLon / 2) * sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = 6371000 * c; // Distance in meters
    
    return distance;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Distance Tracker'),
      ),
      body: Center(
        child: Text(
          'Total Distance Traveled: ${_totalDistance.toStringAsFixed(2)} meters',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
