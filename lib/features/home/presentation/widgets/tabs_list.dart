

import 'package:flutter/material.dart';
import 'tab_container.dart';

class TabsList extends StatefulWidget {


  TabsList({super.key});

  @override
  State<TabsList> createState() => _TabsListState();
}

class _TabsListState extends State<TabsList> {
  List<String> tabs =[
     'All',
     'Cats',
     'Dogs',
     'Birds',
     'Fish',
     'Reptiles',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: tabs.length,
    itemBuilder: (context,index){
      return Padding(
        padding: const EdgeInsets.only(right: 5,),
        child: TabContainer(
          isSelected: selectedIndex == index,
          text: tabs[index],
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },        
        ),
      );
    },);
  }
}