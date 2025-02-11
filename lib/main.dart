import 'dart:html';

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
    GridViewExample(),
    SingleChildScrollViewExample(),
    PageViewExample(),
    NestedScrollViewExample(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Grid Scroll View"), centerTitle: true),

      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "List View"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_on), label: "Grid View"),
          BottomNavigationBarItem(icon: Icon(Icons.view_column), label: "Scroll View"),
          BottomNavigationBarItem(icon: Icon(Icons.pages), label: "Page View"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.layers), label: "NestedScroll"),
        ],
      ),
    );
  }
}

// 📌 ListView Widget
class ListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index){
      return ListTile(leading: Icon(Icons.star),
      title: Text("Item ${index+1}"),);
    });
  }
}

// 📌 GridView Widget
class GridViewExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2
    ), itemCount: 100,
    itemBuilder: (context, index){
      return Card(margin: EdgeInsets.all(10),child: Center(child: Text("Grid ${index+1}"),), color: Colors.purpleAccent,);
    },);
  }
}

// 📌 SingleChildScrollView Widget
class SingleChildScrollViewExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(
      children:
        List.generate(100, (index){
          return Padding(padding: EdgeInsets.all(10),
          child: Text("Item ${index+1}", style: TextStyle(fontSize: 20),),);
        })

    ),);
  }
}

// 📌 PageView Widget
class PageViewExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Container(color: Colors.red, child: Center(child: Text('Page 1'))),
        Container(color: Colors.red, child: Center(child: Text('Page 1'))),
        Container(color: Colors.red, child: Center(child: Text('Page 1'))),
        Container(color: Colors.red, child: Center(child: Text('Page 1'))),
        Container(color: Colors.red, child: Center(child: Text('Page 1'))),
        Container(color: Colors.red, child: Center(child: Text('Page 1'))),
      ],
    );
  }
}

// 📌 NestedScrollView Widget
class NestedScrollViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(expandedHeight: 200, floating: false, pinned: true,
            flexibleSpace: FlexibleSpaceBar(title: Text("Nested ScrollView"),),
          ),
        ];
      },
      body: ListView.builder(itemCount:100,itemBuilder: (context, index){
        return ListTile(title: Text("Nasted Item${index+1}"),);
      }),
    );
  }
}
