import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sall_app/modules/login/login_screen.dart';
import 'package:sall_app/network/local/cachehelper.dart';
import 'package:sall_app/shard/cubit/cubit.dart';
import 'package:sall_app/shard/cubit/states.dart';

class SettingsScreen extends StatelessWidget {
  //const SettingsScreen({Key? key}) : super(key: key);
  var namecontroller=TextEditingController();
  var phonecontroller=TextEditingController();
  var emailcontroller=TextEditingController();
  var Formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
        return BlocConsumer<ShopCubit , ShopStates>(
          listener: (context , state)
          {
          },
          builder: (context , state)
        {
          var listmodel = ShopCubit.get(context).profilemodel;
          namecontroller.text=listmodel!.data!.name!;
          phonecontroller.text = listmodel.data!.phone!;
          emailcontroller.text = listmodel.data!.email!;
                return ConditionalBuilder(
                    condition: ShopCubit.get(context).profilemodel !=null ,
                    builder:(context)=> Scaffold(
                      appBar: AppBar(),
                      body: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: Formkey,
                            child: Column(
                              children: [
                                if( state is ShopupdateProfileLoadingStates)
                                  LinearProgressIndicator(),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  validator: (String? value)
                                  {
                                    if(value!.isEmpty)
                                    {
                                      return 'the name is vaild';
                                    }
                                  },
                                  keyboardType:TextInputType.name,
                                  controller: namecontroller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    labelText: 'Name',
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  validator: (String? value)
                                  {
                                    if(value!.isEmpty)
                                    {
                                      return 'the name is vaild';
                                    }
                                  },
                                  keyboardType:TextInputType.phone,
                                  controller: phonecontroller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    labelText: 'Phone',
                                    prefixIcon: Icon(Icons.phone),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  validator: (String? value)
                                  {
                                    if(value!.isEmpty)
                                    {
                                      return 'the name is vaild';
                                    }
                                  },
                                  keyboardType:TextInputType.emailAddress,
                                  controller: emailcontroller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    labelText: 'email',
                                    prefixIcon: Icon(Icons.email),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Container(
                                  height: 40.0,
                                  width: 150.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    color: Colors.deepPurple,
                                  ),
                                  child: MaterialButton(
                                    onPressed: ()
                                    {
                                      CacheHelper.removedata(key: 'token').then((value) {
                                        if(value)
                                        {
                                          Navigator.pushAndRemoveUntil(context,
                                              MaterialPageRoute(builder: (context)=>LoginScreen(),),
                                                  (route) => false
                                          );
                                        }

                                      });
                                    },
                                    child: Text(
                                      'Logout',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.amber.shade500,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),


                                Container(
                                  height: 40.0,
                                  width: 150.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    color: Colors.deepPurple,
                                  ),
                                  child: MaterialButton(
                                    onPressed: ()
                                    {
                                      if(Formkey.currentState!.validate())
                                      {
                                        ShopCubit.get(context).updateprofilr(
                                          name: namecontroller.text,
                                          phone: phonecontroller.text,
                                          email: emailcontroller.text,
                                        );
                                      }
                                    },
                                    child: Text(
                                      'UP data',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.amber.shade500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    fallback: (context)=> Center(child: CircularProgressIndicator(),),
                );
              },

            );


      }


  // Widget Settings(context)=>Scaffold(
  //   appBar: AppBar(),
  //   body: SingleChildScrollView(
  //     child: Padding(
  //       padding: const EdgeInsets.all(20.0),
  //       child: Form(
  //         key: Formkey,
  //         child: Column(
  //           children: [
  //             if( )
  //             LinearProgressIndicator(),
  //             SizedBox(
  //               height: 15.0,
  //             ),
  //             TextFormField(
  //               validator: (String? value)
  //               {
  //                 if(value!.isEmpty)
  //                 {
  //                   return 'the name is vaild';
  //                 }
  //               },
  //               keyboardType:TextInputType.name,
  //               controller: namecontroller,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(20),
  //                 ),
  //                 labelText: 'Name',
  //                 prefixIcon: Icon(Icons.person),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 15.0,
  //             ),
  //             TextFormField(
  //               validator: (String? value)
  //               {
  //                 if(value!.isEmpty)
  //                 {
  //                   return 'the name is vaild';
  //                 }
  //               },
  //               keyboardType:TextInputType.phone,
  //               controller: phonecontroller,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(20),
  //                 ),
  //                 labelText: 'Phone',
  //                 prefixIcon: Icon(Icons.phone),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 15.0,
  //             ),
  //             TextFormField(
  //               validator: (String? value)
  //               {
  //                 if(value!.isEmpty)
  //                 {
  //                   return 'the name is vaild';
  //                 }
  //               },
  //               keyboardType:TextInputType.emailAddress,
  //               controller: emailcontroller,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(20),
  //                 ),
  //                 labelText: 'email',
  //                 prefixIcon: Icon(Icons.email),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 15.0,
  //             ),
  //             Container(
  //               height: 40.0,
  //               width: 150.0,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(40.0),
  //                 color: Colors.deepPurple,
  //               ),
  //               child: MaterialButton(
  //                 onPressed: ()
  //                 {
  //                   CacheHelper.removedata(key: 'token').then((value) {
  //                     Navigator.pushAndRemoveUntil(context,
  //                         MaterialPageRoute(builder: (context)=>LoginScreen(),),
  //                             (route) => false
  //                     );
  //                   });
  //                 },
  //                 child: Text(
  //                   'Logout',
  //                   style: TextStyle(
  //                     fontSize: 20.0,
  //                     color: Colors.amber.shade500,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 15.0,
  //             ),
  //
  //
  //             Container(
  //               height: 40.0,
  //               width: 150.0,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(40.0),
  //                 color: Colors.deepPurple,
  //               ),
  //               child: MaterialButton(
  //                 onPressed: ()
  //                 {
  //                   if(Formkey.currentState!.validate())
  //                   {
  //                     ShopCubit.get(context).updateprofilr(
  //                       name: namecontroller.text,
  //                       phone: phonecontroller.text,
  //                       email: emailcontroller.text,
  //                     );
  //                   }
  //                 },
  //                 child: Text(
  //                   'UP data',
  //                   style: TextStyle(
  //                     fontSize: 20.0,
  //                     color: Colors.amber.shade500,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   ),
  // );
}
