# dbt
dbt学習用のリポジトリ

## スナップショット
### strategy='check'
* invalidate_hard_deletes指定なし
  * ソースの属性情報が更新 → 同じidで、古い方はdbt_valid_toに実行タイミング(UTC)が入る
  * ソースが物理削除 → スナップショット上のレコードには変更なし
* invalidate_hard_deletes=True
  * ソースの属性情報が更新 → 同じidで、古い方はdbt_valid_toに実行タイミング(UTC)が入る
  * ソースが物理削除 → dbt_valid_toに実行タイミング(UTC)が入る