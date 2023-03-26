import 'package:betting_app/homeheader.dart';
import 'package:betting_app/models/recommended_product_controller.dart';
import 'package:betting_app/slideriteminfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:betting_app/colors.dart';
import 'package:betting_app/models/cart_controller.dart';
import 'package:betting_app/models/popular_product_controller.dart';
import 'package:betting_app/profilepage.dart';
import 'package:betting_app/recommendediteminfo.dart';
import 'dimensions.dart';
import 'historypage.dart';
import 'models/product_cart.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (cartcontroller) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Positioned(
                    top: Dimensions.height40,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
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
                        Container(
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
                              size: Dimensions.circularradius25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )),
                cartcontroller.totalamount > 0
                    ? Positioned(
                        top: Dimensions.height10 * 8,
                        left: Dimensions.width5,
                        right: Dimensions.width5,
                        bottom: Dimensions.height20 * 3.3,
                        child: Container(
                            color: Colors.white,
                            child: ListView.builder(
                              itemCount: cartcontroller.getItems.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    var popIndex =
                                        Get.find<PopularProductsController>()
                                            .popularProductList
                                            .indexOf(cartcontroller
                                                .getItems[index].product!);
                                    if (popIndex >= 0) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  SliderInfo(id: popIndex))));
                                    } else {
                                      var recomIndex = Get.find<
                                              RecommendedProductController>()
                                          .recommendedproductlist
                                          .indexOf(cartcontroller
                                              .getItems[index].product!);
                                      if (recomIndex >= 0) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    RecommendedItemInfo(
                                                        id: recomIndex))));
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: Dimensions.height100,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        color: Colors.greenAccent.shade100,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.circularradius15)),
                                    margin: EdgeInsets.all(Dimensions.height5),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: Dimensions.width5,
                                        ),
                                        Container(
                                          width: Dimensions.width_50,
                                          height: Dimensions.width_50,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions
                                                          .circularradius20),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      cartcontroller
                                                          .getItems[index].img
                                                          .toString()),
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(
                                          width: Dimensions.width10,
                                        ),
                                        Expanded(
                                            child: Container(
                                          height: Dimensions.height100,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.greenAccent.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions
                                                          .circularradius15)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cartcontroller
                                                    .getItems[index].name!,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        Dimensions.height5 * 3,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                cartcontroller
                                                    .getItems[index].company!,
                                                style: TextStyle(
                                                    color: Colors.purple,
                                                    fontSize:
                                                        Dimensions.height7 * 2,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "\$ ${cartcontroller.getItems[index].price}",
                                                    style: TextStyle(
                                                        color: Colors.brown,
                                                        fontSize:
                                                            Dimensions.height5 *
                                                                3,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .only(
                                                                end: Dimensions
                                                                    .margin10),
                                                    height: Dimensions.height30,
                                                    width: Dimensions.width_40,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius
                                                            .circular(Dimensions
                                                                .circularradius20)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () =>
                                                              cartcontroller.additem(
                                                                  cartcontroller
                                                                      .getItems[
                                                                          index]
                                                                      .product!,
                                                                  -1),
                                                          child: Icon(
                                                            Icons.remove,
                                                            size: Dimensions
                                                                .edgeinsertltrb20,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        Text(
                                                          cartcontroller
                                                              .getItems[index]
                                                              .quantity
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: Dimensions
                                                                .fontsize17,
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () =>
                                                              cartcontroller.additem(
                                                                  cartcontroller
                                                                      .getItems[
                                                                          index]
                                                                      .product!,
                                                                  1),
                                                          child: Icon(
                                                            Icons.add,
                                                            size: Dimensions
                                                                .edgeinsertltrb20,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )))
                    : const Center(
                        child: Text(
                          "NOTHING IN CART !!",
                          textScaleFactor: 1.4,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                GetBuilder<CartController>(
                  builder: (cartcontroller) {
                    return Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: Dimensions.height60,
                        width: Dimensions.width_1,
                        decoration: BoxDecoration(
                            color: Colors.brown.shade100,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(
                                    Dimensions.circularradius20),
                                topLeft: Radius.circular(
                                    Dimensions.circularradius20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsetsDirectional.only(
                                  start: Dimensions.margin20),
                              height: Dimensions.height50,
                              width: Dimensions.width_50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.circularradius20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "\$ ${cartcontroller.totalamount}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimensions.fontsize17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //cartcontroller.additemtofirebase();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsetsDirectional.only(
                                    end: Dimensions.edgeinsertltrb20),
                                height: Dimensions.height50,
                                width: Dimensions.width_80,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.circularradius20)),
                                child: Text(
                                  "Pay Now",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontsize14,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            bottomNavigationBar:
                GetBuilder<CartController>(builder: (controller) {
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
      },
    );
  }
}
