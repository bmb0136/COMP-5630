{
  pkgs ? import <nixpkgs> { },
  python3 ? pkgs.python3,
  cudaSupport ? false,
  ...
}:
pkgs.mkShell {
  packages = [
    (python3.withPackages (
      pp: with pp; [
        numpy
        matplotlib
        pandas
        scikit-learn
        openpyxl
        jupyter
        ipympl
        datasets
        gensim
        (tensorflow.override { inherit cudaSupport; })
      ]
    ))
  ];
}
