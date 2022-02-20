import 'package:flutter/material.dart';
import 'package:food_delivery/shared/IconBroken.dart';
import 'package:food_delivery/shared/config/colors.dart';
import 'package:food_delivery/shared/config/const.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../my_order/my_order_screen.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);
  static const routeName = 'TrackOrderScreen';

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  GoogleMapController? controller;
  Marker? _origin, _destination;

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Track Order 🛵',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              IconBroken.Bag_2,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            backgroundColor: Colors.white,
            elevation: 0.0,
            child: const Icon(
              Icons.info,
              color: Colors.black,
            ),
            onPressed: () {
              showBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(kDefaultColor),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Stack(
                      children: [
                        const OrderWidget(),
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Container(
                            height: 120,
                            width: 400,
                            // width: width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              /* child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Delivery address'),
                                  Row(
                                    children: [
                                      Icon(Icons.map),
                                      Text(
                                        'New York, USA',
                                      ),
                                    ],
                                  ),
                                  const Text('Arrives in'),
                                  Row(
                                    children: [
                                      Icon(Icons.watch),
                                      Text(
                                        '12 min',
                                      ),
                                    ],
                                  ),
                                ],
                              ),*/
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding * 1.5),
            child: Container(
              clipBehavior: Clip.antiAlias,
              width: width,
              height: height / 1.5,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: GoogleMap(
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                markers: {
                  if (_origin != null) _origin!,
                  if (_destination != null) _destination!,
                },
                initialCameraPosition: const CameraPosition(
                  target: LatLng(30.0444, 31.2357),
                  zoom: 14.4746,
                ),
                onLongPress: (position) {
                  if (_origin == null ||
                      (_origin != null && _destination != null)) {
                    setState(() {
                      _origin = Marker(
                        markerId: const MarkerId('origin'),
                        infoWindow: const InfoWindow(title: 'Origin'),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRed,
                        ),
                        position: position,
                      );
                      _destination = null;
                    });
                  } else {
                    setState(() {
                      _destination = Marker(
                        markerId: const MarkerId('destination'),
                        infoWindow: const InfoWindow(title: 'destination'),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueBlue,
                        ),
                        position: position,
                      );
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
