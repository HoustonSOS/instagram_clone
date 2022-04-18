import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/global_keys.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget{
  const MyAppBar({Key? key}) : super(key: key);

  @override
  final Size preferredSize = const Size.fromHeight(70);

  @override
  State<StatefulWidget> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar>{

  //notify focus changes
  final focusNode = FocusNode();

  //used to listen to focus changes
  bool hasFocus = false;

  //animated containers width
  //set to 85 when search field is focused
  //TODO: width value is hardcoded for now, make it adaptive to other screens
  double width = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //update width of animated container depending on focus node's state
    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasFocus;
        if(hasFocus){
          width = 85;
        }else{
          width = 0;
        }
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: widget.preferredSize,
        //iPhones clock, wifi, and battery status icons colors
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: SafeArea(
            child: buildSearch(width),
          ),
        ),
    );
  }

  Widget buildSearch(double width){

    return Container(
      alignment: Alignment.bottomCenter,
      height: 55,
      child: Container(
        height: 45,
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                //TODO: Search Field is implemented based on Material design, make adaptive
                child: TextField(
                  onTap: _onTap,
                  focusNode: focusNode,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  maxLines: 1,
                  minLines: 1,
                  decoration: InputDecoration(
                    prefixIconColor: Colors.grey.shade600,
                    contentPadding: EdgeInsets.zero,
                    hintMaxLines: 1,
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search",
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(milliseconds: 1000),
              width: width,
              //TODO: Create your own Cancel button
              child: GestureDetector(
                  onTap: focusNode.unfocus,
                  child: const Text("Cancel",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    maxLines: 1,
                  )
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onTap(){
    var nav = NavigatorKeys.nestedSearchPageKey;

    nav.currentState?.pushNamed("search_results");
  }
}