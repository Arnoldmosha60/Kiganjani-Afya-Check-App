import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/main.dart';

void main() {
  runApp(MyApp());
}

class profile extends StatelessWidget {
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
        title: const Text(
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
          'Gaston Aloyce',
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
      title: 'Akaunti',
      children: [
        _buildListTile('Taarifa Binafsi', Icons.person),
        _buildListTile('Mafanikio', Icons.emoji_events),
        _buildListTile('Activity History', Icons.history),
        _buildListTile('Maendeleo ya Mazoezi', Icons.fitness_center),
      ],
    );
  }

  Widget _buildNotificationSection() {
    return _buildSection(
      title: 'Taarifa',
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
      title: 'Mengineyo',
      children: [
        _buildListTile('Wasiliana Nasi', Icons.contact_mail),
        _buildListTile('Privacy Policy', Icons.privacy_tip),
        _buildListTile('Mpangiio', Icons.settings),
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
              style: const TextStyle(
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
}
