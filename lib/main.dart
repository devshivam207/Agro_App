import 'package:betting_app/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homeheader.dart';
import 'loginpage.dart';
import 'models/dependencies.dart' as dep;
import 'models/popular_product_controller.dart';
import 'models/recommended_product_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final curruser = Authentication().currentuser;

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductsController>().checkPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.brown,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: curruser == null ? const MyLoginPage() : MyHomePage(),
      ),
    );
  }
}
