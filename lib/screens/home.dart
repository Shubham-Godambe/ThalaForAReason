import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:thala/screens/check.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 5,
        title: const Text(
          "Try it if you are a thala Fann!!!!",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 49),
                Color.fromARGB(225, 131, 85, 225)
              ],
              focal: Alignment.center,
              tileMode: TileMode.mirror,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 60,
                ),
                ZoomIn(
                  child: Container(
                    height: 300,
                    width: 300,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/first.png"))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                    style: const ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                        overlayColor:
                            MaterialStatePropertyAll(Colors.amberAccent),
                        iconSize: MaterialStatePropertyAll(30),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => check()));
                    },
                    icon: SlideInRight(
                        child: const Icon(Icons.next_plan_rounded)),
                    label: SlideInLeft(
                      child: const Text(
                        "Click to check",
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
