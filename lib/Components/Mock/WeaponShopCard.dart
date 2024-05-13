// ignore_for_file: file_names
import 'package:flutter/material.dart';

class WeaponShopCardMock extends StatefulWidget {
  const WeaponShopCardMock({super.key});

  @override
  State<StatefulWidget> createState() => _WeaponShopCardState();
}

class _WeaponShopCardState extends State<WeaponShopCardMock> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Card(
          surfaceTintColor: Colors.transparent,
          color: Colors.white,
          elevation: 24.0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Stack(
              children: [
                Center(
                  child: Image.network(
                    "https://localhost:7069/api/Test/GetWeaponImage?Name=TX-15%20DML",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text(
                          "AR",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: Color.fromARGB(255, 153, 153, 153)),
                        ),
                        Spacer(),
                        Text(
                          "PKR ",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 16,
                              color: Color.fromARGB(255, 153, 153, 153)),
                        ),
                        Text(
                          "192,513",
                          style: TextStyle(
                              fontFamily: "Inter Bold",
                              fontSize: 24,
                              color: Color.fromARGB(255, 2, 107, 0)),
                        )
                      ],
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    child: Image.network(
                                        "https://localhost:7069/api/Test/GetWeaponMakeImage?Name=Kalashnikov%20Concern")),
                                const Text(
                                  "TX-15 DML",
                                  style: TextStyle(
                                      fontFamily: "Inter Bold",
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 24, 24, 24)),
                                ),
                                const Text(
                                  "United States of America",
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 12,
                                      color:
                                          Color.fromARGB(255, 153, 153, 153)),
                                ),
                              ],
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "CAL",
                                style: TextStyle(
                                    fontFamily: "Inter SemiBold",
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 153, 153, 153)),
                              ),
                              Text(
                                "5.56x45 NATO",
                                style: TextStyle(
                                    fontFamily: "Inter Bold",
                                    fontSize: 14,
                                    color: Colors.orange),
                              ),
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "ROF",
                                          style: TextStyle(
                                              fontFamily: "Inter SemiBold",
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                  255, 153, 153, 153)),
                                        ),
                                        Text(
                                          "650 R/M",
                                          style: TextStyle(
                                              fontFamily: "Inter Bold",
                                              fontSize: 14,
                                              color: Color.fromARGB(
                                                  255, 153, 153, 153)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "WGT",
                                          style: TextStyle(
                                              fontFamily: "Inter SemiBold",
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                  255, 153, 153, 153)),
                                        ),
                                        Text(
                                          "3.605 KG",
                                          style: TextStyle(
                                              fontFamily: "Inter Bold",
                                              fontSize: 14,
                                              color: Color.fromARGB(
                                                  255, 153, 153, 153)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
