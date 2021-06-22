import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/image_bg_controller.dart';

class ImageBgView extends GetView<ImageBgController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(imgPath: "assets/images/users/login_bg.png"),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: LoginWidget(
              textStyle: TextStyle(fontSize: 22, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

///textStyle: TextStyle(fontSize: 22, color: Colors.white)
class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key, required this.textStyle}) : super(key: key);

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 150,
            child: Center(
              child: Text(
                'Foodybite',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: _buildTextField(textStyle, 'Email', Icon(Icons.email, color: Colors.white), false, TextInputAction.next),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: _buildTextField(textStyle, 'Password', Icon(Icons.lock, color: Colors.white), true, TextInputAction.done),
                    ),
                    Text("Forgot Password?", style: textStyle),
                  ],
                ),
                SizedBox(height: 100),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(16)),
                  child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text("Login", style: textStyle),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 80),
                Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white, width: 1))),
                  child: Text("Create New Account", style: textStyle),
                ),
                SizedBox(height: 30)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextField(TextStyle style, String hintText, Icon icon, bool isPwd, TextInputAction textInputAction) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[600]!.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        style: style,
        obscureText: isPwd,
        keyboardType: TextInputType.emailAddress,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: style,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: icon,
          ),
        ),
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
    required this.imgPath,
  }) : super(key: key);
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          Colors.black,
          Colors.black12,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgPath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white30, BlendMode.lighten),
          ),
        ),
      ),
    );
  }
}
