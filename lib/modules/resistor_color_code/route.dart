import 'package:electroassist/modules/resistor_color_code/definitions.dart';
import 'package:electroassist/shared/widgets/chip_selector.dart';
import 'package:electroassist/shared/widgets/navigator_pop_fab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResistorColorCodePage extends StatelessWidget {
  const ResistorColorCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        floatingActionButton: NavigatorPopFloatingActionButton(
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
      mainAxisAlignment: MainAxisAlignment.center,
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
