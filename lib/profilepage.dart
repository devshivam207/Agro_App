import 'package:betting_app/homeheader.dart';
import 'package:betting_app/models/cart_controller.dart';
import 'package:betting_app/cart_page.dart';
import 'package:betting_app/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:betting_app/auth.dart';
import 'package:betting_app/colors.dart';
import 'package:betting_app/dimensions.dart';
import 'package:betting_app/historypage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> signout() async {
    await Authentication().signout();
  }

  final User? user = Authentication().currentuser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: Dimensions.height60,
              left: Dimensions.width10,
              right: Dimensions.width10,
              child: Container(
                height: Dimensions.height100,
                decoration: BoxDecoration(
                    color: AppColors.maincolor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.edgeinsertltrb50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    Container(
                      height: Dimensions.height60,
                      width: Dimensions.height60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(Dimensions.width100),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3WEmfJCME77ZGymWrlJkXRv5bWg9QQmQEzw&usqp=CAU")),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width_10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "WELCOME >",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.width_7),
                            ),
                            SizedBox(
                              width: Dimensions.width5,
                            ),
                          ],
                        ),
                        Text(
                          user!.email.toString(),
                          style: const TextStyle(
                            color: Colors.purpleAccent,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: Dimensions.height50 * 3.7,
                left: Dimensions.width10,
                right: Dimensions.width10,
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: Dimensions.height40,
                      decoration: BoxDecoration(
                        color: AppColors.maincolor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.circularradius25),
                      ),
                      child: Center(
                        child: Text(
                          "About Us",
                          textScaleFactor: 1.3,
                          style: TextStyle(
                              fontSize: Dimensions.height10,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    Container(
                      width: double.maxFinite,
                      height: Dimensions.height40,
                      decoration: BoxDecoration(
                        color: AppColors.maincolor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.circularradius25),
                      ),
                      child: Center(
                        child: Text(
                          "Offers and Coupons",
                          textScaleFactor: 1.3,
                          style: TextStyle(
                              fontSize: Dimensions.height10,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    Container(
                      width: double.maxFinite,
                      height: Dimensions.height40,
                      decoration: BoxDecoration(
                        color: AppColors.maincolor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.circularradius25),
                      ),
                      child: Center(
                        child: Text(
                          "Customer Support",
                          textScaleFactor: 1.3,
                          style: TextStyle(
                              fontSize: Dimensions.height10,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    Container(
                      width: double.maxFinite,
                      height: Dimensions.height40,
                      decoration: BoxDecoration(
                        color: AppColors.maincolor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.circularradius25),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Version 4.66.0",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  fontSize: Dimensions.height10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "App up to date",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  fontSize: Dimensions.height7,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    InkWell(
                      onTap: () {
                        signout();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MyLoginPage()));
                      },
                      child: Container(
                        width: double.maxFinite,
                        height: Dimensions.height40,
                        decoration: BoxDecoration(
                          color: AppColors.maincolor,
                          borderRadius: BorderRadius.circular(
                              Dimensions.circularradius25),
                        ),
                        child: Center(
                          child: Text(
                            "Logout 🔨",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                                fontSize: Dimensions.height10,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
        bottomNavigationBar: GetBuilder<CartController>(builder: (controller) {
          return Container(
            height: Dimensions.height50,
            decoration: BoxDecoration(
                color: AppColors.maincolor,
                borderRadius:
                    BorderRadius.circular(Dimensions.circularradius15)),
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
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const OfferPage()));
                      },
                      child: Icon(
                        Icons.archive,
                        color: Colors.white,
                        size: Dimensions.height20,
                      ),
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
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: Dimensions.height20,
                    ),
                  ],
                );
              },
            ),
          );
        }));
  }
}
