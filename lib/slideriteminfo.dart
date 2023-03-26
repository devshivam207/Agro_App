import 'package:betting_app/colors.dart';
import 'package:betting_app/dimensions.dart';
import 'package:betting_app/models/cart_controller.dart';
import 'package:betting_app/cart_page.dart';
import 'package:betting_app/expandablecolumn.dart';
import 'package:betting_app/homeheader.dart';
import 'package:betting_app/models/popular_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderInfo extends StatelessWidget {
  final int id;
  const SliderInfo({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductsController>().popularProductList[id];
    Get.find<PopularProductsController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<PopularProductsController>(
          builder: (popularprod) {
            return Stack(children: [
              //background image
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: Dimensions.height250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            popularprod.popularProductList[id].img),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              //icon on image
              Positioned(
                left: Dimensions.width_10,
                right: Dimensions.width_10,
                top: Dimensions.height30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MyHomePage()))
                      },
                      child: Container(
                        height: Dimensions.height40,
                        width: Dimensions.width_20,
                        padding:
                            EdgeInsets.fromLTRB(Dimensions.width_2, 0, 0, 0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => CartPage()))
                      },
                      child: Stack(
                        children: [
                          Container(
                              height: Dimensions.height40,
                              width: Dimensions.width_20,
                              alignment: AlignmentDirectional.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.black,
                              )),
                          popularprod.totalItems >= 1
                              ? const Positioned(
                                  top: 3,
                                  right: 0,
                                  child: Icon(
                                    Icons.circle,
                                    size: 25,
                                    color: AppColors.maincolor,
                                  ))
                              : Container(),
                          popularprod.totalItems >= 1
                              ? Positioned(
                                  top: 5,
                                  right: 5,
                                  child: Text(
                                    popularprod.totalItems.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ))
                              : Container()
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //item name and reviews
              Positioned(
                left: 0,
                right: 0,
                top: Dimensions.position230,
                child: SizedBox(
                  height: Dimensions.height40 * 3,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        Dimensions.width_20,
                        Dimensions.edgeinsertltrb15,
                        Dimensions.width_20,
                        Dimensions.edgeinsertltrb17),
                    decoration: BoxDecoration(
                        color: Colors.greenAccent.shade100,
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(Dimensions.circularradius20),
                            topLeft:
                                Radius.circular(Dimensions.circularradius20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          popularprod.popularProductList[id].name,
                          style: TextStyle(
                              fontSize: Dimensions.fontsize20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis),
                        ),
                        SizedBox(
                          height: Dimensions.height5,
                        ),
                        Row(
                          children: [
                            Wrap(
                                children: List.generate(
                                    5,
                                    (index) => Icon(
                                          Icons.star,
                                          color: AppColors.maincolor,
                                          size: Dimensions.iconsize15,
                                        ))),
                            SizedBox(width: Dimensions.width_2),
                            Text(
                              popularprod.popularProductList[id].star
                                  .toString(),
                              style: const TextStyle(color: Colors.black54),
                            ),
                            SizedBox(width: Dimensions.width_10),
                            const Text(
                              "1457 comments",
                              textScaleFactor: 0.8,
                              style: TextStyle(color: Colors.black54),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.circle_sharp,
                              color: Colors.orangeAccent,
                              size: Dimensions.iconsize15,
                            ),
                            const Text(
                              " Normal",
                              textScaleFactor: 0.97,
                              style: TextStyle(color: Colors.black38),
                            ),
                            SizedBox(
                              width: Dimensions.width_5,
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.orangeAccent,
                              size: Dimensions.iconsize16,
                            ),
                            Text(
                              popularprod.popularProductList[id].location,
                              textScaleFactor: 0.97,
                              style: const TextStyle(color: Colors.black38),
                            ),
                            SizedBox(
                              width: Dimensions.width_7,
                            ),
                            Icon(
                              Icons.access_time_rounded,
                              color: Colors.orangeAccent,
                              size: Dimensions.iconsize16,
                            ),
                            const Text(
                              " 2 days",
                              textScaleFactor: 0.97,
                              style: TextStyle(color: Colors.black38),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //introducing and column
              Positioned(
                top: Dimensions.height30 * 11.3,
                left: 0,
                right: 0,
                child: Container(
                    height: Dimensions.height60 * 3.9,
                    padding: EdgeInsets.only(
                        left: Dimensions.width_10, right: Dimensions.width_10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(Dimensions.circularradius20),
                            topRight:
                                Radius.circular(Dimensions.circularradius20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        const Text(
                          "Introducing : ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: Dimensions.height7),
                        Expanded(
                            child: SingleChildScrollView(
                                child: Columnstructure(
                          text: popularprod.popularProductList[id].description,
                        ))),
                      ],
                    )),
              ),
              //footer and icons
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: Dimensions.height30 * 3,
                  width: Dimensions.width_1,
                  decoration: BoxDecoration(
                      color: AppColors.maincolor,
                      borderRadius: BorderRadius.only(
                          topRight:
                              Radius.circular(Dimensions.circularradius20),
                          topLeft:
                              Radius.circular(Dimensions.circularradius20))),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () => popularprod.setQuantity(false),
                              child: Icon(
                                Icons.remove,
                                color: Colors.black,
                                size: Dimensions.edgeinsertltrb20,
                              ),
                            ),
                            Text(
                              popularprod.incartitem.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.fontsize17,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => popularprod.setQuantity(true),
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                                size: Dimensions.edgeinsertltrb20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          popularprod.addItem(product);
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
                            '\$ ${(popularprod.popularProductList[id].price * popularprod.incartitem).toString()} |  Add to Cart',
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
              ),
            ]);
          },
        ));
  }
}
