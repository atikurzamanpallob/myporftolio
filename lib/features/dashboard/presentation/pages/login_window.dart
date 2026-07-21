import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_colors.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';

class LoginWindow extends StatefulWidget {
  final Function onLoggedIn;
  const LoginWindow({super.key, required this.onLoggedIn});

  @override
  State<LoginWindow> createState() => _LoginWindowState();
}

class _LoginWindowState extends State<LoginWindow> {
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Container(
        height: 350.h,
        width: 350.w,
        padding: EdgeInsets.symmetric(vertical: 20.h),

        child: Column(
          children: [
            Text(
              "Log In",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 60.h,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              height: 60.h,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 50.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: Size(150.w, 50.h)),
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  String userName = dotenv.get("USER_NAME");
                  String password = dotenv.get("USER_PASS");
                  if (nameController.text == userName &&
                      password == passwordController.text) {
                    widget.onLoggedIn();
                    Navigator.pop(context);
                  }
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
