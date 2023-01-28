import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/components/custom_text.dart';

import 'package:grocery_app/screens/utils/app_colors.dart';
import 'package:grocery_app/screens/utils/assets_constants.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: 10, // no of tiles across the height
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // no of tiles across the width
            mainAxisSpacing: 43, // space between two tiles across the height
            crossAxisSpacing: 19, // space between two tiles across the width
            childAspectRatio: 0.75, // ratio between height and width
          ),
          itemBuilder: (context, i) {
            return const ProductTile();
          }),
    );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          // fill the whole container through image
          image: NetworkImage(
            "https://www.oregonlive.com/resizer/pc-6ZYwJzbQTre_2CG488xjJU6A=/1280x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/VIE4DUJ43VD63BMZD2FNUIC7DA.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, right: 7),
            padding: const EdgeInsets.all(7),
            decoration: const BoxDecoration(
              color: AppColors.kWhite,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(AssetsConstants.favIcon),
          ),
          Container(
            height: 38,
            padding: const EdgeInsets.symmetric(horizontal: 9),
            decoration: BoxDecoration(
              color: AppColors.lightGreen.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(
                  "Tomato",
                  fontSize: 15,
                  color: AppColors.kWhite,
                  fontWeight: FontWeight.w500,
                ),
                CustomText(
                  "\$1.50",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
