import 'package:ecommerce_project/imports.dart';

class shopPage extends StatefulWidget {
  const shopPage({super.key});

  @override
  State<shopPage> createState() => _shopPageState();
}

class _shopPageState extends State<shopPage> {
  List<shopPageProduct> allProducts = [];
  List<shopPageProduct> displayedProducts = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() async {
    final products = await ProductService.fetchProducts();
    setState(() {
      allProducts = products;
      displayedProducts = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final userDetails = Provider.of<fetchUserdetails>(context);
    final cart = Provider.of<CartController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homePage())),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  userDetails.isLoading 
                    ? CircularProgressIndicator() 
                    : Text("Hello ${userDetails.userName ?? "Guest"}", style: appTextStyles.bodySmall),
                  Text("Good Morning!", style: appTextStyles.h3),
                ]
              )
            ),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage())),
              child: Stack(
                clipBehavior: Clip.none,
                
                children: [
                  Icon(Icons.shopping_bag_outlined, size: 30,),
                  if (cart.cartItemCount > 0) 
                    Positioned(
                      top: -5,
                      left: -5,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Text(
                          cart.cartItemCount.toString(),
                          style: appTextStyles.withColor(appTextStyles.bodySmall, white),
                        ),
                      )
                    )
                ]
              ),
            )
          ]
        ),
        shape: Border(bottom: BorderSide(color: Colors.grey[600]!)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            customSearchBar(),

            Padding(
              padding: EdgeInsetsGeometry.only(left: 10, right: 10, top: 0, bottom: 5),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ), 
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: displayedProducts.length,
                itemBuilder: (context, index) {
                  final product = displayedProducts[index];
                  return GestureDetector(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => productPage(productPageProduct: product,)));},
                    child: Container(
                      constraints: BoxConstraints(maxWidth: screenWidth * 0.9),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[600]!, width: 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                  child: Image.network(product.imagePath, width: double.infinity, fit: BoxFit.cover),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.name, 
                                  style: appTextStyles.withColor(
                                    appTextStyles.withWeight(appTextStyles.h3, FontWeight.bold), 
                                    Theme.of(context).textTheme.bodyLarge!.color!
                                  ),
                                  maxLines: 1, overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: screenWidth * 0.01),
                                Text(product.category, 
                                  style: appTextStyles.withColor(appTextStyles.bodyMid, Colors.grey[600]!),
                                  maxLines: 1, overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: screenWidth * 0.01),
                                Row(
                                  children: [
                                    Text("PKR ${product.price}/-", 
                                      style: appTextStyles.withColor(
                                        appTextStyles.withWeight(appTextStyles.bodyLarge, FontWeight.bold), 
                                        const Color.fromARGB(255, 16, 133, 35)
                                      ),
                                      maxLines: 1, overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  );
                }
              )
            ),
          ]
        ),
      ),
    );
  }
}
