{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    cmake
    gnumake
    gcc
    pkg-config
  ];

  buildInputs = with pkgs.qt6; [
    qtbase
    qtdeclarative
  ];
}