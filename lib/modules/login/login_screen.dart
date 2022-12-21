import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sall_app/components/constant.dart';
//import 'package:sall_app/modules/home/home_screen.dart';
import 'package:sall_app/modules/login/cubit.dart';
import 'package:sall_app/modules/login/state.dart';
import 'package:sall_app/modules/register/register_screen.dart';
import 'package:sall_app/modules/shop_layout/home_screen.dart';
import 'package:sall_app/network/local/cachehelper.dart';

class LoginScreen extends StatelessWidget {
  //const LoginScreen({Key? key}) : super(key: key);
var emailcontroller=TextEditingController();
var passwordcontroller=TextEditingController();
var Formkey = GlobalKey<FormState>();
@override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>LoginCubit(),
      child: BlocConsumer<LoginCubit , LoginStates>(
        listener: (context , state)
        {
          if(state is LoginSccussStates)
          {
            if(state.loginmodel.status!)
            {
              print(state.loginmodel.message);
              print(state.loginmodel.data!.token);
              CacheHelper.Savedata(
                  key: 'token',
                  value:state.loginmodel.data!.token
              ).then((value)
              {
                if(value)
                {
                  token =state.loginmodel.data!.token!;
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
              print(state.loginmodel.message);

            }
          }
        },
        builder: (context , state)
        {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key:Formkey ,
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
                          'Login',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber.shade500,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.amber.shade500,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailcontroller,
                          validator: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'the email is filed';
                            }
                          },
                          decoration:InputDecoration(
                            filled: true,
                            fillColor: Colors.deepPurple,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.amber.shade500,
                              fontSize: 20.0,
                            ),
                            prefixIcon: Icon(Icons.email_rounded,color: Colors.amber.shade500,),

                          ),
                        ),
                        SizedBox(
                          height: 10.0,
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
                                  LoginCubit.get(context).Logindata(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text,
                                  );
                                }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber.shade500,
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'DON\'T HAVE ANY ACCOUNTS ?',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.deepPurple,
                              ),
                            ),
                            TextButton(
                              onPressed: ()
                              {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>RegisterScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber.shade500
                                ),
                              ),
                            ),
                          ],
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
