import 'package:newmanager/class/crud.dart';
import 'package:newmanager/linkapi.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getdata() async {
    var respo = await crud.postData(AppLink.product, {});
    print(respo);
    return respo.fold((l) => l, (r) => r);
  }

  getCatt() async {
    var respo = await crud.postData(AppLink.cat, {});
    return respo.fold((l) => l, (r) => r);
  }
}
