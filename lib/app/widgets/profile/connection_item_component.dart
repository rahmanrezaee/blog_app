import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../screens/follower_list_screen.dart';
import '../../screens/following_list_screen.dart';
import '../../services/auth_methods.dart';
import '../../services/firebase_functions.dart';

class ConnectionItemComponent extends StatefulWidget {
  final String userId;
  ConnectionItemComponent({required this.userId, super.key});

  @override
  State<ConnectionItemComponent> createState() =>
      _ConnectionItemComponentState();
}

class _ConnectionItemComponentState extends State<ConnectionItemComponent> {
  final AuthMethods _authMethods = AuthMethods();
  final FirebaseFunctions _functions = FirebaseFunctions();

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _functions.auth.currentUser!.uid == widget.userId,
      child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(color: AppColors.borderGreyColor)),
                    shape: MaterialStateProperty.all<OutlinedBorder?>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                     Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FollowerListScreen(
                          userId: widget.userId,
                        ),
                      ),);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Followers",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(color: AppColors.borderGreyColor)),
                    shape: MaterialStateProperty.all<OutlinedBorder?>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FollowingListScreen(
                          userId: widget.userId,
                        ),
                      ),);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Following",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        
      ),
    );
  }
}
