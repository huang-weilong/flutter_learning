import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'test2.dart';

class Test4 extends StatefulWidget {
  @override
  _Test4State createState() => _Test4State();
}

class DownloadFlag {
  static final DownloadFlag _instance = DownloadFlag();
  static DownloadFlag get instance => _instance;

  bool original = false;
}

class _Test4State extends State<Test4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          title: Text('test'),
//          elevation: 0.0,
//        ),
        body: Center(
      child: GestureDetector(
        child: Hero(
          child: Image.asset(
            'assets/images/long.jpg',
            width: 85.0,
          ),
          tag: 'long',
        ),
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              pageBuilder: (BuildContext context, _, __) {
                return HeroTest();
              },
            ),
          );
//          Navigator.push(context, MaterialPageRoute(
//              builder: (BuildContext context) => HeroTest(
//                flag: DownloadFlag.instance.original,
//              )),);
        },
      ),
    ));
  }
}

class HeroTest extends StatefulWidget {
  final bool flag;
  HeroTest({this.flag = true});
  @override
  _HeroTestState createState() => _HeroTestState();
}

class _HeroTestState extends State<HeroTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
          ),
          Positioned(
            bottom: 0.0,
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: GestureDetector(
              child: Hero(
                child: Image.asset(DownloadFlag.instance.original ? 'assets/images/long.jpg' : 'assets/images/long.jpg'),
                tag: 'long',
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 10.0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Timer.periodic(Duration(milliseconds: 500), (timer) {
                    setState(() {
                      DownloadFlag.instance.original = true;
                    });
                    timer.cancel();
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffc5c5c5), width: 0.3),
                    borderRadius: BorderRadius.circular(1.0),
                  ),
                  child: Text(
                    '查看原图',
                    style: TextStyle(color: Color(0xffc5c5c5)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PainterChart extends CustomPainter {
  final List<Map> data;
  final BuildContext context;
  final List<Map<String, double>> yRange;
  final List<int> color;
  final List<String> xAxis;

  PainterChart({this.data, this.context, this.yRange, this.color, this.xAxis});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    var paintData = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;

    var paintBgLine = Paint()
      ..color = Color(0x55ffffff)
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    double width = MediaQuery.of(context).size.width;

    var color = [Colors.green, Colors.orange, Colors.grey];

    double xLong = width - 24.0; // x轴长度
    double yLong = 160.0 - 20.0; // y轴长度
    int yPoint = 5; // y轴显示坐标点个数
    double spacing = xLong / 4.0 + 1.0; // 柱状图直接的间距

    double k, b; // y=kx+b 直线斜率公式两个已知点 (max, yLong),(min, 0)
    k = (yLong - 0.0) / (yRange[0]['max'] - yRange[0]['min']); // 斜率
    b = yLong - (yRange[0]['max'] * k);
    if (data.length != 0) {
      var key = data[0].keys.toList();
      for (int i = 0; i < data.length; i++) {
        for (int j = 0; j < 3; j++) {
          paintData.color = color[j];
          canvas.drawRect(
            Rect.fromLTRB(
              i * spacing + 25.0 + j * 15.0,
              yLong - data[i][key[j]] * k - b,
              i * spacing + 40.0 + j * 15.0,
              yLong,
            ),
            paintData,
          );
        }
      }
    }

    // 画x轴
    canvas.drawLine(Offset(20.0, yLong), Offset(xLong, yLong), paint);
    // 画y轴
    canvas.drawLine(Offset(20.0, 0.0), Offset(20.0, yLong), paint);
//
    List<double> x = [-8.0, width - 40.0];
    List<ui.TextAlign> textAlign = [ui.TextAlign.right, ui.TextAlign.left];

    // y轴纵坐标
    for (int k = 0; k < yRange.length; k++) {
      double num = (yRange[k]['max'] - yRange[k]['min']) / (yPoint - 1); // 纵坐标数值间隔
      for (int i = 0; i < yPoint; i++) {
        ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
          ui.ParagraphStyle(
            textAlign: textAlign[k],
            textDirection: ui.TextDirection.ltr,
            fontSize: 9.0,
            maxLines: 1,
          ),
        )
          ..pushStyle(
            ui.TextStyle(color: Colors.black, textBaseline: ui.TextBaseline.alphabetic),
          )
          ..addText((yRange[k]['max'] - num * i).toStringAsFixed(1));
        ui.Paragraph paragraph = paragraphBuilder.build()..layout(ui.ParagraphConstraints(width: 24.0));
        canvas.drawParagraph(paragraph, Offset(x[k], i * ((yLong + 4.0) / (yPoint - 1) - 1.0) - 4.0));
        canvas.drawLine(Offset(20.0, i * (yLong / (yPoint - 1))), Offset(xLong + 20.0, i * (yLong / (yPoint - 1))), paintBgLine);
      }
    }

    // x轴横坐标
    for (int i = 0; i < 4; i++) {
      ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
        ui.ParagraphStyle(
          textAlign: ui.TextAlign.center,
          textDirection: ui.TextDirection.ltr,
          fontSize: 12.0,
          maxLines: 1,
        ),
      )
        ..pushStyle(
          ui.TextStyle(color: Colors.black, textBaseline: ui.TextBaseline.alphabetic),
        )
        ..addText(xAxis[i]);
      ui.Paragraph paragraph = paragraphBuilder.build()..layout(ui.ParagraphConstraints(width: xLong / 4));
      canvas.drawParagraph(paragraph, Offset(i * xLong / 4 + 6.0, yLong + 5.0));
    }
  }

  @override
  bool shouldRepaint(PainterChart oldDelegate) => true;
}
