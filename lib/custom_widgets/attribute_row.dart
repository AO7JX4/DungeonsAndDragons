import 'package:flutter/material.dart';

class AttributeRow extends StatefulWidget {

  final String attribute;
  final int base;
  final VoidCallback action;

  const AttributeRow({super.key, required this.attribute, required this.base, required this.action});

  @override
  State<AttributeRow> createState() => _AttributeRowState();
}

class _AttributeRowState extends State<AttributeRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex:10,child: Icon(Icons.icecream)),
        Expanded(flex:20,child: Text(widget.attribute)),
        Expanded(flex:55,child: Container()), //TODO FIX EMPTY CONTAINER
        Expanded(flex:5,child: Text(widget.base.toString())),
        Expanded(flex:10,child: GestureDetector(onTap: widget.action,child: const Icon(Icons.add))),
      ],
    );
  }
}
