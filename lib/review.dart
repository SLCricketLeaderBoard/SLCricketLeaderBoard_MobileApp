import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';


/// The body of the main Rate my app test widget.
class ReviewPage extends StatefulWidget {
  /// Creates a new Rate my app test app instance.
  const ReviewPage();
   static String tag = 'review-page';

  @override
  State<StatefulWidget> createState() => ReviewPageState();
}

/// The body state of the main Rate my app test widget.
class ReviewPageState extends State<ReviewPage> {
  /// The widget builder.
  WidgetBuilder builder = buildProgressIndicator;
  
  @override
  Widget build(BuildContext context) => MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rate my app !'),
        ),
        body: RateMyAppBuilder(
          builder: builder,
          onInitialized: (context, rateMyApp) {
            setState(() => builder = (context) => ContentWidget(rateMyApp: rateMyApp));
                        rateMyApp.conditions.forEach((condition) {
                          if (condition is DebuggableCondition) {
                            print(condition.valuesAsString); // We iterate through our list of conditions and we print all debuggable ones.
                          }
                        });
            
                        print('Are all conditions met ? ' + (rateMyApp.shouldOpenDialog ? 'Yes' : 'No'));
            
                        if (rateMyApp.shouldOpenDialog) {
                          rateMyApp.showRateDialog(context);
                        }
                      },
                    ),
                  ),
              );
              
              /// Builds the progress indicator, allowing to wait for Rate my app to initialize.
              static Widget buildProgressIndicator(BuildContext context) => const Center(
                child: CircularProgressIndicator()
              );
            
              ContentWidget({RateMyApp rateMyApp}) {}
}