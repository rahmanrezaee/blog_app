import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../theme/colors.dart';
import '../stores/connect_store.dart';

class FollowingListScreen extends StatefulWidget {
  final String userId;
  FollowingListScreen({required this.userId, super.key});

  @override
  State<FollowingListScreen> createState() => _FollowingListScreenState();
}

class _FollowingListScreenState extends State<FollowingListScreen> {
  ConnectionStore _store = ConnectionStore();
 initState(){
    _store.fetchFollowing(widget.userId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Following List"),
      ),
      body: Observer(builder: (context) {
        if (!_store.isLoading) {
          return _store.followingList.isEmpty
              ? const Center(child: Text("Empty List"))
              : ListView.builder(
                  itemCount: _store.followingList.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      title: Text("${_store.followingList[index].id}"),
                      trailing: OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(color: AppColors.borderGreyColor)),
                          shape: MaterialStateProperty.all<OutlinedBorder?>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          await _store.unFollowUser(_store.followingList[index].id);
                          await _store.fetchFollowing(widget.userId);
                        },
                        child: Text(
                              "Unfollow",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                         
                      ),
                    );
                  });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
