import 'package:assignment_two/Faviourie.dart';
import 'package:flutter/material.dart';
import 'FavouriteData.dart';
import 'data.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController tabController;
  int index=0;
   List<bool> isFavorited = [false,false,false,false,false,false,false,false];
  Color _color= Colors.white;
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
       // physics: NeverScrollableScrollPhysics(),
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
          Center(
            child: Text('Profile'),
          ),
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
