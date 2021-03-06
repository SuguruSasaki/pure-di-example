## RxFlowの導入方法

RxFlowが目指しているのは以下の内容です。

+ ルーティングを論理的なセクションに分割するのを簡単にする
+ ViewControllerからルーティングコードを削除する
+ ViewControllerの再利用性を高める
+ リアクティブプログラミングを促進する
+ 依存性注入を促進する

RxFlowにはいくつか用語が出てきます。

### Flow
各Flowはアプリケーション内のナビゲーション領域を定義します。

### Step
各Stepは、アプリケーション内のナビゲーション状態です。FlowとStepの組み合わせは、考えられるすべてのナビゲーションアクションについて説明しています。

### Stepper
Stepを出すことができるものなら何でも構いません。Stepperはフロー内のすべてのナビゲーションアクションをトリガーする責任があります。

### Presentable
Presentableプロトコルで、基本的にUIViewControllerとFlowに関わります。

### NextFlowItem
Coordinatorに、そのReactiveメカニズムの中で新しいステップを生み出す次になるものは何かを伝えます。

### Coordinator
Coordinatorの仕事は、FlowとStepの組み合わせを一貫した方法で組み合わせることです。


##
RxFlowは主にナビゲーション状態の変化を事後的に処理することを目的としています。
複数のコンテクストで再利用するには、これらの状態が現在のナビゲーションフローを認識していない必要があります。
したがって、「この画面に行きたい」という意味ではなく、「誰かまたは何かがした」という意味になります。
現在のナビゲーションフローに従って、このアクション」とRxFlowは正しい画面を選択します。
RxFlowでは、このナビゲーション状態はStepと呼ばれます。

StepはEnumを利用して実装します。

```
enum DemoStep: Step {
    case detail
}
```


## Stepper
理論的には、ステッパーはプロトコルなので何でもかまいません（たとえばUIViewController）が、ViewModelなどでその動作を分離することをお勧めします。
RxFlowには、定義済みのOneStepperクラスが付属しています。たとえば、ナビゲーションを推進する最初のステップを表すために新しいFlowを作成するときに使用できます。