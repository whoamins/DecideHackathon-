import 'package:decide_hackathon/screens/add_product_screen.dart';
import 'package:flutter/material.dart';

class MainPageScreen extends StatefulWidget {
  @override
  _MainPageScreenState createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  Widget _buildTask(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          ListTile(
            title: Text('Бахнув пельменів'),
            subtitle: Text('Date | sad'),
          ),
          Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.add),
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddProductScreen(),
                  ),
                )),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 80.0),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'qwe',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'qwe',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              );
            }
            return _buildTask(index);
          },
        ));
  }
}
