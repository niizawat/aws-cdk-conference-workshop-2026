+++
title = "kiro-cli のインストール"
weight = 100
+++

## VS Code Server のターミナルを開く

VS Code Server の画面下部にある **TERMINAL** パネルを使用します。

ターミナルが表示されていない場合は、メニューから **Terminal > New Terminal** を選択してください。

## kiro-cli のインストール

ターミナルで以下のコマンドを順に実行します。

```bash
wget https://desktop-release.q.us-east-1.amazonaws.com/latest/kiro-cli.deb
sudo dpkg -i kiro-cli.deb
sudo apt-get install -f
```

{{% notice tip %}}
`.deb` パッケージでインストールされるため、依存関係も自動で解決されます。
{{% /notice %}}

## インストールの確認

インストールが完了したら、以下のコマンドでバージョンを確認します。

```bash
kiro-cli --version
```

バージョン番号が表示されれば、インストール完了です。

{{% notice warning %}}
`command not found` と表示される場合は、ターミナルを一度閉じて再度開いてみてください。
{{% /notice %}}
