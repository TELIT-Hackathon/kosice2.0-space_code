import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/texts/header.dart';


class TabbedHeader extends StatefulWidget {
  final String title;
  final List<String> tabTitles;
  final List<Widget> tabContents;
  final List<Widget> actions;

  const TabbedHeader({
    Key? key,
    required this.title,
    required this.tabTitles,
    required this.actions,
    required this.tabContents,
  }) : super(key: key);

  @override
  State<TabbedHeader> createState() => _TabbedHeaderState();
}

class _TabbedHeaderState extends State<TabbedHeader>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tabTitles.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            elevation: 0,
            actions: widget.actions,
            backgroundColor: AppColors.defaultColor,
            title: Header(
              text: widget.title,
              horizontalPadding: 0,
              verticalPadding: 0,
            ),
            centerTitle: false,
            automaticallyImplyLeading: false,
            floating: true,
            pinned: true,
            snap: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
                child: Column(
                  children: [
                    TabBar(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      isScrollable: true,
                      labelPadding: const EdgeInsets.only(right: 16),
                      indicatorPadding: const EdgeInsets.only(right: 16),
                      indicatorColor: AppColors.secondary,
                      labelColor: AppColors.primary,
                      labelStyle: const TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      unselectedLabelColor: AppColors.secondary,
                      controller: _tabController,
                      tabs: widget.tabTitles
                          .map(
                            (title) => Tab(
                          text: title,
                        ),
                      )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          )
        ];
      },
      body: TabBarView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        controller: _tabController,
        children: widget.tabContents,
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
