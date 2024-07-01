import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nannyhelps/loginController.dart';
import 'package:nannyhelps/loginScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  final TextEditingController _addemailcontroller = TextEditingController();
  final FocusNode _emailFN = FocusNode();
  final TextEditingController _addpasswordcontroller = TextEditingController();
  final FocusNode _passwordFN = FocusNode();

  final controller = Get.put(LoginController());

  String _emailErrorMessage = '';
  String _passwordErrorMessage = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFE5E2EB),
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7E57C2),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: _addemailcontroller,
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
                      controller: _addpasswordcontroller,
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
                  // const SizedBox(
                  //   height: 20.0,
                  // ),
                  // TextField(
                  //   controller: _addcontactcontroller,
                  //   keyboardType: TextInputType.number,
                  //   decoration: const InputDecoration(
                  //     prefixIcon: Icon(Icons.phone),
                  //     labelText: 'Contact',
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(15.0),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: RawMaterialButton(
                        onPressed: () async {
                          final email = _addemailcontroller.text;
                          final password = _addpasswordcontroller.text;

                          setState(() {
                            // Reset error messages
                            _emailErrorMessage = '';
                            _passwordErrorMessage = '';
                          });

                          // Validate email and password
                          if (email.isEmpty) {
                            setState(() {
                              _emailErrorMessage = 'Email can not be empty';
                            });
                            return;
                          } else if (!RegExp(
                            r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
                          ).hasMatch(email)) {
                            setState(() {
                              _emailErrorMessage = 'Invalid email address';
                            });
                            return;
                          }

                          if (password.isEmpty) {
                            setState(() {
                              _passwordErrorMessage = 'Password can not be empty';
                            });
                            return;
                          }

                          setState(() {
                            showSpinner = true;
                          });

                          try {
                            final newUser = await _auth.createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            if (newUser != null) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            }
                          } catch (e) {
                            print(e);
                          }

                          setState(() {
                            showSpinner = false;
                          });
                        },
                        fillColor: Colors.deepPurple.shade400,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
