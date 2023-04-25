import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MapsCart(),
    );
  }
}

class MapsCart extends StatefulWidget {
  const MapsCart({Key? key}) : super(key: key);

  @override
  State<MapsCart> createState() => _MapsCartState();
}

class _MapsCartState extends State<MapsCart> {
  //Kartaning ko'rsatish kerak bo'lgan joyi

  //Birichi markerning joylashuvi
  static const double lat = 39.652451;
  static const double long = 66.970139;

//Ikkinchi markerning joylashuvi
  static const double latTwo = 39.655451;
  static const double longTwo = 66.974139;

  //Kartaning boshlang'ich ko'rsatish joyi
  //Bunda Samarqand  ko'rsatilgan
  static const CameraPosition location =
      CameraPosition(target: LatLng(lat, long), zoom: 15);

//ikkita List o'chmasdan list nomli listdan chiqarishimiz
// mumkun unda karta ochilgan birdan marker ham chiqadi
  final List<Marker> marker = [];
  final List<Marker> list = [
    //Birinchi markerni
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(
        lat,
        long,
      ),
    ),
    //Ikkinchi Marker
    const Marker(
      markerId: MarkerId('2'),
      position: LatLng(
        latTwo,
        longTwo,
      ),
    )
  ];

//Listdagi Markerlarni ikkinchi listga qo'shyapmiz
  void addMarker() {
    marker.addAll(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Karta UI chiqarish qismi
          GoogleMap(
            initialCameraPosition: location,
            markers: Set.of(marker),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(onPressed: () {
            //Markerlarni ko'rsatish uchun funtion ishlatyapmiz
            addMarker();
            setState(() {});
          }),
        ],
      ),
    );
  }
}
