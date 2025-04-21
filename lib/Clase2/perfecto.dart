class Perfecto {
  int n; //publico
  // int_m; //privado

  Perfecto(this.n); //constructor

  bool esPerfecto() {
    int suma = 0;
    for (int i = 1; i <= n / 2; i++) {
      if (n % i == 0) {
        suma += i;
      }
    }
    return suma == n;
  }
}
