import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sheinshop/controller/CartController.dart';
import 'package:sheinshop/controller/FavouriteController.dart';
import 'package:sheinshop/controller/ProductController.dart';
import 'package:sheinshop/controller/UserController.dart';
import 'package:sheinshop/screen/CartScreen.dart';
import 'package:sheinshop/screen/DetailProductScreen.dart';
import 'package:sheinshop/screen/FavouriteScreen.dart';
import 'package:sheinshop/screen/SettingScreen.dart';
import 'package:sheinshop/widget/ProductTileHome.dart';

class ProfileScreen extends StatelessWidget {
  CartController cartController = Get.put(CartController());
  ProductController productController = Get.put(ProductController());
  FavouriteController favouriteController = Get.put(FavouriteController());
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child:Obx(()=> Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,3,5,0),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                   Container(
                    child: Text("2",
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
                      },
                      icon: Icon(Icons.add_alert_sharp,color: Colors.black,size: 24,)
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: (){
                  //productController.testPatch();
                },
                icon: Icon(Icons.qr_code_scanner_outlined,color: Colors.black,size: 24,)
            ),
            IconButton(
                onPressed: (){

                  Get.to(SettingScreen());
                },
                icon: Icon(Icons.settings_outlined,color: Colors.black,size: 24,)
            ),
            Padding(
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
            ),
          ],
        ),),

    ),
      body: SafeArea(
        child: Container(
          color: Color(0xFFEEEEEE),
          margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(7, 10, 7, 10),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "Ch??o, havanri. 17072002",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 20),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                    onPressed: (){},
                                    icon: Text("1",style: TextStyle(fontWeight: FontWeight.bold),)),
                                SizedBox(height:5),
                                Text("Phi???u gi???m gi??")
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: (){},
                                    icon: Text("20",style: TextStyle(fontWeight: FontWeight.bold),)),
                                SizedBox(height:5),
                                Text("??i???m")
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.account_balance_wallet_outlined)),
                                SizedBox(height:5),
                                Text("V??")
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.card_giftcard_outlined)),
                                SizedBox(height:5),
                                Text("th??? qu?? t???ng")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(7, 10, 7, 10),
                  child: Column(
                    children: [
                      Align(alignment: Alignment.topLeft,child: Text("????n h??ng c???a t??i",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.add_card_outlined)),
                              SizedBox(height:5),
                              Text("????n h??ng")
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.transfer_within_a_station_outlined)),
                              SizedBox(height:5),
                              Text("L???y h??ng")
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.fire_truck_outlined)),
                              SizedBox(height:5),
                              Text("???? v???n chuy???n")
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.rate_review_outlined)),
                              SizedBox(height:5),
                              Text("????nh gi??")
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.assignment_returned_outlined)),
                              SizedBox(height:5),
                              Text("Tr??? l???i")
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(7, 10, 7, 10),
                  child: Column(
                    children: [
                      Align(alignment: Alignment.topLeft,child: Text("Nhi???u d???ch v??? h??n",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.headset_mic_outlined)),
                              SizedBox(height:5),
                              Text("C??u h???i")
                            ],
                          ),
                          SizedBox(width: 15,),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.sticky_note_2_outlined)),
                              SizedBox(height:5),
                              Text("Kh???o s??t",)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //TabProfile
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                     Obx(() => DefaultTabController(
                       length:2,
                       child: Column(
                         children: [
                           TabBar(
                               indicatorSize: TabBarIndicatorSize.label,
                               indicatorColor: Colors.black,
                               onTap: (value){
                                 favouriteController.selectedIndexTabInProfile(value);
                                 print(value.toString());

                               },
                               isScrollable: true,
                               unselectedLabelColor: Colors.white.withOpacity(0.3),
                               tabs: [
                                 Tab(
                                   child: Text("Danh s??ch y??u th??ch",style:favouriteController.selectedIndexTabInProfile==0 ? TextStyle(
                                       color: Colors.black,fontWeight: FontWeight.w700,fontFamily: 'Arial',fontSize: 15
                                   ) : TextStyle(
                                       color: Colors.black54,fontWeight: FontWeight.w700,fontFamily: 'Arial',fontSize: 15
                                   ),),
                                 ),
                                 Tab(
                                   child: Text("???? xem g???n ????y",style:favouriteController.selectedIndexTabInProfile==1 ? TextStyle(
                                       color: Colors.black,fontWeight: FontWeight.w700,fontFamily: 'Arial',fontSize: 15
                                   ) : TextStyle(
                                       color: Colors.black54,fontWeight: FontWeight.w700,fontFamily: 'Arial',fontSize: 15
                                   ),),
                                 ),
                               ]),
                           favouriteController.selectedIndexTabInProfile==0 ?
                           Container(
                             child:Column(
                               children: [
                                 productController.isLoading.value ?
                                 Center(child: CircularProgressIndicator()) :
                                 StaggeredGridView.countBuilder(
                                   physics: ScrollPhysics(),
                                   shrinkWrap: true,
                                   crossAxisCount: 2,
                                   itemCount: favouriteController.listProductFavourite.length,
                                   crossAxisSpacing: 16,
                                   mainAxisSpacing: 16,
                                   itemBuilder: (context, index) {
                                     return GestureDetector(
                                       onTap:(){
                                         Get.to(DetailProductScreen(favouriteController.listProductFavourite[index]));
                                         productController.addListSeenHere(favouriteController.listProductFavourite[index]);
                                       },
                                       child:ProductTileHome(favouriteController.listProductFavourite[index]),
                                     );
                                   },
                                   staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                                 )
                               ],
                             ),
                           ) : Container(child:
                           Column(
                             children: [
                               productController.isLoading.value ?
                               Center(child: CircularProgressIndicator()) :
                               StaggeredGridView.countBuilder(
                                 physics: ScrollPhysics(),
                                 shrinkWrap: true,
                                 crossAxisCount: 2,
                                 itemCount: productController.listProductSeenHere.length,
                                 crossAxisSpacing: 16,
                                 mainAxisSpacing: 16,
                                 itemBuilder: (context, index) {
                                   return GestureDetector(
                                     onTap:(){
                                       //productController.addListSeenHere(productController.listProductSeenHere[index]);
                                       Get.to(DetailProductScreen(productController.listProductSeenHere[index]));
                                     },
                                     child:ProductTileHome(productController.listProductSeenHere[index]),
                                   );
                                 },
                                 staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                               )
                             ],
                           ),),
                         ],
                       ),
                     ),)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


