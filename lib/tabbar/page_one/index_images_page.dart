import 'package:flutter/material.dart';
import 'dart:math' as Math;

class IndexImagesPage extends StatefulWidget {
  @override
  _IndexImagesPageState createState() => _IndexImagesPageState();
}

class _IndexImagesPageState extends State<IndexImagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('images'),
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('关于图片分辨率的选择\n在pubspec.yaml中声明到文件夹assets/images/\n若有对应的2x、3x文件夹，则会根据手机分辨率自动选择合适的图片显示，如下：'),
                Image.asset('assets/images/test.png'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('从本地资源获取图片'),
                ),
                Image.asset(
                  'assets/images/background.jpg',
                  height: 100.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('拉伸图片，使用了SizedBox，下图原本是正方形的图片'),
                ),
                SizedBox(
                  width: 400.0,
                  child: Image.asset(
                    'assets/images/img.jpg',
                    height: 200.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('拉伸图片，使用了ConstrainedBox'),
                ),
                Container(
                  height: 200.0,
                  child: ConstrainedBox(
                    child: Image.asset(
                      'assets/images/067.jpg',
                      fit: BoxFit.fill,
                    ),
                    constraints: BoxConstraints.expand(), //填充父元素，需要外包一层container，因为这是在Column中，不包的话是无限高
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('从Internet获取图片'),
                ),
                Image.network(
                    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1534505726489&di=680fd0f270485ab207efa6b014c1ae'
                    '43&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01e12156264b9c6ac72548781bb856.jpg'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('从文件中获取图片见首页“其他”使用相机或相册'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('给图片设置其他属性'),
                ),
                Image.asset(
                  'assets/images/img.jpg',
                  width: 200.0,
                  height: 200.0,
                  color: Colors.blue, //配合colorBlendMode使用，滤镜效果
                  colorBlendMode: BlendMode.multiply,
//                matchTextDirection: true,
//                repeat: ImageRepeat.repeat,//图像没有占满容器时是否重复
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('圆矩形裁剪ClipRRect'),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.asset(
                    'assets/images/img.jpg',
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('圆形裁剪ClipOval\n使用了SizedBox约束图像大小'),
                ),
                ClipOval(
                    child: SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: Image.asset(
                    'assets/images/img.jpg',
                  ),
                )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('矩形裁剪ClipRect\n需要定义clipper参数才有效果'),
                ),
                ClipRect(
                  clipper: _MyClipper(),
                  child: Image.asset(
                    'assets/images/img.jpg',
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('路径裁剪ClipPath'),
                ),
                ClipPath(
                  clipper: _StarCliper(radius: 100.0),
                  child: Image.asset(
                    'assets/images/img.jpg',
                    width: 200.0,
                    height: 200.0,
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

class _MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(10.0, 10.0, size.width - 50.0, size.height - 10.0);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class _StarCliper extends CustomClipper<Path> {
  final double radius;

  _StarCliper({this.radius});

  /// 角度转弧度公式
  double degree2Radian(int degree) {
    return (Math.pi * degree / 180);
  }

  @override
  Path getClip(Size size) {
    double radius = this.radius;
    Path path = new Path();
    double radian = degree2Radian(36); // 36为五角星的角度
    double radiusIn = (radius * Math.sin(radian / 2) / Math.cos(radian)); // 中间五边形的半径

    path.moveTo((radius * Math.cos(radian / 2)), 0.0); // 此点为多边形的起点
    path.lineTo((radius * Math.cos(radian / 2) + radiusIn * Math.sin(radian)), (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) * 2), (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) + radiusIn * Math.cos(radian / 2)), (radius + radiusIn * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) + radius * Math.sin(radian)), (radius + radius * Math.cos(radian)));
    path.lineTo((radius * Math.cos(radian / 2)), (radius + radiusIn));
    path.lineTo((radius * Math.cos(radian / 2) - radius * Math.sin(radian)), (radius + radius * Math.cos(radian)));
    path.lineTo((radius * Math.cos(radian / 2) - radiusIn * Math.cos(radian / 2)), (radius + radiusIn * Math.sin(radian / 2)));
    path.lineTo(0.0, (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) - radiusIn * Math.sin(radian)), (radius - radius * Math.sin(radian / 2)));

    path.close(); // 使这些点构成封闭的多边形

    return path;
  }

  @override
  bool shouldReclip(_StarCliper oldClipper) {
    return this.radius != oldClipper.radius;
  }
}
