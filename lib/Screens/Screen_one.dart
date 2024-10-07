import 'package:flutter/material.dart';
import 'package:maps/Screens/Screen_two.dart';
class ScreenOne extends StatefulWidget {
  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final _locationController = TextEditingController();

  void _updateLocation() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScreenTwo(location: _locationController.text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Location'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _locationController,
            decoration: InputDecoration(
              labelText: 'Enter Location',
            ),
          ),
          ElevatedButton(
            onPressed: _updateLocation,
            child: Text('Update Location'),
          ),
        ],
      ),
    );
  }
}