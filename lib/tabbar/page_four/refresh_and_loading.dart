import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RefreshAndLoading extends StatefulWidget {
  @override
  _RefreshAndLoadingState createState() => _RefreshAndLoadingState();
}

class _RefreshAndLoadingState extends State<RefreshAndLoading> {
  List<String> _list = List();
  ScrollController _controller = ScrollController();
  int _page = 1; //加载的页数
  bool noMore = false;

  @override
  void initState() {
    super.initState();
    _getInitData();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        print('滑动到了最底部');
        _pullUpLoading();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('下拉刷新 上拉加载'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _pullDownRefresh,
        child: ListView.builder(
          controller: _controller,
          itemCount: _list.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < _list.length) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(_list[index], style: TextStyle(fontSize: 20.0)),
              );
            } else {
              return noMore
                  ? Center(child: Text('没有更多了...'))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: CircularProgressIndicator(strokeWidth: 3.0),
                        ),
                        Text('    加载中...'),
                      ],
                    );
            }
          },
        ),
      ),
    );
  }

  // 初始化数据
  Future _getInitData() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _list = List.generate(20, (i) => '初始化数据>>> $i');
      });
    });
  }

  // 下拉刷新
  Future<void> _pullDownRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        noMore = false;
        _page = 1;
        _list = List.generate(30, (int index) => '下拉刷新数据>>>$index');
        Fluttertoast.showToast(msg: '刷新成功！', gravity: ToastGravity.CENTER);
      });
    });
  }

  //上拉加载更多
  Future _pullUpLoading() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        if (_page < 4) {
          _list.addAll(List.generate(5, (i) => '第$_page次上拉加载的数据'));
          _page++;
        } else {
          noMore = true;
        }
      });
    });
  }
}
