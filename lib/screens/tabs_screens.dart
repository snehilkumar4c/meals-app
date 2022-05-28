// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import '../widgets/main_drawer.dart';
import './favourites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // in lecture video he used Object but here we used dynamic
  late List<Map<String, dynamic>> _pages;

  int _selectedPageindex = 0;

  @override
  void initState() {
    _pages = [
      // ignore: prefer_const_constructors
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouritesScreen(widget.favouriteMeals),
        'title': 'Your Favourites!'
      },
    ];
    // TODO: implement initState
    super.initState();
  }

  void _selectpage(int index) {
    setState(() {
      _selectedPageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageindex]['title'],
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageindex]['page'],
      // used for the tab bar end of the screen
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageindex,
        // type: BottomNavigationBarType.shifting,  basically used for slide effect
        // type: BottomNavigationBarType.fixed,  used for fixed effect and is also the default effect
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favourites'),
          ),
        ],
      ),
    );
    // for displaying the tab just below the app bar
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meals'),
    //       bottom: TabBar(
    //         tabs: <Widget>[
    //           Tab(
    //             icon: Icon(
    //               Icons.category,
    //             ),
    //             text: 'Categories',
    //           ),
    //           Tab(
    //             icon: Icon(
    //               Icons.star,
    //             ),
    //             text: 'Favourites',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: <Widget>[
    //         // order should be matched as above
    //         CategoriesScreen(),
    //         FavouritesScreen(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
