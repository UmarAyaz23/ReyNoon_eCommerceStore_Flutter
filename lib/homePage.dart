import 'package:ecommerce_project/imports.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
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

  final List<String> sliderList = [
    "assets/Categories/menLuxury/menLuxury_01.jpg", 
    "assets/Categories/womenLuxury/womenLuxury_01.jpg",
    "assets/Categories/menDaily/menDaily_01.jpg",
    "assets/Categories/womenDaily/womenDaily_01.jpg",
  ];

/*--------------------------------------------------------------------------------FRONT END--------------------------------------------------------------------------------*/
  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<fetchUserdetails>(context);
    final cart = Provider.of<CartController>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: 
        Row(
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

        shape: Border(
          bottom: BorderSide(color: Colors.grey[600]!)
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            //What's New
            Padding(
              padding: EdgeInsetsGeometry.only(left: 10, right: 10, top: 40, bottom: 0),
              child: Text("What's New", style: appTextStyles.withColor(appTextStyles.h2, Colors.grey[600]!)),
            ),

            VxSwiper.builder(
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              height: MediaQuery.of(context).size.width,
              enlargeCenterPage: true,
              itemCount: sliderList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(sliderList[index], fit: BoxFit.cover)
                  )
                );
              }
            ),


            //Categories
            Padding(
              padding: EdgeInsetsGeometry.only(left: 10, right: 10, top: 40, bottom: 0),
              child: Text("Categories", style: appTextStyles.withColor(appTextStyles.h2, Colors.grey[600]!)),
            ),

            Padding(
              padding: EdgeInsetsGeometry.only(left: 10, right: 0, top: 10, bottom: 0),
              child: Expanded(child: categoryChips(),),
            ),

          
            //Featured
            Padding(
              padding: EdgeInsetsGeometry.only(left: 10, right: 10, top: 40, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Featured", style: appTextStyles.withColor(appTextStyles.h2, Colors.grey[600]!)),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => shopPage())),
                    child: Text("See All", style: appTextStyles.withColor(appTextStyles.buttonMid, Theme.of(context).primaryColor))
                  )
                ],
              )
            ),

            Padding(
              padding: EdgeInsetsGeometry.only(left: 10, right: 10, top: 7, bottom: 5),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ), 
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: displayedProducts.length > 28 ? displayedProducts.length - 28 : 0,
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