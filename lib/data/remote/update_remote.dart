import 'package:newmanager/class/crud.dart';
import 'package:newmanager/linkapi.dart';

class ProductRemote {
  Crud crud;
  ProductRemote(this.crud);

  updateDate(String id, String name, String price, String image) async {
    var respo = await crud.postData(AppLink.update, {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
    });
    return respo.fold((l) => l, (r) => r);
  }

  addData(String name, String price, String image) async {
    var respo = await crud.postData(AppLink.addpro, {
      'name': name,
      'price': price,
      'image': image,
    });
    return respo.fold((l) => l, (r) => r);
  }
}
