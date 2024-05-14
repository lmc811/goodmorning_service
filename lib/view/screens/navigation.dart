import 'package:flutter/material.dart';
import 'package:goodmorning_service/view/screens/pages/email.dart';
import 'package:goodmorning_service/view/screens/pages/logout.dart';
import 'package:goodmorning_service/view/screens/pages/none.dart';
import 'package:goodmorning_service/view/screens/pages/number.dart';


class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) => setState(() {
          selectedIndex = value;
        }),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.email_rounded,),
            label: "Email",
            // selectedIcon: Icon(
            //   Icons.email,
            //   color: Theme.of(context).colorScheme.onSecondaryContainer,
            // ),
          ),
          NavigationDestination(
            icon: const Icon(Icons.numbers),
            label: "Number",
            // selectedIcon: Icon(
            //   Icons.numbers,
            //   color: Theme.of(context).colorScheme.onSecondaryContainer,
            // ),
          ),
          NavigationDestination(
            icon: const Icon(Icons.not_interested),
            label: "None",
            // selectedIcon: Icon(
            //   Icons.settings,
            //   color: Theme.of(context).colorScheme.onSecondaryContainer,
            // ),
          ),

          NavigationDestination(
            icon: const Icon(Icons.logout),
            label: "Logout",
            // selectedIcon: Icon(
            //   Icons.logout,
            //   color: Theme.of(context).colorScheme.onSecondaryContainer,
            // ),
          )
        ]  ,
        animationDuration: const Duration(milliseconds: 500),//애니메이션 속도
      ),
      appBar: AppBar(
        title: Text("Navigation"),
      ),
      body: Center(
        child: IndexedStack(  //index에 근거에서 한번의 하나씩 리스트 내에 있는 child 위젯을 보여주는 기능을 한다
          index: selectedIndex,
          children: [
            EmailPage(),
            NumberPage(),
            None_page(),
            LogoutPage()
          ],
        ),
      ),
    );
  }
}
