import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../theme/colors.dart';
import '../stores/connect_store.dart';

class FollowerListScreen extends StatefulWidget {

    final String userId;
  FollowerListScreen({required this.userId, super.key});

  @override
  State<FollowerListScreen> createState() => _FollowerListScreenState();
}

class _FollowerListScreenState extends State<FollowerListScreen> {
 ConnectionStore _store = ConnectionStore();

  initState(){
    _store.fetchFollower(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Following List"),
      ),
      body: Observer(builder: (context) {
        if (!_store.isLoading) {
          return _store.followerList.isEmpty
              ? const Center(child: Text("Empty List"))
              : ListView.builder(
                  itemCount: _store.followerList.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      title: Text("${_store.followerList[index].id}"),
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
                          await _store.unFollowUser(_store.followerList[index].id);
                          await _store.fetchFollowing(widget.userId);
                        },
                        child:Text(
                              "Remove",
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