import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/controllers.dart';
import '../constants/style.dart';
import '../helpers/responsiveness.dart';
import '../widgets/custom_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Obx(
            () => Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 20,
                      weight: FontWeight.bold,
                      color: green,
                    )),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Align(
            alignment: Alignment.topLeft,
            child: buildProfile(),
          ),
        ],
      ),
    );
  }

  buildProfile() {
    return SingleChildScrollView(
      child: Container(
        width: 500,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomText(
                    text: "Name :",
                    color: green,
                    weight: FontWeight.w900,
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    cursorColor: green,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: const OutlineInputBorder(),
                        hintText: "Enter your name",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green))),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomText(
                    text: "Phone Number :",
                    color: green,
                    weight: FontWeight.w900,
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    cursorColor: green,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: const OutlineInputBorder(),
                        hintText: "Enter your phone number",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green))),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomText(
                    text: "Email :",
                    color: green,
                    weight: FontWeight.w900,
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    cursorColor: green,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: const OutlineInputBorder(),
                        hintText: "Enter your email address",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green))),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomText(
                    text: "Password :",
                    color: green,
                    weight: FontWeight.w900,
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    cursorColor: green,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: const OutlineInputBorder(),
                        hintText: "Enter your password",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green))),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: green, padding: const EdgeInsets.all(15)),
                onPressed: () {},
                child: const Text(
                  "Update",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ))
          ],
        ),
      ),
    );
    // });
  }
}
