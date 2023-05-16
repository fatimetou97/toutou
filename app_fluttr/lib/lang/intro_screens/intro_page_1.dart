import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 15,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            side: BorderSide(
              width: 3,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200))),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(170),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Mauri Urgance",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // CircleAvatar(

                    //   radius: 25,
                    //   backgroundColor: Colors.white,
                    // )
                  ],
                ),
                SizedBox(
                  height: 100,
                )
              ],
            )),
      ),
      body: Center(
        child: Column(
          // controller:_controller,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("welcomeText".tr),
            // Text(
            //   "You have pushed the button this many times:".tr,
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline6,
            // ),
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(Locale('fr'));
              },
              child: const Text("Francais"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(Locale('en'));
              },
              child: const Text("English"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(Locale('ar'));
              },
              child: const Text("Arabe"),
            ),
          ],
        ),
      ),
    );
  }
}
