import 'package:flutter/material.dart';
import 'package:newss_app/models/news_model.dart';
import 'package:newss_app/service/news_service.dart';
import 'package:newss_app/view/screens/healthy.dart';
import 'package:newss_app/view/screens/technology.dart';
import 'package:newss_app/view/screens/sports.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentStae = 0;

  List<Widget> screens = [Healthy(), Sports(), Technology()];
  ApiService service = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${screens[currentStae]}'),
        centerTitle: true,
      ),
      body: screens[currentStae],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentStae,
        onTap: (index) {
          setState(() {
            currentStae = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: 'Healthy', icon: Icon(Icons.health_and_safety)),
          BottomNavigationBarItem(label: 'Sports', icon: Icon(Icons.sports)),
          BottomNavigationBarItem(
              label: 'technology', icon: Icon(Icons.science)),
        ],
      ),
    );
  }
}
