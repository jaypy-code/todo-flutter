import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/empty-state.png')),
          SizedBox(height: 50),
          Text(
            'No action to do !',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Add new action to start your day.',
            style: TextStyle(color: Colors.grey[700]),
          )
        ],
      ),
    );
  }
}
