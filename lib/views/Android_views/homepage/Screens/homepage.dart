import 'package:flutter/material.dart';
import 'package:platform_converter_app/Providers/platformProvider.dart';
import 'package:platform_converter_app/utils/data.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "HomePage",
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    onTap: () {
                      Navigator.of(context).pushNamed('settings');
                    },
                    child: Text("Settings"),
                  ),
                  PopupMenuItem(
                    onTap: () {},
                    child: Text("Delete"),
                  ),
                ];
              },
            ),
            GestureDetector(
              onTap: () {
                Provider.of<PlatformProvider>(context, listen: false)
                    .changePlatform();
              },
              child: Icon(
                Icons.add,
                size: 40,
              ),
              // child: Image.asset(
              //   "assets/Icons/apple-black-logo.png",
              //   height: 40,
              // ),
            )
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: <Tab>[
              ...allData.map((e) {
                return Tab(
                  text: e['label'],
                );
              }).toList(),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("John Doe"),
                accountEmail: Text("+91 32457 89120"),
                currentAccountPicture: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/path_to_your_image.jpg"),
                ),
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text('New Group'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.person_add),
                title: Text('New Contact'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.call),
                title: Text('Calls'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.bookmark),
                title: Text('Saved Messages'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.of(context).pushNamed('settings');
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ...allData
                .map(
                  (e) => e['widget'],
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
