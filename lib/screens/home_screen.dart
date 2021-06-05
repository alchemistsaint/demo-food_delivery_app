import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grocery_app/data/data.dart';
import 'package:grocery_app/models/restaurant.dart';
import 'package:grocery_app/widgets/rating_stars.dart';
import 'package:grocery_app/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  Widget _buildRestaurants() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              width: 1.0,
              color: Colors.grey[200],
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.cover,
                  image: AssetImage(restaurant.imageUrl),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(restaurant.name,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 4.0,
                    ),
                    RatingStars(restaurant.rating),
                    Text(restaurant.address,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.normal)),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text("1.5 kms away",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.normal))
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
    return Column(
      children: restaurantList,
    );
  }

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
      body: SingleChildScrollView(
        child: Column(
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
            RecentOrders(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Nearby Restaurants",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2),
                  ),
                ),
                _buildRestaurants()
              ],
            )
          ],
        ),
      ),
    );
  }
}
