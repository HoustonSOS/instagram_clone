import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: const Text("New post"),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.xmark),
          onPressed: Navigator.of(context).pop,
          splashRadius: 0.1,
        ),
        actions: [
          CupertinoButton(child: const Text("Next"), onPressed: (){}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 10,
                    height: 10,
                    child: const Icon(CupertinoIcons.fullscreen),
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle
                    ),
                  ),
                ),
                Container(
                  height: 350,
                  color: Colors.blueGrey,
                ),
              ],
            ),
            Column(
              children: [
                //recents...
                Container(
                  color: Colors.black,
                  height: 50,
                  child: Row(
                    children: [
                      const Expanded(child: Text("Recents", style: TextStyle(color: Colors.white),)),
                      Container(
                        color: Colors.grey,
                        child: Row(
                          children: const [
                            Icon(CupertinoIcons.square_stack_3d_up),
                            Text("Select multiple"),
                          ],
                        ),
                      ),
                      Container(
                        child: const Icon(CupertinoIcons.camera, color: Colors.white,),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle
                        ),
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                    itemCount: 15,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1
                    ),
                    itemBuilder: (context, index){
                      return Container(color: Colors.grey,);
                    },
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
