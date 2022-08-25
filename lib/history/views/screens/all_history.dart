import 'package:flutter/material.dart';
import 'package:road_runner_driver/history/services/history_service.dart';
import 'package:road_runner_driver/shared/shared.dart';

import '../widgets/widgets.dart';

class AllHistory extends StatelessWidget {
  const AllHistory({Key? key}) : super(key: key);
  static Route route() => MaterialPageRoute(
        builder: (_) => const AllHistory(),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'History',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 32 * ScreenRatio.heightRatio),
        child: ListView.builder(
            itemCount: HistoryService().mockHistories().length,
            itemBuilder: (context, index) {
              final history = HistoryService().mockHistories()[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 12 * ScreenRatio.heightRatio),
                child: HistoryTile(
                  price: '5,000',
                  date: '7 Dec, 9:10pm',
                  address: history.order.package.pickUpLocation.address,
                  onTap: () {
                    // context.push(HistoryDetail.route(history));
                  },
                ),
              );
            }),
      ),
    );
  }
}
