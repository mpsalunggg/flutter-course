import 'package:flutter/material.dart';
import 'package:go_moon/widgets/custom_dropdown_button.dart';

class HomePage extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth * 0.04,
            vertical: _deviceHeight * 0.02,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_pageTitle(), _bookRideWidget()],
              ),
              Align(child: _astroMoonImage(), alignment: Alignment.centerRight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return const Text(
      '#GoMoon',
      style: TextStyle(
        color: Colors.white,
        fontSize: 62,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _astroMoonImage() {
    return Container(
      height: _deviceHeight * 0.50,
      width: _deviceWidth * 0.65,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/astro_moon.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _bookRideWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        _destinationDropDown(),
        SizedBox(height: _deviceHeight * 0.02),
        _travellersInformationWidget(),
        SizedBox(height: _deviceHeight * 0.02),
        _rideButton(),
      ],
    );
  }

  Widget _destinationDropDown() {
    return CustomDropdownButtonClass(
      values: const ['James Webb Station', 'Preneure Station'],
      width: _deviceWidth,
    );
  }

  Widget _travellersInformationWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDropdownButtonClass(
          values: const ['1', '2', '3', '4'],
          width: _deviceWidth * 0.44,
        ),
        CustomDropdownButtonClass(
          values: const ['Economy', 'Business', 'First', 'Private'],
          width: _deviceWidth * 0.44,
        ),
      ],
    );
  }

  Widget _rideButton() {
    return Container(
      margin: EdgeInsets.only(bottom: _deviceHeight * 0.01),
      width: _deviceWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: () {},
        child: const Text("Book Ride!", style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
