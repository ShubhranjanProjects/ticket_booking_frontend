import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking_app/dashboard.dart';
import 'package:ticket_booking_app/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDLOuxkH47nApBpxsWFSRzEy9Exr-iZ_Mw",
          appId: "1:329043062915:web:3b7e8616079db151396bb6",
          messagingSenderId: "329043062915",
          projectId: "ticket-booker-b79bb"));
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return (user == null) ? LoginPage() : Dashboard();
    //  return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: const Color.fromARGB(255, 34, 222, 49),
    //     title: const Text('Product Details',
    //     style: TextStyle(color: Colors.white),
    //     ),
    //   ),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: [
    //             SizedBox(
    //               width: 20,
    //               height: 200,
    //               child: Image.asset(
    //                 'assets/WhatsApp Image 2024-03-02 at 8.25.00 PM.jpeg',
    //               ),
    //             ),
    //             const SizedBox(height: 10,),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 550),
    //           child: ElevatedButton(
    //             style: ButtonStyle(
    //               backgroundColor: const MaterialStatePropertyAll(Color.fromARGB(255, 255, 94, 0),
    //               ),
    //                shape: MaterialStateProperty.all<OutlinedBorder>(
    //       RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(0), // Set borderRadius to 0 for square shape
    //       ),),
    //               ),
    //             onPressed: () {

    //             },
    //             child: const Text('Add to Cart',
    //             style: TextStyle(color: Colors.white),),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
