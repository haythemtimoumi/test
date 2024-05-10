import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _phoneNumberController = TextEditingController();

  // Placeholder data for the profile
  String _name = 'John Doe';
  String _occupation = 'Software Engineer';
  String _email = 'john.doe@example.com';
  String _phoneNumber = '+1 (123) 456-7890';
  String _location = 'New York, USA';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Add functionality to upload photo here
                // This is just a placeholder function for demonstration
                _uploadPhoto();
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/user.jpg'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              '$_name',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '$_occupation',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('$_email'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('$_location'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save changes functionality here
                _saveChanges();
                Navigator.pop(context);
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  // Placeholder function for uploading photo
  void _uploadPhoto() {
    // Add your implementation here to upload a new photo
    // This is just a placeholder function for demonstration
    print('Uploading photo...');
  }

  // Placeholder function to save changes
  void _saveChanges() {
    // Add your implementation here to save changes
    // This is just a placeholder function for demonstration
    print('Saving changes...');
    print('New phone number: ${_phoneNumberController.text}');
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }
}
