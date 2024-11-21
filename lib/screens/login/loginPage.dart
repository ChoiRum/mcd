import 'package:flutter/material.dart';
import 'package:mcd/screens/MainHome/MainHome.dart';

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
    double boxWidth(double w) => MediaQuery.of(context).size.width * w; // 화면 너비의%
    final paddingVal = (double l, double t, double r, double b) => EdgeInsets.fromLTRB(l, t, r, b);



    return Scaffold(
      body: Container(  color: Colors.white, // 배경색 설정,
        child: Column(
          children: [
            Flexible(flex: 1, child: Container()),//1번 플
            Flexible(flex: 1, child: Container( padding: paddingVal(30, 0.0, 30, 20),child: Image.asset("assets/icons/mcdLogo.png"),)),//2번 플 로고
            Flexible(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: boxWidth(85),
                    padding: paddingVal(30, 0.0, 30, 10.0),
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
                    padding: paddingVal(30, 0.0, 30, 10.0),
                    width: boxWidth(85),
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
                SizedBox(
                  width: boxWidth(85),
                  child: Padding(
                    padding: paddingVal(5, 0.0, 30, 10.0),
                    child: CheckboxListTile(
                      title: Text('로그인 상태 유지'),
                      value: _continueLoginCheked,
                      onChanged: ( bool ? value) {
                        setState(() {
                          _continueLoginCheked = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.blue, // 체크박스가 선택되었을 때의 색상
                      checkColor: Colors.white, // 체크 표시의 색상
                    )
                  ),
                )
            ),
            Flexible(flex: 1,
              child: ElevatedButton(
                onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // 배경색
                    foregroundColor: Colors.white, // 텍스트 색
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.85, 30), // 최소 크기 설정
                    maximumSize: Size(MediaQuery.of(context).size.width * 0.85, 50), // 최대 크기 설정
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                     ),
                  ),
                child:
                 SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.3,// 화면 너비의 80%
                    child: Center(child: Text('로그인', style:  TextStyle(fontSize: 20,  color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold))),
                  ),
             ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // 자식 위젯 간의 간격 조정
                children: [
                  Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02), // 화면 너비의 2%
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(
                      child: Text(
                        '아이디 찾기',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02), // 화면 너비의 2%
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(
                      child: Text(
                        '비밀번호 재설정',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02), // 화면 너비의 2%
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(
                      child: Text(
                        '회원가입',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(flex: 1, child: Container(color: Colors.white)),
            Flexible(flex: 1, child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬 추가
                children: [
                  Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02), // 화면 너비의 2%
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/Google.png', // 커스텀 아이콘 경로
                              width: 50, // 아이콘 너비
                              height: 50, // 아이콘 높이
                            ),
                            Text(
                              '구글\n로그인',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center, // 중앙 정렬
                            ),
                          ],
                        )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02), // 화면 너비의 2%
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/Kakao.png', // 커스텀 아이콘 경로
                              width: 50, // 아이콘 너비
                              height: 50, // 아이콘 높이
                            ),
                            Text(
                              '카카오톡\n로그인',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center, // 중앙 정렬
                            ),
                          ],
                        )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02), // 화면 너비의 2%
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/Naver.png', // 커스텀 아이콘 경로
                              width: 50, // 아이콘 너비
                              height: 50, // 아이콘 높이
                            ),
                            Text(
                              '네이버\n로그인',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center, // 중앙 정렬
                            ),
                          ],
                        )
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // 클릭 시 실행할 코드
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainHomePage()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02), // 화면 너비의 2%
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child:  Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/c1.png', // 커스텀 아이콘 경로
                              width: 50, // 아이콘 너비
                              height: 50, // 아이콘 높이
                            ),
                            Text(
                              '로그인없이\n사용하기',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center, // 중앙 정렬
                            ),
                          ],
                        )
                      ),
                    ),
                    ),
              ],
              ),
            )
            ),
          ],
        ),
      ),
    );
  }
}
