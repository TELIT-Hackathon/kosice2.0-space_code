import 'package:flutter/cupertino.dart';
import 'package:living_app/widgets/layouts/action_bar_profile.dart';
import 'package:living_app/widgets/layouts/parent.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Column(
        children: [
          ActionBarProfile(title: 'Úprava profilu',),
          Expanded(child: CustomScrollView(physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0, 16, 0, 8))

                ],
              ),
            )
          ],

          ),
          ),
        ],
      ),
    );
  }
}
