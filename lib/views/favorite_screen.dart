import 'package:add_to_cart/controller/fav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fav = Get.put(FavController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Screen"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Obx(
            () => ListTile(
              title: Text("This is title $index"),
              trailing: IconButton(
                onPressed: () {
                  fav.toggleFavorite(index);
                  // if (fav.favList.contains(index)) {
                  //   fav.favList.remove(index);
                  // } else {
                  //   fav.favList.add(index);
                  // }
                },
                icon: const Icon(Icons.favorite),
                color: fav.favList.contains(index) ? Colors.red : Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}
