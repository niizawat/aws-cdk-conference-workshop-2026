+++
title = "kiro-cli のログイン"
weight = 200
+++

## ログインコマンドの実行

ターミナルで以下のコマンドを実行します。

```bash
kiro-cli login --use-device-flow
```

## 認証の手順（デバイスフロー）

1. `kiro-cli login --use-device-flow` を実行し、認証方法を選択します
2. ターミナルに **URL** と **ワンタイムコード** が表示されます
3. 表示された URL を手元の PC やスマートフォンのブラウザで開きます
4. ワンタイムコードを入力し、認証を完了します
5. ターミナルに自動的にログイン成功が反映されます

## アカウントの選択

以下のいずれかのアカウントでログインできます。

- **GitHub アカウント**
- **Google アカウント**
- **AWS Builder ID**

お持ちのアカウントを選択してログインしてください。

## AWS Builder ID を新規作成する場合

AWS Builder ID をお持ちでない方は、以下の手順で作成できます。

### 1. AWS Builder ID の作成ページにアクセス

{{< linkcard title="AWS Builder ID の作成" url="https://profile.aws.amazon.com/" >}}

### 2. メールアドレスの入力

- **Your email address** にメールアドレスを入力
- **Next** をクリック

### 3. 名前の入力

- **Your name** に名前を入力
- **Next** をクリック

### 4. メール認証

- 入力したメールアドレスに確認コードが届きます
- 確認コードを入力して **Verify** をクリック

### 5. パスワードの設定

- パスワードを設定して **Create AWS Builder ID** をクリック

{{% notice note %}}
AWS Builder ID は AWS アカウントとは別のものです。無料で作成でき、クレジットカードの登録は不要です。
{{% /notice %}}

## ログインの確認

ログインが成功すると、ターミナルに認証完了のメッセージが表示されます。

これで kiro-cli を使用する準備が整いました！
