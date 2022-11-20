import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheinshop/controller/CartController.dart';
import 'package:sheinshop/controller/ProductController.dart';
import 'package:sheinshop/entity/Product.dart';
import 'package:sheinshop/screen/FavouriteScreen.dart';
import 'package:sheinshop/widget/ProductInCart.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ProductController productController = Get.put(ProductController());
  CartController cartController = Get.put(CartController());
  Widget customSearchBar = const Text('Giỏ hàng',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),);

  @override
  void initState() {
    super.initState();
  }
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
              icon:const Icon(Icons.close,color: Colors.black26,)
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
                icon: Icon(Icons.mail_outline,color: Colors.black,size: 22,)
            ),
            IconButton(
                onPressed: (){
                  Get.to(FavouriteScreen());
                  //productController.testPatch();
                },
                icon: Icon(Icons.favorite_border_outlined,color: Colors.black,size: 22,)
            ),
          ],
        ),
      ),
      body: Obx(()=>SafeArea(
        child:cartController.listItemInCart.length != 0 ?

        Column(
          children: [
            Expanded(
                child:ListView.builder(
                  itemBuilder: (context,index){
                    Product producInfo;
                    int productId = cartController.listItemInCart[index]["productId"];
                    int quantity = cartController.listItemInCart[index]["quantity"];
                    //
                    double reciprocal(double d) => 1 / d;
                    for(var j=0;j<productController.listProduct.length;j++){
                      if(productId==productController.listProduct[j].id){
                        double price =productController.listProduct[j].price;
                        double doubleQuantity = quantity.toDouble();
                        // datacart.total+=(doubleQuantity*price);
                        //print(datacart.total);
                        producInfo = productController.listProduct[j];
                        return Padding(
                          padding:EdgeInsets.all(2),
                          child: ProductInCart(producInfo,quantity),
                        );
                      }
                    }
                    return Padding(
                      padding:EdgeInsets.all(10),
                      child: Text("Cart Rỗng"),
                    );
                  },
                  itemCount: cartController.listItemInCart.length,
                  padding: EdgeInsets.zero,
                ))
          ],
        )
            :
        Container(
          decoration: BoxDecoration(
              color: Colors.white
          ),
          margin:EdgeInsets.all(15),
          height: 300,
          width: MediaQuery.of(context).size.width,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('images/bag-removebg-preview.png'),
                width: 100,
              ),
              SizedBox(height: 10,),
              Text("Giỏ hàng của bạn trống",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),),
              SizedBox(height: 20,),
              ElevatedButton(
                child: Text("mua ngay",style: TextStyle(fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.black,
                  //onSurface: Colors.grey,
                  //side: BorderSide(color: Colors.black, width: 1),
                  elevation: 20,
                  minimumSize: Size(100, 40),
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {

                  //datacart.getToTal();
                },
              ),
            ],
          ),
        ),
      ),),
      bottomNavigationBar:cartController.listItemInCart.length != 0 ?
      Obx(() => Container(
        decoration: BoxDecoration(
            color: Colors.white
        ),
        padding: EdgeInsets.fromLTRB(13, 6, 13, 6),
        height: 50,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tất cả",style: TextStyle(color: Colors.black54)
              ,),
            Text(
              '${(cartController.total.value).toStringAsFixed(2)}\$',
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              child: Text("Thanh toán(${cartController.quantityProductInCart.value})",style: TextStyle(fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.black,
                //onSurface: Colors.grey,
                //side: BorderSide(color: Colors.black, width: 1),
                elevation: 20,
                minimumSize: Size(200, 50),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {

                //datacart.getToTal();
              },
            ),

          ],
        ) ,

      )) : null,
    );
  }
}

