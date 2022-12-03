import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/back_arrow.dart';

class ActionBarAccDetail extends StatelessWidget {
  final String flatUrl;


  const ActionBarAccDetail({
    Key? key,
    required this.flatUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.primary,
        image: DecorationImage(
          image: NetworkImage(
              flatUrl,),
              fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Expanded(
             child: Padding(
              padding: EdgeInsets.fromLTRB(16,16,0,0),
              child: BackArrow(
                color: AppColors.white,
              ),
          ),
           ),
        ],
      ),
    );
  }
}
