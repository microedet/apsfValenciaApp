import 'dart:async';

import 'package:apfsvalencia/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/* class VerifyEmailScreen extends StatefulWidget {
  static String routerName = 'verifyEmail';

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;

  @override
  void initState() {
    super.initState();
    var email = FirebaseAuth.instance.currentUser;
    if(email != null){
      isEmailVerified = FirebaseAuth.instance.currentUser?.emailVerified!;
    }
    

    if (!isEmailVerified) {
      sendVerificationEmail();
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? HomeScreen()
      : Scaffold(
          appBar: AppBar(title: Text('Verificación Email')),
        );
}
 */

class VerifyEmailScreen extends StatefulWidget {
  VerifyEmailScreen({Key? key}) : super(key: key);

    static String routerName = 'verifyEmail';


  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerifield();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('un email ha sido enviado a ${user.emailVerified} por favor verifícalo'),),
    );
  }

  Future<void> checkEmailVerifield() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacementNamed(HomeScreen.routerName);
    }
  }
}
