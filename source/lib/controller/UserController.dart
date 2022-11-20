
import 'package:dbcrypt/dbcrypt.dart';
import 'package:get/get.dart';
import 'package:sheinshop/entity/User.dart';
import 'package:sheinshop/repository/UserRepositoryImp.dart';

class UserController extends GetxController{
  var isLoading = true.obs;
  var switchValue= true.obs;
  var listUser = [].obs;
  var listDeliveryAddress=[].obs;
  var selectedIndexTabAccess = 0.obs;
  var isObscureLogin=true.obs;
  var isObscureSignUp=true.obs;
  static var session =0.obs;
  var customSizebox = 140.0.obs;
  String? error ;

  UserRepositoryImp repoUser = new UserRepositoryImp();
  @override
  void onInit() {
    getAllUsers();
    super.onInit();
  }
  void getAllUsers()async{
    try {
      isLoading(true);
      var users = await repoUser.getAllUsers();
      if (users != null) {
        listUser.value = users;
        List<User> list = listUser.toJson();
        //List<dynamic> test = list as List<dynamic>;
        print("Độ dài list User:"+list.length.toString());
      }
    } finally {
      isLoading(false);
    }
  }
  Future<void> getListDeliveryAddress() async {
    var user = await repoUser.findUserById(session.value);
    listDeliveryAddress.value=user.deliveryAddress;
  }
  void tabAccess(int selectedIndex){
    if(selectedIndex==0){
      selectedIndexTabAccess.value=0;
    }
    else{
      customSizebox.value=140;
      selectedIndexTabAccess.value=1;
    }
  }
  Future<String?>addUser(String email,String password) async{
    var isExistUser =false;
    listUser.forEach((element) {
     // print("Email: "+element.email);
      //print("Password: "+element.password);
      if(element.email==email){
        error="Tài khoản đã tồn tại!!!";
        isExistUser =true;
      }
    });
    if(isExistUser==false){
      print("Thành công");
      //selectedIndexTabAccess.value = 0;
      error="";
      var hashedPassword = new DBCrypt().hashpw(password, new DBCrypt().gensalt());
      print("password salt:"+hashedPassword.toString());
      var deliveryAddress= [];
      repoUser.addUser(email, hashedPassword,deliveryAddress);
      //var hashedPassword = new DBCrypt().hashpw(password, new DBCrypt().gensalt());
      //print(hashedPassword.toString());
      //repoUser.addUser(email, password);
      //add new User
    }
    getAllUsers();
    return error;
  }
  Future<String?> checkLogin(String email,String password) async{
    error="Oops";
    print("Email mpassswword truyền vào: "+ email+"|"+password);
    print("listUser:"+listUser.length.toString());
    listUser.forEach((element) {
      //print("Email: "+element.email);
      //print("Password: "+element.password);
      var isCorrect = new DBCrypt().checkpw(password, element.password);
      //print("check:"+isCorrect.toString());
      if(element.email==email && isCorrect==true){
        print("Email: "+element.email);
        print("Password: "+password);
        session.value=element.id;
        print("session:"+session.toString());
        print("Đăng nhập thành công");
        error="";
      }
    });
    return error;
  }
  void changeStatusPass(){
    if(isObscureLogin.value==true){
      print("chuyển sang trạng thái hiện");
      isObscureLogin.value=false;
    }
    else {
      print("chuyển sang trạng thái ẩn");
      isObscureLogin.value=true;
    }
  }
  void changeStatusPassSignUp(){
    if(isObscureSignUp.value==true){
      print("chuyển sang trạng thái hiện");
      isObscureSignUp.value=false;
    }
    else {
      print("chuyển sang trạng thái ẩn");
      isObscureSignUp.value=true;
    }
  }

  Future<void> saveNewAddressForUser(String firstname,String lastname,String tel,String address,int zipcode,bool status) async {
    var user = await repoUser.findUserById(session.value);
    if(status==true){
      //change statusAddress = false;
      user.deliveryAddress.forEach((element) {
        element["status"]=false;
      });
      listDeliveryAddress.forEach((element) {
        element["status"]=false;
      });
    }
    print("session:"+session.value.toString());
    var newDeliveryAddress = {
      "firstname":firstname,
      "lastname":lastname,
      "tel":tel,
      "address":address,
      "zipcode":zipcode,
      "status":status
    };
    print("firstname:"+newDeliveryAddress["firstname"].toString());
    print("lasttname:"+newDeliveryAddress["lastname"].toString());
    print("tel:"+newDeliveryAddress["tel"].toString());
    print("address:"+newDeliveryAddress["address"].toString());
    print("zipcode:"+newDeliveryAddress["zipcode"].toString());
    print("status:"+newDeliveryAddress["status"].toString());

    user.deliveryAddress.add(newDeliveryAddress);
    user.deliveryAddress.forEach((element) {
      print(element);
    });
    repoUser.updateUser(user);
    listDeliveryAddress.add(newDeliveryAddress);
    // user.deliveryAddress.forEach((element) {
    //
    //   repoUser.updateUser(user);
    // });
  }
  Future<void> changeDeliveryAddress(int index) async {
    var user = await repoUser.findUserById(session.value);
    print("thay đổi");
    print("index"+index.toString());
    print(listDeliveryAddress.length.toString());
    for(int i=0;i<listDeliveryAddress.length;i++){
      if(i==index && listDeliveryAddress[i]["status"]==true ){
        print("xóa mặc định");
        listDeliveryAddress[i]["status"]=false;
      }
      else if(i==index){
        print("Đã thay đổi index này"+index.toString());
        listDeliveryAddress[i]["status"]=true;
      }
      else {
        listDeliveryAddress[i]["status"]=false;
      }
    }
    user.deliveryAddress=listDeliveryAddress;
    repoUser.updateUser(user);
    listDeliveryAddress.refresh();
  }
  Future<String> removeDeliveryAddress(int index) async {
    for(int i = 0 ; i<listDeliveryAddress.length;i++){
      if(index==i && listDeliveryAddress[i]["status"]==true){
        print("Đây là mặc định");
        return "failed";
      }
    }
    var user = await repoUser.findUserById(session.value);
    listDeliveryAddress.remove(listDeliveryAddress[index]);
    user.deliveryAddress=listDeliveryAddress;
    repoUser.updateUser(user);
    listDeliveryAddress.refresh();
    return "success";
  }
  void changeSwitchAddress(bool switchaddress){
    switchValue.value=switchaddress;
  }
  bool checkExistAddress(){
    if(listDeliveryAddress.length==0){
      return false;
    }
    return true;
  }



}