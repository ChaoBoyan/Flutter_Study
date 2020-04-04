//传值方式
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CrossPassData extends StatefulWidget {
  @override
  _CrossPassDataState createState() => _CrossPassDataState();
}

class _CrossPassDataState extends State<CrossPassData> {
  int count = 0;

  void _creamCount() {
    setState(() {
      count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
//    方式二
//    return CounterProvider(
//        count: count,
//        increaseCount: _creamCount,
//        child: Scaffold(
//          appBar: AppBar(
//            title: Text("传值方式"),
//          ),
//          body: BodyChildDemo(),
//          floatingActionButton: FloatingActionButton(
//              onPressed: _creamCount, child: Icon(Icons.add)),
//        ));
//  方式三
    return ScopedModel(
        model: CounterModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("传值方式"),
          ),
          body: BodyChildDemo(),
          floatingActionButton: ScopedModelDescendant<CounterModel>(
            rebuildOnChange: false,
            builder: (context, _, model) => FloatingActionButton(
                onPressed: model.increaseCount, child: Icon(Icons.add)),
          ),
        ));
  }
}

//数据 父widget 传给  子 widget
class BodyChildDemo extends StatelessWidget {
//  方式一  直接传递
//  int count;
//  final VoidCallback increaseCount;
//
//  BodyChildDemo({this.count, this.increaseCount});

  @override
  Widget build(BuildContext context) {
//方式二    利用  InheritedWidget
//    int count = CounterProvider
//        .of(context)
//        .count;
//    final VoidCallback increaseCount =
//        CounterProvider
//            .of(context)
//            .increaseCount;
//    return Center(
//      child: Center(
//        child: ActionChip(label: Text("$count"), onPressed: increaseCount),
//      ),
//    );
    return ScopedModelDescendant<CounterModel>(
        builder: (context, _, model) => Center(
              child: ActionChip(
                  label: Text("${model.count}"),
                  onPressed: model.increaseCount),
            ));
  }
}

//方式二
//多层传递的时候，使用 inheritedWidget
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({
    this.count,
    this.increaseCount,
    this.child,
  }) : super(child: child);

//  外部通过  CounterProvider.of(context).  来获取 count ,increaseCount等属性和方法
  static CounterProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}

//方式三 Scoped_model
//1 安装 scopedModel
//2 创建 model
class CounterModel extends Model {
  int _count = 0;

  int get count => _count;

  void increaseCount() {
    _count += 1;
    notifyListeners();
  }
}
