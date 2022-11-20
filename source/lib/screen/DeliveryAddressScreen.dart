import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheinshop/controller/UserController.dart';

class DeliveryAddressScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  var _firstnameTextController = TextEditingController(text: "");
  var _lastnameTextController = TextEditingController(text: "");
  var _telTextController = TextEditingController(text: "");
  var _addressTextController = TextEditingController(text: "");
  var _zipcodeTextController = TextEditingController(text: "");
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
        title: Text("Địa chỉ giao hàng",style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 19,color: Colors.black
        ) ,textAlign: TextAlign.start,),
      ),
      body: Obx(()=>SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      //enabled: !controller.loginProcess.value,
                      controller: _firstnameTextController,
                      decoration: InputDecoration(
                        //icon: Icon(Icons.person),
                        labelText: "Họ*",
                        labelStyle: TextStyle(
                            color: Colors.black26,fontWeight: FontWeight.bold,fontSize: 15
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                        ),
                      ),
                      validator: (val){
                        if (val.toString().isEmpty) {
                          return 'Enter valid firstname';
                        }
                      },
                    ),
                    SizedBox(height: 22),
                    TextFormField(
                      //enabled: !controller.loginProcess.value,
                      controller: _lastnameTextController,
                      validator: (val){
                        if (val!.isEmpty) {
                          return 'Enter valid lastname';
                        }
                      },
                      decoration: InputDecoration(
                        //icon: Icon(Icons.lock),
                        labelText: "Tên*",
                        labelStyle: TextStyle(
                            color: Colors.black26,fontWeight: FontWeight.bold,fontSize: 15
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                        ),
                        focusColor: Colors.black38,
                      ),
                    ),
                    SizedBox(height: 22),
                    TextFormField(
                      //enabled: !controller.loginProcess.value,
                      controller: _telTextController,
                      validator: (val){
                        if (val!.isEmpty) {
                          return 'Enter valid Tel';
                        }
                      },
                      decoration: InputDecoration(
                        //icon: Icon(Icons.lock),
                        labelText: "Số điện thoại*",
                        labelStyle: TextStyle(
                            color: Colors.black26,fontWeight: FontWeight.bold,fontSize: 15
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                        ),
                        focusColor: Colors.black38,
                      ),
                    ),
                    SizedBox(height: 22,),
                    TextFormField(
                      //enabled: !controller.loginProcess.value,
                      controller: _addressTextController,
                      validator: (val){
                        if (val!.isEmpty) {
                          return 'Enter valid address';
                        }
                      },
                      decoration: InputDecoration(
                        //icon: Icon(Icons.lock),
                        labelText: "Địa chỉ đường phố*",
                        labelStyle: TextStyle(
                            color: Colors.black26,fontWeight: FontWeight.bold,fontSize: 15
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                        ),
                        focusColor: Colors.black38,
                      ),
                    ),
                    SizedBox(height: 22,),
                    TextFormField(
                      //enabled: !controller.loginProcess.value,
                      controller: _zipcodeTextController,
                      validator: (val){
                        if (val!.isEmpty || val!.isNum==false) {
                          return 'Enter valid zipcode and zipcode is num';
                        }
                      },
                      decoration: InputDecoration(
                        //icon: Icon(Icons.lock),
                        labelText: "Mã bưu điện*",
                        labelStyle: TextStyle(
                            color: Colors.black26,fontWeight: FontWeight.bold,fontSize: 15
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                        ),
                        focusColor: Colors.black38,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      color:Color(0xFFEEEEEE),
                      child: ListTile(
                        onTap:null,
                        trailing: Transform.scale(
                          scale: 0.7,
                          child: CupertinoSwitch(
                            activeColor: Colors.black,
                            // color of the round icon, which moves from right to left
                            thumbColor: Colors.white,
                            // when the switch is off
                            trackColor: Colors.white,
                            value: userController.switchValue.value,
                            onChanged: (value) {
                              userController.changeSwitchAddress(value);
                            },
                          ),
                        ),
                        title: Text("Đặt địa chỉ măc định",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 15)),
                      ),
                    ),
                    SizedBox(height: 40,),
                    ElevatedButton(
                      child: Text("LƯU",style: TextStyle(fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.black,
                        elevation: 20,
                        minimumSize: Size(360, 50),
                      ),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()) {
                            int zipcode =int.parse(_zipcodeTextController.text);
                            userController.saveNewAddressForUser(_firstnameTextController.text, _lastnameTextController.text, _telTextController.text, _addressTextController.text,zipcode, userController.switchValue.value);
                            Get.back();
                        }
                      },
                    ),
                    SizedBox(height: 50),
                    Align(
                      alignment: Alignment.center,
                      child: Text("Chính sách bảo mật & Cookie",style: TextStyle(
                          color: Colors.black54,fontSize: 12,fontFamily: "Arial",fontWeight: FontWeight.bold
                      ,decoration: TextDecoration.underline),textAlign: TextAlign.center),
                    )
                  ]),

            )
        ),
      ),),
    );
  }
}

