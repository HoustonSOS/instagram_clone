import 'package:flutter/material.dart';
import 'package:instagram/global_keys.dart';
class NonePage extends StatelessWidget {
  const NonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => MaterialButton(
        onPressed: (){

          var nav = NavigatorKeys.nestedSearchPageKey;
          var canPop = nav.currentState?.canPop();

          if(canPop!){
            nav.currentState?.pop();
          }else{
            var nav2 = NavigatorKeys.searchPageKey;
            nav2.currentState?.pop();
          }
        },
        child: Text("Go back $index"),
      ),),
    );
  }
}
