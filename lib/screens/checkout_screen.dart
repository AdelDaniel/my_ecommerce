import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:my_ecommerce/widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Checkout'),
      bottomNavigationBar:
          BlocBuilder<CheckoutBloc, CheckoutState>(builder: (context, state) {
        if (state is CheckoutLoadedState) {
          return CustomNavBar(
              buttonText: "Order Now", // TODO :: language all the page
              onPressed: () => context
                  .read<CheckoutBloc>()
                  .add(ConfirmCheckoutEvent(checkout: state.checkout)));
        }
        return const SizedBox();
      }),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoadedState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CUSTOMER INFORMATION',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    CustomTextFormField(
                        onChanged: (value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateCheckoutEvent(email: value));
                        },
                        labelText: 'Email'),
                    CustomTextFormField(
                        onChanged: (value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateCheckoutEvent(fullName: value));
                        },
                        labelText: 'Full Name'),
                    const SizedBox(height: 20),
                    Text(
                      'DELIVERY INFORMATION',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    CustomTextFormField(
                        onChanged: (value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateCheckoutEvent(address: value));
                        },
                        labelText: 'Address'),

                    CustomTextFormField(
                        onChanged: (value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateCheckoutEvent(phoneNumber: value));
                        },
                        labelText: 'Phone Number'),
                    CustomTextFormField(
                        onChanged: (value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateCheckoutEvent(city: value));
                        },
                        labelText: 'City'),
                    CustomTextFormField(
                        onChanged: (value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateCheckoutEvent(country: value));
                        },
                        labelText: 'Country'),
                    CustomTextFormField(
                        onChanged: (value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateCheckoutEvent(zipCode: value));
                        },
                        labelText: 'ZIP Code'),
                    const SizedBox(height: 20),
                    Center(
                      child: MainNavBarButton(
                        onPressed: () {},
                        buttonText: '➡️➡️ SELECT A PAYMENT METHOD',
                        height: 60,
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: 60,
                    //   alignment: Alignment.bottomCenter,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     children: [
                    //       Container(
                    //         alignment: Alignment.center,
                    //         width: MediaQuery.of(context).size.width * 0.8,
                    //         child: FittedBox(
                    //           child: Text('SELECT A PAYMENT METHOD',
                    //               style: Theme.of(context).textTheme.headline6
                    //               // .copyWith(color: Colors.white),
                    //               ),
                    //         ),
                    //       ),
                    //       const Expanded(
                    //         child: Icon(Icons.arrow_forward),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 20),
                    Text(
                      'ORDER SUMMARY',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const OrderSummary(),
                  ],
                ),
              );
            } else {
              return Text('Something went wrong');
            }
          },
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, this.onChanged, required this.labelText})
      : super(key: key);

  final Function(String)? onChanged;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 5),
                focusedBorder: UnderlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
