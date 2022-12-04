import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/texts/rich_text.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String address;
  final String state;
  final String price;
  final String flatUrl;

  const CustomCard(
      {required this.name,
      required this.address,
      required this.state,
      required this.price,
      required this.flatUrl,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.secondary.withOpacity(0.1),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              child: Image.network(
                                flatUrl,
                                height: 160.0,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.defaultColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 4,
                                  ),
                                  child: VarText(
                                    textAlign: TextAlign.left,
                                    text: name,
                                    color: AppColors.secondary,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 4,
                                  ),
                                  child: VarText(
                                    textAlign: TextAlign.left,
                                    text: state,
                                    color: AppColors.secondary,
                                    size: 14,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 4,
                                        bottom: 4,
                                        left: 4,
                                      ),
                                      child: VarText(
                                        textAlign: TextAlign.left,
                                        text: address,
                                        color: AppColors.secondary,
                                        size: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        RichTextCustom(
                          firstText: '$price €',
                          secondText: ' / mesiac',
                          size: 18,
                          horizontalPadding: 4,
                          firstColor: AppColors.secondary,
                          secondColor: AppColors.secondary,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
