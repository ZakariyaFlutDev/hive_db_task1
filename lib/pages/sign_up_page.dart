import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_db_task1/pages/sign_in_page.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const String id = "sign_up_page";

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  _doSignUp(){
    String username = usernameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var box = Hive.box("hive_db");
    box.put("username", username);
    box.put("email", email);
    box.put("phone", phone);
    box.put("password", password);

    String name = box.get("username");
    String mail = box.get("email");
    String tel = box.get("phone");
    String pw = box.get("password");

    print(name);
    print(mail);
    print(tel);
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

                    const Text("Create", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    const Text("Account", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 50,),

                    TextField(
                      controller: usernameController,
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: "User Name",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          icon: Icon(Icons.person_outline_outlined, color: Colors.grey,)
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          icon: Icon(Icons.email_outlined, color: Colors.grey,)
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: phoneController,
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: "Phone Number",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          icon: Icon(Icons.phone_android_outlined, color: Colors.grey,)
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          icon: Icon(Icons.lock_outline, color: Colors.grey,)
                      ),
                    ),
                    SizedBox(height: 10,),
                    const Text("Forget Password?", style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 50,),
                    GestureDetector(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
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
                          child: const Center(
                            child: Icon(Icons.arrow_forward_rounded, size: 50, color: Colors.white,),
                          ),
                        ),
                      ),
                      onTap: _doSignUp,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?", style: TextStyle(color: Colors.grey),),
                  SizedBox(width: 10,),
                  GestureDetector(
                    child: Text("Sign In", style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),),
                    onTap: (){
                      Navigator.pushReplacementNamed(context, SignInPage.id);
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
