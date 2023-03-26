import 'package:betting_app/colors.dart';
import 'package:betting_app/models/cart_repo.dart';
import 'package:betting_app/models/product_cart.dart';
import 'package:betting_app/models/products.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  final Map<String, CartModel> items = {};

  void additem(ProductModel product, int quant) {
    var totalquantity = 0;
    if (items.containsKey(product.pid!.toString())) {
      items.update(product.pid!.toString(), (value) {
        totalquantity = value.quantity! + quant;
        return CartModel(
            pid: value.pid,
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            company: value.company,
            quantity: value.quantity! + quant,
            product: product,
            isExist: true);
      });
      if (totalquantity <= 0) {
        items.remove(product.pid);
      }
    } else {
      if (quant > 0) {
        items.putIfAbsent(product.pid!.toString(), () {
          return CartModel(
              pid: product.pid,
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              company: product.company,
              quantity: quant,
              product: product,
              isExist: true);
        });
      } else {
        Get.snackbar("Bosdike Kuch Add krle !!", "Aur bakchodi na kr",
            backgroundColor: AppColors.maincolor);
      }
    }
    update();
  }

  bool existInCart(ProductModel product) {
    if (items.containsKey(product.pid.toString())) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (items.containsKey(product.pid.toString())) {
      items.forEach((key, value) {
        if (key == product.pid.toString()) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalamount {
    var total = 0;
    items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }
}
