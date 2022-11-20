import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sheinshop/controller/CartController.dart';
import 'package:sheinshop/controller/FavouriteController.dart';
import 'package:sheinshop/controller/ProductController.dart';
import 'package:sheinshop/entity/Product.dart';
import 'package:sheinshop/screen/CartScreen.dart';
import 'package:sheinshop/screen/FavouriteScreen.dart';
import 'package:sheinshop/screen/SearchScreen.dart';
import 'package:sheinshop/widget/ProductRatingBar.dart';

class DetailProductScreen extends StatelessWidget {
  final Product product;
  DetailProductScreen(this.product);
  CartController cartController = Get.put(CartController());
  ProductController productController = Get.put(ProductController());
  FavouriteController favouriteController = Get.put(FavouriteController());
  Icon customIcon = const Icon(Icons.search,color: Colors.black,);
  Widget customSearchBar = const Text('MY SHOP',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),);
  Widget customFavourite =Icon(Icons.favorite_outlined,color: Colors.black,size: 27,);
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _yourTextEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
            onPressed:(){
              Get.back();
            },
            icon:const Icon(Icons.arrow_back,color: Colors.black26,)
        ),
      backgroundColor: Colors.white,
      centerTitle: true,
      title:  SizedBox(
          height: 30,
          child: ListTile(
            tileColor: Colors.black12,
            title: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState!.validate()) {
                      // _formKey.currentState.save();
//               var result = await auth.sendPasswordResetEmail(_email);
//               print(result);
//                                     print(value.toString());
                      //productController.setListOrigin();
                      productController.searchProductByWord(value);
                      Get.to(SearchScreen());
                    }
                  },
                  controller: _yourTextEditingController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black26,
                      size: 20,
                    ),
                    hintText: 'Tìm kiếm',
                    hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Colors.black26,
                  ),

                ),
              ),
            ),
          )),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0,6,5,0),
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
                margin: EdgeInsets.only(top: 3),
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
        IconButton(
            onPressed: (){
              //productController.testPatch();

            },
            icon: Icon(Icons.more_vert,color: Colors.black,size: 23,)
        ),
      ],
    ),
      body:Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _ImageDescription(),
                Container(
                  padding:EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Chi tiết",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black54),),
                      //_buildCategory(),
                      SizedBox(height: 8),
                      _buildDescription(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white
        ),
        padding: EdgeInsets.fromLTRB(13, 6, 13, 6),
        height:200,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 65,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                          '${product.title.split(' ')[0]} ${product.title!.split(' ')[1]} ${product.title!.split(' ')[2]} ',
                          style:TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          )
                      ),
                      IconButton(
                          onPressed: (){

                          },
                          icon: Icon(Icons.share_outlined,color: Colors.black,size: 22,)
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.price}\$',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,fontWeight: FontWeight.bold
                        ),
                      ),
                      _buildRating(context),
                    ],

                  ),
                ],
              ),
            ),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Kích thước ',
                      style:TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      )
                  ),
                  SizedBox(height: 7,),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: null,
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                        ),
                        child: const Text("S",style: TextStyle(color: Colors.black),),
                      ),
                      SizedBox(width: 6,),
                      OutlinedButton(
                        onPressed: null,
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                        ),
                        child: const Text("M",style: TextStyle(color: Colors.black),),
                      ),
                      SizedBox(width: 6,),
                      OutlinedButton(
                        onPressed: null,
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                        ),
                        child: const Text("L",style: TextStyle(color: Colors.black),),
                      ),
                      SizedBox(width: 6,),
                      OutlinedButton(
                        onPressed: null,
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                        ),
                        child: const Text("XL",style: TextStyle(color: Colors.black),),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Obx(() =>  IconButton(
                 onPressed: (){
                   if(favouriteController.isFavourite(product.id)==true){
                     print("chuyển thành hết tim");
                     customFavourite=Icon(Icons.favorite_outline,color: Colors.black,size: 27,);
                   }
                   else {
                     print("chuyển thành tim");
                     customFavourite=Icon(Icons.favorite_outlined,color: Colors.black,size: 27,);
                   }
                   favouriteController.toggleFavorite(product.id);
                 },
                 icon: favouriteController.isFavourite(product.id)==true ? customFavourite : Icon(Icons.favorite_border_outlined,color: Colors.black,size: 27,),
               )),
                ElevatedButton(
                  child: Text("THÊM VÀO GIỎ HÀNG",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.black,
                    //onSurface: Colors.grey,
                    //side: BorderSide(color: Colors.black, width: 1),
                    elevation: 20,
                    minimumSize: Size(300, 50),
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    EasyLoading.showSuccess('Great Success!');
                    //datacart.setQuantityProduct(quantity);
                    cartController.increment(product.id);
                    //datacart.getToTal();
                  },
                ),

              ],
            ),
          ],
        ) ,

      ),
    );
  }



  Image _ImageDescription() {
    return Image.network(
      height: 500,
      product.image,  //ApplicationConstants.dummyImage,
      fit: BoxFit.fitWidth,
    );
  }

  Text _buildCategory() {
    return Text(
      product.category.toString(),style: TextStyle(color: Colors.black38),
    );
  }

  ProductRatingBar _buildRating(BuildContext context) {
    return ProductRatingBar(product: product);
  }


  Text _buildDescription() => Text('${product.description}',style: TextStyle(color: Colors.black38),);
}
