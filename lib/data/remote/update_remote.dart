import 'package:newmanager/class/crud.dart';
import 'package:newmanager/linkapi.dart';

class ProductRemote {
  Crud crud;
  ProductRemote(this.crud);

  updateDate(String id, String name, String price, String image) async {
    var respo = await crud.postData(AppLink.update, {
      'product_id': id,
      'product_name': name,
      'product_price': price,
      'product_image': image,
    });
    return respo.fold((l) => l, (r) => r);
  }

  addData(String name, String price, String image) async {
    var respo = await crud.postData(AppLink.addpro, {
      'product_name': name,
      'product_price': price,
      'product_image': image,
    });
    return respo.fold((l) => l, (r) => r);
  }
}
