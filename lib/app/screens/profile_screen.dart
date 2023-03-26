import 'package:flutter/material.dart';

import '../widgets/profile/connection_component.dart';
import '../widgets/profile/connection_item_component.dart';
import '../widgets/profile/header_component.dart';

class ProfileScreen extends StatefulWidget {

  final String userId;
  const ProfileScreen({required this.userId,super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("${widget.userId}"),
          actions: [IconButton(onPressed: () {}, icon:const Icon(Icons.more_vert))]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                HeaderComponent(),
                ConnectionItemComponent(userId: widget.userId),
                ConnectionProfileComponent(userId: widget.userId),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
