import 'package:bpjs/modelclass.dart';
import 'package:bpjs/service/service.dart';
import 'package:bpjs/shared/shared_preferences.dart';
import 'package:bpjs/ui/menu_layanan.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController nikC = TextEditingController();
  TextEditingController passC = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePreference();
  }

  Future<void> initializePreference() async {
    SharedPreference.loginUser = await SharedPreferences.getInstance();
    // SharedPreference.loginUser = await SharedPreferences.getInstance();
    // SharedPreference.orderPO = await SharedPreferences.getInstance();
    // SharedPreference.adminNo = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 43, vertical: 40),
        children: [
          Center(child: Image.asset('assets/image/bpjsicon.png')),
          Container(
              margin: EdgeInsets.fromLTRB(0, 65, 0, 35),
              width: 150,
              height: 150,
              child: Image.asset('assets/image/bpjsicon2.png')),
          Center(
            child: Text(
              'LOGIN',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 30, color: color1),
            ),
          ),
          SizedBox(height: 5),
          Center(
              child: Text(
            "Silahkan masukkan akun anda",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: color1),
          )),
          SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'No kartu/NIK',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15, color: color1),
              ),
              SizedBox(height: 5),
              TextField(
                controller: nikC,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  hintText: 'Masukkan No.Kartu/NIK',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: color1)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: color1)),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15, color: color1),
              ),
              SizedBox(height: 5),
              TextField(
                controller: passC,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  hintText: 'Masukkan password anda',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: color1)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: color1)),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: color1),
              onPressed: () async {
                var respons = await LoginService()
                    .postLogin(nikC.text.toString(), passC.text.toString());
                if (respons.success) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => menulayanan(),
                      ));
                } else {
                  final snackBar = SnackBar(
                    content: const Text('NIK Atau Password Anda Salah!'),
                    action: SnackBarAction(
                      label: 'oke',
                      onPressed: () {},
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Text('Masuk')),
          Container(
            padding: EdgeInsets.only(top: 35),
            alignment: Alignment.bottomCenter,
            child: Text(
              "Copyright by Informatika19 UINAM",
              style: TextStyle(color: Color(0xffD9D9D9CC)),
            ),
          )
        ],
      )),
    );
  }
}
