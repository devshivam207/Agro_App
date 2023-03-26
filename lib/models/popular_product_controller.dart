import 'package:betting_app/colors.dart';
import 'package:betting_app/models/cart_controller.dart';
import 'package:betting_app/models/popular_product_repo.dart';
import 'package:betting_app/models/product_cart.dart';
import 'package:betting_app/models/products.dart';
import 'package:get/get.dart';

/*
  -> repo lega constructor ke through 
  -> ek private popularproduct list bnayi hai jisme saara json ka data load hoga 
  -> repo se aane wale response ko check krenge aur usko decode krke popularproductlist ma store krwa lenge {if status code == 200}
  -> baaki ki core coading hai cart ma items ko add aur sutract krne ke liye
*/

class PopularProductsController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductsController({required this.popularProductRepo});

  var _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  late CartController _cart;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> checkPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      //print("Got it baby");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      //print("Nhi load ho rha hai bc");
    }
  }

  int _quantity = 0;
  int get quantity => _quantity;

  int _incartitem = 0;
  int get incartitem => _incartitem + _quantity;

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quant) {
    if ((quant + _incartitem) < 0) {
      Get.snackbar(
        "Abe Bhutni Ke",
        "Thodi saharam Kar !!",
        backgroundColor: AppColors.maincolor,
      );
      if (_incartitem > 0) {
        _quantity = -_incartitem;
        return _quantity;
      }
      return 0;
    } else if ((quant + _incartitem) > 20) {
      Get.snackbar(
        "Tere Ghr Jaayinga isme",
        "Smjha na tera ghr chla jaayinga isma !!",
        backgroundColor: AppColors.maincolor,
      );
      return 20;
    } else {
      return quant;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _incartitem = 0;
    //if already exist in cart take that value
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);

    if (exist) {
      _incartitem = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    _cart.additem(product, _quantity);
    _quantity = 0;
    _incartitem = _cart.getQuantity(product);

    // _cart.items.forEach((key, value) {
    //   print("Id is " +
    //       value.pid.toString() +
    //       " quantity is " +
    //       value.quantity.toString());
    // });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
