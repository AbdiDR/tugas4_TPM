import 'package:flot/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";

  String password = "";

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                  )
              ),
              child: Image.asset(
                ('../assets/loginPicture.jpg'),
              ),
            ),
            SizedBox(height: 10),
            Text('Login',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black)),
            SizedBox(height: 10,),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Container(
                        width: 300,
                        child: TextFormField(
                          cursorColor: Color(0xffc1071e),
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.people),
                            filled: true,
                            fillColor: Colors.white24,
                            labelText: 'Username',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Input your Username',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xffffF5C518),
                                width: 2.0,
                              ),
                            ),
                          ),
                          onChanged: (String value) {
                            username = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Container(
                        width: 300,
                        child: TextFormField(
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            filled: true,
                            fillColor: Colors.white24,
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Input your Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xffffF5C518),
                                width: 2.0,
                              ),
                            ),
                          ),
                          onChanged: (String value) {
                            password = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: Builder(builder: (context) {
                          return ElevatedButton(
                            onPressed: () {
                              String text = '';
                              if (username == "admin" && password == "admin") {
                                text = "Login Berhasil!";
                                _isObscure = true;
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                  return HomePage(username: username);
                                }));
                              } else {
                                text = "Login Gagal";
                                _isObscure = false;
                              }
                              SnackBar snackBar = SnackBar(
                                content: Text(text),
                                duration: Duration(seconds: 2),
                                backgroundColor: (_isObscure) ? Colors.green : Colors.red,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            child:
                            Text('Login', style: TextStyle(fontSize: 15)),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffc1071e),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}