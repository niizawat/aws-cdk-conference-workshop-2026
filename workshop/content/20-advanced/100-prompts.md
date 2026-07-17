+++
title = "kiro-cli を使った発展課題"
weight = 100
+++

kiro-cli を使って CDK コードに変更を加えてみましょう。

## kiro-cli の起動

CDK プロジェクトのディレクトリで kiro-cli を起動します。

```bash
cd ~/my-cdk-app
kiro-cli chat
```

## 基本的な使い方

1. **プロンプトを入力** — 変更内容を自然言語で指示する
2. **diff を確認** — 変更内容を確認する（2つの方法）
3. **デプロイ** — `!cdk deploy` で自分自身でデプロイを実行する

### diff の確認方法

#### 方法 1: kiro-cli に cdk diff を実行させる

```
cdk diff で差分を確認してください
```

kiro-cli が `cdk diff` を実行し、結果を表示してくれます。

#### 方法 2: 自分で `cdk diff` を実行する

```
! cdk diff
```

`!` を先頭につけるとシェルコマンドとして実行されます。CloudFormation テンプレートレベルでの差分が確認できます。

---

## 課題 1: RDS を Aurora Serverless v2 に変更する

### プロンプト例

kiro-cli に以下のように入力してみましょう。

```
現在のコードで使用している RDS MySQL インスタンスを Aurora Serverless v2 に変更してください。
Aurora Serverless v2 の capacity は minCapacity: 0.5, maxCapacity: 4 に設定してください。
```

### 変更のポイント

- `aws-cdk-lib/aws-rds` の `DatabaseInstance` が `DatabaseCluster` に変更される
- Aurora Serverless v2 の `serverlessV2MinCapacity` / `serverlessV2MaxCapacity` が設定される
- エンジンが `AuroraMysqlEngineVersion` に変更される

### diff の確認

kiro-cli が変更を行ったら、差分を確認しましょう。

```
cdk diff で差分を確認してください
```

または、自分で実行する場合:

```
! cdk diff
```

変更内容が意図通りか確認してください。

### デプロイ

変更内容に問題がなければ、以下のコマンドでデプロイします。

```
!cdk deploy
```

{{% notice note %}}
Aurora Serverless v2 のデプロイには 7〜8 分程度かかることがあります。
{{% /notice %}}

---

## 課題 2: EC2 インスタンスを冗長化する（ALB + EC2 x 2）

### プロンプト例

```
WordPress のEC2インスタンスを冗長化してください。
Application Load Balancer (ALB) を追加し、EC2インスタンスを2台構成にしてください。
EC2インスタンスはプライベートサブネットに配置してください。
```

### 変更のポイント

- `ApplicationLoadBalancer` が追加される
- EC2 インスタンスが 2 台作成され、プライベートサブネットに配置される
- ALB のターゲットグループに 2 台の EC2 が登録される
- セキュリティグループが ALB 経由のアクセスのみ許可するように変更される

### diff の確認

kiro-cli が変更を行ったら、差分を確認しましょう。

```
cdk diff で差分を確認してください
```

または:

```
! cdk diff
```

### デプロイ

```
!cdk deploy
```

---

## 課題 3: WordPress インストールディレクトリを EFS に変更し共有する

### プロンプト例

```
WordPress のインストールディレクトリを Amazon EFS に変更し、複数のEC2インスタンス間で共有できるようにしてください。
EFS の認証は IAM 認証を使用してください。
/var/www/html を EFS マウントポイントとして設定してください。
```

### 変更のポイント

- `aws-cdk-lib/aws-efs` の `FileSystem` が追加される
- EFS ファイルシステムポリシーに IAM 認証が設定される
- EC2 インスタンスの UserData で EFS マウント処理が追加される
- EC2 インスタンスのロールに EFS へのアクセス権限が付与される
- マウントポイント: `/var/www/html`

### EFS IAM 認証について

EFS の IAM 認証を使用すると、IAM ポリシーで EFS へのアクセスを制御できます。セキュリティグループだけでなく、IAM レベルでのアクセス制御が可能になります。

```typescript
// EFS ファイルシステムポリシーの例
fileSystem.addToResourcePolicy(new iam.PolicyStatement({
  actions: ['elasticfilesystem:ClientMount'],
  principals: [new iam.ArnPrincipal(instance.role.roleArn)],
  conditions: {
    Bool: { 'elasticfilesystem:AccessedViaMountTarget': 'true' },
  },
}));
```

### diff の確認

kiro-cli が変更を行ったら、差分を確認しましょう。

```
cdk diff で差分を確認してください
```

または:

```
! cdk diff
```

### デプロイ

```
!cdk deploy
```

{{% notice tip %}}
課題 2 と課題 3 を組み合わせると、ALB + EC2 x 2 + EFS の高可用性アーキテクチャが完成します！
{{% /notice %}}
