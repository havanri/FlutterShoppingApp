import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sheinshop/controller/CartController.dart';
import 'package:sheinshop/controller/ProductController.dart';
import 'package:sheinshop/screen/CartScreen.dart';
import 'package:sheinshop/screen/DetailProductScreen.dart';
import 'package:sheinshop/widget/ProductTileHome.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  ProductController productController = Get.put(ProductController());
  CartController cartController = Get.put(CartController());
  Icon customIcon = const Icon(Icons.search,color: Colors.black,);
  Widget customSearchBar = const Text('SHEIN',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),);
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _yourTextEditingController = new TextEditingController();
  var isSelect = "Giới thiệu";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:Size.fromHeight(100) ,
          child: AppBar(
            leading: Container(
              child: IconButton(
                onPressed:()  {
                  //productController.backupFromListOrigin();
                  Get.back();
                },
                icon:const Icon(Icons.arrow_back),color: Colors.black,),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            title:  SizedBox(
                height: 30,
                child: customSearchBar),
            bottom: PreferredSize(
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.black,
                    onTap: (value){
                      switch(value){
//
                      }
                    },
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    tabs: [
                      Tab(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(

                            items: <String>['Giới thiệu', 'Mới đến', 'Giá thấp đến cao', 'Giá cao đến thấp'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: isSelect==value ? Text(value,style: TextStyle(
                                    color: Colors.black,fontWeight: FontWeight.bold
                                ),) : Text(value),
                                onTap:() {
                                  setState(() {
                                    isSelect=value;
                                    productController.filterProductByOption(value);
                                  });
                                  print("is select"+isSelect);
                                  print(value.toString());
                                },
                              );
                            }).toList(),
                            onChanged: (_) {},
                            hint: Text("Phân loại",style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                      ),
                      Tab(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(

                            items: <String>['S', 'M', 'L', 'XS'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: isSelect==value ? Text(value,style: TextStyle(
                                    color: Colors.black,fontWeight: FontWeight.bold
                                ),) : Text(value),
                                onTap:() {
                                  setState(() {
                                    isSelect=value;
                                    productController.filterProductByOption(value);
                                  });
                                  print("is select"+isSelect);
                                  print(value.toString());
                                },
                              );
                            }).toList(),
                            onChanged: (_) {},
                            hint: Text("Kích thước",style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                      ),
                      Tab(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(

                            items: <String>['Giới thiệu', 'Mới đến', 'Giá thấp đến cao', 'Giá cao đến thấp'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: isSelect==value ? Text(value,style: TextStyle(
                                    color: Colors.black,fontWeight: FontWeight.bold
                                ),) : Text(value),
                                onTap:() {
                                  setState(() {
                                    isSelect=value;
                                    productController.filterProductByOption(value);
                                  });
                                  print("is select"+isSelect);
                                  print(value.toString());
                                },
                              );
                            }).toList(),
                            onChanged: (_) {},
                            hint: Text("Sàng lọc",style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                      ),
                    ]),
                preferredSize: Size.fromHeight(30.0)),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    if (customIcon.icon == Icons.search) {
                      customIcon = const Icon(Icons.cancel_outlined,color: Colors.black,);
                      //customSearchBar = const Text('My Personal haha');
                      customSearchBar = SizedBox(height: 35,
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
                                    print(value.toString());
                                    //Navigator.of(context).pop();
                                    //productController.setListOrigin();
                                    productController.searchProductByWord(value);
                                    //Get.to(SearchPage());
                                  }
                                },
                                controller: _yourTextEditingController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 18),
                                  prefixIcon: Padding(
                                    padding:EdgeInsets.only(bottom:20),
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
                            // child: TextField(
                            //     controller:_yourTextEditingController,
                            //     textInputAction: TextInputAction.search,
                            //     autofocus:true,
                            //     onSubmitted: null,
                            //     decoration: InputDecoration(
                            //       icon: Icon(
                            //         Icons.search,
                            //         color: Colors.black26,
                            //         size: 20,
                            //       ),
                            //       hintText: 'Tìm kiếm',
                            //       hintStyle: TextStyle(
                            //         color: Colors.black26,
                            //         fontSize: 15,
                            //       ),
                            //       border: InputBorder.none,
                            //     ),
                            //     style: TextStyle(
                            //       color: Colors.black26,
                            //     ),
                            //   ),
                          ),
                        ),
                      );
                    } else {
                      customIcon = const Icon(Icons.search,color: Colors.black,);
                      customSearchBar = const Text('SHEIN',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),);
                    }
                  });
                },

                icon: customIcon,
              ),
              Obx(()=>Padding(
                padding: const EdgeInsets.fromLTRB(0,3,5,0),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
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

                    ),
                    IconButton(
                        onPressed: (){
                          //productController.testPatch();
                          Get.to(CartScreen());
                        },
                        icon: Icon(Icons.shopping_bag_outlined,color: Colors.black,size: 24,)
                    ),
                  ],
                ),
              ),),
            ],
          ),
        ),
        body: Obx(
              () {
            if (productController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else
              return StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: productController.listSearch.length,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap:(){
                      productController.addListSeenHere(productController.listSearch[index]);
                      Get.to(DetailProductScreen(productController.listSearch[index]));
                    },
                    child:ProductTileHome(productController.listSearch[index]),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              );
          },
        ),
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
                customSearchBar = const Text('SHEIN',style: TextStyle(color: Colors.black),);
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
