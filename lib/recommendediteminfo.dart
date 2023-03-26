import 'package:betting_app/colors.dart';
import 'package:betting_app/dimensions.dart';
import 'package:betting_app/expandablecolumn.dart';
import 'package:betting_app/homeheader.dart';
import 'package:betting_app/models/cart_controller.dart';
import 'package:betting_app/models/popular_product_controller.dart';
import 'package:betting_app/models/recommended_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_page.dart';

class RecommendedItemInfo extends StatelessWidget {
  final int id;
  const RecommendedItemInfo({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedproductlist[id];
    Get.find<PopularProductsController>()
        .initProduct(product, Get.find<CartController>());
    return GetBuilder<RecommendedProductController>(builder: (recommendedprod) {
      return GetBuilder<PopularProductsController>(builder: (popularprod) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: Dimensions.height40,
                      width: Dimensions.width_20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => const MyHomePage()))),
                        },
                        child: const Icon(
                          Icons.clear,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartPage()))
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
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(Dimensions.height53),
                  child: Container(
                    width: double.maxFinite,
                    height: Dimensions.height50,
                    decoration: BoxDecoration(
                        color: AppColors.maincolor,
                        borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(Dimensions.circularradius20),
                            topRight:
                                Radius.circular(Dimensions.circularradius20))),
                    child: Center(
                        child: Text(
                      recommendedprod.recommendedproductlist[id].name,
                      style: TextStyle(
                          fontSize: Dimensions.fontsize25,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown.shade300),
                    )),
                  ),
                ),
                pinned: true,
                backgroundColor: AppColors.maincolor,
                expandedHeight: Dimensions.height250,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image(
                    image: NetworkImage(
                        recommendedprod.recommendedproductlist[id].img),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width_20,
                        right: Dimensions.width_15,
                        top: Dimensions.width10),
                    child: Columnstructure(
                      text: recommendedprod
                          .recommendedproductlist[id].description,
                          
                    )),
              )
            ],
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: Dimensions.height50,
                decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.width20),
                        topRight: Radius.circular(Dimensions.width20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(
                          start: Dimensions.width_10),
                      height: Dimensions.height30,
                      width: Dimensions.width_17,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.height40),
                        color: Colors.white,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          popularprod.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: Colors.black,
                          size: Dimensions.width30,
                        ),
                      ),
                    ),
                    Text(
                      "\$ ${recommendedprod.recommendedproductlist[id].price.toString()} X ${popularprod.incartitem}",
                      style: TextStyle(
                        color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.fontsize20),
                    ),
                    Container(
                      margin:
                          EdgeInsetsDirectional.only(end: Dimensions.width_10),
                      height: Dimensions.height30,
                      width: Dimensions.width_17,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.circularradius20),
                        color: Colors.white,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          popularprod.setQuantity(true);
                        },
                        child: Icon(
                          Icons.add,
                          size: Dimensions.height30,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: Dimensions.width20),
                height: Dimensions.height60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: Dimensions.height50,
                        width: Dimensions.width_30,
                        decoration: BoxDecoration(
                          color: AppColors.maincolor,
                          borderRadius: BorderRadius.circular(
                              Dimensions.circularradius20),
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        )),
                    GestureDetector(
                      onTap: () {
                        popularprod.addItem(product);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsetsDirectional.only(
                            end: Dimensions.edgeinsertltrb20),
                        height: Dimensions.height50,
                        width: Dimensions.width_100,
                        decoration: BoxDecoration(
                            color: AppColors.maincolor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "${recommendedprod.recommendedproductlist[id].price * popularprod.incartitem} | Add to Cart",
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
            ],
          ),
        );
      });
    });
  }
}
