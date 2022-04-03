import 'package:flutter/material.dart';

// This widget is just to demo how we can use the data from the database.
// Please do not actually use this as it is right now.
class VocabCard extends StatefulWidget {
  final String term;
  final String definition;

  const VocabCard({Key? key, required this.term, required this.definition})
      : super(key: key);

  @override
  _VocabCardState createState() => _VocabCardState();
}

class _VocabCardState extends State<VocabCard> {
  var isTerm = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isTerm = !isTerm),
      child: SizedBox(
        width: 200,
        height: 200,
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Text(isTerm ? widget.term : widget.definition),
        ),
      ),
    );
  }
}
