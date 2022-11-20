import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sheinshop/controller/CartController.dart';
import 'package:sheinshop/controller/FavouriteController.dart';
import 'package:sheinshop/controller/ProductController.dart';
import 'package:sheinshop/screen/CartScreen.dart';
import 'package:sheinshop/screen/DetailProductScreen.dart';
import 'package:sheinshop/widget/ProductTileHome.dart';

class FavouriteScreen extends StatelessWidget {
  ProductController productController = Get.put(ProductController());
  CartController cartController = Get.put(CartController());
  FavouriteController favouriteController = Get.put(FavouriteController());
  Widget customSearchBar = const Text('Danh sách yêu thích',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(50) ,
        child: AppBar(
          leading: IconButton(
              onPressed:(){
                Get.back();
              },
              icon:const Icon(Icons.arrow_back,color: Colors.black26,)
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: SizedBox(
              height: 30,
              child: customSearchBar
          ),
          actions: <Widget>[
            IconButton(
                onPressed: (){
                  //productController.testPatch();
                },
                icon: Icon(Icons.mail_outline,color: Colors.black,size: 24,)
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,3,5,0),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Obx(() => Container(
                    child: Text("${cartController.quantityProductInCart.value}",
                      style: TextStyle(color: Colors.white,fontSize: 8,fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFFD0002),
                      borderRadius:BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(0),
                    width: 16,
                    height: 16,
                    alignment: Alignment.center,

                  ),),
                  IconButton(
                      onPressed: (){
                        //productController.testPatch();
                        print("click giỏ hàng");
                        Get.to(CartScreen());
                      },
                      icon: Icon(Icons.shopping_bag_outlined,color: Colors.black,size: 25,)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(16),
          //   child: Row(
          //     children: [
          //       const Expanded(
          //         child: Text(
          //           "MyShop",
          //           style: TextStyle(
          //               fontFamily: "avenir",
          //               fontSize: 32,
          //               fontWeight: FontWeight.w900),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: Obx(
                  () {
                if (productController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: favouriteController.listProductFavourite.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap:(){
                          productController.addListSeenHere(favouriteController.listProductFavourite[index]);
                          Get.to(DetailProductScreen(favouriteController.listProductFavourite[index]));
                        },
                        child:ProductTileHome(favouriteController.listProductFavourite[index]),
                      );
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}
