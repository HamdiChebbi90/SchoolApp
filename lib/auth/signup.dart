import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/services/fireauth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final _formSignUpKey = GlobalKey<FormState>();
  final rgex = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$');
  final pwd = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  bool _isSignUp = false;

  final Auth _auth = Auth();

  final TextEditingController _namecontroller = TextEditingController();

  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  void signUp() {
    if (_formSignUpKey.currentState!.validate()) {
      setState(() {
        _isSignUp = true;
      });
      String email = _emailcontroller.text;
      String password = _passwordcontroller.text;

      _auth
          .registerWithEmailAndPassword(email, password)
          .then((userCredential) {
        setState(() {
          _isSignUp = false;
        });
        if (userCredential != null) {
          Navigator.pushNamed(context, '/SignInPage');
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
            height: 20,
          ),
        ),
        Expanded(
          flex: 11,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              child: Form(
                key: _formSignUpKey,
                child: Column(
                  children: [
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _namecontroller,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(35, 158, 158, 158),
                        hintText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.contains(rgex)) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
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
                        if (value == null ||
                            value.isEmpty ||
                            value.contains(pwd) ||
                            value.length < 8) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _passwordcontroller,
                      obscureText: true,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(35, 158, 158, 158),
                        hintText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        signUp();
                      },
                      child: _isSignUp
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text('Sign Up'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
