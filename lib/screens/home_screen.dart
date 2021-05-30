import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grocery_app/data/data.dart';
import 'package:grocery_app/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Delivery"),
        centerTitle: true,
        leading: IconButton(
          iconSize: 30.0,
          onPressed: () {},
          icon: Icon(Icons.account_circle),
        ),
        actions: [
          TextButton(
            child: Text(
              "Cart (${currentUser.cart.length})",
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                hintText: "Search Food and Restaurants",
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 1)
                )
              ),
            ),
          ),
          RecentOrders()
        ],
      ),
    );
  }
}
