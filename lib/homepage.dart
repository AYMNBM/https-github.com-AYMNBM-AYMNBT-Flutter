
import 'package:flutter/material.dart';
import 'custom_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Button Example')),
      body: Center(
        child: CustomButton(
          text: 'اضغط هنا',
          onPressed: () {
            // اكتب هنا ما تريد تنفيذه عند الضغط على الزر
          },
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          width: 200,
          height: 50,
          borderRadius: 10,
          icon: Icons.add,
        )
      ),
    );
  }
}

