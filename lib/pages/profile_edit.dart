// ignore_for_file: use_build_context_synchronously, avoid_print, unnecessary_brace_in_string_interps, non_constant_identifier_names, sort_child_properties_last, prefer_const_constructors, sized_box_for_whitespace

import 'dart:convert';

import 'package:courierv9/pages/components/custom_button.dart';
import 'package:courierv9/pages/global.dart';
import 'package:courierv9/pages/profile.dart';
import 'package:courierv9/pages/routs.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  void initState() {
    super.initState();
    passwordControlar = TextEditingController();
  }

  TextEditingController passwordControlar = TextEditingController();

  Future<void> moveTo(BuildContext context) async {
    try {
      var password = passwordControlar.text;
      var m_id = _myBox.get('m_id');
      if (_finalkey.currentState!.validate()) {
        final response = await http.post(
            Uri.parse('${baseUrl}rest_api_native/RestController.php'),
            body: {
              "view": "updatePassword",
              "password": password,
              "id": m_id,
              "confirm_password": confirmPassword,
            });
        if (response.statusCode == 200) {
          Navigator.pushNamed(context, MyRouts.loginRout);
          var resultData = jsonDecode(response.body)['output'];
          print(response.body);
          if (resultData[0]['error'] == 'No Record found!') {}
        }
      }
    } catch (err) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${err}")));
    }
  }

  final _finalkey = GlobalKey<FormState>();
  String password = "";
  String confirmPassword = "";
  final _myBox = Hive.box('AppData');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Form(
            key: _finalkey,
            child: Column(
              children: [
                CustomPaint(
                  child: Stack(
                    children: [
                      Container(
                        width: 400,
                        child: const Padding(
                          padding: EdgeInsets.only(top: 120),
                          child: CircleAvatar(
                            child: CircleAvatar(
                              backgroundColor: Colors.cyan,
                              radius: 55,
                            ),
                            backgroundColor: Colors.white,
                            radius: 60,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 210, top: 190),
                        child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 76, 187, 202)
                                .withOpacity(.50),
                            child: Icon(Icons.edit)),
                      )
                    ],
                  ),
                  painter: HeaderCurvedContainer(),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordControlar,
                  onChanged: (value) {
                    password = value;
                    print(password);
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    hintStyle:
                        const TextStyle(fontSize: 15.0, color: Colors.black54),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Input Some Text";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    confirmPassword = value;
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    hintStyle:
                        const TextStyle(fontSize: 15.0, color: Colors.black54),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "InPut Some Text";
                    } else if (value != password) {
                      return "Password Not Match";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    text: "Update",
                    onTap: () {
                      moveTo(context);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
