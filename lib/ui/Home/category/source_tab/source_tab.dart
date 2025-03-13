import 'package:flutter/material.dart';
import 'package:news2/ui/Home/category/source_tab/source_name_item.dart';

import '../../../../model/sourceResponse.dart';
import '../../../../utils/app_colors.dart';
import '../../News/NewsWidget.dart';



class SourceTab extends StatefulWidget {
List<Source> sourcesList;

SourceTab({required this.sourcesList});

  @override
  State<SourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {
                  });
                },
                isScrollable: true,
                dividerColor: AppColors.transparentColor,
                indicatorColor: Theme.of(context).indicatorColor,
                tabAlignment:TabAlignment.start ,
                tabs: widget.sourcesList.map((source){
              return SourceNameItem(source: source,
                  isSelected: selectedIndex==widget.sourcesList.indexOf(source));
            }).toList()),
            Expanded(child: Newswidget(source: widget.sourcesList[selectedIndex],))
          ],
        ),
    );
  }
}
