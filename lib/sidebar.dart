import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 7),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 7),
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Kiran Bk",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        Text("Kiran@apexcollege.edu.np"),
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.amber.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(
                        0, 1), // Offset to control the position of the shadow
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text("Expenses Trakker"),
              onTap: () => print("hello"),
            ),
            ListTile(
              leading: Icon(Icons.sms),
              title: Text("Massege"),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notifications"),
              onTap: () => null,
              trailing: ClipOval(
                child: Container(
                  color: Colors.red,
                  height: 20,
                  width: 20,
                  child: Center(
                    child: Text(
                      "8",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () => null,
            ),
          ],
        ),
      ),
    );
  }
}