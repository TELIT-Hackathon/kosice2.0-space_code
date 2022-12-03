import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/back_arrow.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';


class CollapsibleActionBar extends StatelessWidget {
  final Widget body;
  final String title;
  final List<Widget>? actions;
  final Widget? background;

  const CollapsibleActionBar({
    Key? key,
    required this.body,
    required this.title,
    this.actions,
    this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverPersistentHeader(
            pinned: true,
            delegate: FlexibleHeaderDelegate(
              leading: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: BackArrow(
                  color: background != null ? AppColors.white : AppColors.black,
                ),
              ),
              expandedHeight: background != null ? 200 : 100,
              collapsedElevation: 0,
              background: MutableBackground(
                expandedWidget: background,
                collapsedColor: AppColors.primary,
              ),
              backgroundColor:
              background != null ? null : AppColors.defaultColor,
              statusBarHeight: MediaQuery.of(context).padding.top,
              actions: actions,
              children: [
                FlexibleTextItem(
                  text: title,
                  expandedAlignment: Alignment.bottomLeft,
                  expandedMargin: const EdgeInsets.only(right: 16),
                  collapsedAlignment: Alignment.centerLeft,
                  collapsedMargin: EdgeInsets.only(
                    right: 56 *
                        (actions != null ? actions!.length.toDouble() : 1.00),
                  ),
                  expandedPadding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
                  expandedStyle: TextStyle(
                    color:
                    background != null ? AppColors.white : AppColors.black,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                  collapsedStyle: TextStyle(
                    color:
                    background != null ? AppColors.white : AppColors.black,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                  maxLines: 1,
                  collapsedPadding: const EdgeInsets.only(left: 56),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ];
      },
      body: body,
    );
  }
}
