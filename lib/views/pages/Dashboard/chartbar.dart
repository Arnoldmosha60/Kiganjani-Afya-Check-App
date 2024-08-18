import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/main.dart';

void main() {
  runApp(MyApp());
}

class Chartbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Go back action
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // More options action
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildProfileHeader(),
          SizedBox(height: 20),
          _buildAccountSection(),
          SizedBox(height: 20),
          _buildNotificationSection(),
          SizedBox(height: 20),
          _buildOtherSection(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/profile_picture.png'),
        ),
        SizedBox(height: 10),
        Text(
          'Stefani Wong',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Text(
          'Lose a Fat Program',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInfoCard('180cm', 'Height'),
            _buildInfoCard('65kg', 'Weight'),
            _buildInfoCard('22yo', 'Age'),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoCard(String value, String label) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountSection() {
    return _buildSection(
      title: 'Account',
      children: [
        _buildListTile('Personal Data', Icons.person),
        _buildListTile('Achievement', Icons.emoji_events),
        _buildListTile('Activity History', Icons.history),
        _buildListTile('Workout Progress', Icons.fitness_center),
      ],
    );
  }

  Widget _buildNotificationSection() {
    return _buildSection(
      title: 'Notification',
      children: [
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Pop-up Notification'),
          trailing: Switch(
            value: true,
            onChanged: (bool value) {},
            activeColor: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _buildOtherSection() {
    return _buildSection(
      title: 'Other',
      children: [
        _buildListTile('Contact Us', Icons.contact_mail),
        _buildListTile('Privacy Policy', Icons.privacy_tip),
        _buildListTile('Setting', Icons.settings),
      ],
    );
  }

  Widget _buildSection({required String title, required List<Widget> children}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: () {
        // Navigate to the respective page
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart),
          label: 'Activity',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: 3, // Select Profile as the current page
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }
}
