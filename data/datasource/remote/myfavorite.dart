import 'package:app_ecommerce/core/class/crud.dart';
import 'package:app_ecommerce/linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.favoriteView, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  deleteMyFavorite(String id) async {
    var response =
        await crud.postData(AppLink.favoriteDeleteMyFavorite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
