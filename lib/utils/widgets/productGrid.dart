import 'package:ecommerce_project/imports.dart';

class productGrid extends StatelessWidget {
  final double aspectRatio;
  final double childAspectRatio;
  const productGrid ({super.key, required this.aspectRatio, required this.childAspectRatio});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ), 
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),

      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return GestureDetector(
          onTap: () {},
          child: productCard(product: product, aspectRatio: aspectRatio,),
        );
      }
    );
  }
}