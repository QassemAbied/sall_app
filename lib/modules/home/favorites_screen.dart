import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sall_app/models/changefavorites.dart';
import 'package:sall_app/shard/cubit/cubit.dart';
import 'package:sall_app/shard/cubit/states.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
      listener: (context , state){},
      builder: (context , state)
      {
        return ConditionalBuilder(
          condition: state is !ShopchangeFavoritesLoadingStates ,
          builder: (context)=>ListView.separated(
            scrollDirection: Axis.vertical,
            //shrinkWrap: true,
            //physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context ,index)=>favorites(ShopCubit.get(context).favoritesclass!.data!.data![index].product , context),
            separatorBuilder: (context ,index)=>SizedBox(
              height: 10.0,
            ),
            itemCount: ShopCubit.get(context).favoritesclass!.data!.data!.length,
          ),
          fallback: (context)=> Center(child: CircularProgressIndicator()),

        );
      },

    );
  }
  Widget favorites( productdata ?model , context)=> Row(
    children: [
      Image(
          image: NetworkImage(
            model!.image!,
          ),
        height: 180.0,
        width: 150.0,
        fit: BoxFit.cover,
      ),
      SizedBox(
        width: 10.0,
      ),
      Expanded(
        child: Column(
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
                    },
                    icon: Icon(
                        Icons.favorite_border_outlined,
                      color: ShopCubit.get(context).favorites![model.id]! ?Colors.red :Colors.grey,
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
