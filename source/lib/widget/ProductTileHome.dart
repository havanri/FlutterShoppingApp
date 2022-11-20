import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sheinshop/controller/CartController.dart';
import 'package:sheinshop/controller/ProductController.dart';
import 'package:sheinshop/entity/Product.dart';


class ProductTileHome extends StatelessWidget {
  final Product product;
  ProductTileHome(this.product);
  ProductController productController = Get.put(ProductController());
  CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              //alignment: Alignment.topLeft,
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: CachedNetworkImage(
                    height: 250,
                    imageUrl: product.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: EdgeInsets.all(11),
                      minimumSize: Size.zero,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.white,
                    ),
                    child:Icon(Icons.add_shopping_cart_outlined,size:17 ,color: Colors.black,) ,
                    onPressed: () {
                      cartController.increment(product.id);
                      EasyLoading.showSuccess('Great Success!');
                    },
                  ),
                ),
                // Positioned(child: Obx(()=>CircleAvatar(backgroundColor: Colors.white, child: IconButton(icon: product.,),)))
              ],
            ),
            const SizedBox(height: 15),
            Text('${(product.price).toStringAsFixed(2)}\$',
              style: const TextStyle(fontSize: 16, fontFamily: 'avenir',fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
  
}

