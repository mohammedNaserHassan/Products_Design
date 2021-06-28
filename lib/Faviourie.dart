import 'package:flutter/material.dart';

import 'FavouriteData.dart';
import 'Product.dart';
import 'data.dart';
import 'main.dart';
class Favourite extends StatefulWidget {
  const Favourite();

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
  return Favourite_data.xc.length!=0? ListView(
    children: Favourite_data.xc
        .map((e) => Container(
      width: double.infinity,
      child: ListTile(
        title: Text(e.product_name),
        subtitle: Text('${e.product_salary}'),
        leading: Image.asset(e.path),
        trailing: TextButton(
            onPressed: (){
              setState(() {
                Favourite_data.xc.remove(e);
                MyHomePage().createState().isFavorited[e.index]=false;
              });
            },
            child: Icon(Icons.delete,)
        ),
      )
    ))
        .toList(),

    ):Center(child: Text('No Favourite Selected',style: TextStyle(color: Colors.redAccent,fontSize: 20,fontWeight: FontWeight.bold),),);

  }

  }


