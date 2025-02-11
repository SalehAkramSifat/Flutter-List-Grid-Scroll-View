import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.blue,
      )),
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeActivity> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ListViewExample(),
    // GridViewExample(),
    // SingleChildScrollViewExample(),
    // PageViewExample(),
    // NestedScrollViewExample(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Grid Scroll View"), centerTitle: true),

      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(selectedItemColor: Colors.red,
        backgroundColor: Colors.red,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list,), label: "List View"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_on), label: "Grid View"),
          BottomNavigationBarItem(icon: Icon(Icons.view_column), label: "Scroll View"),
          BottomNavigationBarItem(icon: Icon(Icons.pages), label: "Page View"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.layers), label: "NestedScroll"),
        ],
      ),
    );
  }
}

class ListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index){
      return ListTile(leading: Icon(Icons.star),
      title: Text("Item ${index-1}"),);
    }
    );
  }
}
