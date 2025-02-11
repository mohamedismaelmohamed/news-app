import 'package:flutter/material.dart';

import '../../../../model/sourceResponse.dart';

class SourceNameItem extends StatelessWidget {
Source source;
bool isSelected;
SourceNameItem({required this.source,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Text(source.name??'',
        style:isSelected ?Theme.of(context).textTheme.headlineLarge:
      Theme.of(context).textTheme.headlineMedium,) ;
  }
}
