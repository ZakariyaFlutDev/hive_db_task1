import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_db_task1/pages/sign_up_page.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  static const String id = "sign_in_page";

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  _doSignIn(){
    String username = usernameController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var box = Hive.box("hive_db");
    box.putAll({"username" : username, "password" : password});

    String name = box.get("username");
    String pw = box.get("password");

    print(name);
    print(pw);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage("assets/images/user_image.jpeg"),
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Welcome Back !", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Text("Sign in to continue", style: TextStyle(color: Colors.white, fontSize: 16),),
                  SizedBox(height: 50,),

                  TextField(
                    controller: usernameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "User Name",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        icon: Icon(Icons.person_outline_outlined, color: Colors.grey,)
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        icon: Icon(Icons.lock_outline, color: Colors.grey,)
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Forget Password?", style: TextStyle(color: Colors.grey),),
                  SizedBox(height: 50,),
                  GestureDetector(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                colors: [
                                  Colors.white.withOpacity(.5),
                                  Colors.white.withOpacity(.01),
                                ]
                            )
                        ),
                        child: Center(
                          child: Icon(Icons.arrow_forward_rounded, size: 50, color: Colors.white,),
                        ),
                      ),
                    ),
                    onTap: _doSignIn,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: TextStyle(color: Colors.grey),),
                SizedBox(width: 10,),
                GestureDetector(
                  child: Text("Sign Up", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),),
                  onTap: (){
                    Navigator.pushNamed(context, SignUpPage.id);
                  },
                ),
                // SizedBox(height: 20,),
              ],
            )
          ],
        )
      ),
    );
  }
}
