import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lab6_image_picker/users_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.user}) : super(key: key);

  final Completer<GoogleMapController> _controller = Completer();

  final UsersModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        ClipPath(
          clipper: GetClipper(),
          child: Image.network(
            'https://i.pinimg.com/736x/49/8b/d7/498bd7b4b9f9a64cd4f9b9f40cc2ee00--illustration-book-desert-illustration.jpg',
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),
        SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 150,
                ),
                Hero(
                  tag: user.id,
                  child: CircleAvatar(
                      maxRadius: 80,
                      backgroundColor: Colors.blue.withOpacity(0.4),

                      child: Image.network(
                        user.avatar,
                        width: 150,
                        height: 150,
                      )),
                ),
                const SizedBox(height: 20.0),
                Text(
                  '${user.lastName} ${user.firstName}',
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15.0),
                Text(
                  user.employment.title,
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 15.0),
                Text(
                  user.employment.title,
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),      const SizedBox(height: 15.0),

                const Divider(),
                const Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: GoogleMap(
                    myLocationButtonEnabled: false,
                    mapType: MapType.normal,
                    markers: {
                      Marker(
                        markerId: const MarkerId('place_name'),
                        position: LatLng(user.address.coordinates.lat,
                            user.address.coordinates.lng),
                      )
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(user.address.coordinates.lat,
                          user.address.coordinates.lng),
                      zoom: 13,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
                const SizedBox(height: 150),

              ],
            ),
          ),
        ),
        SizedBox(
          height: 56,
          child: AppBar(
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios)),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ],
    ));
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
