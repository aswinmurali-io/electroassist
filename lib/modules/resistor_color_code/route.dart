import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:electroassist/modules/resistor_color_code/definitions.dart';
import 'package:electroassist/shared/widgets/chip_selector.dart';
import 'package:electroassist/shared/widgets/navigator_pop_fab.dart';
import 'package:electroassist/shared/components/module.dart';
import 'package:electroassist/shared/widgets/module_tile.dart';

class ResistorColorCodePage extends StatelessWidget with Module {
  @override
  get name => 'Resistor Color Code';

  @override
  get description => 'Find the value of resistance from the color codes.';

  @override
  get style => ModuleTileStyle(
        avatorColor: Color(0xff8f94fb),
        image: Icon(
          Icons.ac_unit,
          color: Colors.white,
        ),
        textStyle: TextStyle(
          color: Colors.white,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff4e54c8),
            Color(0xff8f94fb),
          ],
        ),
      );

  static final colors = [
    Colors.black,
    Colors.brown,
    Colors.red,
  ];

  const ResistorColorCodePage({Key? key}) : super(key: key);

  @override
  build(context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.blueGrey.shade50,
          ],
        ),
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: ChangeNotifierProvider.value(
              value: ResistorColorCodeViewModel(),
              builder: (_, __) => _ResistorColorCodeView(),
            ),
          ),
        ),
        floatingActionButton: const NavigatorPopFloatingActionButton(
          tooltip: 'Back to dashboard',
        ),
      ),
    );
  }
}

class _ResistorColorCodeView extends StatelessWidget {
  const _ResistorColorCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 10),
          child: Text("Resistor Calculator"),
        ),
        Text("RESISTOR IMAGE HERE"),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            "Band selection",
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ChipSelector<ResistorBandType>(
          initialValue: ResistorBandType.fourBand,
          items: [
            for (final type in ResistorBandType.values)
              ChipSelectorItem(
                value: type,
                itemBuilder: (context, isSelected, selectItem) {
                  return ElevatedButton(
                    child: Text('${type.bandsCount} Band'),
                    onPressed: selectItem,
                  );
                },
              ),
          ],
        ),
      ],
    );
  }
}
