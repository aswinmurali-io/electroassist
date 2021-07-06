import 'package:electroassist/shared/widgets/module_tile.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Electro Assist"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ModuleTile(
              avatorColor: Colors.white,
              title: 'Some title',
              page: DashboardPage(),
              icon: Icon(Icons.ac_unit),
              description: 'Some info',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
