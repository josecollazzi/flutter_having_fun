import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:layout2/features/layout/presentation/adaptative_widget.dart';
import 'package:layout2/features/layout/presentation/column_widget.dart';
import 'package:layout2/routing/routes.dart';

enum Sections{safeArea, columns, adaptative}

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}


class _LayoutScreenState extends State<LayoutScreen> {
  Sections _section = Sections.safeArea;

  void back() {
    setState(() {
      _section = Sections.safeArea;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(_section) {
      case Sections.columns:
        return ColumnWidget(back: back,);
      case Sections.adaptative:
        return AdaptativeWidget(back: back,);
      default:
        //ignore
    }

    final mediaQuery = MediaQuery.of(context);
    final totalHeight = mediaQuery.size.height;
    final safeHeight = totalHeight - mediaQuery.padding.top - mediaQuery.padding.bottom;

    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black12,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 40),
                  child: Text("The white section indicates the screen space occupied by the phone’s system elements rather than the app itself."),
                ),
                Text("The height outside of safeArea"),
                Text("${MediaQuery.of(context).size.height}"),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text("The height inside safeArea"),
                ),
                Text("$safeHeight"),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: OutlinedButton(onPressed: ()=> setState(() => _section = Sections.columns), child: Text("Columns")),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: OutlinedButton(onPressed: ()=> setState(() => _section = Sections.adaptative), child: Text("Adaptative")),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: OutlinedButton(onPressed: ()=> context.goNamed(Routes.basketName), child: Text("Go basket")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
