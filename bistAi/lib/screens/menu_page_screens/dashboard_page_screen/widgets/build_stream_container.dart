import 'package:flutter/material.dart';

import '../../../../constants/color.dart';

class BuildStreamContainer extends StatefulWidget {
  final String label;
  final Stream<String> stream;

  BuildStreamContainer({
    required this.label,
    required this.stream,
    Key? key,
  }) : super(key: key);

  @override
  State<BuildStreamContainer> createState() => _BuildStreamContainerState();
}


class _BuildStreamContainerState extends State<BuildStreamContainer> {
  @override
  Widget build(BuildContext context) {
    String label=widget.label;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      padding: const EdgeInsets.all(15.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: finDarkIMColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey[600]!),
      ),
      child: StreamBuilder<String>(
        stream: widget.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildStreamText('$label: Loading...');
          } else if (snapshot.hasError) {
            return _buildStreamText('$label: Error');
          } else {
            return _buildStreamText('$label: ${snapshot.data}');
          }
        },
      ),
    );;
  }
  /// Stream Text Style
  Widget _buildStreamText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontFamily: "Poppins",
        fontStyle: FontStyle.italic,
        color: finTFColor,
      ),
    );
  }
}
