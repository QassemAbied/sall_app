import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sall_app/modules/home/search_screen.dart';
import 'package:sall_app/modules/search/search.dart';
import 'package:sall_app/shard/cubit/cubit.dart';
import 'package:sall_app/shard/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
      listener: (context , state){},
      builder: (context , state)
      {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Salla',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>SearchScreen(),),
                    );
                  },
                  icon: Icon(Icons.search,
                    size: 30.0,
                  ),
              ),
            ],
          ),
          body:ShopCubit.get(context).Screens[ShopCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index)
            {
              ShopCubit.get(context).ChangeNavBar(index);
            },
            type: BottomNavigationBarType.fixed,
            currentIndex:ShopCubit.get(context).currentIndex ,
            elevation: 0.0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
