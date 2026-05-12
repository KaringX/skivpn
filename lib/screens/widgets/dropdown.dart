import 'package:flutter/material.dart';

class DropdownButtonEx<T> extends StatefulWidget {
  const DropdownButtonEx({
    super.key,
    required this.items,
    this.value,
    this.hint,
    required this.onChanged,
    this.menuWidth,
  });
  @override
  State<DropdownButtonEx<T>> createState() => _DropdownButtonExState();

  final List<DropdownMenuItem<T>>? items;
  final T? value;
  final Widget? hint;
  final ValueChanged<T?>? onChanged;
  final double? menuWidth;
}

class _DropdownButtonExState<T> extends State<DropdownButtonEx<T>> {
  T? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void didUpdateWidget(covariant DropdownButtonEx<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _value = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _value,
      items: widget.items,
      hint: widget.hint,
      onChanged: (value) {
        _value = value;
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
        setState(() {});
      },
    );
  }
}
