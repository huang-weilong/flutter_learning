// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Example of the chart behavior that centers the viewport on domain selection.

// EXCLUDE_FROM_GALLERY_DOCS_START
import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SlidingViewportOnSelection extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SlidingViewportOnSelection(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SlidingViewportOnSelection.withSampleData() {
    return SlidingViewportOnSelection(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory SlidingViewportOnSelection.withRandomData() {
    return SlidingViewportOnSelection(_createRandomData());
  }

  /// Create random data.
  static List<charts.Series<OrdinalSales, String>> _createRandomData() {
    final random = Random();

    final data = [
      OrdinalSales('2014', random.nextInt(100)),
      OrdinalSales('2015', random.nextInt(100)),
      OrdinalSales('2016', random.nextInt(100)),
      OrdinalSales('2017', random.nextInt(100)),
      OrdinalSales('2018', random.nextInt(100)),
      OrdinalSales('2019', random.nextInt(100)),
      OrdinalSales('2020', random.nextInt(100)),
      OrdinalSales('2021', random.nextInt(100)),
      OrdinalSales('2022', random.nextInt(100)),
      OrdinalSales('2023', random.nextInt(100)),
      OrdinalSales('2024', random.nextInt(100)),
      OrdinalSales('2025', random.nextInt(100)),
      OrdinalSales('2026', random.nextInt(100)),
      OrdinalSales('2027', random.nextInt(100)),
      OrdinalSales('2028', random.nextInt(100)),
      OrdinalSales('2029', random.nextInt(100)),
      OrdinalSales('2030', random.nextInt(100)),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义横坐标轴'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: charts.BarChart(
        seriesList,
        animate: animate,
        behaviors: [
          // Add the sliding viewport behavior to have the viewport center on the
          // domain that is currently selected.
          charts.SlidingViewport(),
          // A pan and zoom behavior helps demonstrate the sliding viewport
          // behavior by allowing the data visible in the viewport to be adjusted
          // dynamically.
          charts.PanAndZoomBehavior(),
        ],
        // Set an initial viewport to demonstrate the sliding viewport behavior on
        // initial chart load.
        domainAxis: charts.OrdinalAxisSpec(viewport: charts.OrdinalViewport('2019', 5)),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      OrdinalSales('2014', 5),
      OrdinalSales('2015', 25),
      OrdinalSales('2016', 100),
      OrdinalSales('2017', 75),
      OrdinalSales('2018', 33),
      OrdinalSales('2019', 80),
      OrdinalSales('2020', 21),
      OrdinalSales('2021', 77),
      OrdinalSales('2022', 8),
      OrdinalSales('2023', 12),
      OrdinalSales('2024', 42),
      OrdinalSales('2025', 70),
      OrdinalSales('2026', 77),
      OrdinalSales('2027', 55),
      OrdinalSales('2028', 19),
      OrdinalSales('2029', 66),
      OrdinalSales('2030', 27),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
