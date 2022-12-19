import 'package:ecommerce_api/providers/product_provider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widget/common_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {




  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProductProvider>(context, listen: false).getProductListData();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<ProductProvider>(context).productList;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'Product'
        ),
      ),
      body: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hey Riaz",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          color: Color.fromARGB(255, 226, 223, 223),
                          child: Stack(
                            children: [
                              Icon(
                                Icons.notifications_outlined,
                                color: Colors.black,
                                size: 30,
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(top: 5),
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffc32c37),
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Let's Shop",
                      style: TextStyle(color: Color.fromARGB(255, 128, 127, 127)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 8,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true, //<-- SEE HERE
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: 'Search Items',
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          flex: 1,
                          child: Container(
                              height: 58,
                              width: double.infinity,
                              decoration: BoxDecoration(color: Colors.black),
                              child: Icon(
                                Icons.multiple_stop,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                              fontSize: 20,
                              color:  Colors.blueGrey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 10,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: productList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            color:  Colors.blueGrey,
                            height: 150,
                            width: 100,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Image.network(
                                    productList[index].image!.isEmpty ? "" : imageUrl + productList[index].image.toString(),)

                                ),
                                Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${productList[index].name}",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ))
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trending Auctions",
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                              fontSize: 20,
                              color:  Colors.blueGrey,),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: productList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 17,
                          mainAxisSpacing: 17,
                          childAspectRatio: 1),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              // setState(() {
                              //   selectedGridItem = index;
                              // });
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blueGrey,
                                        ),
                                        child: Image.network(
                                          imageUrl + productList[index].image.toString(),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: FavoriteButton(
                                            isFavorite: false,
                                            iconSize: 40,
                                            iconDisabledColor: Colors.white,
                                            valueChanged: (_isFavorite) {}),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    height: 10,
                                    width: double.infinity,
                                    color: Color.fromARGB(255, 82, 82, 82),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${productList[index].name}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          "${productList[index].price![0].originalPrice}",
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ));
                      },
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
