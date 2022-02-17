import 'package:flutter/material.dart';

import '../../../shared/config/colors.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.width,
  }) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(kCustomAppBarColor)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/burger2.png'),
          Text(
            'Chicken Burger',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            'Burger King',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Row(
            children: [
              Text(
                '\$ 4.25',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: const Color(0xffF54748)),
              ),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xffF54748),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
