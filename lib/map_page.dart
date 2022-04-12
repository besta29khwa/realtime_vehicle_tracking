import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:realtime_vehicle_tracking/lib/.env.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

class MapMap extends StatefulWidget {
  final String user_id;
  MapMap(this.user_id);
  @override
  _MyMapState createState() => _MyMapState();
}

PolylinePoints polylinePoints = PolylinePoints();
Map<PolylineId, Polyline> polylines = {};
double newLatitude = 0;
double newLongitude = 0;
int coord_Number = 0;

class _MyMapState extends State<MapMap> {
  final loc.Location location = loc.Location();
  late GoogleMapController _controller;
  bool _added = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Vehicle-info').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (_added) {
              mymap(snapshot);
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return GoogleMap(
              mapType: MapType.normal,
              markers: {
                Marker(
                    position: LatLng(
                      snapshot.data!.docs.singleWhere(
                              (element) => element.id == widget.user_id)['latitude'],
                      snapshot.data!.docs.singleWhere(
                              (element) => element.id == widget.user_id)['longitude'],
                    ),
                    markerId: MarkerId('id'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueMagenta)),
              },
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                    snapshot.data!.docs.singleWhere(
                            (element) => element.id == widget.user_id)['latitude'],
                    snapshot.data!.docs.singleWhere(
                            (element) => element.id == widget.user_id)['longitude'],
                  ),
                  zoom: 15.47),
              onMapCreated: (GoogleMapController controller) async {
                setState(() {
                  _controller = controller;
                  _added = true;
                });
              },
            );
          },
        ));
  }

  Future<void> mymap(AsyncSnapshot<QuerySnapshot> snapshot) async {
    newLatitude = snapshot.data!.docs.singleWhere(
            (element) => element.id == widget.user_id)['latitude'];
    newLongitude = snapshot.data!.docs.singleWhere(
            (element) => element.id == widget.user_id)['longitude'];

    await _controller
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(
          snapshot.data!.docs.singleWhere(
                  (element) => element.id == widget.user_id)['latitude'],
          snapshot.data!.docs.singleWhere(
                  (element) => element.id == widget.user_id)['longitude'],
        ),
        zoom: 15.47)));
  }
_addPolyLine(List<LatLng> polylineCoordinates) {
  PolylineId id = PolylineId("poly");
  Polyline polyline = Polyline(
    polylineId: id,
    points: polylineCoordinates,
    width: 8,
  );
  polylines[id] = polyline;
  setState(() {});
}

void _getPolyline() async {
  List<LatLng> polylineCoordinates = [];

  PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    googleAPIKey,
    PointLatLng(_originLatitude, _originLongitude),
    PointLatLng(newLatitude, newLongitude),
    travelMode: TravelMode.driving,
  );
  if (result.points.isNotEmpty) {
    result.points.forEach((PointLatLng point) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    });
  } else {
    print(result.errorMessage);
  }
  _addPolyLine(polylineCoordinates);
}
}
