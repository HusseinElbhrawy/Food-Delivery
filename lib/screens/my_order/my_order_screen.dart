import 'package:flutter/material.dart';
import 'package:food_delivery/screens/intro/components/custom_button.dart';
import 'package:food_delivery/shared/config/colors.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({Key? key}) : super(key: key);
  static const routeName = 'MyOrderScreen';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'My Orders 😋',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? height / 3
                  : height / 2,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const OrderWidget();
                  },
                  separatorBuilder: (context, index) => const Divider(
                        color: Color(kSecondColor),
                      ),
                  itemCount: 3),
            ),
            CustomButton(
              width: width / 1.2,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? height / 15
                  : height / 7,
              color: Color(kSecondColor),
              text: 'Apply Coupon 🤑',
              onTap: () {},
            ),
            const Divider(
              color: Color(kSecondColor),
              indent: 30,
              endIndent: 30,
            ),
            ListTile(
              title: Text('Item total'),
              trailing: Text('\$14.95'),
            ),
            ListTile(
              title: Text('Item total'),
              trailing: Text('\$14.95'),
            ),
            ListTile(
              title: Text('Item total'),
              trailing: Text('\$14.95'),
            ),
            ListTile(
              title: Text(
                'Total',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.black),
              ),
              trailing: Text(
                '\$20.15',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: const Color(kDefaultColor)),
              ),
            ),
            SizedBox(height: height / 20),
            CustomButton(
              width: width / 1.2,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? height / 15
                  : height / 7,
              color: Colors.black,
              text: 'Confirm order 😋',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/images/burger2.png'),
      title: Text(
        'Chicken Burger',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      subtitle: const Text(
        '\$ 4.25',
        style: TextStyle(
          color: Color(kDefaultColor),
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Container(
        width: 140,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(50),
          color: const Color(kSecondColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: IconButton(
                  // color: Colors.white,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const Text('2'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(kDefaultColor)),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
