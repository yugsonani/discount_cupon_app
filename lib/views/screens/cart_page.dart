import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/getx_controllers.dart';



class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Cart",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Obx(
                  () => ListView.builder(
                itemCount: cartController.addedProduct.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image(
                            image: MemoryImage(
                                cartController.addedProduct[i].image),
                            fit: BoxFit.cover,
                            width: size.width * 0.18,
                          ),
                        ),
                        title: Text("${cartController.addedProduct[i].name}"),
                        subtitle: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size.height * 0.03,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      cartController.removeQuantity(product:cartController.addedProduct[i],index: i);
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          const CircleBorder()),
                                      side: MaterialStateProperty.all(
                                        BorderSide(
                                            color: Colors.black, width: 2),),),
                                    child: Icon(
                                      Icons.remove,
                                      size: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Obx(
                                      ()=> Text(
                                    "${cartController.productQuantity[i]}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      cartController.addQuantity(productDB: cartController.addedProduct[i],index: i);
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            const CircleBorder()),
                                        side: MaterialStateProperty.all(
                                            BorderSide(
                                                color: Colors.black, width: 2))),
                                    child: Icon(
                                      Icons.add,
                                      size: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "₹ ${cartController.addedProduct[i].price}",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            cartController.removeProduct(
                                productDB: cartController.addedProduct[i],quantity: cartController.productQuantity[i]);
                          },
                          icon: const Icon(
                            CupertinoIcons.delete_simple,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid, color: Colors.grey, width: 2),
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                    ()=> Text(
                        "${cartController.promo}",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(onPressed: (){
                      cartController.removeDiscount(data: 0,text: "Promo Code");
                    }, icon: Icon(Icons.delete,color: Colors.black,)),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed("/coupon_page");
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                      child: Text(
                        "Apply",
                        style:
                        GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub total",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Obx(
                            ()=> Text(
                          "₹ ${cartController.totalPrice}",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping Fees",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,

                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "₹ 29",
                        style: GoogleFonts.poppins(

                            fontWeight: FontWeight.w500,
                            fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Obx(
                        ()=> Text(
                          "₹ ${cartController.discount}",
                          style: GoogleFonts.poppins(
                            fontSize: 16,

                            fontWeight: FontWeight.w500,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(()=> Text(
                        "Total (Qty : ${cartController.totalQuantity})",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      ),
                      Obx(()=> Text(
                        "₹ ${cartController.totalPrice + 29 - cartController.discount.value}",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: SizedBox(
                width: size.width,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)))
                    ),
                    child: Text("Continue Pay",style: GoogleFonts.poppins(fontSize: 18,color: Colors.white),),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
