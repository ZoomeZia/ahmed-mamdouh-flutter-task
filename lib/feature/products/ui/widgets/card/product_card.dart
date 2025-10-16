import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tasks/core/helpers/assets.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/core/theming/text_styles.dart';
import 'package:flutter_tasks/feature/products/data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.product,
  });

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.whiteColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorsManager.blackWithOpacity),
      ),
      width: 156,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 215,
            decoration: const BoxDecoration(
              color: ColorsManager.offWhiteColor,
            ),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2),
                  topRight: Radius.circular(2),
                ),
              ),
              child: Image.asset(
                product?.imagePath ?? '',
                fit: BoxFit.contain,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 110,
                  child: Text(
                    product?.title ?? '',
                    style: TextStyles.font14Medium.copyWith(
                      color: ColorsManager.textPrimaryColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  Assets.bxsOffer,
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        '${product?.currentPrice.toString()}جم /',
                        style: TextStyles.font14Medium.copyWith(
                          color: ColorsManager.priceColor,
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Text(
                              product?.originalPrice.toString() ?? '',
                              style: TextStyles.font14Medium.copyWith(
                                color: ColorsManager.geryColor,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Positioned(
                              bottom: 11,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 1,
                                color: ColorsManager.geryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  Assets.favorite,
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 12,
                  height: 12,
                  child: SvgPicture.asset(
                    Assets.localFireDepartment,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  'تم بيع ${product?.soldQuantity.toString()}+',
                  style: TextStyles.font10Regular.copyWith(
                    color: ColorsManager.geryColor,
                    height: 2.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 9,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: ColorsManager.lightBlueColor,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(
                          Assets.dataIcon,
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ),
                    Positioned(
                      top: -5,
                      right: -5,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsManager.blueColor,
                        ),
                        child: SvgPicture.asset(
                          Assets.check,
                          color: ColorsManager.whiteColor,
                          width: 12,
                          height: 12,
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: ColorsManager.geryColor,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: SvgPicture.asset(
                          Assets.addShoppingCart,
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Image.asset(
                      Assets.logo,
                      width: 30,
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
