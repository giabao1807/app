//import 'dart:convert';

import 'dart:convert';
import 'dart:math';
import 'package:app/home.dart';
import 'package:app/icons/app_icons.dart';
import 'package:app/input_service_body.dart';
import 'package:app/setting.dart';
import 'package:app/socket.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isChecked = false;
  bool _showPass = false;

  InputServiceBody inputServiceBody = InputServiceBody(
    cltVersion: "3.1.9",
    clientSeq: 10,
    secCode: "004",
    workerName: "FOSxID02",
    serviceName: "FOSxID02_Login",
    timeOut: 15,
    mwLoginId: "Android",
    mwLoginPswd: ",+A,3-)-C.*,6,9,=+F*K.N*M.=+)+J,004",
    appLoginId: "",
    appLoginPswd: "",
    clientSentTime: "0",
    lang: "VI",
    mdmTp: "03",
    inVal: [],
    totInVal: 7,
    aprStat: "N",
    operation: "U",
    custMgnBrch: "",
    custMgnAgc: "",
    brkMgnBrch: "",
    brkMgnAgc: "",
    loginBrch: "",
    loginAgnc: "",
    aprSeq: "",
    makerDt: "",
    aprIp: "",
    aprId: "",
    aprAmt: "",
    ipPrivate: "192.168.1.113",
    otp: "",
    acntNo: "",
    subNo: "",
    bankCd: "",
    pcName: "A71 của Solution",
    sessionId: "",
  );

  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  var _userNameErr = 'Tài khoản không hợp lệ';
  var _passWordErr = 'Mật khẩu phải trên 8 ký tự';
  var _userInvalid = false;
  var _passInvalid = false;

  bool isConnected = false;           

  int _currentIndex = 0;

  static const MAX_SEC = 20;
  static const MAX_ITEM = 20;
  static const BASIC_NUM = 40;
  static const secret = [
    [
      191,
      71,
      77,
      46,
      58,
      49,
      44,
      43,
      55,
      101,
      122,
      45,
      124,
      137,
      237,
      117,
      71,
      76,
      129,
      120
    ],
    [
      114,
      41,
      45,
      212,
      49,
      59,
      14,
      58,
      46,
      57,
      133,
      225,
      219,
      116,
      222,
      211,
      119,
      95,
      128,
      146
    ],
    [
      81,
      71,
      44,
      50,
      218,
      89,
      44,
      113,
      115,
      111,
      122,
      95,
      41,
      137,
      137,
      67,
      112,
      76,
      129,
      90
    ],
    [
      40,
      117,
      120,
      126,
      78,
      79,
      54,
      133,
      110,
      81,
      91,
      95,
      94,
      47,
      57,
      66,
      82,
      60,
      122,
      70
    ],
    [
      80,
      71,
      122,
      122,
      128,
      91,
      94,
      73,
      45,
      51,
      213,
      75,
      214,
      57,
      77,
      60,
      232,
      116,
      120,
      130
    ],
    [
      114,
      72,
      54,
      46,
      78,
      79,
      212,
      112,
      115,
      118,
      122,
      52,
      54,
      77,
      117,
      67,
      222,
      127,
      91,
      40
    ],
    [
      51,
      70,
      128,
      99,
      121,
      89,
      74,
      113,
      155,
      111,
      124,
      45,
      90,
      87,
      77,
      47,
      82,
      76,
      129,
      120
    ],
    [
      111,
      77,
      47,
      57,
      78,
      59,
      94,
      113,
      115,
      121,
      128,
      51,
      44,
      47,
      77,
      67,
      52,
      66,
      69,
      80
    ],
    [
      117,
      74,
      71,
      35,
      48,
      49,
      41,
      43,
      65,
      70,
      129,
      115,
      124,
      71,
      57,
      70,
      82,
      76,
      119,
      110
    ],
    [
      79,
      57,
      137,
      136,
      75,
      49,
      141,
      239,
      31,
      116,
      98,
      57,
      40,
      117,
      93,
      84,
      81,
      170,
      190,
      121
    ],
    [
      121,
      51,
      71,
      40,
      54,
      149,
      74,
      42,
      57,
      104,
      112,
      145,
      134,
      127,
      167,
      127,
      76,
      41,
      122,
      132
    ],
    [
      84,
      42,
      42,
      212,
      46,
      59,
      11,
      41,
      46,
      57,
      133,
      225,
      219,
      116,
      222,
      231,
      119,
      95,
      128,
      146
    ],
    [
      83,
      78,
      47,
      51,
      211,
      89,
      43,
      113,
      115,
      111,
      122,
      95,
      141,
      137,
      137,
      67,
      122,
      76,
      129,
      92
    ],
    [
      42,
      127,
      220,
      122,
      178,
      79,
      54,
      133,
      110,
      81,
      91,
      95,
      94,
      47,
      57,
      66,
      81,
      60,
      122,
      71
    ],
    [
      81,
      70,
      142,
      121,
      138,
      91,
      94,
      73,
      45,
      51,
      213,
      175,
      214,
      57,
      77,
      60,
      212,
      116,
      120,
      120
    ],
    [
      54,
      78,
      44,
      43,
      77,
      79,
      112,
      142,
      115,
      118,
      122,
      52,
      54,
      77,
      147,
      67,
      222,
      137,
      111,
      70
    ],
    [
      61,
      74,
      118,
      89,
      122,
      83,
      74,
      113,
      55,
      111,
      124,
      45,
      90,
      87,
      77,
      47,
      82,
      76,
      129,
      220
    ],
    [
      121,
      87,
      87,
      67,
      784,
      52,
      94,
      113,
      95,
      121,
      128,
      51,
      44,
      47,
      77,
      67,
      52,
      66,
      69,
      55
    ],
    [
      97,
      71,
      70,
      45,
      481,
      42,
      41,
      43,
      65,
      70,
      129,
      115,
      114,
      71,
      57,
      70,
      82,
      76,
      119,
      44
    ],
    [
      69,
      52,
      90,
      46,
      70,
      41,
      141,
      239,
      31,
      116,
      98,
      57,
      140,
      117,
      93,
      84,
      81,
      170,
      190,
      77
    ]
  ];

  String encryptString(String originalData) {
    String utf8 = Uri.encodeComponent(originalData);
    List<int> textToEncrypt = [];
    for (var i = 0; i < utf8.length; i++) {
      textToEncrypt.add(utf8.codeUnitAt(i));
    }
    // if (originalData.contains("\"") || originalData.contains("'") || originalData.contains("\\")) {
    //   return '';
    // }

    List<int> mNumberArray = encrypt(textToEncrypt);

    String str = "";
    for (var j = 0; j < mNumberArray.length; j++) {
      str = str + String.fromCharCode(mNumberArray[j]);
    }
    return str;
  }

  List<int> encrypt(List<int> InStr) {
    List<int> outEncryptStr = [];
    int StrLen = InStr.length;
    int j = 0;
    int key = 0;
    int X = 0, Num = 0;
    key = getKeySecret();
    outEncryptStr.add(key + BASIC_NUM);
    for (var i = 0; i < StrLen; i++) {
      X = (InStr[i] + secret[key][j]);

      j += 1;

      if (j == MAX_ITEM) {
        j = 0;
      }
      Num = 0;
      if (X > BASIC_NUM) {
        Num = (X ~/ BASIC_NUM).toInt();
        X = X % BASIC_NUM + BASIC_NUM;
      }
      outEncryptStr.add(Num + BASIC_NUM);
      outEncryptStr.add(X);
    }

    return outEncryptStr;
  }

  int getKeySecret() {
    var randomRange = MAX_SEC - 1;
    var randomNumber = getRandomIntInclusive(0, randomRange);
    return randomNumber;
  }

  int getRandomIntInclusive(int min, int max) {
    min = min.ceil();
    max = max.floor();
    return Random().nextInt(max - min + 1) + min;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 35,
          ), // Icon mũi tên
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const SettingScreen()), // Replace with the actual class name
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 80, height: 80, child: FlutterLogo()),
              const Text(
                'Đăng nhập',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: _userController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Số TK/Số ĐT/Email/CMND',
                    errorText: _userInvalid ? _userNameErr : null,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: _passController,
                  obscureText: !_showPass,
                  decoration: InputDecoration(
                      labelText: 'Mật khẩu',
                      errorText: _passInvalid ? _passWordErr : null,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showPass = !_showPass;
                            });
                          },
                          icon: Icon(
                            _showPass ? Icons.visibility : Icons.visibility_off,
                            size: 30,
                            color: Colors.black,
                          ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.blue.shade900,
                      value: isChecked,
                      onChanged: (newBool) {
                        setState(() {
                          isChecked = newBool;
                        });
                      },
                    ),
                    const Text(
                      'Lưu đăng nhập',
                      style: TextStyle(fontSize: 16),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 29),
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            'Quên mật khẩu?',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 34, top: 25),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(
                              left: 97, right: 97, top: 12, bottom: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: Colors.blue.shade900,
                          foregroundColor: Colors.white),
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        setState(() {
                          if (!_userInvalid && !_passInvalid) {
                            String passwordEncrypt =
                                encryptString(_passController.value.text);
                            List<String> inputParamsArray = [
                              'login',
                              _userController.value.text,
                              passwordEncrypt,
                              '',
                              '',
                              'N',
                              ''
                            ];

                            inputServiceBody.inVal = inputParamsArray;
                            String inputServiceBodyJson =
                                jsonEncode(inputServiceBody).toString();
                            SocketManager.connectToServer();
                            SocketManager.socket!
                                .emit('REQ_MSG', inputServiceBodyJson);
                            print(inputServiceBodyJson);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Bạn chưa có tài khoản?'),
                  const SizedBox(width: 1),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Tạo tài khoản',
                        style: TextStyle(
                            decoration: TextDecoration.underline, fontSize: 15),
                      )),
                ],
              ),
              Container(
                height: 75,
                margin: const EdgeInsets.only(left: 17, right: 17, top: 220),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: BottomNavigationBar(
                      fixedColor: Colors.white,
                      type: BottomNavigationBarType.fixed,
                      unselectedItemColor: Colors.white,
                      iconSize: 25,
                      selectedFontSize: 12,
                      unselectedFontSize: 12,
                      backgroundColor: Colors.blueAccent,
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(AppIcons.chart_line),
                          label: 'Thị trường',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.compass_calibration_sharp),
                          label: 'Tin tức',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.explore),
                          label: 'Hướng dẫn',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.phone),
                          label: 'Liên hệ',
                        ),
                      ],
                      currentIndex: _currentIndex,
                      onTap: (index) {
                        setState(() {
                          _currentIndex = index;
                          switch (index) {
                            case 0:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HomePage()), 
                              );
                              break;
                          }
                        });
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
