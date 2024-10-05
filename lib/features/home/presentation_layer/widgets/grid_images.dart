import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class GridImagesWidget extends StatelessWidget {
  const GridImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23.21),
              color: Colors.red,
              image: const DecorationImage(
                image: AssetImage(
                  "assets/images/I04.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // Top-right image
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23.21),
              color: Colors.red,
              image: const DecorationImage(
                image: AssetImage(
                  "assets/images/I04.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23.21),
              color: Colors.red,
              image: const DecorationImage(
                image: AssetImage(
                  "assets/images/I04.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 20, vertical: 5);
  }
}
