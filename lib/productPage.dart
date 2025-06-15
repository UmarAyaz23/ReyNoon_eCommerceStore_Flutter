import 'package:ecommerce_project/imports.dart';
import 'package:get/route_manager.dart';

class productPage extends StatelessWidget {
  final shopPageProduct productPageProduct;
  const productPage({super.key, required this.productPageProduct});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartController>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new)),
        title: 
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
        )
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(productPageProduct.imagePath, width: double.infinity,),
              ),
              SizedBox(height: 15,),

              Text(productPageProduct.name, style: appTextStyles.h1, overflow: TextOverflow.ellipsis,),
              SizedBox(height: 10,),
              Text(productPageProduct.category, style: appTextStyles.withColor(appTextStyles.bodySmall, Colors.grey[600]!), overflow: TextOverflow.ellipsis),
              SizedBox(height: 10,),
              Text(productPageProduct.price.toString(), style: appTextStyles.withColor(appTextStyles.h2, const Color.fromARGB(255, 16, 133, 35)), overflow: TextOverflow.ellipsis),
              SizedBox(height: 15,),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        cart.addToCart(productPageProduct);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${productPageProduct.name} added to cart"))
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: white,
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey[400]!, width: 1.5),
                          borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                      child: Text("Add to Cart", style: appTextStyles.withColor(appTextStyles.h3, gold))
                    )
                  )
                ]
              )
            ],
          ),
        )
      )
    );
  }
}