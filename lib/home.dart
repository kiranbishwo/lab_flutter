import 'package:flutter/material.dart';
import 'package:lab_project/sidebar.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        title: Text(
          'Dashboard Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text('Selected index: ${_getTabName(_selectedIndex)}'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  String _getTabName(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Search';
      case 2:
        return 'Profile';
      default:
        return '';
    }
  }
}
