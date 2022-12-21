import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sall_app/models/categories_model.dart';
import 'package:sall_app/shard/cubit/cubit.dart';
import 'package:sall_app/shard/cubit/states.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
      listener: (context , state){},
      builder: (context , state)
      {
        return ListView.separated(
            itemBuilder:(context , index)=>Categories(ShopCubit.get(context).categoriesmodel!.data!.data![index]) ,
            separatorBuilder: (context , index)=> SizedBox(
              height: 20.0,
            ),
            //     Container(
            //   width: double.infinity,
            //   height: 1.0,
            //   color: Colors.deepPurple,
            // )

            itemCount: ShopCubit.get(context).categoriesmodel!.data!.data!.length,
        );
      },

    );
  }
  Widget Categories(ListData ? model)=>Row(
   // crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Image(
          image: NetworkImage(
            model!.image!,
          ),
        fit: BoxFit.cover,
        height: 140.0,
        width: 150.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Text(
        model.name!,
        maxLines: 3,
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis
        ),
      ),
      Spacer(),
      IconButton(onPressed: (){},
          icon: Icon(Icons.arrow_forward_ios_outlined)
      ),

    ],
  );
}
