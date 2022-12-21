import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sall_app/components/constant.dart';
import 'package:sall_app/models/search_models.dart';
import 'package:sall_app/modules/search/states.dart';
import 'package:sall_app/network/remote/diohelper.dart';

import '../../network/end_pointes.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialStats());

  static SearchCubit get(context) => BlocProvider.of(context);


  SearchModel? searchmodel;
  void SearchData(String? text)
  {
    emit(SearchLoadingStates());
    DioHelper.postData(
      url: PRODUCTSSEARCH,
      data: {
        'text':text,
      },
      token: token,
    ).then((value) {
      searchmodel=SearchModel.fromJson(value.data);
      //print(searchmodel!.data!.data![].image!);
      emit(SearchSccussStates());
    }).catchError((error){
      emit(SearcherrorStates(error.toString()));
    });
  }
}