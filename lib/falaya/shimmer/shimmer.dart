import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../colors/falaya_colors.dart';

class ShimmerLoadingList extends StatelessWidget {
  const ShimmerLoadingList({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: FalayColors.listBg,
          highlightColor: Colors.grey[100]!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: 18,
                  width: 120,
                  decoration: const BoxDecoration(
                    color: FalayColors.listBg,
                  )),
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 116,
                    decoration: BoxDecoration(
                        color: FalayColors.listBg,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 30,
                    width: 61,
                    decoration: BoxDecoration(
                        color: FalayColors.listBg,
                        borderRadius: BorderRadius.circular(5)),
                  )
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Card(
                  elevation: 0,
                  color: Colors.white,
                  child: Shimmer.fromColors(
                    baseColor: FalayColors.listBg,
                    highlightColor: FalayColors.listBg.withOpacity(0.5),
                    child: Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 169,
                              color: FalayColors.listBg,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 18,
                                  width: 180,
                                  decoration: const BoxDecoration(
                                    color: FalayColors.listBg,
                                  ),
                                ),
                                Container(
                                  height: 18,
                                  width: 60,
                                  decoration: const BoxDecoration(
                                    color: FalayColors.listBg,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 18,
                                    color: FalayColors.listBg,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 18,
                                  width: 140,
                                  decoration: const BoxDecoration(
                                    color: FalayColors.listBg,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 18,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                          color: FalayColors.listBg),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      height: 18,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                          color: FalayColors.listBg),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      height: 18,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                          color: FalayColors.listBg),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
