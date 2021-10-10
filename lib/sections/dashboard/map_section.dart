import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
class map_section extends StatefulWidget{
  final double currentLat;
  final double currentLong;

  const map_section({Key? key, required this.currentLat, required this.currentLong}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _map_sectionState();
  }

}

class _map_sectionState extends State<map_section> {
  final Completer<GoogleMapController> _controller = Completer();

  /*making a method to help in the query of directions using your google map
  * .....this is to get direction between two location*/
  // Markers to show points on the map
  Map<MarkerId, Marker> markers = {};
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  Location location = new Location();

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  /*initial location for the map*/

  /*polyline and distance between two location*/


  @override
  Widget build(BuildContext context) {
    return  GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng( widget.currentLat,widget.currentLong),
        zoom: 14.4746,
      ),
      compassEnabled: false,
      zoomGesturesEnabled: true,
      polylines: Set<Polyline>.of(polylines.values),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
// This method will add markers to the map based on the LatLng position
  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
    Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }
  void _getPolyline() async {
    List<LatLng> polylineCoordinates = [];

    var result = await polylinePoints.getRouteBetweenCoordinates("", -1.286389, 36.817223, -1.310341, 36.833737);
    result.forEach((PointLatLng point) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    });
    _addPolyLine(polylineCoordinates);
  }
  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.purple,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }





  @override
  void initState() {
    /// add origin marker origin marker
    _addMarker(
      LatLng(-1.286389,36.817223),
      "origin",
      BitmapDescriptor.defaultMarker,
    );

    // Add destination marker
    _addMarker(
      LatLng( 	-1.310341,36.833737),
      "destination",
      BitmapDescriptor.defaultMarkerWithHue(90),
    );
    _getPolyline();
    super.initState();
  }

  void goToLocation(CameraPosition _kLake) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
