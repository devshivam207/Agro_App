import 'package:betting_app/dimensions.dart';
import 'package:betting_app/homeheader.dart';
import 'package:betting_app/models/cart_controller.dart';
import 'package:betting_app/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_page.dart';
import 'colors.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: Dimensions.width40, left: Dimensions.width20),
                  height: Dimensions.height40,
                  width: Dimensions.width_20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.maincolor,
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const MyHomePage()))),
                    },
                    child: Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                      size: Dimensions.circularradius25,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: Dimensions.width40, right: Dimensions.width20),
                  height: Dimensions.height40,
                  width: Dimensions.width_20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.maincolor,
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const MyHomePage()))),
                    },
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: Dimensions.circularradius25,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.maincolor,
                  borderRadius:
                      BorderRadius.circular(Dimensions.circularradius25)),
              margin: EdgeInsets.fromLTRB(Dimensions.width10,
                  Dimensions.height10, Dimensions.width10, 0),
              width: double.maxFinite,
              height: Dimensions.height100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "30%",
                    textScaleFactor: 3,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        Dimensions.width5, 0, Dimensions.width10, 0),
                    child: const Text(
                      "Off*",
                      textScaleFactor: 1.5,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "  Pioneer Seeds",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "  & Fertilizers",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(Dimensions.width10,
                  Dimensions.height10, Dimensions.width10, 0),
              width: double.maxFinite,
              height: Dimensions.height100,
              decoration: BoxDecoration(
                  color: AppColors.maincolor,
                  borderRadius:
                      BorderRadius.circular(Dimensions.circularradius25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "10%",
                    textScaleFactor: 3,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Off*",
                    textScaleFactor: 1.5,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "  Balaji Seeds",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "  & Fertilizers",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(Dimensions.width10,
                  Dimensions.height10, Dimensions.width10, 0),
              width: double.maxFinite,
              height: Dimensions.height100,
              decoration: BoxDecoration(
                  color: AppColors.maincolor,
                  borderRadius:
                      BorderRadius.circular(Dimensions.circularradius25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "5%",
                    textScaleFactor: 3,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        Dimensions.width5, 0, Dimensions.width10, 0),
                    child: const Text(
                      "Off*",
                      textScaleFactor: 1.5,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "  On Equipment & Motor",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "  Purchase Only",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<CartController>(builder: (controller) {
          return Container(
            height: Dimensions.height50,
            decoration: const BoxDecoration(
              color: AppColors.maincolor,
            ),
            child: GetBuilder<CartController>(
              builder: (cartcontroller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MyHomePage()));
                      },
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                        size: Dimensions.height20,
                      ),
                    ),
                    Icon(
                      Icons.archive,
                      color: Colors.white,
                      size: Dimensions.height20,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CartPage()));
                        },
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: Dimensions.height20,
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                      },
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: Dimensions.height20,
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }));
  }
}
