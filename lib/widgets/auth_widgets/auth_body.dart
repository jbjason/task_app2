import 'dart:io';
import 'package:flutter/material.dart';
import 'package:task_app2/constants/constant.dart';
import 'package:task_app2/widgets/auth_widgets/auth_buttons.dart';
import 'package:task_app2/widgets/auth_widgets/auth_clippers.dart';
import 'package:task_app2/widgets/auth_widgets/auth_textfield.dart';
import 'package:task_app2/widgets/auth_widgets/auth_user_image.dart';
import 'package:task_app2/widgets/common_widgets/common_widgets.dart';

class AuhtBody extends StatefulWidget {
  const AuhtBody({required this.onSubmit, required this.isLoading, super.key});
  final Function onSubmit;
  final ValueNotifier<bool> isLoading;
  @override
  State<AuhtBody> createState() => _AuhtBodyState();
}

class _AuhtBodyState extends State<AuhtBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nameController = TextEditingController();
  File? _userImageFile;
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      height: _isLogin ? size.height * .5 : size.height * .65,
      width: size.width * .8,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        gradient: loginGradient,
      ),
      child: ClipPath(
        clipper: AuthClipper(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
          decoration: BoxDecoration(
            color: logBackColor,
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: _body(),
        ),
      ),
    );
  }

  Widget _body() => SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // login text & Image circleAvatar
              AuthUserImage(isLogin: _isLogin, pickedImage: _pickedImage),
              SizedBox(height: _isLogin ? 36 : 15),
              // email textfield
              AuthTextField(controller: _emailController, title: 'Email'),
              // username textfield
              if (!_isLogin)
                AuthTextField(controller: _nameController, title: 'Username'),
              // pass textfield
              AuthTextField(controller: _passController, title: 'Password'),
              const SizedBox(height: 20),
              // submit, signup & sigin buttons
              AuthButtons(
                isLogin: _isLogin,
                onPress: _onPress,
                onSubmit: _onSubmit,
                isLoading: widget.isLoading,
              ),
            ],
          ),
        ),
      );

  void _onPress() => setState(() => _isLogin = !_isLogin);

  void _pickedImage(File image) => _userImageFile = image;

  void _onSubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_userImageFile == null && !_isLogin) {
      CommonWidget()
          .getSnackBar(context, 'Please pick an image', Colors.redAccent);
      return;
    }
    if (isValid) {
      widget.onSubmit(
        _emailController.text.trim(),
        _nameController.text.trim(),
        _passController.text.trim(),
        _userImageFile != null ? _userImageFile! : File(''),
        _isLogin,
        widget.isLoading,
        context,
      );
    }
  }
}
