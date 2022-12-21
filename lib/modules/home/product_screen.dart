import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sall_app/models/categories_model.dart';
import 'package:sall_app/models/home_nodels.dart';
import 'package:sall_app/shard/cubit/cubit.dart';
import 'package:sall_app/shard/cubit/states.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
      listener: (context , state){},
      builder: (context , state)
      {
        return ConditionalBuilder(
            condition: ShopCubit.get(context).homemodel !=null  && ShopCubit.get(context).categoriesmodel !=null,
            builder: (context)=>  produtmodel(ShopCubit.get(context).homemodel, ShopCubit.get(context).categoriesmodel, context),
            fallback: (context)=>Center(child: CircularProgressIndicator())
        );
      }

    );
  }

  Widget produtmodel(HomeData?  homemodel, CategoriesModel? categoriesmodel , context)=> SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       CarouselSlider(
           items:
           homemodel!.data!.banners!.map((e) =>
               Image(
                   image: NetworkImage('${e.image}'),
                 fit: BoxFit.cover,
                 height: 200.0,
                 width: double.infinity,
               ),
            ).toList(),

           options: CarouselOptions(
             enableInfiniteScroll: true,
             autoPlay: true,
             autoPlayCurve: Curves.ease,
             autoPlayAnimationDuration: Duration(milliseconds: 750),
             autoPlayInterval: Duration(seconds: 3),
             initialPage: 0,
             scrollDirection: Axis.vertical,
             aspectRatio: 16/9,
             viewportFraction: 1,
           ),
       ),
        SizedBox(
          height: 15.0,
        ),
        Container(
          height: 150.0,
          width: double.infinity,
          child: ListView.separated(
            shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context , index)=>Productstack(categoriesmodel!.data!.data![index], context),
              separatorBuilder: (context , index)=>
                SizedBox(
                  width: 10.0,
                ),

              itemCount: categoriesmodel!.data!.data!.length,
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        GridView.count(
            crossAxisCount: 2,
          children: List.generate(homemodel.data!.products!.length,
                (index) => productScreen(homemodel.data!.products![index], context),
          ),
          shrinkWrap: true,
          reverse: false,
          scrollDirection: Axis.vertical,
          mainAxisSpacing: 1/1,
          crossAxisSpacing: 1/1,
          childAspectRatio: 1/1.5,
          physics: NeverScrollableScrollPhysics(),
        ),

      ],
    ),
  );
 Widget Productstack(ListData ? model , context)=> Stack(
   alignment: Alignment.bottomCenter,
   children: [
     Image(
       image: NetworkImage(
         model!.image!,
       ),
       height: 150.0,
       width: 150.0,
       fit: BoxFit.cover,
     ),
     Container(
       alignment: Alignment.bottomCenter,
       width: 150.0,
       height: 25.0,
       color: Colors.black.withOpacity(0.7),
       child: Text(
         model.name!,
         maxLines: 1,
         style: TextStyle(
           color: Colors.white,
           fontSize: 20.0,
           overflow: TextOverflow.ellipsis,
         ),
       ),
     ),
   ],
 );
 Widget productScreen(listproducts ? model , context )=>Column(
   crossAxisAlignment: CrossAxisAlignment.start,
   children: [
     Image(
         image: NetworkImage(
           model!.image!,
         ),
       height: 130.0,
       width: 130,
     ),
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         children: [
           Text(
             model.name!,
             maxLines: 2,
             style: TextStyle(
                 fontSize: 15.0,
                 overflow: TextOverflow.ellipsis
             ),
           ),
           Row(
             children: [
               Text(
                 '${model.price}',
                 style: TextStyle(
                   fontSize: 15.0,
                 ),
               ),
               SizedBox(
                 width: 7.0,
               ),
               Text(
                 '${model.old_price}',
                 style: TextStyle(
                   fontSize: 10.0,
                   decoration: TextDecoration.lineThrough,
                 ),
               ),
               Spacer(),
               IconButton(
                   onPressed: ()
                   {
                    ShopCubit.get(context).Favoritesdata(model.id);
                    // print(model.id);
                   },
                   icon: Icon(Icons.favorite,
                     color: ShopCubit.get(context).favorites![model.id]!  ? Colors.red : Colors.grey,
                   ),
               ),
             ],
           ),
         ],
       ),
     ),
   ],
 );

}
