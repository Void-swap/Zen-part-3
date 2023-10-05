import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive_animation/zen_zone/msg_widget/screen/zen_zone.dart';
import 'package:uuid/uuid.dart';

class Hello2Page extends StatefulWidget {
  const Hello2Page({Key? key}) : super(key: key);

  @override
  _Hello2PageState createState() => _Hello2PageState();
}

class _Hello2PageState extends State<Hello2Page> {
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var uuid = const Uuid();
  bool isAnimationPlaying = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Add the Lottie animation using the builder
            Lottie.asset(
              'assets/LottieAssets/groupchat_animate.json',
              width: 490, // Adjust the width and height as needed
              height: 490,
              repeat: isAnimationPlaying
                  ? true
                  : false, // Control animation repetition
            ),
            SizedBox(
              height: 5,
            ),

            Positioned(
              bottom: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(38, 50, 56, 0.87),
                ),
                onPressed: () {
                  // Stop playing the animation when the button is pressed
                  //  setState(() {
                  //   isAnimationPlaying = false;
                  //   });

                  showDialog(
                    context: context,
                    builder: (BuildContext content) => AlertDialog(
                      backgroundColor: Colors.white.withOpacity(0.89),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      title: const Text(
                        "Enter Anonymous Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Form(
                            key: formKey,
                            child: TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if (value == null || value.length < 3) {
                                  return "Enter a VALID NAME";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Discreet name...",
                                hintStyle: TextStyle(color: Colors.black26),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 0,
                            right: 0,
                            bottom: -95,
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              String name = nameController.text;
                              nameController.clear();
                              //Navigator.pushReplacement(context);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ZenZone(
                                    name: name,
                                    userId: uuid.v1(),
                                  ),
                                ),
                              );
                            }
                          },
                          //style: TextButton.styleFrom(
                          //  backgroundColor:
                          // const Color.fromARGB(255, 9, 217, 36),
                          //  ),
                          child: const Text(
                            "Enter Zone",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  "Welcome to ZEN-Zone",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color((0xFFEEF0F5))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
