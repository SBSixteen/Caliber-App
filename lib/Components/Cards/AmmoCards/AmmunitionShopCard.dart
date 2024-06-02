// ignore_for_file: file_names, must_be_immutable

import 'package:calibre/Components/Other/BulletStats.dart';
import 'package:calibre/Model/Ammunition.dart';
import 'package:calibre/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AmmunitionShopCard extends ConsumerStatefulWidget {
  Ammunition ammo;
  int qty = 0;
  AmmunitionShopCard(this.ammo, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AmmunitionShopCardState();
  }
}

class _AmmunitionShopCardState extends ConsumerState<AmmunitionShopCard> {
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        BlurEffect(
            begin: const Offset(100, 100),
            end: const Offset(0, 0),
            duration: 600.ms),
        MoveEffect(
            begin: const Offset(-128, 0),
            end: const Offset(0, 0),
            duration: 800.ms)
      ],
      child: Card(
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 10),
                  blurRadius: 30,
                  spreadRadius: -5,
                ),
              ],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 96, 96, 96),
                    Color.fromARGB(255, 64, 64, 64),
                    Color.fromARGB(255, 32, 32, 32),
                    Colors.black,
                  ],
                  stops: [
                    0.1,
                    0.3,
                    0.6,
                    0.66
                  ])),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.network(
                        "${constants.endpoint}${constants.endpointGetAmmunitionPicture}${widget.ammo.AmmunitionCaliber} ${widget.ammo.AmmunitionVariant}",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.ammo.AmmunitionVariant,
                          style: constants.ammoheadings,
                        ),
                        BulletStats(widget.ammo.AmmunitionPenn,
                            widget.ammo.AmmunitionFrag),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            widget.qty < 2
                                ? "${constants.formatter.format(widget.ammo.AmmunitionPrice)} PKR/Round"
                                : "${constants.formatter.format(widget.ammo.AmmunitionPrice * widget.qty)} PKR",
                            style: constants.ammoPrice,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: widget.qty == 0
                                  ? null
                                  : () {
                                      setState(() {
                                        widget.qty--;
                                      });
                                    },
                              icon: Icon(
                                Icons.remove_circle,
                                color: widget.qty == 0
                                    ? Colors.grey
                                    : Colors.white,
                                size: 32.0,
                              ),
                              color: Colors.transparent,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "${widget.qty}",
                                style: constants.ammoPrice,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if(widget.qty > 4){
                                    widget.qty+=5;
                                    return;
                                  }
                                  widget.qty++;
                                });
                              },
                              color: Colors.transparent,
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.white,
                                size: 32.0,
                              ),
                              disabledColor: Colors.grey,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.12,
                              child: widget.qty > 0
                                  ? IconButton.filled(
                                      onPressed: () {
                                        if (constants.ammoCart.containsKey("${widget.ammo.AmmunitionCaliber}-#-${widget.ammo.AmmunitionVariant}")) {
                                          var k = constants.ammoCart["${widget.ammo.AmmunitionCaliber}-#-${widget.ammo.AmmunitionVariant}"]!;

                                          print(k);

                                          k += widget.qty;
                                          constants.ammoCart[
                                              "${widget.ammo.AmmunitionCaliber}-#-${widget.ammo.AmmunitionVariant}"] = k;
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "Ammo incremented to your cart.")));
                                        } else {
                                          constants.ammoCart.putIfAbsent(
                                              "${widget.ammo.AmmunitionCaliber}-#-${widget.ammo.AmmunitionVariant}",
                                              () => widget.qty);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "Ammo added to your cart.")));
                                        }

                                        widget.qty = 0;
                                        setState(() {
                                          
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.shopping_cart_checkout_sharp,
                                        color: Colors.white,
                                      ),
                                      color: Colors.purple,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                ExpansionTile(
                  tilePadding: const EdgeInsets.all(0),
                  childrenPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  shape: const Border(),
                  title: Text(
                    "Learn More",
                    style: constants.benderWhite,
                  ),
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        textAlign: TextAlign.right,
                        softWrap: false,
                        widget.ammo.AmmunitionDescription,
                        maxLines: 24,
                        overflow: TextOverflow.ellipsis,
                        style: constants.benderWhiteSmall,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
