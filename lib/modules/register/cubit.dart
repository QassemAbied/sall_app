import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sall_app/components/constant.dart';
import 'package:sall_app/modules/register/states.dart';
import 'package:sall_app/network/remote/diohelper.dart';

import '../../models/login_models.dart';
import '../../network/end_pointes.dart';

class RegisterShopCubit extends Cubit<RegisterShopStates> {
  RegisterShopCubit() : super(ShopInitialSates());

  static RegisterShopCubit get(context) => BlocProvider.of(context);

  LoginModel ? registermodel;

  void Registerdata({
    String? name,
    String? email,
    String? password,
    String? phone,
  })
  {
    emit(ShopRegisterLoadingStates());
    DioHelper.postData(
        url: REGISTER,
        token: token,
        data:
        {
          'name':name,
          'email':email,
          'password':password,
          'phone':phone,
        }
    ).then((value) {
      //print(value.data);
      registermodel=LoginModel.fromJson(value.data);
      emit(shopRegisterSccussStates(registermodel!));
    }).catchError((error){
      emit(shopRegistererrorStates(error.toString()));
    });
  }
}