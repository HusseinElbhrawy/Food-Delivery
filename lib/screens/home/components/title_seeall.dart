import 'package:flutter/material.dart';

class TitleSeeAll extends StatelessWidget {
  const TitleSeeAll({
    Key? key,
    required this.title,
    this.isSeeAll = true,
  }) : super(key: key);
  final String title;
  final bool? isSeeAll;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        const Spacer(),
        Visibility(
          visible: isSeeAll as bool,
          child: InkWell(
            onTap: () {},
            child: Row(
              children: const [
                Text(
                  'See all\t',
                  style: TextStyle(color: Color(0xffFF5556)),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 15, color: Color(0xffFF5556)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
