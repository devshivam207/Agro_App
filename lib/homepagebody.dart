import 'package:betting_app/colors.dart';
import 'package:betting_app/dimensions.dart';
import 'package:betting_app/models/popular_product_controller.dart';
import 'package:betting_app/models/products.dart';
import 'package:betting_app/models/recommended_product_controller.dart';
import 'package:betting_app/recommendediteminfo.dart';
import 'package:betting_app/slideriteminfo.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  PageController pageController = PageController(viewportFraction: 1);
  var _currentvalue = 0.0;
  bool tapslider = false;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentvalue = pageController.page ?? 0.0;
      });
    });
  }

//shows the number of sliders
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          GetBuilder<PopularProductsController>(
            builder: (popularproduct) {
              return popularproduct.isLoaded
                  ? SizedBox(
                      height: Dimensions.pageView,
                      child: PageView.builder(
                          controller: pageController,
                          itemCount: popularproduct.popularProductList.length,
                          itemBuilder: (context, position) {
                            return _buildPageItems(position,
                                popularproduct.popularProductList[position]);
                          }),
                    )
                  : const CircularProgressIndicator(
                      color: AppColors.maincolor,
                    );
            },
          ),
          GetBuilder<PopularProductsController>(builder: (popularproduct) {
            return DotsIndicator(
              dotsCount: popularproduct.popularProductList.isEmpty
                  ? 1
                  : popularproduct.popularProductList.length,
              position: _currentvalue,
              decorator: DotsDecorator(
                activeColor: AppColors.maincolor,
                size: Size.square(Dimensions.height5),
                activeSize: Size(Dimensions.iconsize9, Dimensions.height5),
                activeShape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.circularradius20)),
              ),
            );
          }),
          Container(
            padding: EdgeInsets.fromLTRB(
                Dimensions.width_15, 0, Dimensions.width_15, 0),
            height: Dimensions.height50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Seeds",
                  style: TextStyle(
                    color: AppColors.maincolor,
                    fontSize: Dimensions.fontsize14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Fertilizer",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: Dimensions.fontsize14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Tools",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: Dimensions.fontsize14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          GetBuilder<RecommendedProductController>(builder: ((recommendedprod) {
            return recommendedprod.isLoaded
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: recommendedprod.recommendedproductlist.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) =>
                                  RecommendedItemInfo(id: index))))
                        },
                        child: Card(
                          color: Colors.white,
                          margin: EdgeInsets.only(
                              left: Dimensions.width_5,
                              right: Dimensions.width_5,
                              bottom: Dimensions.width_5),
                          child: Container(
                            margin: EdgeInsets.only(
                              top: Dimensions.margin10,
                              bottom: Dimensions.margin10,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                Container(
                                  width: Dimensions.width100,
                                  height: Dimensions.height100,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                    Dimensions.circularradius20,
                                  )),
                                  child: Image.network(
                                    recommendedprod
                                        .recommendedproductlist[index].img,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                Expanded(
                                  child: Container(
                                    height: Dimensions.height40 * 2,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(
                                                Dimensions.circularradius20),
                                            bottomRight: Radius.circular(
                                                Dimensions.circularradius20))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          recommendedprod
                                              .recommendedproductlist[index]
                                              .name,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Dimensions.fontsize17,
                                          ),
                                        ),
                                        Text(
                                          recommendedprod
                                              .recommendedproductlist[index]
                                              .company,
                                          style: TextStyle(
                                              fontSize: Dimensions.fontsize14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.brown),
                                        ),
                                        SizedBox(height: Dimensions.height5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.orangeAccent,
                                              size: Dimensions.iconsize16,
                                            ),
                                            Text(
                                              ' ${recommendedprod.recommendedproductlist[index].location}  Km',
                                              textScaleFactor: 0.97,
                                              style: const TextStyle(
                                                  color: Colors.black38),
                                            ),
                                            SizedBox(
                                              width: Dimensions.width7,
                                            ),
                                            Icon(
                                              Icons.access_time_rounded,
                                              color: Colors.orangeAccent,
                                              size: Dimensions.iconsize15,
                                            ),
                                            const Text(
                                              " 2 days",
                                              textScaleFactor: 0.97,
                                              style: TextStyle(
                                                  color: Colors.black38),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const CircularProgressIndicator(
                    color: AppColors.maincolor,
                  );
          }))
        ],
      ),
    );
  }

//shows the slider's content
  Widget _buildPageItems(int index, ProductModel popularProd) {
    return Stack(children: [
      Container(
        height: Dimensions.pageViewController,
        margin: EdgeInsets.fromLTRB(
            Dimensions.width_7,
            Dimensions.edgeinsertltrb20,
            Dimensions.width_7,
            Dimensions.edgeinsertltrb5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.circularradius25),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(popularProd.img!),
            )),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: Dimensions.pageViewTextController,
          margin: EdgeInsets.fromLTRB(
              Dimensions.width_20,
              Dimensions.edgeinsertltrb20,
              Dimensions.width_20,
              Dimensions.edgeinsertltrb20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.circularradius25),
              boxShadow: const [
                BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)),
                BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                BoxShadow(color: Colors.white, offset: Offset(5, 0))
              ]),
          child: Container(
            padding: EdgeInsets.fromLTRB(
                0, Dimensions.edgeinsertltrb15, 0, Dimensions.edgeinsertltrb17),
            child: InkWell(
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => SliderInfo(id: index))))
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    popularProd.name.toString(),
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        popularProd.star.toString(),
                        style: const TextStyle(color: Colors.black54),
                      ),
                      SizedBox(width: Dimensions.width_10),
                      const Text(
                        "1457 comments",
                        textScaleFactor: 0.9,
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle_sharp,
                        color: Colors.orangeAccent,
                        size: Dimensions.iconsize15,
                      ),
                      const Text(
                        " Normal",
                        style: TextStyle(color: Colors.black38),
                      ),
                      SizedBox(
                        width: Dimensions.width5,
                      ),
                      Icon(
                        Icons.location_on,
                        color: Colors.orangeAccent,
                        size: Dimensions.iconsize16,
                      ),
                      const Text(
                        "3.8km",
                        style: TextStyle(color: Colors.black38),
                      ),
                      SizedBox(
                        width: Dimensions.width7,
                      ),
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.orangeAccent,
                        size: Dimensions.iconsize16,
                      ),
                      const Text(
                        " 2 days",
                        style: TextStyle(color: Colors.black38),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
