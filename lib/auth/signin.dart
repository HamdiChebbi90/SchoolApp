import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/services/fireauth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  final _formSignInKey = GlobalKey<FormState>();
  var obscureText = true;
  final pwd = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

  bool _isSignIn = false;

  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  final Auth _auth = Auth();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  void signIn() {
    if (_formSignInKey.currentState!.validate()) {
      setState(() {
        _isSignIn = true;
      });
      String email = _emailcontroller.text;
      String password = _passwordcontroller.text;

      _auth.signInWithEmailAndPassword(email, password).then((userCredential) {
        setState(() {
          _isSignIn = false;
        });
        if (userCredential != null) {
          Navigator.pushNamed(context, '/HomePage');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid email or password'),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Expanded(
          flex: 1,
          child: SizedBox(
            height: 30,
          ),
        ),
        Expanded(
          flex: 11,
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                )),
            child: Form(
              key: _formSignInKey,
              child: Column(
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _emailcontroller,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(35, 158, 158, 158),
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please verify your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _passwordcontroller,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(35, 158, 158, 158),
                      hintText: 'Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.contains(pwd) ||
                          value.length < 8) {
                        return 'Please verify your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formSignInKey.currentState!.validate()) {
                        signIn();
                      }
                    },
                    child: _isSignIn
                        ? const CircularProgressIndicator(
                            color: Color.fromARGB(255, 159, 15, 15),
                          )
                        : const Text('Sign In'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/SignUpPage');
                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
