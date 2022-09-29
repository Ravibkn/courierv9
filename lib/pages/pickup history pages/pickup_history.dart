// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_brace_in_string_interps
// ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:courierv9/pages/style_constent.dart';

import '../routs.dart';

class PickupHistory extends StatefulWidget {
  const PickupHistory({Key? key}) : super(key: key);

  @override
  State<PickupHistory> createState() => _PickupHistoryState();
}

class _PickupHistoryState extends State<PickupHistory> {
  List user = [];

  @override
  void initState() {
    super.initState();
    getAppData();
  }

  getAppData() async {
    var m_id = _myBox.get("m_id");

    var res = await http.post(
        Uri.parse(
            'https://booking.manishairexpress.com/rest_api_native/RestController.php'),
        body: {
          "view": "pickup_history_list",
          "user_id": m_id,
          "page": "1",
        });
    if (res.statusCode == 200) {
      var items = jsonDecode(res.body)["output"];
      print(items);
      setState(() {
        user = items;
      });
    } else {
      user = [];
    }
  }

  final _myBox = Hive.box('AppData');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Text(
            "Pickup History",
            style: mTextStyleHeader,
          ),
        )),
      ),
      body: getList(),
    );
  }

  Widget getList() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MyRouts.pickupawbhistoryrout,
        );
      },
      child: Card(
        color: Colors.grey.shade300,
        child: ListView.builder(
            itemCount: user.length,
            itemBuilder: (context, index) {
              return getCard(user[index]);
            }),
      ),
    );
  }

  Widget getCard(item) {
    var drs_unique_id = item['drs_unique_id'];
    var drs_date = item['drs_date'];
    return Card(
      color: Colors.grey.shade100,
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("${item['pickup_delivered']}/${item['total_awb']}"),
        ),
        title: Text("${drs_unique_id}"),
        subtitle: Text("${drs_date}"),
      ),
    );
  }
}
