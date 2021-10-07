import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopappwithapi/components.dart';
import 'package:shopappwithapi/cubit/shop_app_cubit/shop_app_cubit.dart';
import 'package:shopappwithapi/cubit/shop_app_cubit/shop_app_states.dart';
import 'package:shopappwithapi/screens/search/search_screen.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar( backgroundColor: Colors.pink,
              title: Text('Salla'),
              actions: [
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      navigateTo(context, SearchScreen());
                    })
              ],
            ),
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).primaryColor,
              selectedItemColor: Colors.pink,
              onTap: (int index) {
                cubit.changeBottom(index);
              },
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home,color:Colors.grey,), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.apps,color:Colors.grey), label: 'Categories'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite,color:Colors.grey), label: 'Favorites'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings,color:Colors.grey), label: 'Settings'),
              ],
            ),
          );
        });
  }
}
