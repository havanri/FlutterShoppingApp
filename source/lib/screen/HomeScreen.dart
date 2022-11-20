import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheinshop/controller/CartController.dart';
import 'package:sheinshop/controller/CategoryController.dart';
import 'package:sheinshop/controller/ProductController.dart';
import 'package:sheinshop/screen/CartScreen.dart';
import 'package:sheinshop/screen/FavouriteScreen.dart';
import 'package:sheinshop/screen/SearchScreen.dart';

class HomeScreen extends StatelessWidget {
  ProductController productController = Get.put(ProductController());
  CategoryController categoryController=Get.put(CategoryController());
  CartController cartController =Get.put(CartController());
  Widget customSearchBar = const Text('SHEIN',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),);
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _yourTextEditingController = new TextEditingController();
  double sizeboxcategory = 25.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(100) ,
        child: AppBar(
          leading: Container(
            child: IconButton(
              onPressed:()  {
                Get.to(FavouriteScreen());
                //productController.backupFromListOrigin();
              },
              icon:const Icon(Icons.favorite_outline),color: Colors.black,),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title:  SizedBox(
              height: 40,
              child:  Text('SHEIN',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 31),)
          ),
          actions: <Widget>[
            Icon(Icons.camera_alt_outlined,color: Colors.black,),
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
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              margin: EdgeInsets.fromLTRB(13, 0, 13, 8),
              height: 35,
              child: ListTile(
                tileColor: Colors.black12,
                title: Form(
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
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 24),
                      prefixIcon: Padding(
                        padding:EdgeInsets.only(bottom: 10),
                      child:Icon(
                        Icons.search,
                        color: Colors.black26,
                        size: 20,
                      ), ),
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
            ),
            ),
          ),
        ),
      body: Obx(()=>SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                  height: 40,
                  image: AssetImage('images/freeship.gif'),
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 13,),
                Image(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  image: AssetImage('images/slider.gif'),
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  child: Text("MÃ GIẢM GIÁ: VNYES",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,fontFamily: "Arial"),),
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
                SizedBox(height: 20,),
                Center(
                  //alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Mua theo thể loại",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      Image(
                        image: AssetImage('images/giamgia.png'),
                        width: 25,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 500,
                  height: 100,
                  margin: EdgeInsets.only(top:12),
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount:categoryController.listCateMen.length ,
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>Container(
                        width: 90,
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: EdgeInsets.all(17),
                                minimumSize: Size.zero,
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xFFEEEEEE),
                              ),
                              child:Image(
                                image: AssetImage('images/categories/${categoryController.listCateMen[index].featureImage}'),
                                width: 38,
                              ) ,
                              onPressed: () {
                                productController.searchProductByWord(categoryController.listCateMen[index].name);
                              },
                            ),
                            SizedBox(height:5),
                            Text("${categoryController.listCateMen[index].name}")
                          ],
                        )
                    ),
                  ),
                ),
                Container(
                  width: 500,
                  height: 100,
                  margin: EdgeInsets.only(top:12),
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount:categoryController.listCateWomen.length ,
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>Container(
                        width: 90,
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: EdgeInsets.all(17),
                                minimumSize: Size.zero,
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xFFEEEEEE),
                              ),
                              child:Image(
                                image: AssetImage('images/categories/${categoryController.listCateWomen[index].featureImage}'),
                                width: 38,
                              ) ,
                              onPressed: () {
                                productController.searchProductByWord(categoryController.listCateWomen[index].name);
                              },
                            ),
                            SizedBox(height:5),
                            Text("${categoryController.listCateWomen[index].name}")
                          ],
                        )
                    ),
                  ),
                ),
                Container(
                  width: 500,
                  height: 100,
                  margin: EdgeInsets.only(top:12),
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount:categoryController.listCateChildren.length ,
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>Container(
                        width: 90,
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: EdgeInsets.all(17),
                                minimumSize: Size.zero,
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xFFEEEEEE),
                              ),
                              child:Image(
                                image: AssetImage('images/categories/${categoryController.listCateChildren[index].featureImage}'),
                                width: 38,
                              ) ,
                              onPressed: () {
                                productController.searchProductByWord(categoryController.listCateChildren[index].name);
                              },
                            ),
                            SizedBox(height:5),
                            Text("${categoryController.listCateChildren[index].name}")
                          ],
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),),
    );
  }
}
