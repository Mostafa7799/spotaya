import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotaya/Plan/presentation/bloc/plan_bloc.dart';
import '../../../core/const/request_state.dart';
import '../../../core/dialog/error_dialog.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        elevation: 0,
        title: const Text('Your Plan'),
      ),
      body: BlocConsumer<PlanBloc, PlanState>(
        listenWhen: (previous, current) =>
            previous.getPlanState != current.getPlanState,
        listener: (context, state) {
          if (state.getPlanState == RequestState.error) {
            showDialog(
              context: context,
              builder: (context) => ErrorDialog(
                errorMessage: state.getPlanMessage,
              ),
            );
          }
        },
        buildWhen: (previous, current) =>
            previous.getPlaceData != current.getPlaceData,
        builder: (context, state) {
          if (state.getPlanState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.getPlanState == RequestState.error) {
            return const Center(
              child: Text('No Data'),
            );
          }
          var plan = state.getPlaceData;
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
              itemCount: plan.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plan[index].types[0],
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        height: 220,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                              image: NetworkImage(
                                'https://img.freepik.com/premium-photo/hands-holding-smartphone-social-media-concept_23-2150208265.jpg?w=740',
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                     const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Title',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                'Activity duration 12:12 pm',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                              const Spacer(),
                              const Text(
                                'Location',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.location_on,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
