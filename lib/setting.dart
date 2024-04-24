import 'package:app/login.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 3),
              width: double.infinity,
              child: TextButton.icon(
                  style: TextButton.styleFrom(
                      alignment: Alignment.topLeft,
                      textStyle: const TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  icon: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 8, color: Colors.white)),
                    child: const Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  label: const Text(
                    'Đăng nhập',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
            ),
            
            Container(
              padding: const EdgeInsets.only(left: 18, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 23,
                  ),
                  Container(
                    width: 330,
                    padding: const EdgeInsets.only(left: 22),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cài đặt ứng dụng',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          'Ngôn ngữ, máy chủ, giao diện, cấu hình đăng nhập, ...',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        )
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                    size:30,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 18, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.comment,
                    color: Colors.white,
                    size: 23,
                  ),
                  Container(
                    width: 330,
                    padding: const EdgeInsets.only(left: 22),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phản hồi',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          'Xem các ý kiến phản hồi khác',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        )
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                    size:30,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 18, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.house,
                    color: Colors.white,
                    size: 23,
                  ),
                  Container(
                    width: 330,
                    padding: const EdgeInsets.only(left: 22),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Về chúng tôi',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          'Thông tin CHỨNG KHOÁNG KIẾN THIẾT VIỆT NAM',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        )
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                    size:30,
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    ));
  }
}
