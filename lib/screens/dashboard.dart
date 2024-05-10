import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'profile_screen.dart'; // Import your ProfileScreen file
import 'absence.dart'; // Import your AbsenceScreen file
import 'chatbot.dart'; // Import your Chatbot screen or widget
import 'emploi.dart'; // Import your EmploiScreen file

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const DashboardScreen(), // Replace MyHomePage with DashboardScreen
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DateTime lastUpdateDate;

  @override
  void initState() {
    super.initState();
    // Initialize lastUpdateDate when the screen is created
    lastUpdateDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Haythem Timoumi'), // Replace with user's name
              accountEmail: Text('5sleam1'), // Replace with user's class
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor, // Changed to primary color
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home, color: Theme.of(context).primaryColor), // Changed icon color
              onTap: () {
                // Add your navigation logic here
              },
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings, color: Theme.of(context).primaryColor), // Changed icon color
              onTap: () {
                // Add your navigation logic here
              },
            ),
            ListTile(
              title: Text('Resultat'),
              leading: Icon(Icons.article, color: Theme.of(context).primaryColor), // Changed icon color
              onTap: () {
                // Add your navigation logic here
              },
            ),
            ListTile(
              title: Text('Evaluation'),
              leading: Icon(Icons.star, color: Theme.of(context).primaryColor), // Changed icon color
              onTap: () {
                // Add your navigation logic here
              },
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout, color: Theme.of(context).primaryColor), // Changed icon color
              onTap: () {
                // Add your logout logic here
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor, // Changed to primary color
        centerTitle: true,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, // Changed to primary color
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ListTile(
                title: const Text(
                  'Haythem Timoumi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Last update: ${_formatLastUpdate()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                    ),
                  ),
                ),
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            padding: const EdgeInsets.all(30),
            children: [
              itemDashboard(context, 'Block Map', Icons.map, Colors.deepOrange, PlaceholderWidget()), // PlaceholderWidget is an example
              itemDashboard(context, 'Chat', Icons.chat, Colors.green, Chatbot()), // Replace ChatBot() with Chatbot()
              itemDashboard(context, 'Emploi', Icons.calendar_month, Colors.purple, EmploiScreen()), // Replace PlaceholderWidget() with EmploiScreen()
              itemDashboard(context, 'Absence', Icons.chat_bubble, Colors.brown, AbsenceScreen()), // Provide your AbsenceScreen widget here
              itemDashboard(context, 'Revenue', Icons.attach_money, Colors.indigo, PlaceholderWidget()), // PlaceholderWidget is an example
              itemDashboard(context, 'Upload', Icons.add_circle, Colors.teal, PlaceholderWidget()), // PlaceholderWidget is an example
              itemDashboard(context, 'About', Icons.question_answer, Colors.blue, PlaceholderWidget()), // PlaceholderWidget is an example
              itemDashboard(context, 'Contact', Icons.phone, Colors.pinkAccent, PlaceholderWidget()), // PlaceholderWidget is an example
            ],
          ),
        ],
      ),
    );
  }

  String _formatLastUpdate() {
    final now = DateTime.now();
    final difference = now.difference(lastUpdateDate);
    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inMinutes} minutes ago';
    }
  }

  Widget itemDashboard(BuildContext context, String title, IconData iconData, Color background, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(title.toUpperCase(), style: Theme.of(context).textTheme.subtitle2),
          ],
        ),
      ),
    );
  }
}

// Example placeholder widget
class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Placeholder Widget',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
