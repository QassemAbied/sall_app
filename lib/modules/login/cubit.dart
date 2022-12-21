import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sall_app/models/login_models.dart';
import 'package:sall_app/models/login_models.dart';
import 'package:sall_app/models/login_models.dart';
import 'package:sall_app/models/login_models.dart';
import 'package:sall_app/models/login_models.dart';
import 'package:sall_app/models/login_models.dart';
import 'package:sall_app/modules/login/state.dart';
import 'package:sall_app/network/end_pointes.dart';
import 'package:sall_app/network/remote/diohelper.dart';

import '../../models/login_models.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialStats());
  static LoginCubit get(context)=>BlocProvider.of(context);

  LoginModel ? loginmodel;

  void Logindata({
  String? email,
    String? password,
})
  {
   // emit(LoginLoadingStates());
    DioHelper.postData(
      url: LOGIN,
      data:
      {
        'email':email,
        'password':password,
      }
    ).then((value) {
      //print(value.data);
      loginmodel=LoginModel.fromJson(value.data);
      print(value.data);
      print(loginmodel!.message);
      print('22222222222222222');
      print(loginmodel!.status);
      emit(LoginSccussStates(loginmodel!));
    }).catchError((error){
      emit(LoginerrorStates(error.toString()));
    });
  }
}