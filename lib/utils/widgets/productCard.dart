import 'package:ecommerce_project/imports.dart';

class productCard extends StatelessWidget {
  final Product product;
  final double aspectRatio;
  const productCard({super.key, required this.product, required this.aspectRatio});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      constraints: BoxConstraints(
        maxWidth: screenWidth * 0.9
      ),

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[600]!, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: aspectRatio,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(product.imageURL, width: double.infinity, fit: BoxFit.cover,),
                ),
              )
            ],
          ),

          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name, 
                  style: appTextStyles.withColor(
                    appTextStyles.withWeight(
                      appTextStyles.h3, FontWeight.bold
                    ), 
                  Theme.of(context).textTheme.bodyLarge!.color!),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenWidth * 0.01,),

                Text(
                  product.category, 
                  style: appTextStyles.withColor(
                    appTextStyles.bodyMid,
                    Colors.grey[600]!
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenWidth * 0.01,),

                Row(
                  children: [
                    Text(
                      "${product.price.toStringAsFixed(2)}", 
                      style: appTextStyles.withColor(
                        appTextStyles.withWeight(
                          appTextStyles.bodyLarge, FontWeight.bold
                        ), 
                        const Color.fromARGB(255, 16, 133, 35)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}