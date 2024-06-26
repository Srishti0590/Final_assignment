import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class googleMapScreen extends StatelessWidget {
  const googleMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Maps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 GoogleMapController? _mapController;
  Set<Marker> markers = {};
  LatLng myLocation = const LatLng(27.706187, 85.330005);
  @override
  void initState() {
    markers.add(
      Marker(
        markerId: MarkerId(myLocation.toString()),
        position: myLocation,
        infoWindow: const InfoWindow(
          title: 'ABC',
          snippet: 'Abc company',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Contact us")),
        
        
  //       title: TextField(
  //                   autofocus: true,                    
  //                   decoration: InputDecoration(                     
  //                     hintText: " Search...",
  //                     border: InputBorder.none,
  //                     suffixIcon: IconButton(icon:const Icon(Icons.search), onPressed: () { 
  //                     },)
  //  ),
  //                   style: const TextStyle(color: Color.fromARGB(255, 96, 28, 28), fontSize: 14.0),
  //                 ),
  //         iconTheme: const IconThemeData(color: Color.fromRGBO(9, 133, 46, 100)),
  //           backgroundColor: Colors.white,
  //           actions: const <Widget>[
          
  //           ],        
      ),
      body: GoogleMap(
        zoomControlsEnabled: true,
        initialCameraPosition: CameraPosition(
          target: myLocation,
          zoom: 15,
        ),
        markers: markers,
        mapType: MapType.normal,
        onMapCreated: ((controller) => _mapController = controller),
      ),
    );
  }
}
