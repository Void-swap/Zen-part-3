import 'package:flutter/material.dart';

/*
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Hello User!",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Container(
            height: 280,
            width: 260,
            decoration: BoxDecoration(
              color: Color(0xFF80A4FF),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text("xyz")
                    ],
                  ),
                ),
                SvgPicture.asset("assets/icons/ios.svg")
              ],
            ),
          )
        ],
      ),
    );
  }
}
*/

class Hello1Page extends StatelessWidget {
  const Hello1Page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello 1'),
      ),
      body: Center(
        child: Text('Hello 1 Page Content'),
      ),
    );
  }
}

class Hello2Page extends StatelessWidget {
  const Hello2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello 1'),
      ),
      body: Center(
        child: Text('Hello 2 Page Content'),
      ),
    );
  }
}

class Hello3Page extends StatelessWidget {
  const Hello3Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello 3 Page Content'),
      ),
    );
  }
}

class Hello4Page extends StatelessWidget {
  const Hello4Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello 1'),
      ),
      body: Center(
        child: Text('Hello 4 Page Content'),
      ),
    );
  }
}

class Hello5Page extends StatelessWidget {
  const Hello5Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello 1'),
      ),
      body: Center(
        child: Text('Hello 5 Page Content'),
      ),
    );
  }
}
