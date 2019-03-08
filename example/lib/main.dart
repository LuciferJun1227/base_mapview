import 'package:base_mapview/latlng.dart';
import 'package:flutter/material.dart';
import 'package:base_mapview/amap_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  List _list = [
    LatLng(43.99791, 125.397968).toMap(),
    LatLng(39.833876, 116.301886).toMap(),
    LatLng(39.823862, 116.295385).toMap(),
    LatLng(39.823734, 116.296299).toMap(),
    LatLng(39.823083, 116.294776).toMap()
  ];

  List _polylinelist = [
    LatLng(39.82588, 116.30102).toMap(),
    LatLng(39.825847, 116.302554).toMap(),
    LatLng(39.823853, 116.300612).toMap(),
  ];

  List _polygonlist = [
    LatLng(39.823862, 116.295385).toMap(),
    LatLng(39.823734, 116.296299).toMap(),
    LatLng(39.823083, 116.294776).toMap(),
  ];

  Key _key0;

  @override
  void initState() {
    _key0 = AMapView.createKey(_key0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('MapView app'),
          ),
          body: Column(
            children: <Widget>[
              AMapView(
                key: _key0,
                mapType: MapType.satellite,
                centerCoordinate: LatLng(43.99791, 125.397968),
                zoomLevel: 10,
                onLocationChange: (LatLng latlng) {
                  print(latlng.toString());
                },
              ),
              Wrap(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      AMapView.channel.invokeMethod("location");
                    },
                    child: Text(
                      "定位",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      AMapView.channel.invokeMethod(
                        "addmarker",
                        {
                          "mapView": {"markerlist": _list}
                        },
                      );
                    },
                    child: Text(
                      "添加marker",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      AMapView.channel.invokeMethod("removemarker");
                    },
                    child: Text(
                      "移除marker",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      AMapView.channel.invokeMethod(
                        "drawcircle",
                        {
                          "mapView": {
                            "roundcenter":
                                LatLng(39.825262, 116.297241).toMap(),
                            "radius": 100.0,
                          }
                        },
                      );
                    },
                    child: Text(
                      "绘制圆形",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      AMapView.channel.invokeMethod(
                        "drawpolylin",
                        {
                          "mapView": {"polylinlist": _polylinelist}
                        },
                      );
                    },
                    child: Text(
                      "绘制线",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      AMapView.channel.invokeMethod(
                        "drawPolygon",
                        {
                          "mapView": {"polygonlist": _polygonlist}
                        },
                      );
                    },
                    child: Text(
                      "绘制多边形",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      AMapView.channel.invokeMethod(
                        "setMapType",
                        {
                          "mapView": {"mapType": 2}
                        },
                      );
                    },
                    child: Text(
                      "卫星图层",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      AMapView.channel.invokeMethod(
                        "setMapType",
                        {
                          "mapView": {"mapType": 1}
                        },
                      );
                    },
                    child: Text(
                      "正常图层",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      AMapView.channel.invokeMethod("zoomOut");
                    },
                    child: Text(
                      "放大地图",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      AMapView.channel.invokeMethod("zoomIn");
                    },
                    child: Text(
                      "缩小地图",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
