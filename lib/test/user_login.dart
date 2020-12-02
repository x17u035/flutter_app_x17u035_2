import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/chatpage.dart';

/* --- 省略 --- */
// ログイン画面用Widget

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /* --- 省略 --- */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField( /* --- 省略 --- */ ),
              TextFormField( /* --- 省略 --- */ ),
              Container( /* --- 省略 --- */ ),
              Container(
                width: double.infinity,
                // ユーザー登録ボタン
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('ユーザー登録'),
                  onPressed: () async {
                    try {
                      // メール/パスワードでユーザー登録
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final AuthResult result = await auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      final FirebaseUser user = result.user;
                      // ユーザー登録に成功した場合
                      // チャット画面に遷移＋ログイン画面を破棄
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          // ユーザー情報を渡す
                          return ChatPage(user);
                        }),
                      );
                    } catch (e) {
                      /* --- 省略 --- */
                    }
                  },
                ),
              ),
              Container(
                width: double.infinity,
                // ログイン登録ボタン
                child: OutlineButton(
                  textColor: Colors.blue,
                  child: Text('ログイン'),
                  onPressed: () async {
                    try {
                      // メール/パスワードでログイン
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final AuthResult result = await auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      final FirebaseUser user = result.user;
                      // ログインに成功した場合
                      // チャット画面に遷移＋ログイン画面を破棄
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          // ユーザー情報を渡す
                          return ChatPage(user);
                        }),
                      );
                    } catch (e) {
                      /* --- 省略 --- */
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// チャット画面用Widget
