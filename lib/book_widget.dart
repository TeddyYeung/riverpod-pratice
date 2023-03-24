import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  final String title;
  final String description;

  const BookWidget({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(Icons.book_rounded),
          SizedBox(
            width: 16,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${title}\n",
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: description,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}