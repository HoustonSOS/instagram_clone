import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram/global_keys.dart';
import 'package:instagram/screens/none_page.dart';
import 'package:instagram/nested_navigator.dart';
import 'package:instagram/screens/widgets/search_app_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  _SearchPageState(){
    print("Created Search Page State: $count");
    count++;
  }
  final scrollController = ScrollController();

  int count = 0;

  @override
  void didUpdateWidget(covariant SearchPage oldWidget) {
    print("Did Update Widget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print("Search Page deactivated");
    super.deactivate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: NestedNavigator(
        navigatorKey: NavigatorKeys.nestedSearchPageKey,
        routes: {
          "/" : (context) => const InstagramGridView(),
          "search_results" : (context) => const NonePage(),
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
class Tile extends StatelessWidget {
  const Tile({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey,
      child: Material(
          child: Text("$index"),
          type: MaterialType.transparency,
      ),
    );
  }
}

class InstagramGridView extends StatelessWidget {
  const InstagramGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        repeatPattern: QuiltedGridRepeatPattern.same,
        pattern: const [
          QuiltedGridTile(1, 1),
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),

          //inverted

          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
            (context, index){
          return GestureDetector(
              onTap: (){
                final searchNavigator = NavigatorKeys.searchPageKey.currentState;
                searchNavigator?.push(PageRouteBuilder(pageBuilder: (context, anim1, anim2) => const NonePage()));
              },
              child: Tile(index: index)
          );
        },
      ),
    );
  }
}
