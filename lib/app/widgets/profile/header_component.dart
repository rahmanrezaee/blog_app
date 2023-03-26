import 'package:bloc_app/theme/colors.dart';
import 'package:flutter/material.dart';

class HeaderComponent extends StatefulWidget {
  @override
  State<HeaderComponent> createState() => _HeaderComponentState();
}

class _HeaderComponentState extends State<HeaderComponent> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                          "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200",
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.grayLight,
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child:
                                Icon(Icons.camera, color: AppColors.grayDark),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Jeronme Bell",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Branding Strategist",
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 10,
              top: 10,
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      "Edit",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 11,
                          ),
                    ),

                    const SizedBox(
                      width: 5,
                    ),

                    const Icon(
                      Icons.edit,
                      size: 17,
                    )
                    // Icon(
                    //   Iconsax.edit,
                    //   size: 20,
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
