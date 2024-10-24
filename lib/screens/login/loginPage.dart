import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool _continueLoginCheked = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Flexible(flex: 1, child: Container(color: Colors.blue)),//1번 플
            Flexible(flex: 1, child: Image.asset("assets/icons/mcdLogo.png")),//2번 플 로고
            Flexible(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: '이메일 주소 또는 아이디',
                        hintText: '로그인 아이디를 입력해주세요.',
                        labelStyle: TextStyle(color: Colors.grey),
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(width: 2, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                    child: TextField(
                      obscureText: _obscureText, // 비밀번호 숨기기 설정
                      decoration: InputDecoration(
                        labelText: '패스워드',
                        hintText: '비밀번호를 입력해주세요.',
                        labelStyle: TextStyle(color: Colors.grey),
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(width: 2, color: Colors.blue),
                        ),
                        suffix: GestureDetector(
                          onTap: _togglePasswordVisibility,
                          child: Text(
                            _obscureText ? 'SHOW' : 'HIDE',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              )
            ),//3번 플 ID,PASS  박스
            Flexible(
                flex: 1,
                child:
                 Padding(
                   padding: const EdgeInsets.only(top: 1.0),
                   child: CheckboxListTile(
                     title: Text('로그인 상태 유지'),
                     value: _continueLoginCheked,
                     onChanged: ( bool ? value) {
                       setState(() {
                         _continueLoginCheked = value!;
                       });
                     },
                     controlAffinity: ListTileControlAffinity.leading,
                   )
                 )
            ),
            Flexible(flex: 1,
                child: Container(
                    child: ElevatedButton(
                              onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue, // 배경색
                                  foregroundColor: Colors.white, // 텍스트 색

                                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                   ),
                                ),
                              child:
                                Text('로그인')
                ),

                ),
            ),
            Flexible(flex: 1, child: Container(color: Colors.red)),
            Flexible(flex: 1, child: Container(color: Colors.blue)),
            Flexible(flex: 1, child: Container(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
