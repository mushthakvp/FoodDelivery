import 'package:flutter/material.dart';
import 'package:food_delivery/sign_screen/view/widgets/textfield_widgets.dart';
import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';
import '../../viewmodel/controller.dart';
import 'login_icon_widget.dart';

class LoginInfiItemsWidget extends StatelessWidget {
  const LoginInfiItemsWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          children: [
            const SizedBox(height: 10),
            Text(
              'Welcome to Pizza Pedlers',
              style: gFontsOleo(
                cl: whiteColor,
                sz: 22,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Discover Amazing Thing Near Around you',
              style: gFontsOleo(
                cl: whiteColor,
                sz: 12,
                ls: 1,
              ),
            ),
            const SizedBox(height: 12),
            TextfieldWidget(
              controller: Controller.mailController,
              icon: Icons.email,
              hint: 'Email',
            ),
            TextfieldWidget(
              controller: Controller.passwordController,
              icon: Icons.lock_open_outlined,
              hint: 'Password',
            ),
            Container(
              height: 48,
              width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: whiteColor.withOpacity(.4),
              ),
              child: Center(
                child: Text(
                  'LOGIN',
                  style: gFontsOleo(
                    cl: whiteColor,
                    sz: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SignUp',
                    style: gFontsOleo(cl: whiteColor, sz: 13),
                  ),
                  Text(
                    'Forget password?',
                    style: gFontsOleo(cl: whiteColor, sz: 13),
                  ),
                ],
              ),
            )
          ],
        ),
        const LoginAllIconWidget(),
      ],
    );
  }
}
