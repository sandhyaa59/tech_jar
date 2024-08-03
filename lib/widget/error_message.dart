import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String? message;

  const ErrorMessageWidget({Key? key,  this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.red[100],
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.red, width: 1.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
          const    Icon(
                Icons.error_outline,
                color: Colors.red,
              ),
         const     SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  message??"",
                  style: TextStyle(
                    color: Colors.red[800],
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
