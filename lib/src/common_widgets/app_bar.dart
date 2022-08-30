import 'package:flutter/material.dart';
import 'package:treally_mobile/src/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kLightOrange,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: kBlack2,
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
      centerTitle: false,
      leading: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
            child: Container(
              decoration: BoxDecoration(
                color: kGray,
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.arrow_back_ios_new),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text('back'),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
      leadingWidth: 250,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
