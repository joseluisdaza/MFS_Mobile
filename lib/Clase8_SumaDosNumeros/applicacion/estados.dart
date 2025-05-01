class ContainerState {
  final double resultado;
  final bool flagResultado;

  ContainerState({required this.resultado, required this.flagResultado});

  //Se usa cuando queremos cambiar el resultado, pero no el valor, se llama a copy with.
  //Si el nuevo valor es nulo, toma el resultado, caso contrario toma el valor que habia.
  ContainerState copyWidth({double? resultado, bool? flagResultado}) {
    return ContainerState(
      resultado: resultado ?? this.resultado,
      flagResultado: flagResultado ?? this.flagResultado,
    );
  }
}
