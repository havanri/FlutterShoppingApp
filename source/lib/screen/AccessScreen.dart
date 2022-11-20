import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheinshop/controller/UserController.dart';
import 'package:sheinshop/extensions/regex_extension.dart';
import 'package:sheinshop/main.dart';

class AccessScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final _formKey = GlobalKey<FormState>();
  var _emailTextController = TextEditingController(text: "");
  var _passwordTextController = TextEditingController(text: "");
  var _emailTextControllerSignUp = TextEditingController(text: "");
  var _passwordTextControllerSignUp = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("SHEIN",style: TextStyle(
          fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: "Arial"
        ),
        ),
        actions: [
          IconButton(
              onPressed: (){},
              padding: EdgeInsets.fromLTRB(0, 0, 15, 13),
              icon:Icon(Icons.close,color: Colors.black,size: 27,))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(10),
          child: Obx(()=>DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.black,
                    onTap: (value){
                      userController.tabAccess(value);
                    },
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    tabs: [
                      Tab(
                        child: Text("ĐĂNG NHẬP",style: TextStyle(
                            color: Colors.black,fontWeight: FontWeight.w700,fontFamily: 'Arial',fontSize: 16
                        )),
                      ),
                      Tab(
                        child: Text("ĐĂNG KÝ",style:TextStyle(
                            color: Colors.black,fontWeight: FontWeight.w700,fontFamily: 'Arial',fontSize:16
                        ) ),
                      ),
                    ]),
                userController.selectedIndexTabAccess==0 ? Container(
                  child: Form(
                      key: _formKey,
                      child: Center(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            margin: EdgeInsets.only(top:40),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    //enabled: !controller.loginProcess.value,
                                    controller: _emailTextController,
                                    decoration: InputDecoration(
                                      //icon: Icon(Icons.person),
                                        labelText: "Địa chỉ email",
                                        labelStyle: TextStyle(
                                            color: Colors.black26,fontWeight: FontWeight.bold,fontSize: 15
                                        ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black38),
                                      ),
                                    ),
                                    validator: (val){
                                      if (!val.toString().isValidEmail) {
                                        return 'Enter valid email';
                                      }
                                    },
                                  ),
                                  SizedBox(height: 22),
                                  TextFormField(
                                    //enabled: !controller.loginProcess.value,
                                    controller: _passwordTextController,
                                    validator: (val){
                                      if (!val!.isValidPassword) {
                                        return 'Enter valid Password';
                                      }
                                    },
                                    obscureText: userController.isObscureLogin.value,
                                    decoration: InputDecoration(

                                      //icon: Icon(Icons.lock),
                                      labelText: "Mật mã",
                                      labelStyle: TextStyle(
                                          color: Colors.black26,fontWeight: FontWeight.bold,fontSize: 15
                                      ),
                                      suffixIcon: IconButton(
                                        icon:userController.isObscureLogin.value==true ? Icon(
                                          //_passwordVisible
                                            //Icons.visibility_off
                                           Icons.visibility_off,
                                        ) :Icon(Icons.visibility),
                                        onPressed: () {
                                            userController.changeStatusPass();
                                        },
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black38),
                                      ),
                                      focusColor: Colors.black38,
                                    ),
                                  ),
                                  SizedBox(height:8),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: TextButton(
                                      onPressed: (){

                                      },
                                      child: Text("Quên mật khẩu?",style: TextStyle(
                                          color: Colors.black38,fontSize: 13,fontFamily: "Arial",fontWeight: FontWeight.bold
                                      ),),
                                    ),
                                  ),
                                  SizedBox(height: 26,),
                                  ElevatedButton(
                                    child: Text("ĐĂNG NHẬP",style: TextStyle(fontWeight: FontWeight.bold),),
                                    style: ElevatedButton.styleFrom(
                                      onPrimary: Colors.white,
                                      primary: Colors.black,
                                      elevation: 20,
                                      minimumSize: Size(329, 50),
                                    ),
                                    onPressed: () async {
                                        userController.customSizebox.value=100;
                                        if(_formKey.currentState!.validate()) {
                                          String? error = await userController.checkLogin(_emailTextController.text, _passwordTextController.text);
                                          if(error!=""){
                                            Get.defaultDialog(title: error!,middleText: error);
                                          }
                                          else{
                                            Get.off(MyApp());
                                          }
                                        }
                                    },
                                  ),
                                  SizedBox(height: userController.customSizebox.value,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("----Hoặc tham gia.----",style: TextStyle(
                                          color: Colors.black38,fontSize: 15,fontFamily: "Arial",fontWeight: FontWeight.bold
                                      ),),
                                    ],
                                  ),
                                  SizedBox(height: 6,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          //do what you want here
                                        },
                                        child:  CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          backgroundImage: AssetImage("images/google2.png"),
                                        ),
                                      ),
                                      SizedBox(width: 15,),
                                      GestureDetector(
                                        onTap: () {
                                          //do what you want here
                                        },
                                        child:  CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 21,
                                          backgroundImage: AssetImage("images/facebookmain.png"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text("Bằng cách đăng nhập vào tài khoản của bạn, bạn đồng ý với Chính sách bảo mật & Cookie và Điều khoản và Điều kiện của chúng tôi.",style: TextStyle(
                                        color: Colors.black38,fontSize: 11,fontFamily: "Arial",fontWeight: FontWeight.bold
                                    ),textAlign: TextAlign.center,),
                                  )
                                ]),

                          ))
                  ),

                ) : Container(
                  child: Form(
                      key: _formKey,
                      child: Center(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            margin: EdgeInsets.only(top:8),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(

                                    height: 52,
                                    alignment: Alignment.topLeft,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                    ),
                                    padding: EdgeInsets.fromLTRB(9, 9, 30, 9),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text("GIẢM THÊM 15% CHO ĐƠN HÀNG ĐẦU TIÊN",
                                            style:TextStyle(fontFamily: "Arial",fontWeight: FontWeight.bold) ,
                                      ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  TextFormField(
                                    //enabled: !controller.loginProcess.value,
                                    controller: _emailTextControllerSignUp,
                                    decoration: InputDecoration(

                                      //icon: Icon(Icons.person),
                                        labelText: "Địa chỉ email",
                                        labelStyle: TextStyle(
                                            color: Colors.black26,fontWeight: FontWeight.bold,fontSize: 15
                                        )
                                    ),
                                    validator: (val){
                                      if (!val.toString().isValidEmail) {
                                        return 'Enter valid email';
                                      }
                                    },
                                  ),
                                  SizedBox(height: 22),
                                  TextFormField(
                                    //enabled: !controller.loginProcess.value,
                                    controller: _passwordTextControllerSignUp,
                                    validator: (val){
                                      if (!val!.isValidPassword) {
                                        return 'Enter valid Password';
                                      }
                                    },
                                    obscureText: userController.isObscureSignUp.value,
                                    decoration: InputDecoration(
                                      //icon: Icon(Icons.lock),
                                      labelText: "Mật mã",
                                      labelStyle: TextStyle(
                                          color: Colors.black26,fontWeight: FontWeight.bold,fontSize: 15
                                      ),
                                      suffixIcon: IconButton(
                                        icon:userController.isObscureSignUp.value==true ? Icon(
                                          //_passwordVisible
                                          //Icons.visibility_off
                                          Icons.visibility_off,
                                        ) :Icon(Icons.visibility),
                                        onPressed: () {
                                          userController.changeStatusPassSignUp();
                                        },
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 48,),
                                  ElevatedButton(
                                    child: Text("ĐĂNG KÝ",style: TextStyle(fontWeight: FontWeight.bold),),
                                    style: ElevatedButton.styleFrom(
                                      onPrimary: Colors.white,
                                      primary: Colors.black,
                                      elevation: 20,
                                      minimumSize: Size(329, 50),
                                    ),
                                    onPressed: ()async {
                                      if(_formKey.currentState!.validate()) {
                                        String? error = await userController.addUser(_emailTextControllerSignUp.text, _passwordTextControllerSignUp.text);
                                        if(error!=""){
                                          Get.defaultDialog(title: "Oops!"!,middleText: error!);
                                        }
                                        else{
                                          showDialog(
                                            context: context,
                                            builder:(context) => buildDialog(context),
                                          );
                                        }
                                      }
                                    },
                                  ),
                                  SizedBox(height: 130,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("----Hoặc tham gia.----",style: TextStyle(
                                          color: Colors.black38,fontSize: 15,fontFamily: "Arial",fontWeight: FontWeight.bold
                                      ),),
                                    ],
                                  ),
                                  SizedBox(height: 6,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          //do what you want here
                                        },
                                        child:  CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          backgroundImage: AssetImage("images/google2.png"),
                                        ),
                                      ),
                                      SizedBox(width: 15,),
                                      GestureDetector(
                                        onTap: () {
                                          //do what you want here
                                        },
                                        child:  CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 21,
                                          backgroundImage: AssetImage("images/facebookmain.png"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text("Bằng cách đăng nhập vào tài khoản của bạn, bạn đồng ý với Chính sách bảo mật & Cookie và Điều khoản và Điều kiện của chúng tôi.",style: TextStyle(
                                        color: Colors.black38,fontSize: 11,fontFamily: "Arial",fontWeight: FontWeight.bold
                                    ),textAlign: TextAlign.center,),
                                  )
                                ]),

                          ))
                  ),
                )
              ],
            ),
          ),),
        ),
      ),
    );
  }
  AlertDialog buildDialog(BuildContext context){
    return AlertDialog(
      content: Text("Đăng ký thành công!!! Vui lòng chuyển trang đăng nhập",
        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
      actionsAlignment: MainAxisAlignment.center,
      elevation: 24,
      backgroundColor: Colors.white,
    );
  }
}
