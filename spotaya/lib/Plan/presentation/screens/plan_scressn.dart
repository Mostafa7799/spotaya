import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotaya/Plan/data/models/places_filters.dart';
import 'package:spotaya/Plan/presentation/bloc/plan_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/const/request_state.dart';
import '../../../core/dialog/error_dialog.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({
    Key? key,
    required this.placesFilters,
  }) : super(key: key);
  final PlacesFilters placesFilters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        elevation: 0,
        title: const Text('Your Plan'),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<PlanBloc>(context).add(
                GetPlanEvent(
                  filters: placesFilters,
                ),
              );
            },
            icon: const Icon(
              Icons.refresh_outlined,
              size: 32,
            ),
          )
        ],
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
          var plan = state.getPlaceData;
          if (state.getPlanState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.getPlanState == RequestState.error) {
            return const Center(
              child: Text('No data'),
            );
          }
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
                      Container(
                        width: double.infinity,
                        height: 220,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: NetworkImage(
                              plan[index].imageUrl ?? '',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            plan[index].name!,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Duration ${plan[index].activityDuration}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                              const Spacer(),
                              const Flexible(
                                flex: 2,
                                child: Text(
                                  'Location',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: IconButton(
                                  onPressed: () async {
                                    final Uri url =
                                        Uri.parse(plan[index].location!);
                                    await launchUrl(url);
                                  },
                                  icon: const Icon(
                                    Icons.location_on,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, i) {
                                return Container(
                                  height: 60,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.black87,
                                  ),
                                  child: Center(
                                    child: Text(
                                      plan[index].types[i],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
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
