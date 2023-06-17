import 'package:safe_food/src/resource/model/product.dart';
import 'package:safe_food/src/resource/model/top_product_favourite.dart';
import 'package:safe_food/src/resource/model/top_product_selling.dart';
import 'package:safe_food/src/resource/struct/api_services/base_api.dart';

class ProductRepository {
  final BaseApi _baseApi = BaseApi();
  Future<List<Product>> getListProduct() async {
    String url = "/all-product";
    var respond = await _baseApi.getMethod(url);
    if (respond['statusCode'] == 200) {
      return (respond['data'] as List)
          .map((json) => Product.fromJson(json))
          .toList();
    } else {
      throw respond['message'];
    }
  }

  Future<List<TopProductSelling>> getListTopSelling() async {
    String url = "/top-selling-product";
    final respond = await _baseApi.getMethod(url);

    if (respond['statusCode'] == 200) {
      return (respond['data'] as List)
          .map((json) => TopProductSelling.fromJson(json))
          .toList();
    } else {
      throw respond['message'];
    }
  }

  Future<List<TopProductFavourite>> getListTopFavourite() async {
    String url = "/top-product-favourite";
    var respond = await _baseApi.getMethod(url);
    if (respond['statusCode'] == 200) {
      return (respond['data'] as List)
          .map((json) => TopProductFavourite.fromJson(json))
          .toList();
    } else {
      throw respond['message'];
    }
  }

  Future<List<Product>> getListFavorite(int userId) async {
    String url = "/all-product-favourite?user_id=$userId";
    var respond = await _baseApi.getMethod(url);
    if (respond['statusCode'] == 200) {
      return (respond['data'] as List)
          .map((json) => Product.fromJson(json["Product"]))
          .toList();
    } else {
      throw respond['message'];
    }
  }

  Future<String> deleteProductFavourite(int userId, int productId) async {
    String url = "/delete-product-favourite?user_id=$userId";
    Map<String, dynamic> body = {'product_id': productId};
    var respond = await _baseApi.deleteMethod(url, body: body);
    if (respond['statusCode'] == 200) {
      return respond['message'];
    } else {
      throw respond['message'];
    }
  }

  Future<String> createProductFavourite(int userId, int productId) async {
    String url = "/create-product-favourite?user_id=$userId";
    Map<String, dynamic> body = {'product_id': productId};
    var respond = await _baseApi.postMethod(url, body: body);
    if (respond['statusCode'] == 200) {
      return respond['message'];
    } else {
      throw respond['message'];
    }
  }
}
