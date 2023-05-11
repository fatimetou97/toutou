import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app_fluttr/LanguageChangeProvider.dart';
import 'package:app_fluttr/onboarding_screen.dart';
import 'package:app_fluttr/views/home_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'generated/l10n.dart';
import 'lang/logicLang.dart';
import 'navBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return
        // ChangeNotifierProvider<LanguageChangeProvider>(
        //   create: (context) => LanguageChangeProvider(),
        //   child: Builder(
        //     builder: (context) =>
        GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // locale: Provider.of<LanguageChangeProvider>(context, listen: true)
      //     .currentLocale,
      // localizationsDelegates: const [
      //   S.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('en', ''),
      //   Locale('hi', ''),
      //   Locale('fr', ''),
      // ],
      translations: Messages(), // your translations
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'UK'),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      // home: const MyHomePage(title: 'Mauri Urgance'),
      home: const SplashScreen(),
      // home: const HomeScreen(),
      //   ),
      // ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      
      splash: Column(
        children: [
          Image.asset('images/logohne.jpeg'),
          const Text('Cake app',
          style: TextStyle(fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white),)
        ],
      ),
      backgroundColor: Colors.white,
       nextScreen: const OnBoadingScreen(),
      // nextScreen: const SideBarScreen(),
      splashIconSize: 300,
      duration: 4000,
      splashTransition: SplashTransition.slideTransition,
      // pageTransitionType: PageTransitionsType.topToBottom,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBarScreen(),
      appBar: AppBar(
        centerTitle: true,
        
        title: const Text('Mauri Urgence'),
      ),
      body: const Center(
        child: Text('Mauri Urgence'),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final PageController _controller = PageController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  // class _OnboardinngPageState extends State<OnboardinngPageState>{
  //   override
  //   void dispose(){
  //     controller.dispose();
  //     super.dispose();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(widget.title),
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),

      // ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        height: 80,
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: const Text('SKIP'),
              onPressed: () {},
            ),
            TextButton(
              child: const Text('NEXT'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
