import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/theme/app_theme.dart';
import 'package:kiganjani_afya_check/views/drawer/home_screen.dart';
import 'package:kiganjani_afya_check/views/homelist.dart';
import 'package:kiganjani_afya_check/views/pages/age.dart';
import 'package:kiganjani_afya_check/views/pages/sex.dart'; // Import the AgeSexPage

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  List<HomeList> homeList = HomeList.homeList;
  AnimationController? animationController;
  bool multiple = true;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      // _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()), // Assuming HomeScreen is your home screen
        );
        break;
      case 1:
        break;
      case 2:
      // Handle navigation for third item
        break;
      case 3:
      // Handle navigation for fourth item
        break;
      case 4:
      // Handle navigation for fifth item
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Scaffold(
      backgroundColor: isLightMode ? AppTheme.white : AppTheme.chipBackground,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: isLightMode ? Colors.blue : Colors.blueGrey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(Icons.person, size: 40, color: isLightMode ? Colors.blue : Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Dr.Silas',
                    style: TextStyle(
                      color: isLightMode ? Colors.white : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Nyumbani'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Wasifu'),
              onTap: () {
                // Add navigation to profile screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Muongozo'),
              onTap: () {
                // Add navigation to settings screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Kuhusu'),
              onTap: () {
                // Add navigation to about screen
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 2.0),
              child: Column(
                children: <Widget>[
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.arrow_drop_down_circle),
                          title: const Text('Body Mass Index (BMI)'),
                          subtitle: Text(
                            'The ratio of persons height and weight: ',
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'BMI VALUE',
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                        OverflowBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              // textColor: const Color(0xFF6200EE),
                              onPressed: () {
                                // Perform some action
                              },
                              child: const Text('VIEW'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Perform some action
                              },
                              child: const Text('UPDATE'),
                            ),
                          ],
                        ),
                        // Image.asset('assets/images/background.png')
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.arrow_drop_down_circle),
                          title: const Text('Buzzle Metabolism Rate (BMR)'),
                          subtitle: Text(
                            'Kiwango ambacho mwili unaweza kuchoma calories',
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'BMR Value',
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              // textColor: const Color(0xFF6200EE),
                              onPressed: () {
                                // Perform some action
                              },
                              child: const Text('VIEW'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Perform some action
                              },
                              child: const Text('UPDATE'),
                            ),
                          ],
                        ),
                        // Image.asset('assets/images/background.png')
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget appBar() {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Builder(
              builder: (BuildContext context) {
                return Container(
                  width: AppBar().preferredSize.height - 8,
                  height: AppBar().preferredSize.height - 8,
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: isLightMode ? AppTheme.darkText : AppTheme.grey,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'KIGANJANI AFYA CHECK',
                  style: TextStyle(
                    fontSize: 22,
                    color: isLightMode ? AppTheme.darkText : AppTheme.grey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
