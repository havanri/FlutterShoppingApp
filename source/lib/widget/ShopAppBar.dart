import 'package:flutter/material.dart';
import 'package:sheinshop/extensions/context_extension.dart';

class ShopAppBar extends StatefulWidget implements PreferredSizeWidget{
  const ShopAppBar({Key? key}) : preferredSize = const Size.fromHeight(kToolbarHeight * 2);

  @override
  final Size preferredSize;
  @override
  State<ShopAppBar> createState() => _ShopAppBarState();

}

class _ShopAppBarState extends State<ShopAppBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFEEEEEE),
      elevation: 5,
      child: Column(
        children: [
          _buildHeader(context),
          _buildActions(),
        ],
      ),
    );
  }

  AppBar _buildHeader(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFEEEEEE),
      elevation: 0,
      titleTextStyle: context.textTheme.headline5!
          .copyWith(color: context.colors.onPrimary),
      title: Center(
        child: Text(
          "Products",
          style: TextStyle(
            color: Color(0xFF04FD01),
          ),
        ),
      ),
      actions: [
        IconButton(
            onPressed: (){

            },
            // onPressed: () =>
            //     showSearch(
            //         context: context,
            //         delegate: CustomSearchDelegate(hintText: 'Search')),
            icon: const Icon(
              Icons.search,
              color: Color(0xFF04FD01),
            ))
      ],
    );
  }
  Container _buildActions() {
    return Container(
      color:Color(0xFFEEEEEE),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.sort,
            color:Colors.black,
          ),
          Text("Popular",style: TextStyle(color: Colors.black),),
          const Spacer(),
          IconButton(
              color: Colors.black,
              onPressed: () {

              },
              icon: const Icon(Icons.swap_vert)),
          const Spacer(),
          IconButton(
            color:Colors.black,
            onPressed: () {

            },
            icon:  Icon(
              Icons.grid_view_rounded,
            )
            ,)

        ],
      ),
    );
  }
}