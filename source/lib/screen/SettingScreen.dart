import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheinshop/controller/UserController.dart';
import 'package:sheinshop/screen/AccessScreen.dart';
import 'package:sheinshop/screen/AddressScreen.dart';

class SettingScreen extends StatelessWidget {
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
        title: Text("Cài đặt",style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black
        ) ,textAlign: TextAlign.start,),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Color(0xFFEEEEEE)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                child: ListTile(
                  onTap: (){

                  },
                  trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 15,),
                  title: Text("${UserController.session.value}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14)),
                ),
              ),
              SizedBox(height: 12,),
              ListView(
                shrinkWrap: true,
                  children: [
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        onTap: (){
                            userController.getListDeliveryAddress();
                            Get.to(AddressScreen());
                        },
                        trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 15,),
                        title: Text("Số địa chỉ",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14)),
                      ),
                    ),
                    Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 0,
                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        onTap: (){

                        },
                        trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 15,),
                        title: Text("Bảo mật tài khoản",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 12,),
              ListView(
                shrinkWrap: true,
                    children: [
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          onTap: (){

                          },
                          trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 15,),
                          title: Text("Vị trí",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14)),
                        ),
                      ),
                      Divider(
                        color: Colors.black12,
                        thickness: 1,
                        height: 0,
                      ),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          onTap: (){

                          },
                          trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 15,),
                          title: Text("Ngôn ngữ",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14)),
                        ),
                      ),
                      Divider(
                        color: Colors.black12,
                        thickness: 1,
                        height: 0,
                      ),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          onTap: (){

                          },
                          trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 15,),
                          title: Text("Tiền tệ",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14)),
                        ),
                      ),
                      Divider(
                        color: Colors.black12,
                        thickness: 1,
                        height: 0,
                      ),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          onTap: (){

                          },
                          trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 15,),
                          title: Text("Tùy chọn liên hệ",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14)),
                        ),
                      ),
                    ],
                  ),
              SizedBox(height: 12,),
              ListView(
                shrinkWrap: true,
                  children: [
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        onTap: (){

                        },
                        trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 15,),
                        title: Text("Đánh giá&Phản hồi",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14)),
                      ),
                    ),
                    Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 0,
                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        onTap: (){

                        },
                        trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 15,),
                        title: Text("Theo dõi chúng tôi",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14)),
                      ),
                    ),
                    Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 0,
                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        onTap: (){

                        },
                        trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 15,),
                        title: Text("Giới thiệu SHEIN",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 12,),
              ElevatedButton(
                child: Text("ĐĂNG XUẤT",style: TextStyle(fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                  onPrimary: Color(0xFDFF0000),
                  primary: Colors.white,
                  elevation: 20,
                  minimumSize: Size(360, 50),
                ),
                onPressed: ()  {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
