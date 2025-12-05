import 'package:flutter/material.dart';

class MicroTask extends StatefulWidget {
  const MicroTask({super.key});

  @override
  State<MicroTask> createState() => _MicroTaskState();
}

class _MicroTaskState extends State<MicroTask> {
  List<String> listItems = [];

  @override
  void initState() {
    super.initState();

    listItems.add("A");
    Future.delayed(Duration.zero, ()=> listItems.add("B"));
    Future.microtask(()=> listItems.add("C"));
    listItems.add("D");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: listItems.map((e)=> Text(e)).toList(),
      )
    );
  }
}
