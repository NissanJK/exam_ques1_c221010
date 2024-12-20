import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/product.dart';

class ProductDetails extends StatefulWidget {
  final Product? productInfo;

  const ProductDetails({super.key, this.productInfo});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.blue,
        title: Text(
          "Product Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                Hero(
                  tag: widget.productInfo!.image!,
                  child: CachedNetworkImage(
                    imageUrl: widget.productInfo!.image!,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    fadeInDuration: const Duration(milliseconds: 500),
                    fadeOutDuration: const Duration(milliseconds: 200),
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height/3,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.blue,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.productInfo!.title!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Text(
                        "Tk " + widget.productInfo!.price!.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        widget.productInfo!.description!,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.acme(
                          fontSize: 18,
                        ),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
