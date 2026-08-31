class FlowMixFeedbackProfile {
  const FlowMixFeedbackProfile({
    this.dismissedStationIds = const <String>{},
    this.negativeTagCounts = const <String, int>{},
  });

  final Set<String> dismissedStationIds;
  final Map<String, int> negativeTagCounts;
}
