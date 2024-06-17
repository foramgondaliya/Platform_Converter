import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/Providers/platformProvider.dart';
import 'package:platform_converter_app/utils/data.dart';
import 'package:provider/provider.dart';

class homepage_IOS extends StatefulWidget {
  const homepage_IOS({super.key});

  @override
  State<homepage_IOS> createState() => _homepage_IOSState();
}

class _homepage_IOSState extends State<homepage_IOS> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: CupertinoColors.black,
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chat_bubble),
          label: "Chats",
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.upload_circle),
          label: "Updates",
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.phone),
          label: "Calls",
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.settings),
          label: "Settings",
        ),
      ]),
      tabBuilder: (context, val) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text(
                  "Homepage",
                  style: TextStyle(color: CupertinoColors.white),
                ),
                backgroundColor: CupertinoColors.black,
                trailing: CupertinoButton(
                  pressedOpacity: 0.5,
                  onPressed: () {
                    Provider.of<PlatformProvider>(context, listen: false)
                        .changePlatform();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 50),
                    child: Icon(
                      CupertinoIcons.add,
                    ),
                  ),
                ),
              ),
              child: Center(
                child: Container(
                  child: Text("${allData[val]['widget']}"),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
