import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

//import 'package:rive_animation/screen/onboarding_screen.dart';
import 'package:rive_animation/screen/onboding/components/custom_signin_dialog.dart';
import 'package:rive_animation/screen/onboding/components/animated_btn.dart';
//components

//import 'package:rive_animation/screens/onboding/components/sign_in_form.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //button's Animation
  late RiveAnimationController _btnAnimationController;
  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay:
          true, //once we start Apllication the button used to auto-play, making it false this stosps it
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //
      body: Stack(
        children: [
          //this is BACKGROUND
          Center(
            child: Positioned(
              height: 100,
              width: MediaQuery.of(context).size.width * 1.7,
              bottom: 200,
              left: 100,
              child: Image.asset('assets/Backgrounds/Spline.png'),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          //this is TEXT
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const SizedBox(
                    width: 280,
                    child: Column(
                      children: [
                        Text(
                          "hola!\nto\nZen Mind",
                          style: TextStyle(
                            fontSize: 59,
                            fontFamily: 'Poppins',
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 29),
                        Text(
                            "Zen Mind invites you to discover mindfulness and self-care.Experience peace and balance like never before.\nStart your journey to a healthier mind today",
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),

                  const Spacer(
                    flex: 2,
                  ),
                  //this is Animated Button
                  AnimatedBtn(
                    btnAnimationController: _btnAnimationController,
                    press: () {
                      _btnAnimationController.isActive = true;
                      Future.delayed(
                        //shows DELAY after our BUTTONS ANIMATION
                        Duration(milliseconds: 800),
                        () {
                          CustomSigninDialog(context);
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 39,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
