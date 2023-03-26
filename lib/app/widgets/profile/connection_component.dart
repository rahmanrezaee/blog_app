import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../routes/app_pages.dart';
import '../../services/auth_methods.dart';
import '../../services/firebase_functions.dart';

class ConnectionProfileComponent extends StatefulWidget {
  final String userId;
  ConnectionProfileComponent({required this.userId, super.key});

  @override
  State<ConnectionProfileComponent> createState() =>
      _ConnectionProfileComponentState();
}

class _ConnectionProfileComponentState
    extends State<ConnectionProfileComponent> {
  final AuthMethods _authMethods = AuthMethods();

  final FirebaseFunctions _functions = FirebaseFunctions();

  bool isLoading = false;

  @override
  void initState() {
    getCollectionData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          if (_functions.auth.currentUser!.uid == widget.userId)
            Container()
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                !isLoading
                    ? followerData!['isFollowed'] != null &&
                            followerData!['isFollowed'].isNotEmpty
                        ? followerData!['isFollowed']['status'] != "pending" &&
                                followerData!['following'] != null &&
                                followerData!['following']['status'] !=
                                    "pending"
                            ? Expanded(
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all<BorderSide>(
                                        BorderSide(
                                            color: AppColors.borderGreyColor)),
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder?>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  onPressed: unFollowUser,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Un Follow",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : followerData!['isFollowed']['status'] !=
                                        "pending" &&
                                    followerData!['following'] == null
                                   
                                ? Expanded(
                                    child: OutlinedButton(
                                      style: ButtonStyle(
                                        side: MaterialStateProperty
                                            .all<BorderSide>(BorderSide(
                                                color:
                                                    AppColors.borderGreyColor)),
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder?>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      onPressed: followUser,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Follow Back",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : followerData!['following'] != null &&
                                        followerData!['following']['status'] ==
                                            "pending"
                                    ? Expanded(
                                        child: OutlinedButton(
                                          style: ButtonStyle(
                                            side: MaterialStateProperty
                                                .all<BorderSide>(BorderSide(
                                                    color: AppColors
                                                        .borderGreyColor)),
                                            shape: MaterialStateProperty.all<
                                                OutlinedBorder?>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                          onPressed: () => unFollowUser(),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Cancel Follow",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: OutlinedButton(
                                                style: ButtonStyle(
                                                  side: MaterialStateProperty
                                                      .all<BorderSide>(BorderSide(
                                                          color: AppColors
                                                              .borderGreyColor)),
                                                  shape: MaterialStateProperty
                                                      .all<OutlinedBorder?>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () =>
                                                    acceptOrReject(true),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      followerData!['isFollowed']
                                                                  ['status'] ==
                                                              "pending"
                                                          ? "Accept Request"
                                                          : "Follow Back",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: OutlinedButton(
                                                style: ButtonStyle(
                                                  side: MaterialStateProperty
                                                      .all<BorderSide>(BorderSide(
                                                          color: AppColors
                                                              .borderGreyColor)),
                                                  shape: MaterialStateProperty
                                                      .all<OutlinedBorder?>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () =>
                                                    acceptOrReject(false),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      followerData!['isFollowed']
                                                                  ['status'] ==
                                                              "pending"
                                                          ? "Cancel Request"
                                                          : "Follow Back",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                        : followerData != null &&
                                followerData!['following'] != null &&
                                followerData!['following'].isNotEmpty
                            ? Expanded(
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all<BorderSide>(
                                        BorderSide(
                                            color: AppColors.borderGreyColor)),
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder?>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  onPressed: unFollowUser,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        followerData!['following']['status'] ==
                                                "pending"
                                            ? "Cancel Follow"
                                            : "Unfollow",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Expanded(
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all<BorderSide>(
                                        BorderSide(
                                            color: AppColors.borderGreyColor)),
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder?>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  onPressed: followUser,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Follow",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                    : Expanded(
                        child: OutlinedButton(
                          onPressed: null,
                          style: ButtonStyle(
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(color: AppColors.borderGreyColor)),
                            shape: MaterialStateProperty.all<OutlinedBorder?>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Loading...",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      )
              ],
            ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    _authMethods.signOut();
                    Navigator.pushNamed(context, Routes.LOGIN);
                  },
                  child: Text("Logout",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void unFollowUser() async {
    setState(() {
      isLoading = true;
    });
    await _functions.unfollowUser(unfollowUserId: widget.userId);
    followerData = await _functions.isFollowing(otherUserId: widget.userId);
    setState(() {
      isLoading = false;
    });
  }

  void followUser() async {
    setState(() {
      isLoading = true;
    });

    await _functions.followUser(followUserId: widget.userId);
    followerData = await _functions.isFollowing(otherUserId: widget.userId);
    setState(() {
      isLoading = false;
    });
  }

  void acceptOrReject(bool status) async {
    setState(() {
      isLoading = true;
    });

    await _functions.acceptOrRejectRequest(
        followUserId: widget.userId, status: status);
    followerData = await _functions.isFollowing(otherUserId: widget.userId);
    setState(() {
      isLoading = false;
    });
  }

  Map? followerData;

  void getCollectionData() async {
    setState(() {
      isLoading = true;
    });
    followerData = await _functions.isFollowing(otherUserId: widget.userId);
    log("follower Data $followerData");
    setState(() {
      isLoading = false;
    });
  }
}
