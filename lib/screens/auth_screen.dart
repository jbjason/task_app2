import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_app2/constants/constant.dart';
import 'package:task_app2/widgets/auth_widgets/auth_body.dart';
import 'package:task_app2/widgets/common_widgets/common_widgets.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/welcome-screen';
  const AuthScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final isLoading = ValueNotifier<bool>(false);
    return Scaffold(
      backgroundColor: logBackColor,
      body: Center(child: AuhtBody(onSubmit: _onSubmit, isLoading: isLoading)),
    );
  }

  void _onSubmit(String email, String name, String pass, File? image,
      bool isLogin, ValueNotifier<bool> isLoading, BuildContext ctx) async {
    isLoading.value = true;
    String message = 'An error occured, please check ur credentials!';
    try {
      final auth = FirebaseAuth.instance;
      if (isLogin) {
        await auth.signInWithEmailAndPassword(email: email, password: pass);
      } else {
        await auth.createUserWithEmailAndPassword(email: email, password: pass);
      }
    } on PlatformException catch (err) {
      if (err.message == null) {
        message = err.message!;
      }
      isLoading.value = false;
      CommonWidget().getSnackBar(ctx, message, Colors.redAccent);
    } catch (e) {
      isLoading.value = false;
      CommonWidget().getSnackBar(ctx, message, Colors.redAccent);
    }
  }
}
