import 'package:betting_app/colors.dart';
import 'package:betting_app/dimensions.dart';
import 'package:betting_app/homepagebody.dart';
import 'package:betting_app/models/cart_controller.dart';
import 'package:betting_app/historypage.dart';
import 'package:betting_app/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:betting_app/cart_page.dart';

import 'package:betting_app/models/popular_product_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, bool? searchtapped}) : super(key: key);
  static bool searchtapped = false;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // PageController pageController = PageController(viewportFraction: 1);
  // var _currentvalue = 0.0;
  // bool tapslider = false;

  // @override
  // void initState() {
  //   super.initState();
  //   pageController.addListener(() {
  //     setState(() {
  //       //_currentvalue = pageController.page!;
  //     });
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<PopularProductsController>(builder: (popularprod) {
          return SafeArea(
              child: Column(
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(top: Dimensions.margin10),
                padding: EdgeInsets.fromLTRB(Dimensions.width_10, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Haryana",
                          style: TextStyle(
                              fontSize: Dimensions.fontsize20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.maincolor),
                        ),
                        Row(
                          children: const [
                            Text(
                              "Gurugram",
                              style: TextStyle(color: Colors.black),
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          // onTap: () {
                          //   MyHomePage.searchtapped = !MyHomePage.searchtapped;
                          // },
                          child: Container(
                            width: Dimensions.width40,
                            height: Dimensions.height40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.circularradius15),
                              color: AppColors.maincolor,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: Dimensions.width20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.width_10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: SingleChildScrollView(child: HomePageBody()),
              ),
            ],
          ));
        }),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) {
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
                      GestureDetector(
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
          },
        ));
  }
}
