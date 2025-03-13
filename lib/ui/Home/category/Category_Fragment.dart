import 'package:flutter/material.dart';

class CategoryFragment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(child: Column(
      children: [
        Text('Good Morning\nHere is Some News For You',  style: Theme
            .of(context)
            .textTheme
            .labelLarge,)
      ],
    ),);
  }
}
