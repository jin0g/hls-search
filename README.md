# Timing Strategy Search for Vitis HLS

# Vitis HLSのタイミング戦略検索

HLS Searchは、Vitis HLSのハードウェア記述の最適化をサポートします。
このツールは主にVitis HLSの実行をさまざまなパラメータや設定を変更し探索します。
効率的にFPGAハードウェアの記述と最適化を行うことができるように設計されています。

## 推奨環境

- Ubuntu 22.04
- Vivado 2023.1 および Vitis HLS 2023.1
- インストールパス: `/tools/Xilinx/`

## 設定パラメータ

以下のパラメータを通じて、HLSの振る舞い、ターゲットデバイス、テストケースなどを指定できます：

- `SOURCE`: C/C++ソースファイル (デフォルト: `main.cpp`)
- `TARGET`: ターゲットデバイス (デフォルト: `KV260`)
- `TEST`: 実行するテストケース (デフォルト: `NONE`)
- `HLS_PERIOD`: HLSのクロックサイクル (デフォルト: `5.0`)
- `VIVADO_PERIOD`: Vivadoのクロックサイクル (デフォルト: `5.0`)
- `SYNTH_STRATEGY`: Synthesys Strategy (デフォルト: `default`)
- `IMPL_STRATEGY`: Impliment Strategy (デフォルト: `default`)

## Makefileのコマンド

- `all`: 指定されたパラメータを使用してVitis HLSを実行します。
- `results`: `all`の実行ログファイルを検索して表示します。
- `clean`: `build/`ディレクトリを削除して、出力とログをクリアします。

## 使い方

### 動作周波数の指定
```
$ make HLS_PERIOD=3.0 VIVADO_PERIOD=2.5
```

### A/Bテストの実行
```
$ make TEST=A
$ make TEST=B
```

### 戦略の変更
```
$ make SYNTH_STRATEGY=Flow_AreaOptimized_high IMPL_STRATEGY=Performance_NetDelay_low
```

### 結果の表示
```
$ make results
>                          Directory,    CP, LUT,  FF, BRAM, URAM, CLB
> KV260-NONE-3.0-2.5-default-default, 1.298,  47, 113,    0,    0,  14
>    KV260-A-2.0-2.0-default-default, 2.028,  57,  96,    0,    0,  16
>    KV260-B-5.0-5.0-default-default, 1.195,   0,  32,    0,    0,   4
```
