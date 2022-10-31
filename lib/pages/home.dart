import 'package:fbl_client_dapp/Models/location.dart';
import 'package:fbl_client_dapp/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Location> location = ref.watch(locationProvider);
    return location.when(
      loading: () => const Scaffold(
        body: CircularProgressIndicator(),
      ),
      error: (error, stack) => const Scaffold(
        body: Center(
          child: Text('Oops'),
        ),
      ),
      data: (location) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  location.lat.toString(),
                ),
                subtitle: const Text('Latitude'),
              ),
              ListTile(
                title: Text(
                  location.lng.toString(),
                ),
                subtitle: const Text('Longitude'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
