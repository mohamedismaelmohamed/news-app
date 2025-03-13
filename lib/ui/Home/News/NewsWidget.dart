
import 'package:flutter/material.dart';
import 'package:news2/api/api_manager.dart';
import 'package:news2/model/sourceResponse.dart';
import 'package:news2/ui/Home/News/NewsItem.dart';
import 'package:news2/utils/app_colors.dart';

import '../../../model/newsResponce.dart';



class Newswidget extends StatefulWidget {
Source source;
Newswidget({required this.source
});

  @override
  State<Newswidget> createState() => _NewswidgetState();
}

class _NewswidgetState extends State<Newswidget> {
  @override
  Widget build(BuildContext context) {
    return
    FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? ""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.grayColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  const Text('Something went wrong.'),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getNewsBySourceId(widget.source.id ?? '');
                        setState(() {});
                      },
                      child: const Text('Try again!'))
                ],
              ),
            );
          }
          //server => response (success , error )
          if (snapshot.data!.status != 'ok') {
            return Center(
              child: Column(
                children: [
                  Text(snapshot.data!.message!),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getNewsBySourceId(widget.source.id ?? '');
                        setState(() {});
                      },
                      child: const Text('Try again!'))
                ],
              ),
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem (news: newsList[index]);
            },
            itemCount: newsList.length,
          );
        });



  }
}

//   FutureBuilder<NewsResponse?>(
//   future: ApiManager.getNewsBySourceId(widget.source.id??''),
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return Center(
//         child: CircularProgressIndicator(
//           color: AppColors.grayColor,
//         ),
//       );
//     } else if (snapshot.hasError) {
//       return Column(
//         children: [
//           Text(
//             snapshot.data!.massage!,
//             style: Theme.of(context).textTheme.headlineLarge,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 ApiManager.getNewsBySourceId(widget.source.id??'');
//                 setState(() {});
//               },
//               child: Text(
//                 'Try again',
//                 style: Theme.of(context).textTheme.headlineLarge,
//               ))
//         ],
//       );
//     }
//     if (snapshot.data!.status != 'ok') {
//       return Column(
//         children: [
//           Text(
//             snapshot.data!.massage!,
//             style: Theme.of(context).textTheme.headlineLarge,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 ApiManager.getNewsBySourceId(widget.source.id??'');
//                 setState(() {});
//               },
//               child: Text(
//                 'Try again',
//                 style: Theme.of(context).textTheme.headlineLarge,
//               ))
//         ],
//       );
//     }
//     var newsList = snapshot.data!.articles!;
//     return ListView.builder(itemBuilder: (context, index) {
//       return Newsitem(news: newsList[index]);
//     },
//     itemCount: newsList.length,
//     );
//   },
// );
