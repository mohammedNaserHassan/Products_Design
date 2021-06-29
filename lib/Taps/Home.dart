import 'package:assignment_two/Dummy_data/FavouriteData.dart';
import 'package:assignment_two/Dummy_data/data.dart';
import 'package:assignment_two/Taps/Faviourie.dart';
import 'package:assignment_two/Taps/profile.dart';
import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController tabController;
  int index=0;
  List<bool> isFavorited = [false,false,false,false,false,false,false,false];
  @override
  void initState() {
    tabController=TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Products app',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: MockData.mockData
                                .getProducts()
                                .map((e) => Container(
                              margin:
                              EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset(e.path),
                            ))
                                .toList(),
                          ))),
                  Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: Column(
                          children: MockData.mockData
                              .getProducts()
                              .map((e) => Container(
                            width: double.infinity,
                            child: ListTile(
                              title: Text(e.product_name),
                              subtitle: Text('${e.product_salary}'),
                              leading: Image.asset(e.path),
                              trailing: TextButton(
                                  onPressed: (){
                                    setState(() {
                                      isFavorited[e.index] = !isFavorited[e.index];

                                      if(isFavorited[e.index]){
                                        if( !Favourite_data.xc.contains(e))
                                          Favourite_data.xc.insert(0,e);
                                      }

                                    });
                                  },
                                  child: isFavorited[e.index]?Icon(Icons.favorite_outlined,color: Colors.red,):Icon(Icons.favorite_outline,color: Colors.red,)
                              ),
                            ),
                          ))
                              .toList(),
                        ),
                      ))
                ],
              ),
            ),
          ),
          Favourite(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tapped){
          tabController.animateTo(tapped);
          setState(() {
            index=tapped;
          });
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_rounded),label: 'Favourite'),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity),label: 'Profile'),
        ],
      ),
    );
  }
}
