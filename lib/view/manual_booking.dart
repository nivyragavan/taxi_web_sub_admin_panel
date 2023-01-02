import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../constants/controllers.dart';
import '../constants/style.dart';
import '../helpers/responsiveness.dart';
import '../widgets/custom_text.dart';

class ManualBookingPage extends StatefulWidget {
  const ManualBookingPage({Key key}) : super(key: key);

  static const packageItems = ['Local', 'Rental', 'Outstation', 'Tour Package'];
  static const rentalItems = [
    '1 Hour',
    '2 Hours',
    '3 Hours',
    '4 Hours',
    '5 Hours'
  ];
  static const cabItems = ['Mini', 'Sedan', 'SUV'];

  @override
  State<ManualBookingPage> createState() => _ManualBookingPageState();
}

class _ManualBookingPageState extends State<ManualBookingPage> {
  final name = TextEditingController();
  final phone = TextEditingController();
  final pickup = TextEditingController();
  final drop = TextEditingController();
  final package = TextEditingController();
  final rental = TextEditingController();
  final cab = TextEditingController();
  final pickupDate = TextEditingController();
  final dropDate = TextEditingController();

  final box = GetStorage();

  final DataTableSource dataTableSource = MyData();

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
          Expanded(
              child: ListView(
            children: [
              if (!ResponsiveWidget.isSmallScreen(context))
                buildAddBookingLarge()
              else
                buildAddBookingSmall(),
              const SizedBox(height: 50),
              const Divider(thickness: 2),
              const SizedBox(height: 50),
              Text(
                'Booking List',
                style: TextStyle(
                    fontSize: 20, color: black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              buildManualBookingTable()
            ],
          ))
        ],
      ),
    );
  }

  buildAddBookingLarge() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Booking',
          style: TextStyle(
              fontSize: 20, color: black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: name,
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Name",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: phone,
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Phone Number",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: pickup,
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Pickup Location",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: drop,
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Drop Location",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                      cursorColor: green,
                      controller: package,
                      decoration: InputDecoration(
                        hintText: 'Select package',
                        contentPadding: const EdgeInsets.all(10),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 2)),
                      )),
                  suggestionsCallback: (pattern) {
                    return ManualBookingPage.packageItems.where((item) =>
                        item.toLowerCase().contains(pattern.toLowerCase()));
                  },
                  onSuggestionSelected: (String val) {
                    this.package.text = val;
                    print(val);
                  },
                  itemBuilder: (_, String item) {
                    return ListTile(
                      title: Text(item),
                    );
                  },
                  getImmediateSuggestions: true,
                  hideSuggestionsOnKeyboardHide: true,
                  hideOnEmpty: false,
                  noItemsFoundBuilder: (context) => const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('No item found'),
                      ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid district';
                    }
                    return null;
                  }),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                      cursorColor: green,
                      controller: rental,
                      decoration: InputDecoration(
                        hintText: 'Select rental hour',
                        contentPadding: const EdgeInsets.all(10),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 2)),
                      )),
                  suggestionsCallback: (pattern) {
                    return ManualBookingPage.rentalItems.where((item) =>
                        item.toLowerCase().contains(pattern.toLowerCase()));
                  },
                  onSuggestionSelected: (String val) {
                    this.rental.text = val;
                    print(val);
                  },
                  itemBuilder: (_, String item) {
                    return ListTile(
                      title: Text(item),
                    );
                  },
                  getImmediateSuggestions: true,
                  hideSuggestionsOnKeyboardHide: true,
                  hideOnEmpty: false,
                  noItemsFoundBuilder: (context) => const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('No item found'),
                      ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid district';
                    }
                    return null;
                  }),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                      cursorColor: green,
                      controller: cab,
                      decoration: InputDecoration(
                        hintText: 'Select cab',
                        contentPadding: const EdgeInsets.all(10),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 2)),
                      )),
                  suggestionsCallback: (pattern) {
                    return ManualBookingPage.cabItems.where((item) =>
                        item.toLowerCase().contains(pattern.toLowerCase()));
                  },
                  onSuggestionSelected: (String val) {
                    this.cab.text = val;
                    print(val);
                  },
                  itemBuilder: (_, String item) {
                    return ListTile(
                      title: Text(item),
                    );
                  },
                  getImmediateSuggestions: true,
                  hideSuggestionsOnKeyboardHide: true,
                  hideOnEmpty: false,
                  noItemsFoundBuilder: (context) => const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('No item found'),
                      ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid district';
                    }
                    return null;
                  }),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Row(
                children: [
                  Text('Total Kms :',
                      style: TextStyle(fontSize: 15, color: green)),
                  Text('100', style: TextStyle(fontSize: 15, color: black)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Text('Total Fare :',
                      style: TextStyle(fontSize: 15, color: green)),
                  Text('2000', style: TextStyle(fontSize: 15, color: black)),
                ],
              ),
            ),
            Expanded(
              child: TextFormField(
                  controller: pickupDate,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: green, width: 2)),
                      hintText: 'Enter pickup date'),
                  readOnly: true,
                  onTap: () async {
                    DateTime pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        pickupDate.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid expiry date';
                    }
                    return null;
                  }),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                  controller: dropDate,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: green, width: 2)),
                      hintText: 'Enter drop date'),
                  readOnly: true,
                  onTap: () async {
                    DateTime pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      print(pickedDate);
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      print(formattedDate);

                      setState(() {
                        dropDate.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid expiry date';
                    }
                    return null;
                  }),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: green),
              // onPressed: () async {
              //   var data = await APIService().createManualBooking(
              //       name.text,
              //       phone.text,
              //       pickup.text,
              //       drop.text,
              //       package.text,
              //       rental.text,
              //       cab.text,
              //       pickupDate.text,
              //       dropDate.text);
              //   if (data['success'] == true) {
              //     box.write("token", data["token"]);
              //     print('success');
              //   } else {
              //     print('failed');
              //     return null;
              //   }
              // },
              onPressed: () {},
              child: Container(
                width: MediaQuery.of(context).size.width * 0.20,
                height: 45,
                padding: const EdgeInsets.all(10),
                child: const Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )),
        ),
      ],
    );
  }

  buildAddBookingSmall() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Booking',
          style: TextStyle(
              fontSize: 20, color: black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: name,
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Name",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: phone,
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Phone Number",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: pickup,
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Pickup Location",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: drop,
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Drop Location",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                      cursorColor: green,
                      controller: package,
                      decoration: InputDecoration(
                        hintText: 'Select package',
                        contentPadding: const EdgeInsets.all(10),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 2)),
                      )),
                  suggestionsCallback: (pattern) {
                    return ManualBookingPage.packageItems.where((item) =>
                        item.toLowerCase().contains(pattern.toLowerCase()));
                  },
                  onSuggestionSelected: (String val) {
                    this.package.text = val;
                    print(val);
                  },
                  itemBuilder: (_, String item) {
                    return ListTile(
                      title: Text(item),
                    );
                  },
                  getImmediateSuggestions: true,
                  hideSuggestionsOnKeyboardHide: true,
                  hideOnEmpty: false,
                  noItemsFoundBuilder: (context) => const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('No item found'),
                      ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid district';
                    }
                    return null;
                  }),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                      cursorColor: green,
                      controller: rental,
                      decoration: InputDecoration(
                        hintText: 'Select rental hour',
                        contentPadding: const EdgeInsets.all(10),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 2)),
                      )),
                  suggestionsCallback: (pattern) {
                    return ManualBookingPage.rentalItems.where((item) =>
                        item.toLowerCase().contains(pattern.toLowerCase()));
                  },
                  onSuggestionSelected: (String val) {
                    this.rental.text = val;
                    print(val);
                  },
                  itemBuilder: (_, String item) {
                    return ListTile(
                      title: Text(item),
                    );
                  },
                  getImmediateSuggestions: true,
                  hideSuggestionsOnKeyboardHide: true,
                  hideOnEmpty: false,
                  noItemsFoundBuilder: (context) => const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('No item found'),
                      ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid district';
                    }
                    return null;
                  }),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                      cursorColor: green,
                      controller: cab,
                      decoration: InputDecoration(
                        hintText: 'Select cab',
                        contentPadding: const EdgeInsets.all(10),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 2)),
                      )),
                  suggestionsCallback: (pattern) {
                    return ManualBookingPage.cabItems.where((item) =>
                        item.toLowerCase().contains(pattern.toLowerCase()));
                  },
                  onSuggestionSelected: (String val) {
                    this.cab.text = val;
                    print(val);
                  },
                  itemBuilder: (_, String item) {
                    return ListTile(
                      title: Text(item),
                    );
                  },
                  getImmediateSuggestions: true,
                  hideSuggestionsOnKeyboardHide: true,
                  hideOnEmpty: false,
                  noItemsFoundBuilder: (context) => const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('No item found'),
                      ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid district';
                    }
                    return null;
                  }),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Text('Total Kms :',
                      style: TextStyle(fontSize: 15, color: green)),
                  const SizedBox(width: 10),
                  Text('100', style: TextStyle(fontSize: 15, color: black)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Text('Total Fare :',
                      style: TextStyle(fontSize: 15, color: green)),
                  const SizedBox(width: 10),
                  Text('2000', style: TextStyle(fontSize: 15, color: black)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                  controller: pickupDate,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: green, width: 2)),
                      hintText: 'Enter pickup date'),
                  readOnly: true,
                  onTap: () async {
                    DateTime pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        pickupDate.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid expiry date';
                    }
                    return null;
                  }),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                  controller: dropDate,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: green, width: 2)),
                      hintText: 'Enter drop date'),
                  readOnly: true,
                  onTap: () async {
                    DateTime pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      print(pickedDate);
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      print(formattedDate);

                      setState(() {
                        dropDate.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid expiry date';
                    }
                    return null;
                  }),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: green, fixedSize: const Size(200, 45)),
            // onPressed: () async {
            //   var data = await APIService().createManualBooking(
            //       name.text,
            //       phone.text,
            //       pickup.text,
            //       drop.text,
            //       package.text,
            //       rental.text,
            //       cab.text,
            //       pickupDate.text,
            //       dropDate.text);
            //   if (data['success'] == true) {
            //     box.write("token", data["token"]);
            //     print('success');
            //   } else {
            //     print('failed');
            //     return null;
            //   }
            // },
            onPressed: () {},
            child: const Center(
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  buildManualBookingTable() {
    return PaginatedDataTable(
      columns: [
        DataColumn(
            label: Text('Id', style: TextStyle(fontSize: 15, color: green))),
        DataColumn(
            label: Text('Name', style: TextStyle(fontSize: 15, color: green))),
        DataColumn(
            label:
                Text('Number', style: TextStyle(fontSize: 15, color: green))),
        DataColumn(
            label:
                Text('Pickup', style: TextStyle(fontSize: 15, color: green))),
        DataColumn(
            label: Text('Drop', style: TextStyle(fontSize: 15, color: green))),
        DataColumn(
            label:
                Text('Package', style: TextStyle(fontSize: 15, color: green))),
        DataColumn(
            label: Text('Rental Hour',
                style: TextStyle(fontSize: 15, color: green))),
        DataColumn(
            label: Text('Cab', style: TextStyle(fontSize: 15, color: green))),
        DataColumn(
            label: Text('KM', style: TextStyle(fontSize: 15, color: green))),
        DataColumn(
            label: Text('Price', style: TextStyle(fontSize: 15, color: green))),
        DataColumn(
            label: Text('Pickup Date',
                style: TextStyle(fontSize: 15, color: green))),
        DataColumn(
            label: Text('Drop Date',
                style: TextStyle(fontSize: 15, color: green))),
      ],
      source: dataTableSource,
      columnSpacing: 30,
      horizontalMargin: 40,
      arrowHeadColor: green,
    );
  }
}

class MyData extends DataTableSource {
  final List<Map<String, dynamic>> data = List.generate(
      20,
      (index) => {
            "id": index + 1,
            "name": "Nivy",
            "number": "6382136965",
            "pickup": "Coimbatore",
            "drop": "thiruvarur",
            "package": "rental",
            "hours": "2 hours",
            "cab": "sedan",
            "km": "300",
            "fare": "6000",
            "pickupdate": "31/12/2022",
            "dropdate": "01/01/2023"
          });

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index]["id"].toString())),
      DataCell(Text(data[index]["name"])),
      DataCell(Text(data[index]["number"])),
      DataCell(Text(data[index]["pickup"])),
      DataCell(Text(data[index]["drop"])),
      DataCell(Text(data[index]["package"])),
      DataCell(Text(data[index]["hours"])),
      DataCell(Text(data[index]["cab"])),
      DataCell(Text(data[index]["km"])),
      DataCell(Text(data[index]["fare"])),
      DataCell(Text(data[index]["pickupdate"])),
      DataCell(Text(data[index]["dropdate"])),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
