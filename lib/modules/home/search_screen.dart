// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sall_app/models/search_models.dart';
// import 'package:sall_app/shard/cubit/cubit.dart';
// import 'package:sall_app/shard/cubit/states.dart';
//
// class SearchScreen extends StatelessWidget {
//   //const SearchScreen({Key? key}) : super(key: key);
//   var textcontroller = TextEditingController();
//   var Formkey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShopCubit , ShopStates>(
//       listener: (context , state){},
//       builder: (context , state)
//       {
//         return  ConditionalBuilder(
//           condition: ShopCubit.get(context).searchmodel !=null,
//           builder: (context)=>
//            Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Form(
//                 key: Formkey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       validator: (value)
//                       {
//                         if(value!.isEmpty)
//                         {
//                           return ' please enter the text';
//                         }
//                       },
//                       onTap: ()
//                       {
//                         if(Formkey.currentState!.validate())
//                         {
//
//                         }
//                       },
//                       onFieldSubmitted: (String ? text)
//                       {
//                         ShopCubit.get(context).SearchData(text);
//                       },
//                       controller:textcontroller ,
//                       keyboardType:TextInputType.text ,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                         labelText: 'Search',
//                         prefixIcon: Icon(Icons.search),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     if(state is shopSearchSccussStates)
//                       LinearProgressIndicator(),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Expanded(
//                       child: ListView.separated(
//                         scrollDirection: Axis.vertical,
//                         //shrinkWrap: true,
//                         //physics: NeverScrollableScrollPhysics(),
//                         itemBuilder: (context ,index)=>uiofavorites(ShopCubit.get(context).searchmodel!.data!.data![index] , context),
//                         separatorBuilder: (context ,index)=>SizedBox(
//                           height: 10.0,
//                         ),
//                         itemCount: ShopCubit.get(context).searchmodel!.data!.data!.length,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//           fallback: (context)=> Center(child: CircularProgressIndicator()),
//         );
//       },
//
//     );
//   }
//   Widget uiofavorites( searchListData ?model , context)=> Row(
//     children: [
//       Image(
//         image: NetworkImage(
//           model!.image!,
//         ),
//         height: 180.0,
//         width: 150.0,
//         fit: BoxFit.cover,
//       ),
//       SizedBox(
//         width: 10.0,
//       ),
//       Expanded(
//         child: Column(
//           children: [
//             Text(
//               model.name!,
//               maxLines: 2,
//               style: TextStyle(
//                 fontSize: 20.0,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             Row(
//               children: [
//                 Text(
//                   '${model.price}',
//                   style: TextStyle(
//                     fontSize: 15.0,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 7.0,
//                 ),
//                 Text(
//                   '${model.old_price}',
//                   style: TextStyle(
//                     fontSize: 10.0,
//                     decoration: TextDecoration.lineThrough,
//                   ),
//                 ),
//                 Spacer(),
//                 IconButton(
//                   onPressed: ()
//                   {
//                     ShopCubit.get(context).Favoritesdata(model.id);
//                   },
//                   icon: Icon(
//                     Icons.favorite_border_outlined,
//                     color: ShopCubit.get(context).favorites![model.id]! ?Colors.red :Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }
