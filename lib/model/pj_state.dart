class State {
  State({
    required this.id,
    required this.state,
    required this.userId,
  });

  factory State.fromJson(Map<String, dynamic> j) => State(
        id: j['id'].toString(),
        state: ProjectorState.values.firstWhere(
          (element) => element.name == j['state'].toString(),
          orElse: () => ProjectorState.waiting,
        ),
        userId: int.tryParse(j['userId'].toString()),
      );

  final String id;
  final ProjectorState state;
  final int? userId;
}

enum ProjectorState {
  waiting,
  starting,
  running,
}
