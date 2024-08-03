import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const FitnessCentersScreen(),
    );
  }
}

class FitnessCentersScreen extends StatefulWidget {
  const FitnessCentersScreen({super.key});

  @override
  _FitnessCentersScreenState createState() => _FitnessCentersScreenState();
}

class _FitnessCentersScreenState extends State<FitnessCentersScreen> {
  int _selectedIndex = 0;

  String? _location = "Road no:127,Tharumaru street";
  String? _city = "Madhapur";
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Screen'),
    Text('Bookings Screen'),
    Text('Explore Screen'),
    Text('Profile Screen'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToGymPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GymPage()),
    );
  }

  // Future<void> _getLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //
  //   final position = await Geolocator.getCurrentPosition();
  //   setState(() {
  //     _location = '${position.latitude}, ${position.longitude}';
  //   });
  //   print("location:- ");
  //   print(_location);
  // }

  // Future<void> _getLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //
  //   final position = await Geolocator.getCurrentPosition();
  //
  //   try {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
  //     Placemark place = placemarks[0];
  //     setState(() {
  //       _location = '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
  //       _city='${place.locality}';
  //     });
  //     print("location:- ");
  //       print(_location);
  //   } catch (e) {
  //     setState(() {
  //       _location = 'Failed to get address';
  //     });
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("call");
    // _getLocation();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('${_city}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(36, 36, 36, 1))),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${_location?.substring(0, 28)}...',
                        style: TextStyle(
                            color: Color.fromRGBO(85, 85, 85, 1),
                            fontSize: 14)),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/coin.png',
                      width: 16,
                    ),
                    Text(' Points',
                        style: TextStyle(
                            color: Color.fromRGBO(85, 85, 85, 1),
                            fontSize: 12)),
                  ],
                ),
                Text('3,725',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(241, 231, 255, 1),
        elevation: 0,
      ),
      body: _selectedIndex == 0
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(241, 231, 255, 1),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, bottom: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Text('Hello, Karthik!',
                                  style: TextStyle(
                                      fontSize: 34,
                                      fontWeight: FontWeight.w800)),
                              Text('What would you like ',
                                  style: TextStyle(
                                      fontSize: 34,
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.w600)),
                              Text('to do today? ',
                                  style: TextStyle(
                                      fontSize: 34,
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(height: 5),
                              TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  hintText: 'Find a nearby activity',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () => _navigateToGymPage(context),
                                  // Call the callback when tapped
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/images/gym (traced).png',
                                        width: 64,
                                      ),
                                      SizedBox(height: 0),
                                      Text(
                                        "Gym",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {}, // Call the callback when tapped
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/images/swim (traced).png',
                                        width: 64,
                                      ),
                                      SizedBox(height: 0),
                                      Text(
                                        "Swimming",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {}, // Call the callback when tapped
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/images/badminton-birdie (traced).png',
                                        width: 64,
                                      ),
                                      SizedBox(height: 0),
                                      Text(
                                        "Badminton",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {}, // Call the callback when tapped
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/images/Black.png',
                                        width: 64,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "Yoga",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {}, // Call the callback when tapped
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/images/zumba (traced).png',
                                        width: 64,
                                      ),
                                      SizedBox(height: 0),
                                      Text(
                                        "Zumba",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Add your functionality for "View all" here
                                  },
                                  child: Text('View all',
                                      style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.underline)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Expanded(
                  child: FitnessCenterList(),
                ),
              ],
            )
          : _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Colors.deepPurple),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        // Prevents the sliding effect
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class GymPage extends StatefulWidget {
  const GymPage({super.key});

  @override
  _GymPageState createState() => _GymPageState();
}

class _GymPageState extends State<GymPage> {
  int _selectedIndex = 0;
  int _selectedActivityIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Screen'),
    Text('Bookings Screen'),
    Text('Explore Screen'),
    Text('Profile Screen'),
  ];

  final List<String> _activities = [
    'Gym',
    'Swimming',
    'Cricket',
    'Yoga',
    'Zumba',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onActivityTapped(int index) {
    setState(() {
      _selectedActivityIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Madhapur',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Road no:127, Tharumaru street...',
                        style: TextStyle(
                            color: Color.fromRGBO(85, 85, 85, 1),
                            fontSize: 14)),
                  ],
                ),
              ],
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 60.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _activities.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onActivityTapped(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: _selectedActivityIndex == index
                          ? Colors.deepPurple
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.deepPurple,
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        _activities[index],
                        style: TextStyle(
                          color: _selectedActivityIndex == index
                              ? Colors.white
                              : Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: FitnessCenterList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Colors.deepPurple),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        // Prevents the sliding effect
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class ActivityIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const ActivityIcon({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.black),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.black)),
      ],
    );
  }
}

class FitnessCenterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('fitness_centers').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }

        final fitnessCenters = snapshot.data!.docs;

        return ListView.builder(
          itemCount: fitnessCenters.length,
          itemBuilder: (context, index) {
            final fitnessCenter = fitnessCenters[index];
            return FitnessCenterCard(
              name: fitnessCenter['name'],
              location: fitnessCenter['location'],
              price: fitnessCenter['price'],
              imageUrl: fitnessCenter['imageUrl'],
              distance: fitnessCenter['distance'],
            );
          },
        );
      },
    );
  }
}

class FitnessCenterCard extends StatelessWidget {
  final String name;
  final String location;
  final int price;
  final String imageUrl;
  final double distance;

  const FitnessCenterCard({
    super.key,
    required this.name,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), // Adjust the radius as needed
              topRight: Radius.circular(16.0), // Adjust the radius as needed
            ),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('~ $distance Km'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(location),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('₹$price / session'),
                ElevatedButton(
                  onPressed: () {
                    // Add your booking functionality here
                  },
                  child: const Text('Book Slot'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
