import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sall_app/models/search_models.dart';
import 'package:sall_app/modules/search/cubit.dart';
import 'package:sall_app/modules/search/states.dart';
import 'package:sall_app/shard/cubit/cubit.dart';
import 'package:sall_app/shard/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  //const SearchScreen({Key? key}) : super(key: key);
  var textcontroller = TextEditingController();
  var Formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>SearchCubit(),
      child: BlocConsumer<SearchCubit , SearchStates>(
        listener: (context , state){},
        builder: (context , state)
        {
          return   Scaffold(
              appBar: AppBar(),
              body : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: Formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        // validator: (value)
                        // {
                        //   if(value!.isEmpty) {
                        //     return ' please enter the text';
                        //   }
                        //
                        // },

                        onChanged: ( text)
                        {

                            SearchCubit.get(context).SearchData(text);


                        },
                        controller:textcontroller ,
                        keyboardType:TextInputType.text ,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          labelText: 'Search',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      // if(state is SearchLoadingStates)
                      //   LinearProgressIndicator(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Expanded(
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context , index)=>Searchview(SearchCubit.get(context).searchmodel!.data!.data![index]),
                            separatorBuilder: (context , index)=>SizedBox(
                              width: 20.0,
                            ),
                            itemCount: SearchCubit.get(context).searchmodel!.data!.data!.length,
                        ),
                      ),
                    ],
                  ),


                ),

              ),
            );




        },

      ),
    );
  }
 Widget Searchview(searchListData ? model)=> Row(
   mainAxisAlignment: MainAxisAlignment.start,
   children: [
     Image(
         image: NetworkImage(
           model!.image!,
         ),
       height: 180.0,
       width: 130.0,
     ),
     SizedBox(
       width: 10.0,
     ),
     Expanded(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(
            model.name!,
             maxLines: 2,
             style: TextStyle(
               fontSize: 20.0,
               overflow: TextOverflow.ellipsis,
             ),
           ),
           Row(
             children: [
               Text(
                 '${model.price}',
               ),
               SizedBox(
                 width: 10.0,
               ),
               Text(
                 '${model.old_price}',
                 style: TextStyle(
                   decoration: TextDecoration.lineThrough,
                 ),
               ),
               Spacer(),
               IconButton(
                   onPressed: (){},
                   icon: Icon(Icons.favorite_border_outlined),
               ),


             ],
           ),
         ],
       ),
     ),
   ],
 );
}
