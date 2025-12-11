import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  final void Function() back;
  const ColumnWidget({required this.back, super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
          child: ListView(
            children: [
              Container(width: double.infinity,),
              Container(
                color: Colors.green,
                width: 200,
                height: 100,
                child: Row(
                    children: [
                      Expanded(
                          child: Container(width: 120, height: 100,color: Colors.orange,
                            child: Text("the container is too width"),)),
                      Expanded(
                        child: Container(width: 120, height: 100,color: Colors.blue,
                          child: Text("the container is also too width"),),
                      ),
                    ]
                ),
              ),
              Divider(height: 20,),
              Container(
                color: Colors.lime,
                width: 200,
                height: 100,
                child: ListView(
                  children: [
                    Text("item 1"),
                    Text("item 2"),
                    Text("item 3"),
                    Text("item 4"),
                    Text("item 5"),
                    Text("item 6"),
                    Text("item 7"),
                  ],
                ),
              ),
              Divider(height: 20,),
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.amber,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("item 1"),
                      Text("item 2"),
                      Text("item 3"),
                      Text("item 4"),
                      Text("item 5"),
                      Text("item 6"),
                      Text("item 7"),
                    ],
                  ),
                ),
              ),
              Divider(height: 20,),
              Container(
                color: Colors.deepPurpleAccent,
                height: 300,
                width: 300,
                child: CustomScrollView(
                  slivers: [
                    // --- SliverList ---
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Text("item 1"),
                        Text("item 2"),
                        Text("item 3"),
                        Text("item 4"),
                        Text("item 5"),
                        Text("item 6"),
                        Text("item 7"),
                      ]),
                    ),

                    SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                          return Container(
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: Text("Grid $index"),
                          );
                        },
                        childCount: 6,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,  // 3 columns
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 20,),
              OutlinedButton(onPressed: back, child: Text("Back Home"))
            ],
          )
      ),
    );
  }
}
