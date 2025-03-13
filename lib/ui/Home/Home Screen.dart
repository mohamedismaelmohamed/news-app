import 'package:flutter/material.dart';
import 'package:news2/ui/Home/category/Category_Fragment.dart';

import 'category/category_details.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home',style: Theme.of(context).textTheme.headlineSmall),),
      body: CategoryFragment(),
    );
  }
}