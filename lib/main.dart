import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sall_app/components/constant.dart';
import 'package:sall_app/modules/0n_board/on_boarding_screen.dart';
//import 'package:sall_app/modules/home/home_screen.dart';
import 'package:sall_app/modules/login/login_screen.dart';
import 'package:sall_app/modules/shop_layout/home_screen.dart';
import 'package:sall_app/network/local/cachehelper.dart';
import 'package:sall_app/network/remote/diohelper.dart';
import 'package:sall_app/shard/cubit/cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await CacheHelper.init();
 Widget ?widget;
bool ? onboard= CacheHelper.getbool(key: 'onboarding');
  String?  token =CacheHelper.getdata(key: 'token');
  print(token);
  if(onboard !=null)
  {
    if(token !=null)
    {
      widget = HomeScreen();

    }else
    {
      widget = LoginScreen();
    }
  }else
  {
    widget = OnBoardingScreen();
  }


  runApp(MyApp(startWidget:widget,));
}

class MyApp extends StatelessWidget {
  //const MyApp( {Key? key}) : super(key: key);
final Widget? startWidget;
  MyApp({this.startWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider (create :(BuildContext context)=>ShopCubit()..data()..Categoriesdata()..changefavorites()..profiledata()),
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        color: Colors.white,
        theme: ThemeData(

          scaffoldBackgroundColor: Colors.white,
          //backgroundColor: Colors.white,
          appBarTheme: AppBarTheme(

            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),

            backgroundColor: Colors.white,
            elevation: 0.0,
            titleTextStyle: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            iconTheme: IconThemeData(
              color: Colors.deepPurple,

            ),
          ),
          // inputDecorationTheme: InputDecorationTheme(
          //   filled: true,
          //   floatingLabelAlignment: FloatingLabelAlignment.start,
          //   floatingLabelBehavior: FloatingLabelBehavior.auto,
          //   floatingLabelStyle: TextStyle(
          //    color: Colors.white,
          //     //backgroundColor: Colors.white,
          //     decoration: TextDecoration.underline,
          //     textBaseline: TextBaseline.alphabetic,
          //   ),
          //   fillColor: Colors.deepPurple,
          //   hoverColor: Colors.deepPurple,
          //   focusColor: Colors.deepPurple,
          //   iconColor: Colors.white,
          //   prefixIconColor: Colors.white,
          //   suffixIconColor:  Colors.white,
          //
          // )
        ),

        home:startWidget,
      ),
    );
  }
}
