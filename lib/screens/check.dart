import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:thala/screens/noThala.dart';
import 'package:thala/screens/thala.dart';

import '../widget/FeatureBox.dart';

class check extends StatefulWidget {
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _check();
}

class _check extends State<check> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Flash(
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          padding: EdgeInsets.all(10),
          children: [
            const SizedBox(
              height: 50,
            ),
            ElasticInUp(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(140, 235, 209, 133),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Container(
                    height: 200,
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 3,
                            style: BorderStyle.solid),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/mahi.webp"))),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: ElasticInRight(
                child: const FeatureBox(
                  color: Color.fromARGB(154, 95, 190, 224),
                  headertext: 'Thala',
                  description:
                      'Write any string or a number you want to check.',
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElasticInLeft(
              child: TextField(
                controller: search,
                decoration: InputDecoration(
                  iconColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Enter what you want to check?',
                  icon: SlideInRight(child: Icon(Icons.search)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ZoomIn(
              child: ElevatedButton.icon(
                style: const ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(Colors.amberAccent),
                    iconSize: MaterialStatePropertyAll(30),
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                icon: BounceInLeft(child: const Icon(Icons.next_plan_rounded)),
                label: BounceInRight(
                  child: const Text(
                    "Enter",
                  ),
                ),
                onPressed: () {
                  setState(() {
                    String enteredText = search.text;
                    bool navigateToThala = false;

                    // Check if the entered value is 7 or the string "seven"
                    if (enteredText.toLowerCase() == '7' ||
                        enteredText.toLowerCase() == 'seven') {
                      navigateToThala = true;
                    }

                    // Check if the entered value is a string with 7 alphabets
                    if (countAlphabets(enteredText) == 7) {
                      navigateToThala = true;
                    }
                    int? enteredNumber = int.tryParse(enteredText);
                    if (enteredNumber != null &&
                            checkNumberConditions(enteredNumber) ||
                        countDigits(enteredNumber) == 7) {
                      navigateToThala = true;
                    }

                    if (navigateToThala) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Thala(),
                      ));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NOThala(),
                      ));
                    }
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

int countAlphabets(String text) {
  int count = 0;
  for (int i = 0; i < text.length; i++) {
    if (text[i].toLowerCase().contains(RegExp(r'[a-z]'))) {
      count++;
    }
  }
  return count;
}

bool checkNumberConditions(int number) {
  int sum = 0;
  int product = 1;
  int difference = 0;

  int lastDigit = number % 10;
  // number ~/= 10;

  while (number > 0) {
    int digit = number % 10;
    sum = sum + digit;
    product *= digit;
    difference += (digit - lastDigit).abs();
    lastDigit = digit;
    number ~/= 10;
  }

  return sum == 7 || product == 7 || difference == 7;
}

int countDigits(int? number) {
  int count = 0;
  while (number != null && number > 0) {
    count++;
    number ~/= 10;
  }
  return count;
}
