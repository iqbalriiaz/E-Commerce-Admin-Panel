import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/order_provider.dart';
import '../../widget/common_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    // TODO: implement initState

    Provider.of<OrderProvider>(context, listen: false).getOrderListData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<OrderProvider>(context).orderList;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Order'),
      ),
      body: orderList.isEmpty
          ? spinKit
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: orderList.length,
                      itemBuilder: (context, index) {
                        var orderStatusId = orderList[index]
                            .orderStatus!
                            .orderStatusCategory!
                            .id;
                        return Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 15, left: 15, right: 15, bottom: 15),
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey.shade100,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ), //Offset
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 100,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.blueGrey.shade300,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  20.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  offset: Offset(0, 5),
                                                  blurRadius: 10,
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                                child: Text(
                                                  orderList[index]
                                                      .user!.name
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16
                                                  ),
                                                )),
                                          ),),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Order ID"),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    height: 36,
                                                    width: 88,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black12,
                                                          offset: Offset(0, 5),
                                                          blurRadius: 10,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      orderList[index]
                                                          .id
                                                          .toString(),
                                                    )),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Order Status"),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  orderStatusId == 1
                                                      ? Container(
                                                          height: 36,
                                                          width: 88,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.amber,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .black12,
                                                                offset: Offset(
                                                                    0, 5),
                                                                blurRadius: 10,
                                                              ),
                                                            ],
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                                  'Pending')),
                                                        )
                                                      : orderStatusId == 3
                                                          ? Container(
                                                              height: 36,
                                                              width: 88,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .lightBlue,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .black12,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            5),
                                                                    blurRadius:
                                                                        10,
                                                                  ),
                                                                ],
                                                              ),
                                                              child: Center(
                                                                  child: Text(
                                                                      'Ready')),
                                                            )
                                                          : Container(
                                                              height: 36,
                                                              width: 88,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .lightGreen,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .black12,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            5),
                                                                    blurRadius:
                                                                        10,
                                                                  ),
                                                                ],
                                                              ),
                                                              child: Center(
                                                                  child: Text(
                                                                      'Delivered')),
                                                            )
                                                ],
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
    );
  }
}
