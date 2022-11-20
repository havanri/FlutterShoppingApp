import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sheinshop/controller/CartController.dart';
import 'package:sheinshop/controller/FavouriteController.dart';
import 'package:sheinshop/entity/Product.dart';
import 'package:sheinshop/extensions/context_extension.dart';
import 'package:sheinshop/widget/PrimaryListTile.dart';
import 'package:sheinshop/widget/TileImageCard.dart';

class ProductInCart extends StatelessWidget {
  final Product product;
  final int quantity;
  ProductInCart(this.product,this.quantity);

  CartController cartController = Get.put(CartController());
  FavouriteController favouriteController = Get.put(FavouriteController());
  Widget customFavourite =Icon(Icons.favorite_outlined,color: Colors.black54,size: 17,);

  @override
  Widget build(BuildContext context) {
    return PrimaryListTile(
      childWidget: Row(
        children: [
          _buildProductImage(),
          _buildProductDetails(context),
        ],
      ),
    );
  }
  TileImageCard _buildProductImage() {
    return TileImageCard(image: product.image);
  }
  Expanded _buildProductDetails(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 0, 10),
        child: Column(
          children: [
            _buildTitle(context),
            _buildSize(context),
            const SizedBox(
              height: 20,
            ),
            _buildQuantity(context)
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
  Row _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Text(
            product.title!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
              color: Colors.black54
            ),
          ),
        ),
        Expanded(
          child:Obx(() => IconButton(
            onPressed: () {
              if(favouriteController.isFavourite(product.id)==true){
                print("chuyển thành hết tim");
                customFavourite=Icon(Icons.favorite_outline,color: Colors.black,size: 17,);
                favouriteController.toggleFavorite(product.id);
              }
              else {
                showDialog(
                  context: context,
                  builder:(context) => buildDialog(context),
                );
              }
            },
            icon: favouriteController.isFavourite(product.id)==true ? customFavourite : Icon(Icons.favorite_border_outlined,color: Colors.black54,size: 17,),)) ,
        )
      ],
    );
  }

  Row _buildSize(BuildContext context) {
    return Row(
      children: [
        Text(
          'Size: ',style: TextStyle(fontWeight: FontWeight.bold),

        ),
        Text(
          'M',style: TextStyle(fontWeight: FontWeight.bold)
        ),
      ],
    );
  }

  Padding _buildQuantity(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${(product.price!*quantity).toStringAsFixed(2)}\$',
            style:TextStyle(
              fontWeight: FontWeight.bold,
              color: context.colors.onSurface,
              fontSize: 16
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 25,
                child: ElevatedButton(
                  onPressed: (){
                    cartController.decrement(product.id);
                    EasyLoading.showSuccess('Great Success!');
                  },
                  child:Icon(Icons.remove,color: Colors.black),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEEEEEE),
                    elevation: 20,
                    minimumSize: Size(20,20),
                    shape: CircleBorder(side: BorderSide(width: 20,color: Colors.white60,)),
                  ),
                ),
              ),
              Text(
                '${quantity}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
                child: ElevatedButton(
                  onPressed: (){
                    //datacart.increment(product.id!);
                    EasyLoading.showSuccess('Great Success!');
                    //datacart.setQuantityProduct(quantity);
                    cartController.increment(product.id);
                  },
                  child:Icon(Icons.add,color: Colors.black),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEEEEEE),
                    elevation: 20,
                    minimumSize: Size(40,40),
                    shape: CircleBorder(side: BorderSide(width: 20,color: Colors.white60,)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  AlertDialog buildDialog(BuildContext context){
    return AlertDialog(
      content: Text("Bạn có chắc chắn chuyển sản phẩm vào danh sách yêu thích không ?",
        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
      actions: [
        OutlinedButton(onPressed: (){
          Navigator.pop(context, false);
        },
          child: Text("KHÔNG",style:TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),),
          style: ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(30, 10, 30, 10)),
            backgroundColor:MaterialStateColor.resolveWith((states) => Colors.white),
          ),
        ),
        OutlinedButton(onPressed: (){
          //datacart.setQuantityProduct(quantity);
          if(favouriteController.isFavourite(product.id)==true){
            print("chuyển thành hết tim");
            customFavourite=Icon(Icons.favorite_border_outlined,color: Colors.black54,size: 17,);
          }
          else {
            print("chuyển thành tim");
            customFavourite=Icon(Icons.favorite_outlined,color: Colors.black54,size: 17,);
          }
          favouriteController.toggleFavorite(product.id);
          Navigator.pop(context, false);
        },
            child: Text("VÂNG",style:TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          style: ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(30, 10, 30, 10)),
            backgroundColor:MaterialStateColor.resolveWith((states) => Colors.black),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
      elevation: 24,
      backgroundColor: Colors.white,
    );
  }
}
