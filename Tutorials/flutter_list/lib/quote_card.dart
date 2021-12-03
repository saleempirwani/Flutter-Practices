import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function onDelete;

  QuoteCard({Key? key, required this.quote, required this.onDelete})
      : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(quote.text),
            Text(quote.author),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () => onDelete(),
                    icon: const Icon(Icons.delete)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
