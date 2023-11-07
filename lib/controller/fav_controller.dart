import 'package:add_to_cart/data/api_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FavController extends GetxController {
  final favList = <dynamic>[].obs;
  final token = "126|qx30VC62IR4WtmfcSsLPkMou5WWWnDGzTOCekya4f36dbbbe";

  fetchFavorite() async {
    final response = await http.get(
      Uri.parse(ApiList.showWishlist),
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      print("data fetched");
    }
  }

  toggleFavorite(int productId) async {
    if (favList.contains(productId)) {
      await http.post(Uri.parse(ApiList.wishList), headers: {
        "Authorization": "Bearer $token",
      }, body: {
        "product_id": productId.toString(),
        "toggle": 0.toString(),
      });
      favList.remove(productId);
      print("Item Deleted to favorite");
    } else {
      await http.post(Uri.parse(ApiList.wishList), headers: {
        "Authorization": "Bearer $token",
      }, body: {
        "product_id": productId.toString(),
        "toggle": 1.toString(),
      });
      favList.add(productId);
      print("Item Added from favorite");
    }
  }
}
