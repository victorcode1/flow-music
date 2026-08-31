enum FlowMixMood { relax, energy, focus, local, surprise }

extension FlowMixMoodDefinition on FlowMixMood {
  List<String> get discoveryTags => switch (this) {
    FlowMixMood.relax => const ['chillout', 'ambient', 'jazz'],
    FlowMixMood.energy => const ['dance', 'reggaeton', 'rock'],
    FlowMixMood.focus => const ['classical', 'ambient', 'lofi'],
    FlowMixMood.local || FlowMixMood.surprise => const [],
  };
}
