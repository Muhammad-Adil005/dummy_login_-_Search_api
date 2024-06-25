import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api_app/falaya/falaya.dart';
import 'package:login_api_app/falaya/shimmer/shimmer.dart';

import '../model/falaya_model.dart';

class FalayaScreen extends StatelessWidget {
  const FalayaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FalayaBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Fallaya'),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<FalayaBloc, FalayaState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(
                child: ShimmerLoadingList(),
                //child: CircularProgressIndicator(),
              );
            } else if (state.errorMessage != null) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else if (state.falayaList.isEmpty) {
              return const Center(child: Text('No Data'));
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('43 Found'),
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.greenAccent,
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.print,
                                        size: 16,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'Save Search',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.greenAccent,
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Sort',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.falayaList.length,
                      itemBuilder: (context, index) {
                        Falaya falaya = state.falayaList[index];
                        return Card(
                          color: Colors.white,
                          margin: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 200,
                                // color: Colors.grey[300],
                                child: Center(
                                  child: falaya.listingImages.isNotEmpty
                                      ? Image.network(
                                          falaya.listingImages,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Center(
                                              child: Icon(
                                                Icons.broken_image,
                                                color: Colors.red,
                                              ),
                                            );
                                          },
                                        )
                                      : const Text(
                                          'Image Placeholder',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          // '\$245,300',
                                          '\$${falaya.price}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal,
                                          ),
                                        ),
                                        Container(
                                          height: 25,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.greenAccent,
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'For Sale',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on_outlined,
                                            size: 16),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            //'1621 Ruelle De Grace Dr, Baton Rouge',
                                            falaya.address,
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.ad_units_outlined,
                                                color: Colors.teal, size: 18),
                                            SizedBox(width: 4),
                                            //Text('2400 SF'),
                                            Text(
                                                '${falaya.appxSqftLivingArea} SF'),
                                          ],
                                        ),
                                        /*Row(
                                          children: [
                                            Icon(Icons.bed, color: Colors.teal),
                                            Text('4'),
                                            SizedBox(width: 10),
                                            Icon(Icons.bathtub,
                                                color: Colors.teal),
                                            Text('4'),
                                            SizedBox(width: 10),
                                            Icon(Icons.directions_car,
                                                color: Colors.teal),
                                            Text('2'),
                                          ],
                                        ),*/
                                        Row(
                                          children: [
                                            const Icon(Icons.bed,
                                                color: Colors.teal),
                                            Text('${falaya.bedrooms}'),
                                            const SizedBox(width: 10),
                                            const Icon(Icons.bathtub,
                                                color: Colors.teal),
                                            Text('${falaya.bathrooms}'),
                                            const SizedBox(width: 10),
                                            const Icon(Icons.directions_car,
                                                color: Colors.teal),
                                            const Text('2'),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    const Divider(),
                                    const Center(
                                      child: Text(
                                        'Latter & Blum - Lake Sherwood',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

/*bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore, color: Colors.grey),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle, color: Colors.grey),
              label: 'Task',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz, color: Colors.grey),
              label: 'More',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          child: const Icon(Icons.map),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
