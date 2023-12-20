import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Design Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MaterialDesign(),
      initialRoute: '/',
      routes: {
        '/':(context) => MaterialDesign(),
        '/first': (context) => const firstRoute(data: 'Hello from Material Page!'),
        '/second': (context) => const secondRoute(),
      },
    );
  }
}

class firstRoute extends StatelessWidget {
  const firstRoute({Key? key, required this.data}) : super(key: key);
  final String data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation First Route'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(data),
              ElevatedButton(
                child: const Text('Launch second creen'),
                onPressed: () {
                  
                  Navigator.pushNamed(context, '/second');
                },
              ),
              ElevatedButton(
                child: const Text('Go back'),
                onPressed: () {
                  
                  Navigator.pop(context,'Hello from first page!!');
                },
              ),
            ],
          ),
        ), // Elevated
 
        
        //   child: const Text('Launch screen'),
        //   onPressed: () {
        //     Navigator.pushNamed(context, '/second');
        //   },
        // ),
      ),
    );
  }
}

class secondRoute extends StatelessWidget {
  const secondRoute({Key? key}) : super(key: key);
 
  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation Second Route"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context,'Hello from Second Page!');
          },
          child: const Text('Go back!'),
        ), // ElevatedButton
      ),
 
    );
  }
}

class MaterialDesign extends StatefulWidget {
  @override
  _MaterialDesignState createState() => _MaterialDesignState();
  
}

class _MaterialDesignState extends State<MaterialDesign> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
        ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Material Design Demo'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 16.0),


              AppBar(
              title: Text('App Bar Demo'),
              backgroundColor: Colors.lightBlue[100],
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(context: context, delegate: MySearchDelegate());
                  },
                ),
              ],
            ),

            BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'School',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),

            SizedBox(height: 16.0),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.favorite, size: 50.0, color: Colors.red),
                Icon(Icons.star, size: 50.0, color: Colors.yellow),
                Icon(Icons.android, size: 50.0, color: Colors.green),
              ],
            ),

            SizedBox(height: 16.0),


          Card(
             shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Add border radius to the card
              side: BorderSide(color: Colors.grey), // Add border color to the card
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  'https://blenderartists.org/uploads/default/original/4X/0/c/1/0c1ed6ec2bd33db0abdf48d8802e24d7f04e704a.jpeg', // Replace with your image URL
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                ListTile(
                  title: Text('Image Title'),
                  subtitle: Text('Image Description'),
                ),
                ButtonBar(
                  children: [
                    TextButton(
                      onPressed: () {
                        
                        Toast.show("This is the McLaren MP4-8 of Ayrton Senna", duration: Toast.lengthShort, gravity:  Toast.bottom);                      },
                      child: const Text('ACTION'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        

            SizedBox(height: 16.0),


            Card(
              child: ListTile(
                leading: Icon(Icons.photo),
                title: Text('Sample Card'),
                subtitle: Text('Subtitle'),
                onTap: () {
                  // Show dialog on card tap
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Dialog Title'),
                        content: Text('This is a sample dialog.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),

            SizedBox(height: 16.0),

          
            AnimatedContainer(
              width: _selectedIndex == 0 ? 50.0 : _selectedIndex == 1 ?200.0:150,
              height: _selectedIndex == 0 ? 50.0 : _selectedIndex == 1 ?200.0:150,
              color: _selectedIndex == 0 ? Colors.blue : _selectedIndex == 1?  Colors.red : Colors.green,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
            ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
            child: const Text('Launch Screen by route based navigation'),
            onPressed: () {
              Navigator.pushNamed(context, '/first');
            },
                    ),
          ), // Elev
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
            child: const Text('Launch Screen by page based navigation'),
            onPressed: () async {
              final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => firstRoute(data: 'Hello from Material Page!')));
              print(result);
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text('$result')));
            },
                    ),
          ), // Elev

            SizedBox(height: 16.0),

          ],
        ),
      ),
    );
  }
  

   
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for the app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon on the left of the app bar
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show results based on the query
    // This is where you can display your search results
    return Text('Search Results for: $query');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show suggestions while typing
    // You can fetch and display suggestions here
    return Text('Suggestions for: $query');
  }


}