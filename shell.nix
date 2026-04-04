{
  pkgs ? import <nixpkgs> { },
  python3 ? pkgs.python3,
  cudaSupport ? false,
  ...
}:
pkgs.mkShell {
  packages =
    let
      tensorflow = python3.pkgs.tensorflow.override { inherit cudaSupport; };
    in
    [
      (python3.withPackages (pp: [
        pp.numpy
        pp.matplotlib
        pp.pandas
        pp.scikit-learn
        pp.openpyxl
        pp.jupyter
        pp.ipympl
        pp.datasets
        pp.gensim
        tensorflow
        (pp.keras.override (prev: {
          inherit tensorflow;
          tf2onnx = prev.tf2onnx.override { inherit tensorflow; };
        }))
        pp.fasttext
      ]))
    ];
}
