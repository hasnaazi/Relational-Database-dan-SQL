CREATE TABLE Ruang_kelas (
  Kode_rk VARCHAR(45) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY(Kode_rk)
);

CREATE TABLE MK (
  Kode_MK VARCHAR(45) NOT NULL,
  Nama_MK VARCHAR(255) NULL,
  PRIMARY KEY(Kode_MK)
);

CREATE TABLE Dosen (
  Nik INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Nama_dosen VARCHAR(45) NULL,
  Alamat_dosen VARCHAR(255) NULL,
  Jk_dosen VARCHAR(45) NULL,
  PRIMARY KEY(Nik)
);

CREATE TABLE Mahasiwa (
  Nim INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Nama_mahasiswa VARCHAR(45) NULL,
  Alamat_mahasiswa VARCHAR(255) NULL,
  Jk_mahasiswa VARCHAR(45) NULL,
  PRIMARY KEY(Nim)
);

CREATE TABLE MK_has_Ruang_kelas (
  Ruang_kelas_Kode_rk VARCHAR(45) NOT NULL,
  MK_Kode_MK VARCHAR(45) NOT NULL,
  PRIMARY KEY(Ruang_kelas_Kode_rk, MK_Kode_MK),
  INDEX MK_has_Ruang_kelas_FKIndex2(Ruang_kelas_Kode_rk),
  FOREIGN KEY(MK_Kode_MK)
    REFERENCES MK(Kode_MK)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Ruang_kelas_Kode_rk)
    REFERENCES Ruang_kelas(Kode_rk)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Mahasiwa_has_Dosen (
  Mahasiwa_Nim INTEGER UNSIGNED NOT NULL,
  Dosen_Nik INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Mahasiwa_Nim, Dosen_Nik),
  INDEX Mahasiwa_has_Dosen_FKIndex1(Mahasiwa_Nim),
  INDEX Mahasiwa_has_Dosen_FKIndex2(Dosen_Nik),
  FOREIGN KEY(Mahasiwa_Nim)
    REFERENCES Mahasiwa(Nim)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Dosen_Nik)
    REFERENCES Dosen(Nik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Mahasiwa_has_MK (
  Mahasiwa_Nim INTEGER UNSIGNED NOT NULL,
  MK_Kode_MK VARCHAR(45) NOT NULL,
  PRIMARY KEY(Mahasiwa_Nim, MK_Kode_MK),
  INDEX Mahasiwa_has_MK_FKIndex1(Mahasiwa_Nim),
  INDEX Mahasiwa_has_MK_FKIndex2(MK_Kode_MK),
  FOREIGN KEY(Mahasiwa_Nim)
    REFERENCES Mahasiwa(Nim)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(MK_Kode_MK)
    REFERENCES MK(Kode_MK)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


