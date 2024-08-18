import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: UserProfilePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class UserProfilePage extends StatelessWidget {
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
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your image asset
                ),
                SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Stefani Wong',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Lose a Fat Program',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Edit'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileStat(title: '180cm', subtitle: 'Height'),
                ProfileStat(title: '65kg', subtitle: 'Weight'),
                ProfileStat(title: '22yo', subtitle: 'Age'),
              ],
            ),
            SizedBox(height: 20),
            AccountSection(),
            SizedBox(height: 20),
            NotificationSection(),
            SizedBox(height: 20),
            OtherSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 3,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class ProfileStat extends StatelessWidget {
  final String title;
  final String subtitle;

  ProfileStat({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class AccountSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Personal Data'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.emoji_events),
            title: Text('Achievement'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Activity History'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.fitness_center),
            title: Text('Workout Progress'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class NotificationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SwitchListTile(
        title: Text('Pop-up Notification'),
        secondary: Icon(Icons.notifications),
        value: true,
        onChanged: (bool value) {},
        activeColor: Colors.purple,
      ),
    );
  }
}

class OtherSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Contact Us'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy Policy'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
