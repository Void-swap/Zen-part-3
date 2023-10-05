import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/components/animated_bar.dart';
import 'package:rive_animation/components/side_menu.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/models/menu_btn.dart';
import 'package:rive_animation/models/rive_asset.dart';
import 'package:rive_animation/screen/home/home_screen.dart';
import 'package:rive_animation/utils/rive_utils.dart';
import 'package:rive_animation/zen_zone/zen_entry.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

//using RIVE ASSETS FOR ICONS ON NAVIGATION BAR
class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  //here we see how ANIMATION WORKS
  //late SMIBool searchTrigger;

  late SMIBool isSideDrawerClosed;
  RiveAsset selectedBottomNav = bottomNavs.first;
  bool isSideMenuClosed = true;
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;

  // Add a list of page widgets corresponding to each bottom nav item
  final List<Widget> pages = [
    const Hello1Page(),
    const Hello2Page(),
    const Hello3Page(),
    Hello4Page(),
    const Hello5Page(),
  ];

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
        //COMPLEX ONLINE REF
      });
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor2,
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Stack(
          children: [
            //this is how ANIMATION works
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn, //till here
              width: 288,
              left: isSideMenuClosed ? -288 : 0,
              height: MediaQuery.of(context).size.height,
              child: SideMenu(),
            ),
            Transform(
              //3D animation ONLINE REF   this rotate screen by 30 DEGREE
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(animation.value - 30 * animation.value * pi / 180),
              child: Transform.translate(
                offset: Offset(animation.value * 265, 0),
                child: Transform.scale(
                  scale: scalAnimation.value,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    child: pages[bottomNavs.indexOf(selectedBottomNav)],
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              left: isSideMenuClosed ? 0 : 220,
              top: 16,
              child: MenuBtn(
                riveOnit: (artboard) {
                  StateMachineController controller =
                      RiveUtils.getRiveController(artboard,
                          stateMachineName: "State Machine");
                  isSideDrawerClosed = controller.findSMI("isOpen") as SMIBool;
                  isSideDrawerClosed.value = true;
                },
                press: () {
                  isSideDrawerClosed.value = !isSideDrawerClosed.value;
                  if (isSideMenuClosed) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                  setState(() {
                    isSideMenuClosed = isSideDrawerClosed.value;
                  });
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Transform.translate(
          offset: Offset(0, 100 * animation.value),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: backgroundColor2.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(29)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    bottomNavs.length,
                    (index) => GestureDetector(
                      onTap: () {
                        bottomNavs[index].input!.change(true);
                        if (bottomNavs[index] != selectedBottomNav) {
                          setState(() {
                            selectedBottomNav = bottomNavs[index];
                          });
                        }
                        Future.delayed(const Duration(milliseconds: 300), () {
                          bottomNavs[index].input!.change(false);
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AminatedBar(
                              isActive: bottomNavs[index] == selectedBottomNav),
                          SizedBox(
                            height: 36,
                            width: 36,
                            //using each of the RIVE ANIMATED ICON
                            child: Opacity(
                              opacity: bottomNavs[index] == selectedBottomNav
                                  ? 1
                                  : 0.5,
                              child: RiveAnimation.asset(
                                //SCR or PATH is same for all ICONS
                                bottomNavs.first.src,
                                artboard: bottomNavs[index].artboard,
                                onInit: (artboard) {
                                  StateMachineController controller =
                                      RiveUtils.getRiveController(artboard,
                                          stateMachineName: bottomNavs[index]
                                              .stateMachineName);

                                  bottomNavs[index].input =
                                      controller.findSMI("active") as SMIBool;
                                },
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: bottomNavs[index] == selectedBottomNav
                                ? 1
                                : 0.5,
                            duration: Duration(milliseconds: 500),
                            // curve: Curves.linear,
                            child: Text(
                              _getLabel(index),
                              style: TextStyle(
                                color: bottomNavs[index] == selectedBottomNav
                                    ? Colors.white
                                    : backgroundColor2.withOpacity(0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

// Helper function text based on the index
  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Store';
      case 1:
        return 'ZEN-ZONE';
      case 2:
        return 'Home';
      case 3:
        return 'Council';
      case 4:
        return 'Near  Dr';
      default:
        return '';
    }
  }
}
