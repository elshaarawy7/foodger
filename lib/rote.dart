import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungey/core/constant/app_color.dart';
import 'package:hungey/feat/auth/presentation/pages/profils_page.dart';
import 'package:hungey/feat/cart/presentation/pages/cart_page.dart';
import 'package:hungey/feat/home/presentation/pages/home_page.dart';
import 'package:hungey/feat/order/presentation/pages/order_page.dart';


class Root extends StatefulWidget {
   Root({super.key});

  static const String rootRoute = "/root";
  @override
  State<Root> createState() => _RootState(); 
  
}

class _RootState extends State<Root> {
  late  PageController? controller = PageController() ; 
  late  List<Widget> screans; 
  int curentScrean = 0 ;
  @override
  void initState(){
    screans = [
    HomePage() , 
    CartPage() , 
    OrderPage(), 
    ProfilsPage() , 
  ]; 
  controller = PageController(initialPage: curentScrean) ;
    super.initState() ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller:  controller ,
        children:screans ,
        physics: NeverScrollableScrollPhysics(),
        
      ), 

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10), 
        decoration: BoxDecoration(
          color: AppColor.primary , 
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12) , 
            topRight: Radius.circular(12) , 
          ) , 
        ),
        child: BottomNavigationBar(

          backgroundColor: Colors.transparent , 
          elevation: 0, 
          type: BottomNavigationBarType.fixed, 
          selectedItemColor: Colors.white, 
          unselectedItemColor: Colors.grey.shade700, 
          currentIndex: curentScrean,
          onTap: (value) {
            setState(() {
              curentScrean =  value ;
            }); 

            controller?.jumpToPage(curentScrean);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home) , 
              label: "Home" , 
            ) ,  
        
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart) , 
              label: "Cart" , 
            ) , 
        
            BottomNavigationBarItem(
              icon: Icon(Icons.local_restaurant) , 
              label: "Home" , 
            ) ,
        
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled) , 
              label: "profile" , 
            ) ,
          ],
        ),
      ),
      
    );
  }
}