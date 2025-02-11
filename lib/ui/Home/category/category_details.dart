import 'package:flutter/material.dart';
import 'package:news2/ui/Home/category/source_tab/source_tab.dart';

import '../../../api/api_manager.dart';
import '../../../model/sourceResponse.dart';
import '../../../utils/app_colors.dart';

class categoryDetails extends StatefulWidget {
  @override
  State<categoryDetails> createState() => _categoryDetailsState();
}

class _categoryDetailsState extends State<categoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.grayColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                'Something went wrong ',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources();
                    setState(() {});
                  },
                  child: Text(
                    'Try again',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ))
            ],
          );
        }
        if (snapshot.data!.status != 'ok') {
          return Column(
            children: [
              Text(
                snapshot.data!.massage!,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources();
                    setState(() {});
                  },
                  child: Text(
                    'Try again',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ))
            ],
          );
        }
        var sourcesList = snapshot.data!.sources!;
        return SourceTab(sourcesList: sourcesList);
      },
    );
  }
}
