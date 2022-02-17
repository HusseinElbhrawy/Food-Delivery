import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/shared/IconBroken.dart';
import 'package:food_delivery/shared/config/const.dart';
import 'package:food_delivery/shared/cubit/bloc/home_screen_bloc.dart';

import '../../shared/cubit/states.dart';
import 'components/appbar_decoration.dart';
import 'components/categories_list_widget.dart';
import 'components/custom_bottom_navigation_bar.dart';
import 'components/custom_icon_button.dart';
import 'components/item_widget.dart';
import 'components/title_seeall.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List<IconData> icons = [
    IconBroken.Home,
    IconBroken.Heart,
    IconBroken.Bag_2,
    IconBroken.User1,
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => HomeScreenBloc(),
        child: BlocConsumer<HomeScreenBloc, DeliveryStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            var homeScreenCubit = HomeScreenBloc.object(context);

            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  expandedHeight:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? height / 4
                          : height / 2,
                  flexibleSpace: AppBarDecoration(
                    items: homeScreenCubit.items,
                    selectedValue: homeScreenCubit.selectedValue,
                  ),
                  leading: CustomIconButton(onTap: () {}, icon: Icons.menu),
                  actions: [
                    CustomIconButton(
                      onTap: () {},
                      icon: Icons.notifications_none_outlined,
                    )
                  ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const Padding(
                        padding: EdgeInsets.all(kDefaultPadding * 2),
                        child: TitleSeeAll(title: 'Categories'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(kDefaultPadding * 1.3),
                        child: SizedBox(
                          height: 70,
                          child: CategoriesListWidget(
                            homeScreenCubit: homeScreenCubit,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(kDefaultPadding * 2),
                        child: TitleSeeAll(
                          title: 'Popular now 🔥',
                          isSeeAll: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: SizedBox(
                          height: height / 3,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(kDefaultPadding),
                                child: ItemWidget(width: width / 2),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 10);
                            },
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(kDefaultPadding * 2),
                        child: TitleSeeAll(
                          title: 'Offer & Deal 🤩',
                          isSeeAll: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: SizedBox(
                          height: height / 3,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(kDefaultPadding),
                                child: ItemWidget(width: width / 2),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 10);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(icons: icons),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffF54748),
        onPressed: () {},
        child: Icon(IconBroken.Search),
      ),
      // bottomNavigationBar: ,
    );
  }
}
