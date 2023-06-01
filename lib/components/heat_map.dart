import 'package:work_it_out/datetime/date_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';


class MyHeatMap extends StatelessWidget {

  final Map<DateTime,int>? datasets;
  final String startDateDDMMYYYY;
  const MyHeatMap({
    super.key,
    required this.datasets,
    required this.startDateDDMMYYYY,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: HeatMap(
        startDate: createDateTimeObject(startDateDDMMYYYY),
        endDate: DateTime.now().add( const Duration(days: 0)),
        datasets: datasets,
        colorMode: ColorMode.color,
        defaultColor: Colors.blueGrey,
        textColor: Colors.white,
        showColorTip: true,
        scrollable: true,
        showText: true,
        size: 30,
        colorsets: const{
          1: Colors.green,
        },

      ),
    );
  }
}


