import 'package:flutter/material.dart';

class AbsenceScreen extends StatelessWidget {
  const AbsenceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Absence Screen'),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Haythem Timoumi'),
              accountEmail: Text('5sleam1'),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home, color: Theme.of(context).primaryColor),
              onTap: () {
                // Add your navigation logic here
              },
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings, color: Theme.of(context).primaryColor),
              onTap: () {
                // Add your navigation logic here
              },
            ),
            ListTile(
              title: Text('Resultat'),
              leading: Icon(Icons.article, color: Theme.of(context).primaryColor),
              onTap: () {
                // Add your navigation logic here
              },
            ),
            ListTile(
              title: Text('Evaluation'),
              leading: Icon(Icons.star, color: Theme.of(context).primaryColor),
              onTap: () {
                // Add your navigation logic here
              },
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout, color: Theme.of(context).primaryColor),
              onTap: () {
                // Add your logout logic here
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          _buildAbsenceRow(
            date: '30 septembre 2023',
            time: '10:45 à 12:15',
            module: 'Développement Durable',
            justification: 'Absence injustifiée',
          ),
          _buildAbsenceRow(
            date: '4 octobre 2023',
            time: '10:45 à 12:15',
            module: 'Développement Durable',
            justification: 'Absence injustifiée',
          ),
          // Add more absence rows here as needed
        ],
      ),
    );
  }

  Widget _buildAbsenceRow({
    required String date,
    required String time,
    required String module,
    required String justification,
  }) {
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date Seance: $date'),
            Text('N° Seance: $time'),
            Text('Module: $module'),
            Text('Justification: $justification'),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
