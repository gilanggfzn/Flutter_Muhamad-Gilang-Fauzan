# Finite State Machine
---
## Finite State Machine
merupakan sebuah mesin yang memiliki state dan setiap state menunjukan apa yang terjadi sebelumnya yang didalamnya terdapat 3 state yang menunjukan kejadian didalam suatu proses.

### Contoh
1. IDDLE merupakan state saat tidak terjadi proses
2. RUNNING merupakan state saat proses dijalankan
3. ERROR saat proses gagal diselesaikan

jadi saat Proses sukses maka kondisi yang awalnya IDDLE akan berubah menjadi RUNNING lalu kembali menjadi IDDLE 

saat proses gagal maka kondisi yang awalnya IDDLE akan berubah menjadi RUNNING lalu berubah menjadi ERROR dan kembali menjadi IDDLE