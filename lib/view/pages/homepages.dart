import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

double bmis = 180;
int weigth = 0;
int age = 0;
Color c1 = Color(0xff1D1E33);
Color c2 = Colors.white;
Color co1 = Color(0xff3B3C4D);
Color co2 = Colors.red;

class _HomePageState extends State<HomePage> {
  Widget Animationcontioner(
      {required String name,
      required String image,
      required Color color,
      required Color color_1}) {
    return BouncingWidget(
      onPressed: () {
        setState(() {
          if (name == "Female") {
            c1 = Color(0xff3B3C4D);
            c2 = Colors.red;
            co1 = Color(0xff1D1E33);
            co2 = Colors.white;
            ;
          } else {
            c1 = Color(0xff1D1E33);
            c2 = Colors.white;
            co1 = Color(0xff3B3C4D);
            co2 = Colors.red;
          }
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
          color: (name == "Female") ? c1 : co1,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 100,
              child: Image.asset(
                image,
                color: (name == "Female") ? c2 : co2,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                color: (name == "Female") ? c2 : co2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget AnimatedSilder() {
    return Padding(
      padding: EdgeInsets.fromLTRB(19, 5, 19, 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xff1D1E33),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "HEIGHT",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff626473),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Container(
                height: 50,
                width: 90,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    (bmis < 10)
                        ? Text(
                            "${bmis.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          )
                        : (bmis < 100)
                            ? Text(
                                "${bmis.toStringAsFixed(1)}",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "${bmis.toStringAsFixed(0)}",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                ),
                              ),
                    SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: Text(
                        "cm",
                        style: TextStyle(
                          color: Color(0xff626473),
                          fontSize: 13,
                          height: 2.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 1,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                ),
                child: Slider(
                  min: 0,
                  max: 300,
                  divisions: 300,
                  value: bmis,
                  onChanged: (value) {
                    setState(() {
                      bmis = value;
                    });
                  },
                  activeColor: Color(0xffF5C1D1),
                  inactiveColor: Color(0xff555555),
                  thumbColor: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget Weigth_age({required String name, required int ind}) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xff1D1E33),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
            (name == "Weight")
                ? Text(
                    "${weigth}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  )
                : Text(
                    "${age}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BouncingWidget(
                    duration: Duration(milliseconds: 100),
                    // stayOnBottom: true,
                    scaleFactor: 1.5,
                    onPressed: () {
                      setState(() {
                        if (name == "Weight") {
                          if (weigth > 0) {
                            weigth--;
                          }
                        } else {
                          if (age > 0) {
                            age--;
                          }
                        }
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Color(0xff4C4F5E), shape: BoxShape.circle),
                      child: Icon(
                        Icons.remove,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  BouncingWidget(
                    onPressed: () {
                      setState(() {
                        if (name == "Weight") {
                          weigth++;
                        } else {
                          age++;
                        }
                      });
                    },
                    duration: Duration(milliseconds: 100),
                    scaleFactor: 1.5,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Color(0xff6E6F7A), shape: BoxShape.circle),
                      child: Icon(
                        Icons.add,
                        color: Color(0xffF67FA4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// TweenAnimationBuilder(
//           tween: Tween<double>(begin: 0, end: 1),
//           duration: Duration(seconds: 2),
//           builder: (context, value, child) {
//             return Transform.scale(
//               scale: value,
//               child: Text("BMI Calculator"),
//             );
//           },
//         ),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText("BMI Calculator"),
          ],
          pause: Duration(seconds: 3),
          repeatForever: true,
        ),
        centerTitle: true,
        backgroundColor: Color(0xffff090E21),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xff090E21),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Animationcontioner(
                        name: "Female",
                        color: c1,
                        color_1: c2,
                        image: "assets/images/female.png"),
                    Animationcontioner(
                        name: "Male",
                        color: co1,
                        color_1: co2,
                        image: "assets/images/imags.png"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xffff090E21),
              child: AnimatedSilder(),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xffff090E21),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Weigth_age(name: "Weight", ind: weigth),
                    Weigth_age(name: "Age", ind: age),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xffff090E21),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 13,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xffEB1555),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Calculate",
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                    ),
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
