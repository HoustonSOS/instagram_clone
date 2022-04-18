import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/global_keys.dart';
import 'package:instagram/screens/search_page.dart';
import 'package:instagram/services/authentication.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var controller = CupertinoTabController();

  final globalKey = NavigatorKeys.searchPageKey;

  List<Widget> containers = [
    Container(
      color: Colors.grey,
    ),
    Container(),
    // SearchPage(),
    Container(
      color: Colors.deepOrangeAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CupertinoTabScaffold(
            controller: controller,
            resizeToAvoidBottomInset: true,
            tabBar: CupertinoTabBar(
              activeColor: Colors.black,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.search)),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart_fill)),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.person)),
              ],
            ),
            tabBuilder: (context, index) {
              switch (index) {
                case 1:
                  return CupertinoTabView(
                      navigatorKey: globalKey,
                      builder: (context) {
                        return const SearchPage();
                      });
                case 2:
                  return CupertinoTabView(builder: (context) {
                    return containers[2];
                  });
                case 3:
                  return const Personal();
                default:
                  return containers[0];
              }
            }),
      ],
    );
  }
}


class Personal extends StatelessWidget {
  const Personal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context, listen: false);
    return Container(
      color: Colors.deepPurpleAccent,
      child: Center(child: MaterialButton(onPressed: () async {auth.signOut();},
        child: const Text("Sign Out"),),),
    );
  }
}


// void da(BuildContext context){
//   Navigator.of(context)
//       .push(CupertinoPageRoute(
//     builder: (context) => const CameraPage(),
//   ));
// }

// void a(){
//   CupertinoTabBar(
//     activeColor: Colors.black,
//     items: const <BottomNavigationBarItem>[
//       BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
//       BottomNavigationBarItem(icon: Icon(CupertinoIcons.search)),
//       BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart_fill)),
//       BottomNavigationBarItem(icon: Icon(CupertinoIcons.person)),
//     ],
//   );
// }