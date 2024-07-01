import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nannyhelps/home.dart';
import 'package:nannyhelps/loginController.dart';
import 'package:nannyhelps/reset.dart';
import 'package:nannyhelps/signup.dart';
import 'package:nannyhelps/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
        required String password,
        required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User found for that email");
      }
    }
    return user;
  }

  final controller = Get.put(LoginController());

  String _emailErrorMessage = '';
  String _passwordErrorMessage = '';

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailcontroller = TextEditingController();
    FocusNode _emailFN = FocusNode();
    TextEditingController _passwordcontroller = TextEditingController();
    FocusNode _passwordFN = FocusNode();

    return Scaffold(
      backgroundColor: const Color(0xFFE5E2EB),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'YoungSerif',
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7E57C2),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _emailcontroller,
                  focusNode: _emailFN,
                  onSubmitted: (value) {
                    _emailFN.unfocus();
                    _passwordFN.requestFocus();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    prefixIcon: const Icon(Icons.mail_outline, color: Colors.deepPurpleAccent,),
                    labelText: 'Email',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    errorText: _emailErrorMessage.isNotEmpty ? _emailErrorMessage : null,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Obx(
                      () => TextField(
                    controller: _passwordcontroller,
                    focusNode: _passwordFN,
                    obscureText: controller.visible.value,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      prefixIcon: const Icon(Icons.lock, color: Colors.deepPurpleAccent),
                      suffixIcon: IconButton(
                          onPressed: controller.isChange,
                          icon: const Icon(Icons.remove_red_eye, color: Colors.deepPurpleAccent)),
                      labelText: 'Password',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      errorText: _passwordErrorMessage.isNotEmpty ? _passwordErrorMessage : null,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPassword())),
                      child: const Text(
                        "forgot password?",
                        style:
                        TextStyle(fontSize: 12.0, color: Color(0xFF7E57C2)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: RawMaterialButton(
                    onPressed: () async {
                      final email = _emailcontroller.text;
                      final password = _passwordcontroller.text;
                      final user = await loginUsingEmailPassword(
                        email: email,
                        password: password,
                        context: context,
                      );

                      if (user != null) {
                        var sharedPref = await SharedPreferences.getInstance();
                        sharedPref.setBool(SplashScreenState.KEYLOGIN, true);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()
                          ),
                        );
                      } else {
                        setState(() {
                          // Display appropriate error messages for email and password
                          if (email.isEmpty) {
                            _emailErrorMessage = "Email can not be empty";
                          } else if (!EmailValidator.validate(email)) {
                            _emailErrorMessage = "Invalid email address";
                          } else {
                            _emailErrorMessage = '';
                          }

                          if (password.isEmpty) {
                            _passwordErrorMessage = "Password can not be empty";
                          } else {
                            _passwordErrorMessage = '';
                          }
                        });
                      }
                    },
                    fillColor: Colors.deepPurple.shade400,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 13.0),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: const Text(
                        "Sign Up",
                        style:
                        TextStyle(fontSize: 18.0, color: Color(0xFF7E57C2)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
