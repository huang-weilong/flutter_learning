import 'package:flutter/material.dart';

import '../../../util/emoticons.dart';

class IndexTabBarShowEmotions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TabController controller = DefaultTabController.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBarView'),
        elevation: 0.0,
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: <Widget>[
            Expanded(
              child: TabBarView(
                  children: List.generate(4, (index) {
                return GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    children: List.generate(12, (flag) {
                      return Text(emoticons[index * 12 + flag]);
                    }));
              })),
            ),
            Expanded(
              child: TabPageSelector(controller: controller),
            )
          ],
        ),
      ),
    );
  }
}
