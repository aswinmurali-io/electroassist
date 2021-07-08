import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class ChipSelector extends StatefulWidget {
  final List<String> tabs;

  final int Function(int index) onSelected;

  ChipSelector({
    Key? key,
    required this.onSelected,
    required this.tabs,
  }) : super(key: key);

  @override
  createState() => _ChipSelectorState();
}

class _ChipSelectorState extends State<ChipSelector> {
  int _selectedIndex = 0;

  @override
  build(context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 2.4,
      children: List.generate(widget.tabs.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 130,
            child: BouncingWidget(
              onPressed: () => setState(() => _selectedIndex = index),
              child: ZoomIn(
                preferences: AnimationPreferences(
                  duration: Duration(milliseconds: 100),
                  offset: Duration(milliseconds: 200 + index * 50),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: _selectedIndex == index
                          ? [Colors.red, Colors.yellow]
                          : [Colors.blueGrey.shade50, Colors.white],
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.shade50,
                        offset: Offset(0, 3),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.label,
                          color: _selectedIndex == index
                              ? Colors.white
                              : Colors.blueGrey.shade400,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '${widget.tabs[index]}',
                          style: TextStyle(
                            color: _selectedIndex == index
                                ? Colors.white
                                : Colors.blueGrey.shade400,
                            fontWeight: _selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
