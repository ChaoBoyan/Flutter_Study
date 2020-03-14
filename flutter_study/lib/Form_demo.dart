import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/form.dart';

class FormDemo extends StatelessWidget {
  final String title;

  FormDemo({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(title),
//      ),
//    body: FormWidget(),
//    自定义当前主题颜色
      body: Theme(
        data: ThemeData(
            primaryColor: Colors.green, accentColor: Colors.blue[600]),
//          child: FormWidget()
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//            TextFieldDemo(),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  bool autoVlid = false;
  String username, password;

  void resigsterAction() {
//    验证表单数据
    final valid = registerFormKey.currentState.validate();

//   为true 验证通过
    if (valid) {
      //    获取表单数据
      registerFormKey.currentState.save();

      print("register-UserName: $username");
      print("register-PassWorld: $password");
//      Scaffold.of(context).showBottomSheet(builder)
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("注册中。。。"),
        action: new SnackBarAction(
            label: '取消',
            onPressed: () {
              // do something to undo
            }),
      ));
    } else {
      setState(() {
        autoVlid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: "用户名",
            ),
            onSaved: (value) {
              username = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return "用户名为空";
              }
              return null;
            },
            autovalidate: autoVlid,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "密码",
            ),
            onSaved: (value) {
              password = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return "密码为空";
              }
              return null;
            },
            autovalidate: autoVlid,
          ),
          SizedBox(
            height: 36,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text(
                  "注册",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: resigsterAction),
          ),
        ],
      ),
    );
  }
}

class FormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      主题颜色
      color: Theme.of(context).primaryColor,
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  TextFieldDemoState createState() => TextFieldDemoState();
}

class TextFieldDemoState extends State<TextFieldDemo> {
  final textFieldController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    textFieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    设置当前值
//    textFieldController.text = "welcome Flutter";
    textFieldController.addListener(() {
      print("input -${textFieldController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 16, color: Colors.red),

      controller: textFieldController,
//      onChanged: (value){
//        print("onChanged" + value);
//
//      },
      onSubmitted: (value) {
        print("onSubmitted" + value);
      },
//      自定义点击完成事件
//      onEditingComplete: (){
//        print("onEditingComplete");
//      },
      decoration: InputDecoration(
//        左边按钮样式
//        icon: Icon(Icons.print),

//       输入信息Title
        labelText: "Title",
        labelStyle: TextStyle(fontSize: 16, color: Colors.black54),

//        placehoder 未输入时预留的提示文字
        hintText: "请输入。。。",
        hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
//去除底部横线
        border: InputBorder.none,
//      包围边框
//        border: OutlineInputBorder(),
//      带背景，颜色可以用filledColor设置
        filled: true,
      ),
    );
  }
}
