import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/controllers.dart';
import '../constants/style.dart';
import '../helpers/responsiveness.dart';
import '../widgets/custom_text.dart';

class RidesBookedPage extends StatefulWidget {
  const RidesBookedPage({Key key}) : super(key: key);

  @override
  State<RidesBookedPage> createState() => _RidesBookedPageState();
}

class _RidesBookedPageState extends State<RidesBookedPage> {
  DateTime _dateTime = DateTime(25, 03, 2022, 6, 51);

  bool isVisible = false;

  final DataTableSource dataTableSource = MyData();

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: buildFromToDate(),
        ),
        Expanded(
            child: ListView(
          children: [
            // buildDriverShimmer()
            if (isVisible) buildRidesBookedTable()
          ],
        )),
      ],
    );
  }

  buildFromToDate() {
    return Column(
      children: [
        Row(
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Text('Today',
                    style: TextStyle(fontSize: 15, color: green))),
            Container(
              width: 1,
              height: 30,
              color: Colors.black,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Text('Yesterday',
                    style: TextStyle(fontSize: 15, color: green))),
          ],
        ),
        Row(
          children: [
            const Text('From :', style: TextStyle(fontSize: 15)),
            TextButton(
                onPressed: () {
                  pickDateTime();
                },
                child: Text(
                  '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
                  style: TextStyle(fontSize: 15, color: green),
                )),
            Container(
              width: 1,
              height: 30,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            const Text('To :', style: TextStyle(fontSize: 15)),
            TextButton(
                onPressed: () {
                  pickDateTime();
                },
                child: Text(
                  '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
                  style: TextStyle(fontSize: 15, color: green),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: green),
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        )
      ],
    );
  }

  Future pickDateTime() async {
    DateTime date = await pickDate();
    if (date == null) return;

    final dateTime = DateTime(date.day, date.month, date.year);

    setState(() {
      _dateTime = dateTime;
    });
  }

  Future<DateTime> pickDate() => showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2021),
      lastDate: DateTime(2100));

  buildRidesBookedTable() {
    return PaginatedDataTable(
      columns: [
        DataColumn(
            label: Text('Id', style: TextStyle(fontSize: 15, color: green))),
        DataColumn(
            label: Text('Name', style: TextStyle(fontSize: 15, color: green))),
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
        DataColumn(
            label:
                Text('Status', style: TextStyle(fontSize: 15, color: green))),
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
            "pickup": "Coimbatore",
            "drop": "thiruvarur",
            "package": "rental",
            "hours": "2 hours",
            "cab": "sedan",
            "km": "300",
            "fare": "6000",
            "pickupdate": "31/12/2022",
            "dropdate": "01/01/2023",
            "status": "Completed"
          });

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index]["id"].toString())),
      DataCell(Text(data[index]["name"])),
      DataCell(Text(data[index]["pickup"])),
      DataCell(Text(data[index]["drop"])),
      DataCell(Text(data[index]["package"])),
      DataCell(Text(data[index]["hours"])),
      DataCell(Text(data[index]["cab"])),
      DataCell(Text(data[index]["km"])),
      DataCell(Text(data[index]["fare"])),
      DataCell(Text(data[index]["pickupdate"])),
      DataCell(Text(data[index]["dropdate"])),
      DataCell(Text(data[index]["status"])),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
