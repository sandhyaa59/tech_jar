import 'package:flutter/material.dart';
import 'package:tech_jar/utils/constants.dart';

class CommentCard extends StatelessWidget {
  final String? name;
  final String? body;

  const CommentCard({
    Key? key,
     this.name,
     this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue.shade50),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(kPadding),
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: Colors.white)],
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.blue.shade50),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name??"",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 6.0),
            Text(body??""),
            const SizedBox(height: 6.0),
          ],
        ),
      ),
    );
  }
}
