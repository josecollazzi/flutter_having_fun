import 'package:flutter/material.dart';

class AdaptativeWidget extends StatelessWidget {
  final void Function() back;
  const AdaptativeWidget({ required this.back, super.key});

  @override
  Widget build(BuildContext context) {
    final vertical = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("if your mobile is horizontal you should see a row, if it is vertical you should see a column"),
            Divider(height: 20,),
            Expanded(
              child: ListView.builder(
                scrollDirection: vertical ? Axis.vertical : Axis.horizontal,
                itemCount: 40,
                itemBuilder: (context, index) {
                  return Text("item ${index + 1}");
                },
              ),
            ),
            OutlinedButton(onPressed: back, child: Text("Back Home"))
          ],
        ),
      ),
    );
  }
}
