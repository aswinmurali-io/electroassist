import 'package:electroassist/shared/widgets/module_tile.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
              page: Dashboard(),
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
