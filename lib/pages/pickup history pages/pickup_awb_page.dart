// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, avoid_print, unnecessary_brace_in_string_interps
// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_brace_in_string_interps, non_constant_identifier_names, unused_local_variable, prefer_typing_uninitialized_variables, avoid_print, prefer_is_empty
// // https://booking.manishairexpress.com/rest_api_native/RestController.php
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:lottie/lottie.dart';
// import '../components/custom_button.dart';
// import '../global.dart';
// import '../routs.dart';

// class PickupAwbHistory extends StatefulWidget {
//   final Map<String, dynamic>? args;
//   const PickupAwbHistory(this.args, {Key? key}) : super(key: key);

//   @override
//   State<PickupAwbHistory> createState() => _PickupAwbHistoryState();
// }

// class _PickupAwbHistoryState extends State<PickupAwbHistory> {
//   List users = [];
//   var arguments;
//   @override
//   void initState() {
//     super.initState();
//     arguments = widget.args;

//     getAppData(arguments);
//   }

//   Future<void> getAppData(arguments) async {
//     try {
//       print(arguments['pickup_id']);
//       var res = await http.post(
//           Uri.parse('${baseUrl}rest_api_native/RestController.php'),
//           body: {
//             "view": "getAwbNumberForPickup",
//             "drs_unique_id": arguments['pickup_id'],
//             "page": "1",
//             "listType": "List"
//           });
//       if (res.statusCode == 200) {
//         var items = jsonDecode(res.body)['output'];
//         if (items[0]['error'] == 'No Record found!') {
//           users = [];
//         } else {
//           setState(() {
//             users = items;
//           });
//         }
//       } else {
//         users = [];
//       }
//     } catch (err) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("${err}")));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.cyan,
//           title: Padding(
//             padding: const EdgeInsets.only(right: 45.0),
//             child: Center(
//               child: Text(
//                 "Pickup Awb List",
//                 style: TextStyle(
//                   shadows: <Shadow>[
//                     Shadow(
//                       offset: Offset(2.0, 2.0),
//                       blurRadius: 3.0,
//                       color: Color.fromARGB(255, 0, 0, 0),
//                     ),
//                     Shadow(
//                       offset: Offset(2.0, 2.0),
//                       blurRadius: 8.0,
//                       color: Color.fromARGB(124, 94, 94, 107),
//                     ),
//                   ],
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: Container(
//                 margin: EdgeInsets.only(left: 10, right: 10, top: 10),
//                 height: 90,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                           blurRadius: 5, spreadRadius: .2, color: Colors.grey)
//                     ]),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         left: 8.0,
//                       ),
//                       child: Text(
//                         "View Direction Of All\nBellow Pickup Shipments\nin Google Map ",
//                         style: TextStyle(fontSize: 13),
//                       ),
//                     ),
//                     CustomButton(text: "Get Direction", onTap: () {})
//                   ],
//                 ),
//               ),
//             ),
//             users.length > 0
//                 ? getList()
//                 : Center(
//                     child: Lottie.asset("images/delavery.json",
//                         width: 150, height: 150),
//                   ),
//           ],
//         ));
//   }

//   Widget getList() {
//     if (users.length > 0) {
//       return ListView.builder(
//           itemCount: users.length,
//           itemBuilder: (context, index) {
//             return getCard(users[index]);
//           });
//     } else {
//       return Center(child: const Text('No items'));
//     }
//   }

//   Widget getCard(item) {
//     return Column(children: [
//       SizedBox(
//         height: 15,
//       ),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0, right: 10),
//         child: InkWell(
//           onTap: () {
//             Navigator.pushNamed(context, MyRouts.pickupDetailRout, arguments: {
//               "shipment_id": item['shipment_id'],
//               "unique_id": arguments['pickup_id']
//             });
//           },
//           child: Container(
//               height: 70,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [
//                     BoxShadow(
//                         blurRadius: 5, spreadRadius: .2, color: Colors.grey)
//                   ]),
//               child: Row(children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: Text("AWB No:"),
//                 ),
//                 Expanded(
//                   child: Divider(
//                     indent: 5.0,
//                     endIndent: 15,
//                     thickness: 1,
//                   ),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 10.0, right: 10),
//                       child: Text("${item['shipment_id']}",
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 10.0),
//                       child: Text("${item['drs_date']}"),
//                     )
//                   ],
//                 )
//               ])),
//         ),
//       )
//     ]);
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:courierv9/pages/routs.dart';
import 'package:courierv9/pages/style_constent.dart';
import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../global.dart';
import 'package:http/http.dart' as http;

class PickupAwbHistory extends StatefulWidget {
  final Map<String, dynamic>? args;
  const PickupAwbHistory(this.args, {Key? key}) : super(key: key);

  @override
  State<PickupAwbHistory> createState() => _PickupAwbHistoryState();
}

class _PickupAwbHistoryState extends State<PickupAwbHistory> {
  List dataList = [];
  var arguments;
  @override
  void initState() {
    super.initState();
    arguments = widget.args;

    getAppData(arguments);
  }

  Future<void> getAppData(arguments) async {
    try {
      print(arguments['pickup_id']);
      var res = await http.post(
          Uri.parse('${baseUrl}rest_api_native/RestController.php'),
          body: {
            "view": "getAwbNumberForPickup",
            "drs_unique_id": arguments['pickup_id'],
            "page": "1",
            "listType": "History"
          });
      if (res.statusCode == 200) {
        var items = jsonDecode(res.body)['output'];
        if (items[0]['error'] == 'No Record found!') {
          dataList = [];
        } else {
          setState(() {
            dataList = items;
          });
        }
      } else {
        dataList = [];
      }
    } catch (err) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${err}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Padding(
          padding: const EdgeInsets.only(right: 45.0),
          child: Center(
            child: Text("Pickup Awb List", style: mTextStyleHeader),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              height: 90,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5, spreadRadius: .2, color: Colors.grey)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Text(
                      "View Direction Of All\nBellow Pickup Shipments\nin Google Map ",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  CustomButton(text: "Get Direction", onTap: () {})
                ],
              ),
            ),
          ),
          getList()
        ],
      ),
    );
  }

  Widget getList() {
    return Expanded(
      child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return getCard(dataList[index]);
          }),
    );
  }

  Widget getCard(item) {
    return Column(children: [
      SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, MyRouts.pickupdetallHistoryrout,
                arguments: {
                  "shipment_id": item['shipment_id'],
                  "unique_id": arguments['pickup_id']
                });
          },
          child: Container(
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5, spreadRadius: .2, color: Colors.grey)
                  ]),
              child: Row(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("AWB No:"),
                ),
                Expanded(
                  child: Divider(
                    indent: 5.0,
                    endIndent: 15,
                    thickness: 1,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, right: 10),
                      child: Text("${item['shipment_id']}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text("${item['drs_date']}"),
                    )
                  ],
                )
              ])),
        ),
      )
    ]);
  }
}
