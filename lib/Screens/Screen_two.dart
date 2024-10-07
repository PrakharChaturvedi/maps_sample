import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ScreenTwo extends StatefulWidget {
  final String location;

  ScreenTwo({required this.location});

  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  late MapController _mapController;
  String _selectedMapType = 'OpenStreetMap';
  List<String> _mapTypes = ['OpenStreetMap', 'OpenTopoMap'];

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location on Map'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _getLatLng(widget.location),
                initialZoom: 13.0,
              ),
              children: [
                _getTileLayer(),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _getLatLng(widget.location),
                      width: 80.0,
                      height: 80.0,
                      child: Icon(Icons.location_pin),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: DropdownButton(
              value: _selectedMapType,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedMapType = newValue!;
                });
              },
              items: _mapTypes.map((mapType) {
                return DropdownMenuItem(
                  child: Text(mapType),
                  value: mapType,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  LatLng _getLatLng(String location) {
    final parts = location.split(', ');
    return LatLng(double.parse(parts[0]), double.parse(parts[1]));
  }

  TileLayer _getTileLayer() {
    switch (_selectedMapType) {
      case 'OpenStreetMap':
        return TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
        );
      case 'OpenTopoMap':
        return TileLayer(
          urlTemplate: 'https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
        );
      default:
        return TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
        );
    }
  }
}