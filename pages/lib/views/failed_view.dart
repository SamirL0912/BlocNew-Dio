import 'package:flutter/material.dart';

class FailedView extends StatelessWidget {
  const FailedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error, size: 60, color: Colors.red),
          SizedBox(height: 12),
          Text(
            "Error",
            style: TextStyle(fontSize: 24, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
