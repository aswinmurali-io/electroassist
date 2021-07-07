import 'package:electroassist/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResistorColorCodePage extends StatefulWidget {
  const ResistorColorCodePage({Key? key}) : super(key: key);

  @override
  createState() => _ResistorColorCodePageState();
}

class _ResistorColorCodePageState extends State<ResistorColorCodePage> {
  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ElectroAssist.appName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("RESISTOR IMAGE HERE"),
                CupertinoScrollbar(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: DataTable(
                      headingRowColor:
                          MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.08);
                        return null; // Use the default value.
                      }),
                      columns: [
                        DataColumn(label: Text("1st Digit")),
                        DataColumn(label: Text("2nd Digit")),
                        DataColumn(label: Text("3rd Digit")),
                        DataColumn(label: Text("Multipiler")),
                        DataColumn(label: Text("Tolerance")),
                        DataColumn(label: Text("Temp Coeff")),
                      ],
                      rows: [
                        DataRow(cells: [
                          for (int i = 0; i < 6; i++) DataCell(Text("--")),
                        ]),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
