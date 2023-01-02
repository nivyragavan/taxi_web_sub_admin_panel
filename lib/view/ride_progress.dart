import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/controllers.dart';
import '../constants/style.dart';
import '../helpers/responsiveness.dart';
import '../widgets/custom_text.dart';

class RidesInProgressPage extends StatefulWidget {
  const RidesInProgressPage({Key key}) : super(key: key);

  @override
  State<RidesInProgressPage> createState() => _RidesInProgressPageState();
}

class _RidesInProgressPageState extends State<RidesInProgressPage> {
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
          Expanded(
              child: ListView(
            children: [
              //buildDriverShimmer()
              buildRidesProgressTable()
            ],
          )),
        ],
      ),
    );
  }

  buildRidesProgressTable() {
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
            "dropdate": "01/01/2023"
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
      DataCell(Text(data[index]["dropdate"]))
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
