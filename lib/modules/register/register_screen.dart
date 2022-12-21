import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sall_app/components/constant.dart';
import 'package:sall_app/modules/register/cubit.dart';
import 'package:sall_app/modules/register/states.dart';
import 'package:sall_app/network/local/cachehelper.dart';

import '../shop_layout/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  //const RegisterScreen({Key? key}) : super(key: key);
  var emailcontroller=TextEditingController();
  var namecontroller=TextEditingController();
  var phonecontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var Formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>RegisterShopCubit(),
      child: BlocConsumer<RegisterShopCubit ,RegisterShopStates >(
        listener: (context , state)
        {
          if(state is shopRegisterSccussStates)
          {
            if(state.model!.status!)
            {
              print(state.model!.message);
              print(state.model!.data!.token);
              CacheHelper.Savedata(
                  key: 'token',
                  value:state.model!.data!.token
              ).then((value)
              {
                if(value)
                {
                  token =state.model!.data!.token!;
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context)=>HomeScreen(),
                      ),
                          (route) => false);
                }
              }).catchError((error){
                print(error.toString());
              });

            }else
            {
              print(state.model!.message);

            }
          }
        },
        builder: (context , state)
        {
          return  Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key : Formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Hello!',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber.shade500,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: namecontroller,
                          validator: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'the user name is filed';
                            }
                          },
                          decoration:InputDecoration(
                              filled: true,
                              fillColor: Colors.deepPurple,
                              //bo:BorderRdius.all(Radius.circular(20.0,),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              labelText: 'User name',
                              labelStyle: TextStyle(
                                color: Colors.amber.shade500,
                                fontSize: 20.0,
                              ),
                              prefixIcon: Icon(Icons.co_present_outlined,color: Colors.amber.shade500,)
                          ),

                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailcontroller,
                          validator: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'the email is filed';
                            }
                          },
                          decoration:InputDecoration(
                              filled: true,
                              fillColor: Colors.deepPurple,
                              //bo:BorderRdius.all(Radius.circular(20.0,),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.amber.shade500,
                                fontSize: 20.0,
                              ),
                              prefixIcon: Icon(Icons.email_outlined,color: Colors.amber.shade500,)
                          ),

                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordcontroller,
                          validator: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'the password is filed';
                            }
                          },
                          decoration:InputDecoration(
                              filled: true,
                              fillColor: Colors.deepPurple,
                              //bo:BorderRdius.all(Radius.circular(20.0,),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.amber.shade500,
                                fontSize: 20.0,
                              ),
                              prefixIcon: Icon(Icons.remove_red_eye_outlined,color: Colors.amber.shade500,)
                          ),

                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: phonecontroller,
                          validator: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'the phone is filed';
                            }
                          },
                          decoration:InputDecoration(
                              filled: true,
                              fillColor: Colors.deepPurple,
                              //bo:BorderRdius.all(Radius.circular(20.0,),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              labelText: 'Phone',
                              labelStyle: TextStyle(
                                color: Colors.amber.shade500,
                                fontSize: 20.0,
                              ),
                              prefixIcon: Icon(Icons.phone,color: Colors.amber.shade500,)
                          ),

                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Center(
                          child: Container(
                            height: 40.0,
                            width:150,
                            //color: Colors.deepPurple,
                            decoration: BoxDecoration(
                              // shape: BoxShape.,
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.all(Radius.circular(20.0,),),
                            ),
                            child: MaterialButton(
                              onPressed: ()
                              {
                                if(Formkey.currentState!.validate())
                                {
                                  RegisterShopCubit.get(context).Registerdata(
                                    name: namecontroller.text,
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text,
                                    phone: phonecontroller.text,
                                  );
                                }
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber.shade500,
                                  fontSize: 25.0,
                                ),
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
          );
        },
      ),
    );
  }
}
