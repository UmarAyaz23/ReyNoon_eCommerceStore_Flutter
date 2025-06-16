import 'package:ecommerce_project/imports.dart';

class categoryChips extends StatelessWidget {
  final categories = [
    {'path': 'assets/Categories/menLuxury/menLuxury_Banner.jpg', 'name': 'Luxury - Men', 'route': 'productPage(product: product)'},
    {'path': 'assets/Categories/womenLuxury/womenLuxury_Banner.jpg', 'name': 'Luxury - Women', 'route': 'productPage(product: product)'},
    {'path': 'assets/Categories/menDaily/menDaily_Banner.jpg', 'name': 'Daily - Men', 'route': 'productPage(product: product)'},
    {'path': 'assets/Categories/womenDaily/womenDaily_Banner.jpg', 'name': 'Daily - Women', 'route': 'productPage(product: product)'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            categories.length,
            (index) {
              final product = categories[index];
              return GestureDetector(
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainNavigation(selectedIndex: 2,))),
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 0),
                  constraints: BoxConstraints(maxWidth: screenWidth * 0.5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Column(
                    children: [
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                              child: Image.asset(
                                product['path']!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: Text(
                          product['name']!,
                          style: appTextStyles.withColor(
                            appTextStyles.withWeight(
                              appTextStyles.h3, FontWeight.bold
                            ),
                            Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                )
              );
            },
          ),
        ],
      ),
    );
  }
}
