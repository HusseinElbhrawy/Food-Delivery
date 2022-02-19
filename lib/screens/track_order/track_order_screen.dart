import 'package:flutter/material.dart';
import 'package:food_delivery/shared/IconBroken.dart';
import 'package:food_delivery/shared/config/colors.dart';

import '../my_order/my_order_screen.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);
  static const routeName = 'TrackOrderScreen';

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
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
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
                      OrderWidget(),
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
                          child: Column(
                            children: [
                              Text('Delivery address'),
                              Text('Delivery address'),
                              Text('Delivery address'),
                              Text('Delivery address'),
                            ],
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
      }),
      body: Column(
        children: [
          Text('Map Here'),
        ],
      ),
    );
  }
}
