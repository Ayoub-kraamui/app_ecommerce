import 'dart:convert';

import 'package:app_ecommerce/core/constant/key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future getPolyLine(lat, long, destlat, destlong) async {
  Set<Polyline> polylintSet = {};
  List<LatLng> polylineco = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destlat,$destlong&key=$keyGoogleMaps";
  var response = await http.post(Uri.parse(url));
  var responsebosy = jsonDecode(response.body);
  var point = responsebosy['route'][0]['overview_polyline']['points'];
  List<PointLatLng> result = polylinePoints.decodePolyline(point);
  if (result.isNotEmpty) {
    result.forEach((PointLatLng pointLatLng) {
      polylineco.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    });
  }
  Polyline polyline = Polyline(
      polylineId: PolylineId("ayoub"),
      color: Color.fromARGB(255, 54, 244, 216),
      width: 5,
      points: polylineco);
  polylintSet.add(polyline);

  return polylintSet;
}
