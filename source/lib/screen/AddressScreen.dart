import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheinshop/controller/UserController.dart';
import 'package:sheinshop/screen/DeliveryAddressScreen.dart';

class AddressScreen extends StatelessWidget {
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed:(){
              Get.back();
            },
            icon:const Icon(Icons.arrow_back,color: Colors.black,)
        ),
        backgroundColor: Colors.white,
        title: Text("Địa chỉ của tôi",style: TextStyle(
          fontWeight: FontWeight.bold,fontSize: 19,color: Colors.black
        ) ,textAlign: TextAlign.start,),
      ),
      body: Obx(()=>SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color(0xFFEEEEEE)
          ),
          child:userController.checkExistAddress()==false ? Column(
            children: [
              Column(
                children: [
                  SizedBox(height: 100,),
                  Image.asset("images/address.png",width: 70,),
                  SizedBox(height:28),
                  Text("Rỗng :-(",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontFamily: "Arial"),),
                  SizedBox(height: 30,),
                  ElevatedButton(
                    child: Text("+ Thêm địa chỉ giao hàng",style: TextStyle(fontWeight: FontWeight.bold),),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Colors.black,
                      elevation: 20,
                      minimumSize: Size(329, 50),
                    ),
                    onPressed: () async {
                      Get.to(DeliveryAddressScreen());
                    },
                  ),
                ],
              )
            ],
          )
              : Container(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    color: Colors.white,
                    child: ListTile(
                      onTap: (){
                          print("Sửa nhé");
                          //userController.editDeliveryAddress(index);
                      },
                      trailing: IconButton(
                        onPressed: () async {
                              //remove deliveryAddress
                          var result = await userController.removeDeliveryAddress(index);
                          print("---"+result.toString());
                          if(result=="failed"){
                            showDialog(
                              context: context,
                              builder:(context) => buildDialog(context),
                            );
                          }
                        },
                        icon: Icon(Icons.restore_from_trash_outlined,color: Colors.black54,size: 27,),
                      ),
                      title: Text("${userController.listDeliveryAddress[index]["firstname"]} "+ "${userController.listDeliveryAddress[index]["lastname"]}"+"  ${userController.listDeliveryAddress[index]["tel"]}",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${userController.listDeliveryAddress[index]["address"]}"),
                          Divider(
                            color: Color(0xFFEEEEEE),
                            thickness: 1,
                            height: 0,
                          ),
                          CheckboxListTile(
                            title:userController.listDeliveryAddress[index]["status"]== true ? Text("Mặc định") : null,
                            value: userController.listDeliveryAddress[index]["status"],
                            onChanged: (newValue) {

                                userController.changeDeliveryAddress(index);

                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          )
                        ],
                      ),
                    ),
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  itemCount: userController.listDeliveryAddress.length,
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  child: Text("+ Thêm địa chỉ giao hàng",style: TextStyle(fontWeight: FontWeight.bold),),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.black,
                    elevation: 20,
                    minimumSize: Size(360, 50),
                  ),
                  onPressed: () async {
                    Get.to(DeliveryAddressScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),)
    );
  }
  AlertDialog buildDialog(BuildContext context){
    return AlertDialog(
      content: Text("Không thể xóa địa chỉ mặc định",
        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
      actionsAlignment: MainAxisAlignment.center,
      elevation: 24,
      backgroundColor: Colors.white,
    );
  }
}
