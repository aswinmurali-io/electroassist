import 'package:flutter/material.dart';

class ChipSelectorItem<T> {
  const ChipSelectorItem({
    required this.value,
    required this.itemBuilder,
  });

  final T value;

  final Widget Function(
    BuildContext context,
    bool isSelected,
    VoidCallback selectCallback,
  ) itemBuilder;
}

class ChipSelector<T> extends StatefulWidget {
  ChipSelector({
    Key? key,
    required this.initialValue,
    required this.items,
    this.onChanged,
  })  : assert(items.isNotEmpty, "Atleast one item shall be present"),
        super(key: key);

  final List<ChipSelectorItem<T>> items;

  final T initialValue;

  final ValueChanged<T>? onChanged;

  @override
  createState() => _ChipSelectorState<T>();
}

class _ChipSelectorState<T> extends State<ChipSelector<T>> {
  late T value;

  @override
  initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  build(context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final item in widget.items)
          item.itemBuilder(
            context,
            item.value == value,
            () {
              setState(() => value = item.value);
              widget.onChanged?.call(value);
            },
          ),
      ],
    );
  }
}
