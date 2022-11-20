import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sheinshop/controller/CartController.dart';
import 'package:sheinshop/controller/ProductController.dart';
import 'package:sheinshop/screen/CartScreen.dart';
import 'package:sheinshop/screen/DetailProductScreen.dart';
import 'package:sheinshop/widget/ProductTileHome.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());
  Icon customIcon = const Icon(Icons.search,color: Colors.black,);
  Widget customSearchBar = const Text('MY SHOP',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),);
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _yourTextEditingController = new TextEditingController();
  double customerSizeTab = 65;
  int customerFontTab = 0;
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize:Size.fromHeight(100) ,
            child: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title:  SizedBox(
                  height: 35,
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
                              //Get.to(SearchScreen());
                            }
                          },
                          controller: _yourTextEditingController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 18),
                            prefixIcon: Padding(
                              padding:EdgeInsets.only(top: 1),
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
                  )),
              bottom: PreferredSize(
                  child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.black,
                      onTap: (value){
                          setState(() {
                            customerFontTab=value;
                            print(value.toString());
                          });
                      },
                      isScrollable: true,
                      unselectedLabelColor: Colors.white.withOpacity(0.3),
                      tabs: [
                        Tab(
                          child: Container(
                            width: customerSizeTab,
                            alignment: Alignment.center,
                            child: Text("ALL",style: customerFontTab==0 ? TextStyle(
                                color: Colors.black,fontWeight: FontWeight.bold
                            ) :TextStyle(
                                color: Colors.black54,fontWeight: FontWeight.bold
                            ) ,),
                          ),
                        ),
                        Tab(
                          child: Container(
                            width: customerSizeTab,
                            alignment: Alignment.center,
                            child: Text("NỮ",style: customerFontTab==1 ? TextStyle(
                                color: Colors.black,fontWeight: FontWeight.bold
                            ) :TextStyle(
                                color: Colors.black54,fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                        Tab(
                          child: Container(
                            width: customerSizeTab,
                            alignment: Alignment.center,
                            child: Text("NAM",style: customerFontTab==2 ? TextStyle(
                                color: Colors.black,fontWeight: FontWeight.bold
                            ) :TextStyle(
                                color: Colors.black54,fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                        Tab(
                          child: Container(
                            width: customerSizeTab,
                            alignment: Alignment.center,
                            child: Text("TRẺ EM",style: customerFontTab==3 ? TextStyle(
                                color: Colors.black,fontWeight: FontWeight.bold
                            ) :TextStyle(
                                color: Colors.black54,fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                        // Tab(
                        //   child: Text("TRANG SỨC",style: TextStyle(
                        //       color: Colors.black,fontWeight: FontWeight.bold
                        //   ),),
                        // ),
                        // Tab(
                        //   child: Text("ĐIỆN TỬ",style: TextStyle(
                        //       color: Colors.black,fontWeight: FontWeight.bold
                        //   ),),
                        // ),
                      ]),
                  preferredSize: Size.fromHeight(30.0)),
              actions: <Widget>[
                IconButton(
                    onPressed: (){
                      //productController.testPatch();

                    },
                    icon: Icon(Icons.mail_outline,color: Colors.black,size: 23,)
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
                          icon: Icon(Icons.shopping_bag_outlined,color: Colors.black,size: 24,)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Obx(
                    () {
                  if (productController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else
                    return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: productController.listProduct.length,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap:(){
                            productController.addListSeenHere(productController.listProduct[index]);
                            Get.to(DetailProductScreen(productController.listProduct[index]));
                          },
                          child:ProductTileHome(productController.listProduct[index]),
                        );
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    );
                },
              ),
              Obx(
                    () {
                  if (productController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else
                    return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: productController.listProductWoMen.length,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap:(){
                            productController.addListSeenHere(productController.listProductWoMen[index]);
                            Get.to(DetailProductScreen(productController.listProductWoMen[index]));
                          },
                          child:ProductTileHome(productController.listProductWoMen[index]),
                        );
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    );
                },
              ),
              Obx(
                    () {
                  if (productController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else
                    return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: productController.listProductMen.length,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap:(){
                            productController.addListSeenHere(productController.listProductMen[index]);
                            Get.to(DetailProductScreen(productController.listProductMen[index]));
                          },
                          child:ProductTileHome(productController.listProductMen[index]),
                        );
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    );
                },
              ),
              Obx(
                    () {
                  if (productController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else
                    return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: productController.listProductChildren.length,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap:(){
                            productController.addListSeenHere(productController.listProductChildren[index]);
                            Get.to(DetailProductScreen(productController.listProductChildren[index]));
                          },
                          child:ProductTileHome(productController.listProductChildren[index]),
                        );
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    );
                },
              ),
            ],
          )
      ),
    );
  }

  AppBar _buildCateAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: customSearchBar,
      automaticallyImplyLeading: false, //Color(0xFFEEEEEE),
      elevation: 0,
      actions: [
        // IconButton(
        //     onPressed: (){
        //     },
        //     icon: Icon(Icons.mail_outline,color: Colors.black,size: 17,)
        // ),
        IconButton(
          onPressed: () {
            setState(() {
              if (customIcon.icon == Icons.search) {
                customIcon = const Icon(Icons.cancel_outlined,color: Colors.black,);
                //customSearchBar = const Text('My Personal haha');
                customSearchBar =  const ListTile(
                  tileColor: Colors.black12,
                  title: TextField(
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
                );
              } else {
                customIcon = const Icon(Icons.search,color: Colors.black,);
                customSearchBar = const Text('My Shop',style: TextStyle(color: Colors.black),);
              }
            });
          },
          icon: customIcon,
        ),
        IconButton(
            onPressed: (){

            },
            icon: Icon(Icons.shopping_bag_outlined,color: Colors.black,size: 20,)
        ),
      ],
      centerTitle: true,
    );
  }
}
